package kr.co.shopping_mall.controller;

import java.io.File;
import java.io.IOException;
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

import kr.co.shopping_mall.model.Review;
import kr.co.shopping_mall.service.ReviewPagination;
import kr.co.shopping_mall.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@GetMapping
	public String load(Model model, @RequestParam(value="nowPage", required = false) String nowPage, ReviewPagination pagination){
		int total = service.reviewCount();
		System.out.println("요청페이지 : " + nowPage);
		System.out.println("토탈 : " + total);
		if (nowPage == null) {
			nowPage = "1";
		}
		pagination = new ReviewPagination(total, Integer.valueOf(nowPage));
		model.addAttribute("count", service.reviewCount());
		model.addAttribute("paging", pagination);
		model.addAttribute("read", service.reviewRead(pagination.getStartRow() - 1));
		System.out.println("시작 limit : " + pagination.getStartRow());
		System.out.println("끝 limit : " + pagination.getEndRow());
		return "bullentin-board";
	}
	
	@PostMapping
	public String addReview(Model model, HttpServletRequest request) throws IOException, InterruptedException {
		String uploadPath = request.getSession().getServletContext().getRealPath("");
		uploadPath = uploadPath.substring(0, uploadPath.indexOf(".metadata")) + "shopping_mall_spring/src/main/webapp/resources/imageUpload/";
		
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, uploadPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String id = multipartRequest.getParameter("id");
		String fileName = multipartRequest.getOriginalFileName("fileName");
		String text = multipartRequest.getParameter("text");
		String now = new SimpleDateFormat("yyyy-MM-dd-HH_mm_ss_").format(new Date());
		
		File file = new File(uploadPath + fileName);
		file.renameTo(new File(uploadPath + "/" + now + fileName));
		service.reviewAdd(new Review(id, now + fileName, text));
		
		Thread.sleep(5000);
		return "redirect:/review";
	}
}
