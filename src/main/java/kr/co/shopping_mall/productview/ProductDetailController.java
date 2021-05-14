package kr.co.shopping_mall.productview;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.shopping_mall.product.Product;
import kr.co.shopping_mall.product.ProductPhoto;
import kr.co.shopping_mall.product.ProductService;

@Controller
public class ProductDetailController {
	@Autowired
	private ProductService service;
	
	@GetMapping("/detail")
	public String view(Model model, @RequestParam String product_id) {
		List<Product> list = service.readAll();
		int productId = Integer.parseInt(product_id);
		for (int i = 0; i < list.size(); i++) {
			int getId = list.get(i).getProduct_id();
			if (productId == getId) {
				model.addAttribute("name", list.get(i).getName());
				List<ProductPhoto> fileNameList = new ArrayList<>();
				
				fileNameList.add(new ProductPhoto(list.get(i).getPhoto_1(), list.get(i).getPhoto_2(), list.get(i).getPhoto_3()));
				
				model.addAttribute("fileNames", fileNameList);
				model.addAttribute("price", list.get(i).getPrice());
				model.addAttribute("description", list.get(i).getDescription());
				break;
			}
		}
		
		return "product-detail";
	}
}
