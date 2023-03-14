package data.dto;

import java.sql.*;

public class ReviewDto {

	private String review_num;
	private String movie_num;
	private String user_num;
	private Double review_score;
	private String review_content;
	private Timestamp review_writeday;

	public Double getReview_score() {
		return review_score;
	}

	public void setReview_score(Double review_score) {
		this.review_score = review_score;
	}

	public String getReview_num() {
		return review_num;
	}

	public void setReview_num(String review_num) {
		this.review_num = review_num;
	}

	public String getMovie_num() {
		return movie_num;
	}

	public void setMovie_num(String movie_num) {
		this.movie_num = movie_num;
	}

	public String getUser_num() {
		return user_num;
	}

	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Timestamp getReview_writeday() {
		return review_writeday;
	}

	public void setReview_writeday(Timestamp review_writeday) {
		this.review_writeday = review_writeday;
	}
}
