package kr.co.shopping_mall.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MallDao {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public MallDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<Map<String, Object>> getCount() {
		return jdbcTemplate.queryForList("SELECT * FROM product_upload");
	}
	
	public Map<String, Object> getFirstRow() {
		return jdbcTemplate.queryForMap("SELECT * FROM product_upload LIMIT 1");
	}
}
