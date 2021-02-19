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

import fr.ebook.dao.ITypologyDao;
import fr.ebook.model.Typology;

@Controller
@RequestMapping("/typology")
public class TypologyController {

	@Autowired
	private ITypologyDao daoTypology;

	@GetMapping("")
	public String findAll(Model model) {
		model.addAttribute("typologies", this.daoTypology.findAll());
		return "typology/list";
	}

	@GetMapping("/add")
	public String add() {
		return "typology/form";
	}

	@PostMapping("/add")
	public String add(@Valid Typology typology, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "typology/form";
		}

		this.daoTypology.add(typology);
		return "redirect:.";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam int id, Model model) {
		model.addAttribute("typology", this.daoTypology.findById(id));
		return "typology/form";
	}

	@PostMapping("/edit")
	public String edit(@Valid Typology typology, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "typology/form";
		}

		this.daoTypology.save(typology);

		return "redirect:.";
	}

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		this.daoTypology.deleteById(id);
		return "redirect:..";
	}

}
