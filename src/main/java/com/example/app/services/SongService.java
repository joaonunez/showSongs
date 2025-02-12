package com.example.app.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.app.models.Song;
import com.example.app.repositories.SongRepository;

@Service
public class SongService {
    private final SongRepository songRepository;
    
    public SongService(SongRepository songRepository) {
        this.songRepository = songRepository;
    }


    public List<Song> getAllSongs() {
        return songRepository.findAll();
    }

    public Song getSongById(Long id) {
        Optional<Song> song = songRepository.findById(id);
        return song.orElse(null);
    }
    public Song addSong(Song song) {
        return songRepository.save(song);
    }
    public Song updateSong(Song song) {
        return songRepository.save(song);
    }
    
    public void deleteSong(Long id) {
        songRepository.deleteById(id);
    }

}
