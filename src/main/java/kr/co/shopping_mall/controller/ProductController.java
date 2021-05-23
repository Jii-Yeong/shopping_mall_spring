package kr.co.shopping_mall.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.shopping_mall.service.ProductService;
import kr.co.shopping_mall.service.VisitorService;


@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	@Autowired
	private VisitorService visitorService;
	
	@GetMapping("/")
	public String index(Model model) {
		String today = LocalDate.now().format(DateTimeFormatter.ofPattern("MM월 dd일"));
		visitorService.ExistToday(today);
		visitorService.VisitorUpdateCnt(today);
		model.addAttribute("product_list", service.readAll());
		return "index";
	}
	
	@GetMapping("/shopping-cart")
	public String shoppingCart(Model model) {
		return "shopping-cart";
	}
}
