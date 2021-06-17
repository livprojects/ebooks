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

import fr.ebook.dao.IGenreDao;
import fr.ebook.model.Genre;

@Controller
@RequestMapping("/genre")
public class GenreController {
	@Autowired
	private IGenreDao daoGenre;

	@GetMapping
	public String findAll(Model model) {
		model.addAttribute("genres", this.daoGenre.findAll());

		return "genre/list";
	}

	@GetMapping("/add")
	public String add() {
		return "genre/form";
	}

	@PostMapping("/add")
	public String add(@RequestParam String label, @Valid Genre genre, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "genre/form";
		} else {
			Genre newGenre = new Genre();
			newGenre.setLabel(label);

			this.daoGenre.add(newGenre);

			return "redirect:.";
		}


	}

	@GetMapping("/edit")
	public String edit(@RequestParam int id, Model model) {
		model.addAttribute("genre", this.daoGenre.findById(id));

		return "genre/form";
	}

	@PostMapping("/edit")
	public String edit(@Valid Genre genre, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "genre/form";
		}

		this.daoGenre.save(genre);

		return "redirect:.";
	}

	@GetMapping("/delete/{id}")
	public String deleteById(@PathVariable int id) {
		this.daoGenre.deleteById(id);

		return "redirect:..";
	}

}
