package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

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
      
      public boolean isCheck(String user_num,String movie_num) {
            
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
         
         //user_num별 pick 갯수
         public int myPickCount(String user_num) {
        	 
        	 int total = 0;
     	    
     	    Connection conn = db.getConnection();
     		PreparedStatement pstmt = null;
     		ResultSet rs = null;

     		String sql = "select count(*) from pick where user_num=?";

     		try {

     			pstmt = conn.prepareStatement(sql);
     			pstmt.setString(1, user_num);
     			rs = pstmt.executeQuery();

     			if (rs.next()) {
     				total = rs.getInt(1);
     			}

     		} catch (SQLException e) {
     			// TODO Auto-generated catch block
     			e.printStackTrace();
     		} finally {
     			db.dbClose(rs, pstmt, conn);
     		}
     		return total;
         }
         
         //user_num에 따른 리스트 출력
         public List<PickDto> getMyPickList(String user_num, int start, int perPage){
        	 
        	 List<PickDto> mypicklist=new Vector<>();
        	 
        	 Connection conn = db.getConnection();
     		 PreparedStatement pstmt = null;
     		 ResultSet rs = null;

     		String sql = "select * from pick where user_num=? order by pick_num desc limit ?,?";
        	 
     		try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, user_num);
				pstmt.setInt(2, start);
				pstmt.setInt(3, perPage);

				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					PickDto dto=new PickDto();
					
					dto.setMovie_num(rs.getString("movie_num"));
					dto.setUser_num(rs.getString("user_num"));
					dto.setPick_num(rs.getString("pick_num"));
					
					mypicklist.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
        	 return mypicklist;
         }
         
         //movie_num에 따른 포스터이미지 
         public String getMoviePoster(String movie_num) {
        	 
        	String movie_poster="";
        	
        	Connection conn=db.getConnection();
	        PreparedStatement pstmt=null;
	        ResultSet rs=null;
	        
	        String sql="select movie_poster from movie where movie_num=?";
	        
	        try {
				 pstmt=conn.prepareStatement(sql);
				 pstmt.setString(1, movie_num);
		         rs=pstmt.executeQuery();
		               
		               if(rs.next()) {
		            	   movie_poster=rs.getString("movie_poster");
		               }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
        	
        	return movie_poster;
         }
         
         //movi_num에 따른 영화제목 가져오기
         public String getMovieSubJect(String movie_num) {
        	 
        	String movie_subject="";
        	
        	Connection conn=db.getConnection();
	        PreparedStatement pstmt=null;
	        ResultSet rs=null;
	        
	        String sql="select movie_subject from movie where movie_num=?";
	        
	        try {
				 pstmt=conn.prepareStatement(sql);
				 pstmt.setString(1, movie_num);
		         rs=pstmt.executeQuery();
		               
		               if(rs.next()) {
		            	   movie_subject=rs.getString("movie_subject");
		               }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
        	
        	return movie_subject;
         }
      
}