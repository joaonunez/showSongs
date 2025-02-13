package com.example.app.repositories;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.app.models.Artist;

@Repository
public interface ArtistRepository extends JpaRepository<Artist, Long> {
    // metodo para paginacion
    Page<Artist> findAllByOrderByFirstNameAsc(Pageable pageable);

    //metodo para obtener en forma ascendente por nombre todos los artistas
    List<Artist> findAllByOrderByFirstNameAsc();
}
