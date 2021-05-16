package kr.co.shopping_mall.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.shopping_mall.model.Review;

@Repository
public class ReviewDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public ReviewDAO(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private class ReviewMapper implements RowMapper<Review>{
		@Override
		public Review mapRow(ResultSet rs, int rowNum) throws SQLException {
			int number = rs.getInt("number");
			String id = rs.getString("id");
			String fileName = rs.getString("fileName");
			String text = rs.getString("text");
			return new Review(number, id, fileName, text);
		}
	}
	
	public int reviewAdd(Review review) {
		return jdbcTemplate.update("INSERT INTO review(id, fileName, text) VALUES (?, ?, ?)", review.getId(), review.getFileName(), review.getText());
	}
	
	public List<Review> reviewRead(int startRow) {
		return jdbcTemplate.query("SELECT * FROM review ORDER BY number DESC LIMIT ?, 15;", new Object[] { startRow }, new ReviewMapper());
	}
	
	public int reviewCount() {
		return jdbcTemplate.queryForObject("SELECT count(*) FROM review", Integer.class);
	}
	
	public int reviewDelete(int num) {
		return jdbcTemplate.update("DELETE FROM review WHERE num = ?", num);
	}
	
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
}
