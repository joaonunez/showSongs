package com.example.app.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.app.models.Artist;
import com.example.app.repositories.ArtistRepository;

@Service
public class ArtistService {

    private final ArtistRepository artistRepository;

    public ArtistService(ArtistRepository artistRepository) {
        this.artistRepository = artistRepository;
    }

    public List<Artist> getAllArtists() {
        return artistRepository.findAll();
    }
    
    public Artist getArtistById(Long id) {
        Optional<Artist> artist = artistRepository.findById(id);
        return artist.orElse(null);
    }

    public Artist addArtist(Artist artist) {
        return artistRepository.save(artist);
    }

}
