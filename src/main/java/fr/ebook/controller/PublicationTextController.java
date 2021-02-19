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

import fr.ebook.dao.IPublicationDetailsDao;
import fr.ebook.dao.IPublicationTextDao;
import fr.ebook.dao.IUserDao;
import fr.ebook.model.PublicationText;
import fr.ebook.model.User;

@Controller
@RequestMapping("/publication-text")
public class PublicationTextController {

	@Autowired
	IPublicationTextDao daoPublicationText;

	@Autowired
	IUserDao daoUser;

	@Autowired
	IPublicationDetailsDao daoPublicationDetails;

	@GetMapping("")
	public String findAll(Model model) {
		model.addAttribute("publicationtexts", this.daoPublicationText.findAll());
		return "publication-text/list";
	}

	@GetMapping("/add")
	public String add() {
//		List <PublicationDetails> publicationDetails = this.daoPublicationDetails.findAll();
//		model.addAttribute("publicationDetails", publicationDetails);
		return "publication-text/form";
	}

	@PostMapping("/add")
	public String add(@Valid PublicationText publicationText, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "publication-text/form";
		}

		this.daoPublicationText.add(publicationText);

		return "redirect:.";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam int id, Model model) {
		model.addAttribute("publicationtext", this.daoPublicationText.findById(id));
//		model.addAttribute("publicationDetails", this.daoPublicationDetails.findById(id));
		return "publication-text/form";
	}

	@PostMapping("/edit")
	public String edit(@Valid PublicationText publicationText, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "publication-text/form";
		}

		this.daoPublicationText.save(publicationText);

		return "redirect:.";
	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable int id) {
		this.daoPublicationText.deleteById(id);
		return "redirect:..";
	}

}
