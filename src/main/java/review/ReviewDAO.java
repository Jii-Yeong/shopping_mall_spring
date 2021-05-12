package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionProvider;

public class ReviewDAO {
	public int reviewAdd(Review review) {
		try (Connection conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement("INSERT INTO review(id, fileName, text) VALUES (?, ?, ?)");) {
				pstmt.setString(1, review.getId());
				pstmt.setString(2, review.getFileName());
				pstmt.setString(3, review.getText());
				return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public List<Review> reviewRead(int startRow, int endRow) {
		List<Review> list = new ArrayList<Review>();
		try (Connection conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM review WHERE number BETWEEN ? AND ? ORDER BY number DESC");) {
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					list.add(new Review(rs.getString("id"), rs.getString("fileName"), rs.getString("text")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int reviewCount() {
		int count = 0;
		try (Connection conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement("SELECT count(*) FROM review");
				ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					count = rs.getInt(1);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public void reviewDelete(int num) {
		try (Connection conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement("DELETE FROM review WHERE num = ?")) {
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
