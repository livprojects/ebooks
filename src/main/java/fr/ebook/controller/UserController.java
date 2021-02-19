package fr.ebook.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.ebook.dao.IUserDao;
import fr.ebook.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserDao daoUser;

	@GetMapping("")
	public String findAll(Model model) {
		model.addAttribute("users", this.daoUser.findAll());
		return "user/list";
	}

	@GetMapping("/add")
	public String add() {
		return "user/form";

	}

	@PostMapping("/add")
	public String add(@Valid User user, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "user/form";
		}
		this.daoUser.add(user);
		return "redirect:.";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam int id, Model model) {
		model.addAttribute("user", this.daoUser.findById(id));
		return "user/form";
	}

	@PostMapping("/edit")
	public String edit(@Valid User user, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "user/form";
		}

		this.daoUser.save(user);

		return "redirect:.";
	}

	@GetMapping("/delete/{id}")
	public String deleteById(@PathVariable int id) {
		this.daoUser.deleteById(id);
		return "redirect:..";
	}
}
