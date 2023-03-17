package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.MovieDto;
import mysql.db.DbConnect;

public class MovieDao {

	DbConnect db=new DbConnect();
	
	public void insertMovie(MovieDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into movie values(null,?,?,?,?,?,?,?,?,?,0,0)";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMovie_genre());
			pstmt.setString(2, dto.getMovie_subject());
			pstmt.setString(3, dto.getMovie_poster());
			pstmt.setString(4, dto.getMovie_play());
			pstmt.setString(5, dto.getMovie_year());
			pstmt.setString(6, dto.getMovie_nara());
			pstmt.setString(7, dto.getMovie_director());
			pstmt.setString(8, dto.getMovie_actor());
			pstmt.setString(9, dto.getMovie_content());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	
	 //전체개수
	   public int getTotalCount() {
	      
	      int n=0;
	      
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select count(*) from movie";
	      
	      try {
	         
	         pstmt=conn.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         
	         if(rs.next())
	            n=rs.getInt(1);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         db.dbClose(rs, pstmt, conn);
	      }
	      
	      return n;
	   }
	   
	   
	   //카테고리별 총갯수
	   public int getTotalCount_Genre(String movie_genre) {
		      
		      int n=0;
		      
		      Connection conn=db.getConnection();
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      
		      String sql="select count(*) from movie where movie_genre=?";
		      
		      try {
		         
		         pstmt=conn.prepareStatement(sql);
		         pstmt.setString(1, movie_genre);
		         
		         rs=pstmt.executeQuery();
		         
		         if(rs.next())
		            n=rs.getInt(1);
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		         db.dbClose(rs, pstmt, conn);
		      }
		      
		      return n;
		   }
	   
	   
	 
	 //전체 리스트출력(최신순)
	 public List<MovieDto> getList_Recent(int start,int perPage){
	      
	      List<MovieDto> list=new ArrayList<>();
	      
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select * from movie order by movie_num desc limit ?,?";
	      
	      try {
	         
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setInt(1, start);
	         pstmt.setInt(2, perPage);
	         
	         rs=pstmt.executeQuery();
	         
	         while(rs.next()) {
	            
	            MovieDto dto=new MovieDto();
	            
	            dto.setMovie_num(rs.getString("movie_num"));
	            dto.setMovie_genre(rs.getString("movie_genre"));
	            dto.setMovie_subject(rs.getString("movie_subject"));
	            dto.setMovie_poster(rs.getString("movie_poster"));
	            dto.setMovie_play(rs.getString("movie_play"));
	            dto.setMovie_year(rs.getString("movie_year"));
	            dto.setMovie_nara(rs.getString("movie_nara"));
	            dto.setMovie_director(rs.getString("movie_director"));
	            dto.setMovie_actor(rs.getString("movie_actor"));
	            dto.setMovie_content(rs.getString("movie_content"));
	            dto.setMovie_pcount(rs.getInt("movie_pcount"));
	            dto.setMovie_rank_avg(rs.getDouble("movie_rank_avg"));
	            
	            list.add(dto);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         db.dbClose(rs, pstmt, conn);
	      }
	      
	      
	      return list;
	   }
	 
	 
	 
	 //전체 리스트출력(픽순)
	 public List<MovieDto> getList_Pcount(int start,int perPage){
	      
	      List<MovieDto> list=new ArrayList<>();
	      
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select * from movie order by movie_pcount desc limit ?,?";
	      
	      try {
	         
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setInt(1, start);
	         pstmt.setInt(2, perPage);
	         
	         rs=pstmt.executeQuery();
	         
	         while(rs.next()) {
	            
	            MovieDto dto=new MovieDto();
	            
	            dto.setMovie_num(rs.getString("movie_num"));
	            dto.setMovie_genre(rs.getString("movie_genre"));
	            dto.setMovie_subject(rs.getString("movie_subject"));
	            dto.setMovie_poster(rs.getString("movie_poster"));
	            dto.setMovie_play(rs.getString("movie_play"));
	            dto.setMovie_year(rs.getString("movie_year"));
	            dto.setMovie_nara(rs.getString("movie_nara"));
	            dto.setMovie_director(rs.getString("movie_director"));
	            dto.setMovie_actor(rs.getString("movie_actor"));
	            dto.setMovie_content(rs.getString("movie_content"));
	            dto.setMovie_pcount(rs.getInt("movie_pcount"));
	            dto.setMovie_rank_avg(rs.getDouble("movie_rank_avg"));
	            
	            list.add(dto);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         db.dbClose(rs, pstmt, conn);
	      }
	      
	      
	      return list;
	   }
	 
	 
	 
	 //전체 리스트출력(평점순)
	 public List<MovieDto> getList_Rank_Avg(int start,int perPage){
	      
	      List<MovieDto> list=new ArrayList<>();
	      
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select * from movie order by movie_rank_avg desc limit ?,?";
	      
	      try {
	         
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setInt(1, start);
	         pstmt.setInt(2, perPage);
	         
	         rs=pstmt.executeQuery();
	         
	         while(rs.next()) {
	            
	            MovieDto dto=new MovieDto();
	            
	            dto.setMovie_num(rs.getString("movie_num"));
	            dto.setMovie_genre(rs.getString("movie_genre"));
	            dto.setMovie_subject(rs.getString("movie_subject"));
	            dto.setMovie_poster(rs.getString("movie_poster"));
	            dto.setMovie_play(rs.getString("movie_play"));
	            dto.setMovie_year(rs.getString("movie_year"));
	            dto.setMovie_nara(rs.getString("movie_nara"));
	            dto.setMovie_director(rs.getString("movie_director"));
	            dto.setMovie_actor(rs.getString("movie_actor"));
	            dto.setMovie_content(rs.getString("movie_content"));
	            dto.setMovie_pcount(rs.getInt("movie_pcount"));
	            dto.setMovie_rank_avg(rs.getDouble("movie_rank_avg"));
	            
	            list.add(dto);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         db.dbClose(rs, pstmt, conn);
	      }
	      
	      
	      return list;
	   }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	//카테고리별 리스트출력(최신순)
		 public List<MovieDto> getList_Genre_Recent(String movie_genre,int start,int perPage){
		      
		      List<MovieDto> list=new ArrayList<>();
		      
		      Connection conn=db.getConnection();
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      
		      String sql="select * from movie where movie_genre=? order by movie_num desc limit ?,?";
		      
		      try {
		         
		         pstmt=conn.prepareStatement(sql);
		         pstmt.setString(1, movie_genre);
		         pstmt.setInt(2, start);
		         pstmt.setInt(3, perPage);
		         
		         rs=pstmt.executeQuery();
		         
		         while(rs.next()) {
		            
		            MovieDto dto=new MovieDto();
		            
		            dto.setMovie_num(rs.getString("movie_num"));
		            dto.setMovie_genre(rs.getString("movie_genre"));
		            dto.setMovie_subject(rs.getString("movie_subject"));
		            dto.setMovie_poster(rs.getString("movie_poster"));
		            dto.setMovie_play(rs.getString("movie_play"));
		            dto.setMovie_year(rs.getString("movie_year"));
		            dto.setMovie_nara(rs.getString("movie_nara"));
		            dto.setMovie_director(rs.getString("movie_director"));
		            dto.setMovie_actor(rs.getString("movie_actor"));
		            dto.setMovie_content(rs.getString("movie_content"));
		            dto.setMovie_pcount(rs.getInt("movie_pcount"));
		            dto.setMovie_rank_avg(rs.getDouble("movie_rank_avg"));
		            
		            list.add(dto);
		         }
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		         db.dbClose(rs, pstmt, conn);
		      }
		      
		      
		      return list;
		   }
		 
		 
		//카테고리별 리스트출력(픽순)
		 public List<MovieDto> getList_Genre_Pcount(String movie_genre,int start,int perPage){
		      
		      List<MovieDto> list=new ArrayList<>();
		      
		      Connection conn=db.getConnection();
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      
		      String sql="select * from movie where movie_genre=? order by movie_pcount desc limit ?,?";
		      
		      try {
		         
		         pstmt=conn.prepareStatement(sql);
		         pstmt.setString(1, movie_genre);
		         pstmt.setInt(2, start);
		         pstmt.setInt(3, perPage);
		         
		         rs=pstmt.executeQuery();
		         
		         while(rs.next()) {
		            
		            MovieDto dto=new MovieDto();
		            
		            dto.setMovie_num(rs.getString("movie_num"));
		            dto.setMovie_genre(rs.getString("movie_genre"));
		            dto.setMovie_subject(rs.getString("movie_subject"));
		            dto.setMovie_poster(rs.getString("movie_poster"));
		            dto.setMovie_play(rs.getString("movie_play"));
		            dto.setMovie_year(rs.getString("movie_year"));
		            dto.setMovie_nara(rs.getString("movie_nara"));
		            dto.setMovie_director(rs.getString("movie_director"));
		            dto.setMovie_actor(rs.getString("movie_actor"));
		            dto.setMovie_content(rs.getString("movie_content"));
		            dto.setMovie_pcount(rs.getInt("movie_pcount"));
		            dto.setMovie_rank_avg(rs.getDouble("movie_rank_avg"));
		            
		            list.add(dto);
		         }
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		         db.dbClose(rs, pstmt, conn);
		      }
		      
		      
		      return list;
		   }
		 
		 
		 
		//카테고리별 리스트출력(평점순)
		 public List<MovieDto> getList_Genre_Rank_Avg(String movie_genre,int start,int perPage){
		      
		      List<MovieDto> list=new ArrayList<>();
		      
		      Connection conn=db.getConnection();
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      
		      String sql="select * from movie where movie_genre=? order by movie_rank_avg desc limit ?,?";
		      
		      try {
		         
		         pstmt=conn.prepareStatement(sql);
		         pstmt.setString(1, movie_genre);
		         pstmt.setInt(2, start);
		         pstmt.setInt(3, perPage);
		         
		         rs=pstmt.executeQuery();
		         
		         while(rs.next()) {
		            
		            MovieDto dto=new MovieDto();
		            
		            dto.setMovie_num(rs.getString("movie_num"));
		            dto.setMovie_genre(rs.getString("movie_genre"));
		            dto.setMovie_subject(rs.getString("movie_subject"));
		            dto.setMovie_poster(rs.getString("movie_poster"));
		            dto.setMovie_play(rs.getString("movie_play"));
		            dto.setMovie_year(rs.getString("movie_year"));
		            dto.setMovie_nara(rs.getString("movie_nara"));
		            dto.setMovie_director(rs.getString("movie_director"));
		            dto.setMovie_actor(rs.getString("movie_actor"));
		            dto.setMovie_content(rs.getString("movie_content"));
		            dto.setMovie_pcount(rs.getInt("movie_pcount"));
		            dto.setMovie_rank_avg(rs.getDouble("movie_rank_avg"));
		            
		            list.add(dto);
		         }
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		         db.dbClose(rs, pstmt, conn);
		      }
		      
		      
		      return list;
		   }
		 
		 
	//삭제
	 public void deleteMovie(String movie_num) {
		 
		  Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      
	      String sql="delete from movie where movie_num=?";
	      
	      try {
	         
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, movie_num);
	         
	         pstmt.execute();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         db.dbClose(pstmt, conn);
	      }
	 }
	 
	 //데이터얻기
	 public MovieDto getData(String movie_num) {
	      
	      MovieDto dto=new MovieDto();
	      
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;

	      String sql="select * from movie where movie_num=?";

	      try {

	         pstmt=conn.prepareStatement(sql);

	         pstmt.setString(1, movie_num);
	         rs=pstmt.executeQuery();

	         if(rs.next()) {

	        	 dto.setMovie_num(rs.getString("movie_num"));
		         dto.setMovie_genre(rs.getString("movie_genre"));
		         dto.setMovie_subject(rs.getString("movie_subject"));
		         dto.setMovie_poster(rs.getString("movie_poster"));
		         dto.setMovie_play(rs.getString("movie_play"));
		         dto.setMovie_year(rs.getString("movie_year"));
		         dto.setMovie_nara(rs.getString("movie_nara"));
		         dto.setMovie_director(rs.getString("movie_director"));
		         dto.setMovie_actor(rs.getString("movie_actor"));
		         dto.setMovie_content(rs.getString("movie_content"));
		         dto.setMovie_pcount(rs.getInt("movie_pcount"));
		         dto.setMovie_rank_avg(rs.getDouble("movie_rank_avg"));
	         }
	      } catch (SQLException e) {

	         e.printStackTrace();
	      }finally {
	         db.dbClose(rs, pstmt, conn);
	      }
	      return dto;

	   }
}