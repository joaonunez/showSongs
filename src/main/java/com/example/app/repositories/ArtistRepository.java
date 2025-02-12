package com.example.app.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.app.models.Artist;

@Repository
public interface ArtistRepository extends CrudRepository<Artist, Long> {
    @Override
	List<Artist> findAll();
}
