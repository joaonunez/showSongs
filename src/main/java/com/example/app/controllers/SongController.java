package com.example.app.controllers;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.app.models.Song;
import com.example.app.services.ArtistService;
import com.example.app.services.SongService;

import jakarta.validation.Valid;

@Controller
public class SongController {

    private final SongService songService;
    private final ArtistService artistService;

    public SongController(SongService songService, ArtistService artistService) {
        this.songService = songService;
        this.artistService = artistService;
    }

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/songs")
    public String showSongs(
            Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size

    ) {
        Page<Song> songsPage = songService.getSongsPaginated(page, size);
        model.addAttribute("songsPage", songsPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", songsPage.getTotalPages());

        return "songs";
    }

    @GetMapping("/songs/detail/{id}")
    public String showSongDetail(@PathVariable Long id, Model model) {
        Song song = songService.getSongById(id);
        if (song == null) {
            return "redirect:/songs";
        }
        model.addAttribute("song", song);
        return "songDetail";
    }

    @GetMapping("/songs/form/add")
    public String formAddSong(Model model) {
        model.addAttribute("song", new Song()); // Inicializa una nueva canción
        model.addAttribute("artists", artistService.getAllArtistsForComboBox()); // Pasa la lista de artistas al JSP
        return "addSong";
    }

    @PostMapping("/songs/process/add")
    public String processAddSong(@Valid @ModelAttribute("song") Song song, BindingResult result,
            RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "addSong";
        }
        songService.addSong(song);
        redirectAttributes.addFlashAttribute("success", "Canción agregada con éxito.");
        return "redirect:/songs";
    }

    @GetMapping("/songs/form/edit/{id}")
    public String editSongForm(@PathVariable Long id, Model model) {
        Song song = songService.getSongById(id);
        if (song == null) {
            return "redirect:/songs";
        }
        model.addAttribute("song", song);
        // para traer todos los artistas al combobox del formulario editar cancion
        model.addAttribute("artists", artistService.getAllArtistsForComboBox());
        return "editSong";
    }

    @PutMapping("/songs/process/edit/{id}")
    public String processEditSong(@PathVariable Long id, @Valid @ModelAttribute("song") Song song,
            BindingResult result) {
        if (result.hasErrors()) {
            return "editSong";
        }
        song.setId(id);
        songService.updateSong(song);
        return "redirect:/songs";
    }

    @DeleteMapping("/songs/delete/{id}")
    public String processDeleteSong(@PathVariable Long id) {
        songService.deleteSong(id);
        return "redirect:/songs";
    }

}
