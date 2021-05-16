package kr.co.shopping_mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.shopping_mall.service.ProductService;


@Controller
public class ProductEditController {
	@Autowired
	private ProductService service;
	
	@GetMapping("product_edit.do")
	public String getAllProduct(Model model) {
		model.addAttribute("product_list", service.readAll());
		return "manage-product";
	}
}