package com.example.app.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.app.models.Artist;
import com.example.app.services.ArtistService;
import com.example.app.services.SongService;

@Controller
public class ArtistController {
    private final ArtistService artistService;
    private final SongService songService;

    public ArtistController(ArtistService artistService, SongService songService) {
    	this.artistService = artistService;
        this.songService = songService;
        
    }
    
    @GetMapping("/artists")
    public String showArtists(Model model) {
    	List<Artist> artists = artistService.getAllArtists();
    	model.addAttribute("artists", artists);
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
    
}
