package kr.co.shopping_mall.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.RowMapperResultSetExtractor;
import org.springframework.stereotype.Repository;

import kr.co.shopping_mall.model.Order;

@Repository
public class OrderDao {
	private JdbcTemplate jdbcTemplate;
	
	public OrderDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private class OrderMapper implements RowMapper<Order> {
		@Override
		public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
			int number = rs.getInt("number");
			int productNum = rs.getInt("product_num");
			String userId = rs.getString("user_id");
			String color = rs.getString("color");
			String size = rs.getString("size");
			int amount = rs.getInt("amount");
			int totalPrice = rs.getInt("total_price");
			return new Order(number, productNum, userId, color, size, amount, totalPrice);
		}
	}
	
	public List<Order> readAll() {
		return jdbcTemplate.query("SELECT * FROM product_order", new OrderMapper());
	}
	
	public int deleteOrder(int productNum) {
		return jdbcTemplate.update("DELETE FROM product_order WHERE product_num = ?", productNum);
	}
}
