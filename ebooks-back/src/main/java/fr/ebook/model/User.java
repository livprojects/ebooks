package fr.ebook.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "user")

public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private int id;

	@Column(name = "user_role", nullable = false)
//	@NotBlank(message = "Merci de choisir un rôle.")
	private String role;

	@Column(name = "user_mail", length = 150, nullable = false)
	@Size(max = 150, message = "L'adresse e-mail ne peut dépasser 150 caractères.")
	@NotBlank(message = "Merci de renseigner une adresse e-mail.")
	@Pattern(regexp = "^(.+)@(.+)$", message = "Merci de rentrer une adresse e-mail valide.")
	private String mail;

	@Column(name = "user_password", length = 300, nullable = false)
	@Size(min = 8, max = 300, message = "Merci de rentrer un mot de passe entre 8 et 300 caractères.")
	@NotBlank(message = "Le mot de passe ne peut être vide.")
	private String password;

	@Column(name = "user_pseudo", length = 50, nullable = false)
	@NotBlank(message = "Merci de rentrer un pseudonyme.")
	@Size(min = 3, max = 50, message = "Merci de choisir un pseudonyme entre 3 et 50 caractères.")
//	@Pattern(regexp = "^\\S+\\w{8,32}\\S{1,}.", message = "Les caractères spéciaux et les espaces ne sont pas autorisés.")
	private String pseudo;

	@Column(name = "user_firstname", length = 50)
	@Size(max = 50, message = "Le prénom ne peut dépasser 50 caractères.")
	private String firstname;

	@Column(name = "user_lastname", length = 50)
	@Size(max = 50, message = "Le prénom ne peut dépasser 50 caractères.")
	private String lastname;

	@Column(name = "user_birthdate")
	// Contrainte Past fait planter
	// Renseigne une erreur de console en default
//	@Past(message = "Merci de ne pas renseigner une date de naissance dans le futur.")
	private Date birthdate;

	@Column(name = "user_description")
	private String description;

	@Column(name = "user_rank", nullable = false)
//	@NotBlank(message = "Merci de choisir un rang.")
	private String rank;

// Getters et Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	// Constructeur

	public User() {

	}

	public User(String mail) {

	}

}
