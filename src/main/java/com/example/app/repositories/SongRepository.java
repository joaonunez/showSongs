package com.example.app.repositories;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable; 
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.app.models.Song;

@Repository
public interface SongRepository extends JpaRepository<Song, Long> {
	//Metodo para paginacion
	Page<Song> findAllByOrderByTitleAsc(Pageable pageable);

	//metodo para obtener en forma ascendente por nombre todas las canciones
    List<Song> findAllByOrderByTitleAsc();
}
