package kr.co.shopping_mall.review;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

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

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@Autowired
	private ServletContext ServletContext;
	
	@GetMapping
	public String load(Model model) {
		model.addAttribute("read", service.reviewRead(0, 10));
		model.addAttribute("count", service.reviewCount());
		return "bullentin-board";
	}
	
	@PostMapping
	public String addReview(Model model, HttpServletRequest request) throws IOException {
		String uploadPath = request.getRealPath("/resources/imageUpload");
		System.out.println(uploadPath);
		
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, uploadPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String id = multipartRequest.getParameter("id");
		String fileName = multipartRequest.getParameter("fileName");
		String text = multipartRequest.getParameter("text");
		String now = new SimpleDateFormat("yyyy-MM-dd-HH_mm_ss_").format(new Date());
		
		File file = new File(uploadPath + fileName);
		file.renameTo(new File(uploadPath + "/" + now + fileName));
		
		service.reviewAdd(new Review(id, fileName, text));
		return "redirect:/bullentin-board";
	}
	
}
