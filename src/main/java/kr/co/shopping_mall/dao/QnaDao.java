package kr.co.shopping_mall.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.shopping_mall.model.Qna;


@Repository
public class QnaDao {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public QnaDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private class QnaMapper implements RowMapper<Qna> {
		@Override
		public Qna mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			int qna_num = rs.getInt("qna_num");
			String id = rs.getString("id");
			String title = rs.getString("title");
			String date = rs.getString("date");
			String content = rs.getString("content");
			int available = rs.getInt("available");
			return new Qna(qna_num, id, title, content, date, available);
		}
	}
	
	public int qnaAdd(Qna qna) { // qna추가
		return jdbcTemplate.update(
				"INSERT INTO qna(id, title, content, date)"
				+ " VALUES (?, ?, ?, ?)", qna.getId(), qna.getTitle()
				, qna.getContent(), qna.getDate());
	}
	
//	public ArrayList<Qna> qnaListRead1(int pageNum) {
//		ArrayList<Qna> list = new ArrayList<Qna>();
//		try (Connection conn = ConnectionProvider.getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(
//						"SELECT * FROM qna WHERE qna_num < ?"
//						+ " AND available = 1 ORDER BY qna_num DESC LIMIT 10");
//				ResultSet rs = pstmt.executeQuery();) {
//			
//			pstmt.setInt(1, getNext() - (pageNum -1) * 10);
//
//			while (rs.next()) {
//				Qna qna = new Qna();
//				qna.setQna_Num(rs.getInt(1));
//				qna.setId(rs.getString(2));
//				qna.setTitle(rs.getString(3));
//				qna.setDate(rs.getString(4));
//				qna.setContent(rs.getString(5));
//				qna.setAvailable(rs.getInt(6));
//				list.add(qna);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list; 
//	}
	public ArrayList<Qna> qnaListRead(int pageNum) {
		return (ArrayList<Qna>) jdbcTemplate.query(
				"SELECT * FROM qna WHERE qna_num < ?"
				+ " AND available = 1 ORDER BY qna_num"
				+ " DESC LIMIT 10"
				, new Object[] { getNext() - (pageNum -1) * 10 }
				, new QnaMapper());
	}
	
	//10 단위 페이징 처리를 위한 함수
//	public boolean nextPage1 (int pageNum) {
//		try (Connection conn = ConnectionProvider.getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(
//						"SELECT * FROM qna WHERE qna_num < ?"
//						+ " AND available = 1 ORDER BY qna_num DESC LIMIT 10");
//				ResultSet rs = pstmt.executeQuery();) {
//			pstmt.setInt(1, getNext() - (pageNum -1) * 10);
//			if (rs.next()) {
//				return true;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return false;
//	}
	public boolean nextPage (int pageNum) {
		return jdbcTemplate.query(
				"SELECT * FROM qna WHERE qna_num < ?"
						+ " AND available = 1 ORDER BY qna_num"
						+ " DESC LIMIT 10"
						, new Object[] { getNext() - (pageNum -1) * 10 }
						, new QnaMapper()) != null; // 이부분 검사해봐야함 마지막 !=null
	}
	
	//게시글번호로 읽기
	public Qna getQna(int qna_num) {
		return jdbcTemplate.queryForObject(
				"SELECT * FROM qna WHERE qna_num = ?"
				, new Object[] { qna_num }, new QnaMapper());
	}
	
	//qna 수정
	public int update(int qna_num, String title, String content) {
		return jdbcTemplate.update(
				"UPDATE qna SET title = ?, content = ?"
				+ " WHERE qna_num = ?"
						, title, content, qna_num);
	}

	//qna 수정
	public int qnaDelete(int qna_num) {
		return jdbcTemplate.update("DELETE FROM qna WHERE qna_num = ?", qna_num);
	}
	
	//mysql에서 현재 시간을 가져오는 메소드
//	public String getDate1() { 
//		ResultSet rs = null;
//		try (Connection conn = ConnectionProvider.getConnection();
//				PreparedStatement pstmt = conn.prepareStatement("SELECT NOW()");) {
//			pstmt.executeQuery();
//			if(rs.next()) {
//				return rs.getString(1);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return ""; //데이터베이스 오류
//	}
	public String getDate() {
		return jdbcTemplate.queryForObject("SELECT NOW()", String.class);
	}
	
	//게시글 번호(qna_num 칼럼) 가져오는 메소드
	public int getNext() {
		return jdbcTemplate.queryForObject("SELECT qna_num FROM qna ORDER BY qna_num DESC", Integer.class);
	}
}
