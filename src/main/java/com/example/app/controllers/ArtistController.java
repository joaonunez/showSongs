package com.example.app.controllers;

import javax.naming.Binding;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.app.models.Artist;
import com.example.app.models.Song;
import com.example.app.services.ArtistService;
import com.example.app.services.SongService;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ArtistController {
    private final ArtistService artistService;
    /* private final SongService songService; */

    public ArtistController(ArtistService artistService, SongService songService) {
        this.artistService = artistService;
        /* this.songService = songService; */

    }

    @GetMapping("/artists")
    public String showArtists(
            Model model,
            // pasamos por parametros el valor por defecto y el tamaño de la lista que
            // tendremos en tiempo real de los artistas
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size) {
        // parametros
        Page<Artist> artistsPage = artistService.getArtistsPaginated(page, size);
        model.addAttribute("artistsPage", artistsPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", artistsPage.getTotalPages());
        return "artists.jsp";
    }

    @GetMapping("/artists/detail/{id}")
    public String showArtistDetail(@PathVariable Long id, Model model) {
        Artist artist = artistService.getArtistById(id);
        if (artist == null) {
            return "redirect:/artists";
        }
        model.addAttribute("artist", artist);
        return "artistDetail.jsp";
    }

    @GetMapping("/artists/form/add")
    public String formAddArtist(Model model) {
        model.addAttribute("artist", new Artist());
        return "addArtist.jsp";
    }

    @PostMapping("/artists/process/add")
    public String processAddArtist(@Valid @ModelAttribute("artist") Artist artist, BindingResult result,
            RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "addArtist.jsp";
        }
        artistService.addArtist(artist);
        redirectAttributes.addFlashAttribute("success", "Canción agregada con éxito.");
        return "redirect:/artists";
    }

    // actualizar artista
    @GetMapping("/artists/form/edit/{id}")
    public String editArtistForm(@PathVariable Long id, Model model) {
        Artist artist = artistService.getArtistById(id);
        if (artist == null) {
            return "redirect:/artists";
        }
        model.addAttribute("artist", artist);
        return "editArtist.jsp";
    }

    @PutMapping("artists/process/edit/{id}")
    public String processEditArtist(
            @PathVariable Long id,
            @Valid @ModelAttribute("artist") Artist artist,
            BindingResult result) {
        if (result.hasErrors()) {
            return "editSong.jsp";
        }
        artist.setId(id);
        artistService.updateArtist(artist);
        return "redirect:/artists";
    }

    @DeleteMapping("artists/delete/{id}")
    public String processDeleteArtist(@PathVariable Long id){
        artistService.deleteArtist(id);
        return "redirect:/artists";
    }

}
