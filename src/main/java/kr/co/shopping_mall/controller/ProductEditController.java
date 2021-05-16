package kr.co.shopping_mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shopping_mall.model.Product;
import kr.co.shopping_mall.service.ProductService;

// 상품 관리 컨트롤러
@Controller
@RequestMapping("/manage-page2")
public class ProductEditController {
	@Autowired
	private ProductService service;
	
	// 상품 목록 조회
	@GetMapping(value="list.do")
	public String getAllProduct(Model model) {
		model.addAttribute("product_list", service.readAll());
		return "manage-page";
	}
	
	// 상품 정보 수정
	@GetMapping(value="update_product.do")
	public String updateProduct(Product product) {
		service.update(product);
		return "manage-page";
	}
	
	// 상품 삭제
	@GetMapping(value="delete_product.do")
	public String deleteProduct(int productId) {
		service.delete(productId);
		return "manage-page";
	}
	
}