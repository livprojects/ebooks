package fr.ebook.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;

@Entity
@Table (name = "publication_text")

public class PublicationText {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name = "publication_id_text")
	private int id;
	
	@ManyToOne 
	@JoinColumn(name = "author_id", nullable = false)
	private User user; 
	
	
	@Column(name = "publication_content", nullable = false)
	@NotBlank(message = "Le contenu de la publication ne doit pas être vide.")
	private String content;
	
	@Column(name = "chaptering")
	@Positive(message = "Le numéro de chapitre ne peut pas être négatif.")
	private int chaptering;
	
	// Getters et setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getChaptering() {
		return chaptering;
	}
	public void setChaptering(int chaptering) {
		this.chaptering = chaptering;
	}
	

	
	
	
	
}



