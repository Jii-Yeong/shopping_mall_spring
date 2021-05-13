package kr.co.shopping_mall.productview;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ProductController {
	
	@GetMapping("/")
	public String index(Model model) {
		return "index";
	}
}
