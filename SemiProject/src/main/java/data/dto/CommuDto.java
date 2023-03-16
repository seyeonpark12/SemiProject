package data.dto;

import java.sql.Timestamp;

public class CommuDto {
	
	
	private String commu_num;
	private String user_num;
	private String commu_subject;
	private String commu_category;
	private String commu_content;
	private String commu_photo;
	private int commu_readcount;
	private Timestamp commu_writeday;
	
	private int answerCount; //댓글갯수!!
	
	
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public String getCommu_num() {
		return commu_num;
	}
	public void setCommu_num(String commu_num) {
		this.commu_num = commu_num;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public String getCommu_subject() {
		return commu_subject;
	}
	public void setCommu_subject(String commu_subject) {
		this.commu_subject = commu_subject;
	}
	public String getCommu_category() {
		return commu_category;
	}
	public void setCommu_category(String commu_category) {
		this.commu_category = commu_category;
	}
	public String getCommu_content() {
		return commu_content;
	}
	public void setCommu_content(String commu_content) {
		this.commu_content = commu_content;
	}
	public String getCommu_photo() {
		return commu_photo;
	}
	public void setCommu_photo(String commu_photo) {
		this.commu_photo = commu_photo;
	}
	public int getCommu_readcount() {
		return commu_readcount;
	}
	public void setCommu_readcount(int commu_readcount) {
		this.commu_readcount = commu_readcount;
	}
	public Timestamp getCommu_writeday() {
		return commu_writeday;
	}
	public void setCommu_writeday(Timestamp commu_writeday) {
		this.commu_writeday = commu_writeday;
	}
	
	
	
}