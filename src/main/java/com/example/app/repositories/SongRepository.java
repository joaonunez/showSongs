package com.example.app.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.app.models.Song;

@Repository
public interface SongRepository extends CrudRepository<Song, Long> {
	@Override
	List<Song> findAll();
}
