package fr.ebook.controller;

import java.util.List;

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
import fr.ebook.dao.IUserDao;
import fr.ebook.model.PublicationDetails;
import fr.ebook.model.User;

@Controller
@RequestMapping("/publication-details")
public class PublicationDetailsController {
	@Autowired
	private IPublicationDetailsDao daoPublicationDetails;

	@Autowired
	private IUserDao daoUser;

	@GetMapping
	public String findAll(Model model) {
		model.addAttribute("publicationDetails", this.daoPublicationDetails.findAll());
		System.out.println(this.daoPublicationDetails.findAll());
		return "publication-details/list";
	}

	@GetMapping("/add")
	public String add(Model model) {
		List<User> authors = this.daoUser.findAll();

		model.addAttribute("authors", authors);

		return "publication-details/form";
	}

	@PostMapping("/add")
	public String add(@Valid PublicationDetails publicationDetails, BindingResult result,
			Model model) {

		if (result.hasErrors()) {
			model.addAttribute("error", result);
			return "publication-details/form";
		}

		this.daoPublicationDetails.add(publicationDetails);

		return "redirect:.";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam int id, Model model) {

		model.addAttribute("publicationDetails", this.daoPublicationDetails.findById(id));

		return "publication-details/form";
	}

	@PostMapping("/edit")
	public String edit(@Valid PublicationDetails publicationDetails, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("error", result);

			return "publication-details/form";
		}
		
		this.daoPublicationDetails.save(publicationDetails);

		return "redirect:.";
	}

	@GetMapping("/delete/{id}")
	public String deleteById(@PathVariable int id) {
		this.daoPublicationDetails.deleteById(id);

		return "redirect:..";
	}

}
