package kr.co.shopping_mall.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO dao;
	
	public int ReviewAdd(Review review) {
		return dao.reviewAdd(review);
	}
	
	public List<Review> ReviewRead(int startRow, int endRow) {
		return dao.reviewRead(startRow, endRow);
	}
	
	public int ReviewCount() {
		return dao.reviewCount();
	}
	
	public int ReviewDelete(int num) {
		return dao.reviewDelete(num);
	}
}
