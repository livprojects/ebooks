package fr.ebook.controller;

import java.sql.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.ebook.dao.IUserDao;
import fr.ebook.model.User;

@Controller
public class SignUpController {
	@Autowired
	private IUserDao daoUser;

	@GetMapping("/signup")
	public String add() {
		return "signup/form";

	}

	@PostMapping("/signup")
	public String add(@Valid User user, BindingResult result, Model model, @RequestParam Date birthdate,
			@RequestParam String pseudo, @RequestParam String password, @RequestParam String firstname,
			@RequestParam String lastname, @RequestParam String mail, @RequestParam String description) {

		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "signup/form";
		}
		User newuser = new User();

		newuser.setBirthdate(birthdate);
		newuser.setPseudo(pseudo);
		newuser.setPassword(password);
		newuser.setFirstname(firstname);
		newuser.setLastname(lastname);
		newuser.setMail(mail);
		newuser.setDescription(description);

		newuser.setRank("Poids plume");
		newuser.setRole("Lecteur");

		this.daoUser.add(newuser);
		return "redirect:home";
	}

	// Méthodes suivantes pourront servir à l'édition de profil (vues non existantes
	// pour le moment)

	@GetMapping("/profile/edit")
	public String edit(@RequestParam int id, Model model) {
		model.addAttribute("user", this.daoUser.findById(id));
		return "singup/form";
	}

	@PostMapping("/profile/edit")
	public String edit(@Valid User user, BindingResult result, Model model, @RequestParam int id,
			@RequestParam Date birthdate, @RequestParam String pseudo, @RequestParam String password,
			@RequestParam String firstname, @RequestParam String lastname, @RequestParam String mail,
			@RequestParam String description, @RequestParam String rank, @RequestParam String role) {

		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "signup/form";
		}

		User newuser = this.daoUser.findById(id);

		newuser.setBirthdate(birthdate);
		newuser.setPseudo(pseudo);
		newuser.setPassword(password);
		newuser.setFirstname(firstname);
		newuser.setLastname(lastname);
		newuser.setMail(mail);
		newuser.setDescription(description);

		newuser.setRank(rank);
		newuser.setRole(role);

		this.daoUser.save(newuser);

		return "redirect:../home";
	}

// Pour la suppression, rediriger dans la vue vers user/delete/id
}
