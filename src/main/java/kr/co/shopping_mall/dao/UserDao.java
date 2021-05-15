package kr.co.shopping_mall.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.shopping_mall.model.User;

@Repository
public class UserDao {
	private JdbcTemplate jdbcTemplate;
	
//	@Autowired
	public UserDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private class UserMapper implements RowMapper<User> {
		@Override
		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			int user_num = rs.getInt("user_num");
			String id = rs.getString("id");
			String password = rs.getString("password");
			String name = rs.getString("name");
			Date birth = rs.getDate("birth");
			int phone_num = rs.getInt("phone_num");
			String address = rs.getString("address");
			LocalDateTime join_date = rs.getTimestamp("join_date").toLocalDateTime();
			
			return new User(user_num, id, password, name, birth, phone_num, address, join_date, user_num);
		}
	}
	// 전체 회원 조회
	public List<User> getAllUser() {
		return jdbcTemplate.query("SELECT * FROM users", new UserMapper());
	}
	
	// 회원 번호로 조회
	public User getByUserNum(int user_num) {
		return jdbcTemplate.queryForObject(
								"SELECT * FROM users WHERE user_num = ?"
								, new Object[] { user_num }
								, new UserMapper());
	}
	
	// 회원 삭제
	public int deleteUser(int user_num) {
		return jdbcTemplate.update("DELETE FROM users WHERE user_num = ?"
				, user_num);
	}
	
	// 회원 정보 업데이트
	public int update(User user) {
		return jdbcTemplate.update("UPDATE users SET password = ?"
													+ ", name = ?"
													+ ", phone_num = ?"
													+ ", address = ?"
													+ ", grade = ?",
													user.getPassword()
													, user.getName()
													, user.getPhone_num()
													, user.getAddress()
													, user.getGrade());
	}
}
