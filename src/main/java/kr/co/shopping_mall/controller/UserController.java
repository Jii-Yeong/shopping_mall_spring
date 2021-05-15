package kr.co.shopping_mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.shopping_mall.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	@RequestMapping("/manage-page1")
	public String getAllUser(Model model) {
		model.addAttribute("user_list", service.getAllUser());
		return "manage-page";
	}
}