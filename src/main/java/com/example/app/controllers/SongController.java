package com.example.app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.app.models.Song;
import com.example.app.services.SongService;

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
}
