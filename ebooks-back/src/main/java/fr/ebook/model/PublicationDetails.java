
package fr.ebook.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;


@Entity
@Table (name = "publication_details")

public class PublicationDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name = "publication_id_details")
	private int id;
	
	// Cl� �trang�re 
	@ManyToOne 
	@JoinColumn(name = "author_id", nullable = false)
	private User user; 
	
	
	@Column(name = "publication_title", length = 200, nullable = false)
	@NotBlank(message = "Le titre de la publication ne doit pas �tre vide.")
	@Size(max = 200, message = "Le titre de la publication ne doit pas d�passer 200 caract�res.")
	private String title;
	
	@Column(name = "ratings")
	@Max(value = 5, message = "La note ne peut pas d�passer 5.")
	@PositiveOrZero(message = "La note ne peut pas �tre n�gative.")
	private int ratings;
	
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
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRatings() {
		return ratings;
	}
	public void setRatings(int chaptering) {
		this.ratings = chaptering;
	}

}