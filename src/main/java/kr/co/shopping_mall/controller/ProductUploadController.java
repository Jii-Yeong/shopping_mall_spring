package kr.co.shopping_mall.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.shopping_mall.model.Product;
import kr.co.shopping_mall.model.ProductInfo;
import kr.co.shopping_mall.service.ProductService;

@Controller
public class ProductUploadController {
	@Autowired
	private ProductService service;
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("/manage-page123") 
	public String uploadView() {
		return "manage-page";
	}
	
	@PostMapping("/product_upload123")
	public String upload(Model model, HttpServletRequest request) throws IOException {
		URL uploadDir = servletContext.getResource("/resources/imageUpload");
        String uploadPath = uploadDir.toString().substring(6);
        System.out.println("하이" + uploadPath);
        
        
        
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest mutlpartRequest = new MultipartRequest(request, System.getProperty("java.io.tmpdir"), maxSize, encoding, new DefaultFileRenamePolicy());
		
		String name = mutlpartRequest.getParameter("product-title");
		String[] fileName = new String[3];
		File[] photo = new File[3];
		for (int i = 0; i < 3; i++) {
			fileName[i] = mutlpartRequest.getOriginalFileName("product-file" + (i + 1));
			photo[i] = mutlpartRequest.getFile("product-file" + (i + 1));
		}
		int price = Integer.parseInt(mutlpartRequest.getParameter("product-price"));
		String description = mutlpartRequest.getParameter("product-content");
		String now = new SimpleDateFormat("yyyy-MM-dd-HH_mm_ss_").format(new Date());
		
		String[] colorList = mutlpartRequest.getParameterValues("color_input");
		String[] sList = mutlpartRequest.getParameterValues("color_s");
		String[] mList = mutlpartRequest.getParameterValues("color_m");
		String[] lList = mutlpartRequest.getParameterValues("color_l");
		
		for (int i = 0; i < colorList.length; i++) {
		}
		
		String[] renameFileName = new String[3];
		for (int i = 0; i < 3; i++) {
			File file = new File(uploadDir + "/" + fileName[i]);
			file.renameTo(new File(uploadDir + "/" + now + fileName[i]));
			
			if (photo[i] != null) {
				renameFileName[i] = now + fileName[i];
				BufferedImage img = ImageIO.read(photo[i]);
				File imgFile = new File(uploadPath + renameFileName[i]);
				ImageIO.write(img, "png", imgFile);
			} else {
				renameFileName[i] = null;
			}
		}
		
		service.add(new Product(name, renameFileName[0], renameFileName[1], renameFileName[2], price, description));
		
		return "redirect:/manage-page";
	}
	

}
