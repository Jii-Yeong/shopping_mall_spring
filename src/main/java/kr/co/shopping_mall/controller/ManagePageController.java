package kr.co.shopping_mall.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.shopping_mall.model.Product;
import kr.co.shopping_mall.service.ProductService;
import kr.co.shopping_mall.service.ReviewPagination;
import kr.co.shopping_mall.service.ReviewService;
import kr.co.shopping_mall.service.UserService;

@Controller
@RequestMapping("/manage-page")
public class ManagePageController {
	@Autowired
	private ProductService productservice;
	@Autowired
	private UserService userService;
	@Autowired
	private ReviewService ReviewService;
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping
	public String managePage() {
		return "manage-page";
	}
	
	@GetMapping("/manage-review")
	public String load(Model model, @RequestParam(value="nowPage", required = false) String nowPage, ReviewPagination pagination){
		int total = ReviewService.reviewCount();
		System.out.println("요청페이지 : " + nowPage);
		System.out.println("토탈 : " + total);
		if (nowPage == null) {
			nowPage = "1";
		}
		pagination = new ReviewPagination(total, Integer.valueOf(nowPage));
		model.addAttribute("count", ReviewService.reviewCount());
		model.addAttribute("paging", pagination);
		model.addAttribute("read", ReviewService.reviewRead(pagination.getStartRow() - 1));
		System.out.println("시작 limit : " + pagination.getStartRow());
		System.out.println("끝 limit : " + pagination.getEndRow());
		return "manage-review";
	}
	
	@GetMapping("/manage-user")
	public String userLoad(Model model) {
		model.addAttribute("user_list", userService.getAllUser());
		return "manage-user-list";
	}
	
	@GetMapping("/manage-product")
	public String index(Model model) {
		model.addAttribute("product_list", productservice.readAll());
		return "manage-product";
	}
	
	@PostMapping("/manage-upload")
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
		productservice.add(new Product(name, renameFileName[0], renameFileName[1], renameFileName[2], price, description));
		return "redirect:/manage-upload";
	}
}
