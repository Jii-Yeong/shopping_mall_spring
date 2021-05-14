package kr.co.shopping_mall.review;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@GetMapping("/load")
	public String load() {
		return "bullentin-board";
	}
	
	@PostMapping(value = "/load", params = { "id", "text", "file"})
	public String addReview(@RequestParam String id, @RequestParam String text, @RequestParam String fileName) {
		String uploadDir = this.getClass().getResource("").getPath();
		uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "shopping_mall/WebContent/imageUpload";
		
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String now = new SimpleDateFormat("yyyy-MM-dd-HH_mm_ss_").format(new Date());
		
		File file = new File(uploadDir + "/" + fileName);
		file.renameTo(new File(uploadDir + "/" + now + fileName));
		
		int result = service.ReviewAdd(new Review(id, fileName, text));
		return "redirect/";
	}
	
}
