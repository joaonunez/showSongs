package com.example.app.models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.Size;

@Entity
@Table (name = "song")
public class Song {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Size(min = 5, message = "El título debe tener al menos 5 caracteres")
	private String title;
	
	@ManyToOne
	@JoinColumn(name = "artist_id")
	private Artist artist;
	
	@Size(min = 3, message = "El álbum debe tener al menos 3 caracteres")
	private String album;
	
	@Size(min = 3, message = "El género debe tener al menos 3 caracteres")
	private String gender;
	
	@Size(min = 3, message = "El idioma debe tener al menos 3 caracteres")
	private String language;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(updatable = false)
	private Date createdAt;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedAt;

	

	//Constructor vacio
	public Song() {
	}

	//getters y setters:
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Artist getArtist() {
		return artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	@PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }
	
	@PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
	
	
	
	
}
