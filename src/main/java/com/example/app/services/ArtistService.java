package com.example.app.services;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    //para mantener la asesion acrtiva mientras se consulta o elimina el artista
    @Transactional(readOnly = true)
    public Artist getArtistById(Long id) {
        Artist artist = artistRepository.findById(id).orElse(null);
        if (artist != null) {
            // Forzar la carga de la lista de canciones
            artist.getSongs().size();
        }
        return artist;
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


    //metodo para eliminar artista con verificacion incluida para que 
    //no borre todas 
    //las canciones de golpe
    @Transactional
    public void deleteArtist(Long id) {
        Artist artist = artistRepository.findById(id).orElse(null);
        if (artist != null) {
            // Forzar la carga de canciones antes de verificar
            artist.getSongs().size();
            if (artist.getSongs().isEmpty()) {
                artistRepository.deleteById(id);
            } else {
                throw new IllegalStateException("No se puede eliminar artista con canciones asociadas");
            }
        } else {
            throw new IllegalStateException("Artista no encontrado");
        }
    }
    

}
