package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.UserDto;
import mysql.db.DbConnect;

public class UserDao {
	
	DbConnect db=new DbConnect();
	
	
	//id 중복 체크
	public int isIdCheck(String user_id) {
		
		int isid=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from user where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				isid=rs.getInt(1);
				
			}	
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return isid;
	}
	
	
	//id에 따른 name 값 리턴
	public String getName(String user_id) {
		String name="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from user where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				name=rs.getString("name");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return name;
	}
	
	
	//insert
	public void insertUser(UserDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt= null;
		
		String sql="insert into user values(null,?,?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pw());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setString(4, dto.getUser_nickname());
			pstmt.setString(5, dto.getUser_hp());
			pstmt.setString(6, dto.getUser_addr());
			pstmt.setString(7, dto.getUser_email());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	//전체 목록 출력
	public List<UserDto> getAllUsers(){
		
		List<UserDto> list =new Vector<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from user order by user_id";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				UserDto dto=new UserDto();
				
				dto.setUser_num(rs.getString("user_num"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pw(rs.getString("user_pw"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setUser_hp(rs.getString("user_hp"));
				dto.setUser_addr(rs.getString("user_addr"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_gaip(rs.getTimestamp("user_gaip"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
		
	}
	
	
	//id, pw 체크
	public boolean isIdPwCheck(String user_id, String user_pw) {
		boolean b=false;
		Connection conn=db.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		
		String sql="select * from user where user_id=? and user_pw=?";
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				b=true;
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return b;
		
		
	}
	
	
	//id에 따른 num 값 리턴
	public String getNum(String user_id) {
		String num="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		String sql="select num from user where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getString("num");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return num;
	}
	
	
	//user 삭제
	public void deleteUser(String user_num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from user where user_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_num);
			pstmt.execute();
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	
	
	
	
	
	
	
}
