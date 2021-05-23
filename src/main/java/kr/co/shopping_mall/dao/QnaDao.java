package kr.co.shopping_mall.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
		public Qna mapRow(ResultSet rs, int rowNum) throws SQLException {
			int qna_num = rs.getInt("qna_num");
			String writer = rs.getString("writer");
			String title = rs.getString("title");
			String content = rs.getString("content");
			Date date = rs.getDate("regDate");
			int viewCnt = rs.getInt("viewCnt");
			
			return new Qna(qna_num, writer, title, content, date, viewCnt);
		}
	}

	// qna 목록 불러오기
	public List<Qna> selectAll() {
		return jdbcTemplate.query("SELECT * FROM qna", new QnaMapper());
	}

	// qna 하나 불러오기
	public Qna selectOne(int qna_num) {
		return jdbcTemplate.queryForObject("SELECT * FROM qna WHERE qna_num = ?", new Object[] { qna_num },
				new QnaMapper());
	}

	// qna 글 갯수 카운트
	public int qnaCount() {
		return jdbcTemplate.queryForObject("SELECT count(*) FROM qna", Integer.class);
	}

	// 15개씩 불러오기
	public List<Qna> qnaRead(int startRow) {
		return jdbcTemplate.query("SELECT * FROM qna ORDER BY qna_num DESC LIMIT ?, 15;", new Object[] { startRow },
				new QnaMapper());
	}

	// 조회수 증가
	public int updateViewCnt(int qna_num) {
		return jdbcTemplate.update("UPDATE qna SET viewCnt = viewCnt + 1" + " WHERE qna_num = ?", qna_num);
	}

	// qna 추가
	public int addQna(Qna qna) {
		return jdbcTemplate.update("INSERT INTO qna(writer, title, content)" + " VALUES (?, ?, ?)", qna.getWriter(),
				qna.getTitle(), qna.getContent());
	}

	// qna 업데이트
	public int update(Qna qna) {
		return jdbcTemplate.update("UPDATE qna SET writer = ?, title = ?, content = ?" + " WHERE qna_num = ?", qna.getWriter(),
				qna.getTitle(), qna.getContent(), qna.getQna_num());
	}

	// qna 삭제
	public int delete(int qna_num) {
		return jdbcTemplate.update("DELETE FROM qna WHERE qna_num = ", qna_num);
	}
}
