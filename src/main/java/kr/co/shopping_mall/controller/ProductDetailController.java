package kr.co.shopping_mall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.shopping_mall.model.Amount;
import kr.co.shopping_mall.model.Product;
import kr.co.shopping_mall.model.ProductInfo;
import kr.co.shopping_mall.model.ProductPhoto;
import kr.co.shopping_mall.service.ProductService;

@Controller
public class ProductDetailController {
	@Autowired
	private ProductService service;
	
	@GetMapping("/detail")
	public String view(Model model, @RequestParam String product_id) {
		List<Product> list = service.readAll();
		List<ProductInfo> infoList = service.readAllInfo(); 
		Map<String, Amount> colorAmount = new HashMap<>();
		List<ProductPhoto> fileNameList = new ArrayList<>();
		int productId = Integer.parseInt(product_id);
		for (int i = 0; i < list.size(); i++) {
			int getId = list.get(i).getProduct_id();
			if (productId == getId) {
				model.addAttribute("name", list.get(i).getName());
				fileNameList.add(new ProductPhoto(list.get(i).getPhoto_1(), list.get(i).getPhoto_2(), list.get(i).getPhoto_3()));
				model.addAttribute("fileNames", fileNameList);
				model.addAttribute("price", list.get(i).getPrice());
				model.addAttribute("description", list.get(i).getDescription());
				for (ProductInfo info : infoList) {
					if (productId == info.getNumber()) {
						colorAmount.put(info.getColor(), new Amount(info.getSize_s(), info.getSize_m(), info.getSize_l()));
						model.addAttribute("color_map", colorAmount);
					}
				}
				break;
			}
		}
		model.addAttribute("color_map", colorAmount);
		
		return "product-detail";
	}
}
