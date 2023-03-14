package data.dto;

import java.sql.Timestamp;

public class MentDto {
	
	private String ment_num;
	private String commu_num;
	private String user_num;
	private String ment_content;
	private Timestamp ment_writeday;
	
	public String getMent_num() {
		return ment_num;
	}
	public void setMent_num(String ment_num) {
		this.ment_num = ment_num;
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
	public String getMent_content() {
		return ment_content;
	}
	public void setMent_content(String ment_content) {
		this.ment_content = ment_content;
	}
	public Timestamp getMent_writeday() {
		return ment_writeday;
	}
	public void setMent_writeday(Timestamp ment_writeday) {
		this.ment_writeday = ment_writeday;
	}
	
	
}
