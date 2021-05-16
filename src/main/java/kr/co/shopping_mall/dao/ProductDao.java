package kr.co.shopping_mall.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.shopping_mall.model.Product;

public class ProductDao {
	private JdbcTemplate jdbcTemplate;
	
	public ProductDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private class ProductMapper implements RowMapper<Product> {
		@Override
		public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
			int productId = rs.getInt("number");
			String name = rs.getString("name");
			String photo_1 = rs.getString("photo_1");
			String photo_2 = rs.getString("photo_2");
			String photo_3 = rs.getString("photo_3");
			int price = rs.getInt("price");
			String description = rs.getString("description");
			
			return new Product(productId, name, photo_1, photo_2, photo_3, price, description);
		}
		
	}
	
	public List<Product> readAllProduct() {
		return jdbcTemplate.query("SELECT * FROM product_upload", new ProductMapper());
	}
	
	public int addProduct(Product product) {
		return jdbcTemplate.update("INSERT INTO product_upload(name, photo_1, photo_2, photo_3, price, description) VALUES (?, ?, ?, ?, ?, ?)", product.getName(), product.getPhoto_1(), product.getPhoto_2(), product.getPhoto_3(), product.getPrice(), product.getDescription());
	}
	
}
