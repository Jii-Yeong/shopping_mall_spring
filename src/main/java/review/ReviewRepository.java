package review;

import java.util.List;

public class ReviewRepository {
	private static ReviewRepository instance = new ReviewRepository(new ReviewDAO());
	private ReviewDAO dao;
	
	public ReviewRepository(ReviewDAO dao) {
		super();
		this.dao = dao;
	}

	public static ReviewRepository getInstance() {
		return instance;
	}
	
	public void reviewAdd(Review review) {
		dao.reviewAdd(review);
	}
	
	public List<Review> reviewRead(int startRow, int endRow) {
		return dao.reviewRead(startRow, endRow);
	}
	
	public int reviewCount() {
		return dao.reviewCount();
	}
	
	public void reviewDelete(int num) {
		dao.reviewDelete(num);
	}
}
