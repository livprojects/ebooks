package fr.ebook.controller;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.NestedServletException;

import fr.ebook.dao.IUserDao;
import fr.ebook.model.User;

@Controller
public class LoginController {
	@Autowired
	private IUserDao daoUser;

	@GetMapping("/login")
	public String login() {
		return "login/form";
	}

	@PostMapping("/login")
	public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {

		User userToLog = this.daoUser.findByEmail(email);

//		try {
			if (userToLog.getPassword().equals(password)) {

				session.setAttribute("email", email);
				session.setAttribute("isLogged", true);
				// model.addAttribute("isLogged", true);

				System.out.println("Authentification réussie!");
				return "redirect:/home";

			}
//		} catch (NoResultException nre) {
//			return "login/form";
//		}
//
//		catch (EmptyResultDataAccessException erd) {
//			return "login/form";
//
//		}

//		if (email.equals("toto@toto.com") && password.equals("tata")) {
//			session.setAttribute("email", email);
//			session.setAttribute("isLogged", true);
//			// model.addAttribute("isLogged", true);
//			
//			System.out.println("Authentification réussie!");
//			return "redirect:/home";
//		}

		return "login/form";

		// Si on récupère un user

		// On a son id

		// On fait un find by id avec cet id

		// On compare les mots de passe des deux instanciations de user

	}

	/*
	 * @PostMapping("/login") public String login(
	 * 
	 * @RequestParam String email, @RequestParam String password) {
	 * if(email.equals("toto@toto.com") && password.equals("tata")) {
	 * this.loggedUser.setLogged(true); this.loggedUser.setEmail(email);
	 * 
	 * System.out.println("Authentification r�ussie"); return "redirect:/home"; }
	 * System.out.println("Authentification �chou�e"); return "login/form"; }
	 */

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		System.out.println("Déconnexion réussie");
		return "redirect:/login";
	}

	/*
	 * @GetMapping("/logout") public String logout() {
	 * this.loggedUser.setLogged(false); this.loggedUser.setEmail(null);
	 * 
	 * System.out.println("D�connexion ok"); return "redirect:/home"; }
	 */

}
