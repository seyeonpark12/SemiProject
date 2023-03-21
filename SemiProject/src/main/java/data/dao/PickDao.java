package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.MovieDto;
import data.dto.PickDto;
import mysql.db.DbConnect;

public class PickDao {

	DbConnect db = new DbConnect();
	   
	   public void insertPick(String user_num,String movie_num) {
		   
		   Connection conn=db.getConnection();
		   PreparedStatement pstmt=null;
		   
		   String sql="insert into pick values(null,?,?)";
		   
		   try {
			   
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_num);
			pstmt.setString(2, movie_num);
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		   
	   }
	   
	   public boolean isCehck(String user_num,String movie_num) {
		      
		      boolean flag=false;
		      
		      Connection conn=db.getConnection();
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;

		      String sql="select * from pick where user_num=? and movie_num=?";

		      try {

		         pstmt=conn.prepareStatement(sql);

		         pstmt.setString(1, user_num);
		         pstmt.setString(2, movie_num);
		         rs=pstmt.executeQuery();

		         if(rs.next()) {
		        	 
		        	 flag=true;
		         }
		      } catch (SQLException e) {

		         e.printStackTrace();
		      }finally {
		         db.dbClose(rs, pstmt, conn);
		      }
		      return flag;

		   }
	   
	   public void deletePick(String user_num,String movie_num) {
		   
		   	  Connection conn=db.getConnection();
		      PreparedStatement pstmt=null;
		      
		      String sql="delete from pick where user_num=? and movie_num=?";
		      
		      try {
		         
		         pstmt=conn.prepareStatement(sql);
		         pstmt.setString(1, user_num);
		         pstmt.setString(2, movie_num);
		         
		         pstmt.execute();
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		         db.dbClose(pstmt, conn);
		      }
	   }
	   
	   
	   public void insertPcount(String movie_num) {
		      Connection conn = db.getConnection();
		      PreparedStatement pstmt = null;

		      String sql = "update movie set movie_pcount=movie_pcount+1 where movie_num=?";

		      try {
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, movie_num);

		         pstmt.execute();
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      } finally {
		         db.dbClose(pstmt, conn);
		      }
		   }
		   
		   public void deletePcount(String movie_num) {
		      Connection conn = db.getConnection();
		      PreparedStatement pstmt = null;

		      String sql = "update movie set movie_pcount=movie_pcount-1 where movie_num=?";

		      try {
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, movie_num);

		         pstmt.execute();
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      } finally {
		         db.dbClose(pstmt, conn);
		      }
		   }
	   
	   
	   
	   
	   
	   
}
