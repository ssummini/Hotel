package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class UserDAO {
	private Connection conn = null;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		 try {
	         String dbURL = "jdbc:mysql://localhost:3306/hotel?serverTimezone=Asia/Seoul&useSSL=false";
	         String dbID = "root";
	         String dbPassword = "a2330680^^";
	         
	         Class.forName("com.mysql.cj.jdbc.Driver");
	         this.conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	         
	         System.out.println("연결되었습니다.");
	     }catch (Exception e) {
	         e.printStackTrace();	         
	     }
	}
	
	 public int login(String userID, String userPW) {
	      String SQL = "SELECT userPW FROM user WHERE userID = ? ";

	      try {
	    	 System.out.println(userID);
		         
	         pstmt = this.conn.prepareStatement(SQL);
	         
	         pstmt.setString(1, userID);
	         rs = pstmt.executeQuery();
	         
	        
	         if(rs.next()) {
	        	 
	        	 
	            if(rs.getString(1).equals(userPW)) {	       
	               return 1; //로그인 성공
	            }
	            else
	               return 0; //비밀번호 불일치
	         }
	         return -1; // 아이디가 없음
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return -2; //데이터베이스 오류
	   }
	 
	 public int join(User user) {
		 String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		 try {
			 pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, user.getUserID());
			 pstmt.setString(2, user.getUserPW());
			 pstmt.setString(3, user.getUserName());			 
			 pstmt.setString(4, user.getUserEmail());				
			 pstmt.setString(5, user.getUserPhone());		
			 return pstmt.executeUpdate();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return -1; //데이터베이스 오류
	 }
	 
	 
}