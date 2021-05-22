package kr.co.shopping_mall.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.shopping_mall.model.Visitor;

@Repository
public class VisitorDao {
	private JdbcTemplate jdbcTemplate;
	
	public VisitorDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Visitor> VisitorRead() {
		return jdbcTemplate.query("SELECT * FROM visitor ORDER BY date DESC LIMIT 0, 6", new VisitorMapper());
	}
	
	public void VisitorAdd(String today) {
		jdbcTemplate.update("INSERT INTO visitor(date) VALUES(?)", today);
	}
	
	private int VisitorGetCnt(String today) {
		return jdbcTemplate.queryForObject("SELECT cnt FROM visitor WHERE date = ?", new Object[] { today }, Integer.class);
	}
	
	public void VisitorUpdateCnt(String date) {
		int cnt = VisitorGetCnt(date) + 1; 
		jdbcTemplate.update("UPDATE visitor set cnt = ? WHERE date = ?;", new Object[] { cnt, date });
	}
	
	public void ExistToday(String today) {
		int exist =  jdbcTemplate.queryForObject("SELECT count(*) FROM visitor WHERE date = ?", new Object[] { today }, Integer.class);
		if (exist == 0) {
			VisitorAdd(today);
		}
	}
	
	private class VisitorMapper implements RowMapper<Visitor> {
		@Override
		public Visitor mapRow(ResultSet rs, int rowNum) throws SQLException {
			String date = rs.getString("date");
			int cnt = rs.getInt("cnt");
			return new Visitor(date, cnt);
		}
	}
}
