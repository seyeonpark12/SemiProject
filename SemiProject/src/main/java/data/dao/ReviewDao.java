package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.ReviewDto;
import mysql.db.DbConnect;

public class ReviewDao {
	DbConnect db = new DbConnect();

	public void insertreview(ReviewDto dto) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into review values(null, ?, ?,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMovie_num());
			pstmt.setString(2, dto.getUser_num());
			pstmt.setDouble(3, dto.getReview_score());
			pstmt.setString(4, dto.getReview_content());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	public int getMaxNum() {
		int max = 0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select max(review_num) max from review";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				max = rs.getInt("max");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return max;

	}

	public List<ReviewDto> getAllReview(String user_num) {
		List<ReviewDto> list = new Vector<>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from review where user_num=? order by movie_num";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setUser_num(rs.getString("user_num"));
				dto.setMovie_num(rs.getString("movie_num"));
				dto.setReview_num(rs.getString("review_num"));
				dto.setReview_score(rs.getDouble("review_score"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReview_writeday(rs.getTimestamp("review_writeday"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	public int getTotalReviewCount() {
		int total = 0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from review";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return total;
	}

	// 페이징처리 list
	public List<ReviewDto> getAllReview(int start, int perPage) {
		List<ReviewDto> list = new Vector<>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from review order by user_num desc limit ?,?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, perPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewDto dto = new ReviewDto();

				dto.setUser_num(rs.getString("user_num"));
				dto.setMovie_num(rs.getString("movie_num"));
				dto.setReview_num(rs.getString("review_num"));
				dto.setReview_score(rs.getDouble("review_score"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReview_writeday(rs.getTimestamp("review_writeday"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;

	}


}
