package fr.ebook.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.ebook.dao.IInstitutionDao;
import fr.ebook.model.Genre;
import fr.ebook.model.Institutions;

@Controller
@RequestMapping("/institutions")
public class InstitutionController {
	@Autowired
	private IInstitutionDao daoInstitution;

	@GetMapping
	public String findAll(Model model) {
		model.addAttribute("institutions", this.daoInstitution.findAll());

		return "institutions/list";
	}

	@GetMapping("/add")
	public String add() {
		return "institutions/form";
	}

	@PostMapping("/add")
	public String add(@Valid Institutions institutions, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "institutions/form";
		}

		this.daoInstitution.add(institutions);

		return "redirect:.";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam int id, Model model) {
		model.addAttribute("institutions", this.daoInstitution.findById(id));

		return "institutions/form";
	}

	@PostMapping("/edit")
	public String edit(@Valid Institutions institutions, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "institutions/form";
		}

		this.daoInstitution.save(institutions);

		return "redirect:.";
	}

	@GetMapping("/delete")
	public String deleteById(@RequestParam int id) {
		this.daoInstitution.deleteById(id);

		return "redirect:.";
	}

}
