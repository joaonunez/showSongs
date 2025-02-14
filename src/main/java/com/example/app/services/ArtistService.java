package com.example.app.services;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.example.app.models.Artist;
import com.example.app.repositories.ArtistRepository;

@Service
public class ArtistService {

    private final ArtistRepository artistRepository;

    public ArtistService(ArtistRepository artistRepository) {
        this.artistRepository = artistRepository;
    }

    //Servicio actualizado para paginar a los artistas
    public Page<Artist> getArtistsPaginated(int page, int size) {
        return artistRepository.findAllByOrderByFirstNameAsc(PageRequest.of(page,size));
    }
    
    public Artist getArtistById(Long id) {
        return artistRepository.findById(id).orElse(null);
    }

    public Artist addArtist(Artist artist) {
        return artistRepository.save(artist);
    }
    //para obtener todos los artistas en orden ascedente por nombre
    public List<Artist> getAllArtistsForComboBox() {
        return artistRepository.findAllByOrderByFirstNameAsc();
    }

    //metodo para actualizar el artista sus datos personales al menos
    public Artist updateArtist(Artist artist){
        return artistRepository.save(artist);
    }
    

}
