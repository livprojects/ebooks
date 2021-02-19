package fr.ebook.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table (name = "institutions")
public class Institutions {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name = "INSTITUTION_ID")

	private int id; 
	
	@Column (name = "INSTITUTION_LABEL", length = 100, nullable = false)
	@NotBlank(message = "Le libellé ne peut être vide.")
	@Size(max = 100, message = "Le libellé ne peut pas faire plus de 100 caractères.")
	private String label;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	
}