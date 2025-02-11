package com.example.app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.app.models.Song;
import com.example.app.services.SongService;

import jakarta.validation.Valid;

@Controller
public class SongController {

    @Autowired
    private SongService songService;

    @GetMapping("/songs")
    public String showSongs(Model model) {
        List<Song> songs = songService.getAllSongs();
        model.addAttribute("songs", songs);
        return "songs.jsp";
    }

    @GetMapping("/songs/detail/{id}")
    public String showSongDetail(@PathVariable Long id, Model model) {
        Song song = songService.getSongById(id);
        if (song == null) {
            return "redirect:/songs";
        }
        model.addAttribute("song", song);
        return "songDetail.jsp";
    }
    
    @GetMapping("/songs/form/add")
    public String formAddSong(Model model) {
        model.addAttribute("song", new Song());
        return "addSong.jsp";
    }

    @PostMapping("/songs/process/add")
    public String procesarAgregarCancion(@Valid @ModelAttribute("song") Song song, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "addSong.jsp";
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
        return "editSong.jsp";
    }

    @PutMapping("/songs/process/edit/{id}")
    public String processEditSong(@PathVariable Long id, @Valid @ModelAttribute("song") Song song, BindingResult result) {
        if (result.hasErrors()) {
            return "editSong.jsp";
        }
        song.setId(id);
        songService.updateSong(song);
        return "redirect:/songs";
    }
    
    
}
