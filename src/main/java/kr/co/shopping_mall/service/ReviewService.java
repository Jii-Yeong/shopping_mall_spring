package kr.co.shopping_mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.shopping_mall.dao.ReviewDAO;
import kr.co.shopping_mall.model.Review;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO dao;
	
	public int reviewAdd(Review review) {
		return dao.reviewAdd(review);
	}
	
	public List<Review> reviewRead(int startRow, int endRow) {
		return dao.reviewRead(startRow, endRow);
	}
	
	public int reviewCount() {
		return dao.reviewCount();
	}
	
	public int reviewDelete(int num) {
		return dao.reviewDelete(num);
	}
}
