package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import board.BoardDTO;

public class BoardDAO {
   
   private Connection conn = null;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
   public BoardDAO()  {
      
      try {
         String jdbcUrl = "jdbc:mysql://localhost:3306/hotel?serverTimezone=Asia/Seoul&useSSL=false";
           String dbId = "root";
           String dbPass = "a2330680^^";
      
          Class.forName("com.mysql.cj.jdbc.Driver");
          conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass);
          System.out.println("dddd");
        }catch (Exception e) {
            e.printStackTrace();
        }
   }

   public String getDate() {
      String SQL = "SELECT NOW()";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            return rs.getString(1);
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return ""; 
   }
   
   public int getNext() {
      String SQL = "SELECT b_number FROM board ORDER BY b_number DESC";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            return rs.getInt(1) + 1;
         }
         return 1; 
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1; 
   }
   
   public int write(String b_title, String userID, String b_content) {
      
      String SQL = "INSERT INTO board VALUES (?, ?, ?, ?, ?, ?)";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, getNext());
         pstmt.setString(2, b_title);
         pstmt.setString(3, userID);
         pstmt.setString(4, b_content);
         pstmt.setString(5, getDate());
         pstmt.setInt(6, 1);
         return pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
   public ArrayList<BoardDTO> getList(int pageNumber) {
      String SQL = "SELECT * FROM board WHERE b_number < ? AND b_available = 1 ORDER BY b_number DESC LIMIT 10";
      ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            BoardDTO dto = new BoardDTO();
            dto.setB_number(rs.getInt(1));
            dto.setB_title(rs.getString(2));
            dto.setUserID(rs.getString(3));
            dto.setB_content(rs.getString(4));
            dto.setB_date(rs.getString(5));
            dto.setB_available(rs.getInt(6));
            list.add(dto);
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return list;
   }
   
   public boolean nextPage(int pageNumber) {
      String SQL = "SELECT * FROM board WHERE b_number < ? AND b_available = 1 ORDER BY b_number DESC LIMIT 10";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, (pageNumber - 1) * 5);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            return true;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return false;
   }
   
   public BoardDTO getBoardDTO(int b_number) {
      String SQL = "SELECT * FROM board WHERE b_number = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, b_number);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            BoardDTO dto = new BoardDTO();
            dto.setB_number(rs.getInt(1));
            dto.setB_title(rs.getString(2));
            dto.setUserID(rs.getString(3));
            dto.setB_content(rs.getString(4));
            dto.setB_date(rs.getString(5));
            dto.setB_available(rs.getInt(6));
            return dto;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }
   public int update(int b_number, String b_title, String b_content) {
      String SQL = "UPDATE board SET b_title = ?, b_content = ? WHERE b_number = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, b_title);
         pstmt.setString(2, b_content);
         pstmt.setInt(3, b_number);
         return pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
   public int delete(int b_number) {
      String SQL = "UPDATE board SET b_available = 0 WHERE b_number = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, b_number);
         return pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1; 
   }
}