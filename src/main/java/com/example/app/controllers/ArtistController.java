package com.example.app.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.app.models.Artist;
import com.example.app.services.ArtistService;
import com.example.app.services.SongService;

import jakarta.validation.Valid;

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
    
    @GetMapping("/artists/form/add")
    public String formAddArtist(Model model) {
        model.addAttribute("artist", new Artist()); 
        return "addArtist.jsp";
    }
    
    
    @PostMapping("/artists/process/add")
    public String processAddArtist(@Valid @ModelAttribute("artist") Artist artist, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "addArtist.jsp";
        }
        artistService.addArtist(artist);
        redirectAttributes.addFlashAttribute("success", "Canción agregada con éxito.");
        return "redirect:/artists";
    }
    
}
