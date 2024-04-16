package reserve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import room.Room;
import reserve.Reserve;

public class reservation {
	private Connection conn = null;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public reservation(String r_id, int r_adults, int r_kids, String r_checkin, 
			String r_checkout, String r_type, int r_price) {
		try {
	        String dbURL = "jdbc:mysql://localhost:3306/hotel?serverTimezone=Asia/Seoul&useSSL=false";
	        String dbID = "root";
	        String dbPassword = "a2330680^^";

	        Class.forName("com.mysql.cj.jdbc.Driver");
	        this.conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

	        System.out.println("연결되었습니다.");
	        String SQL ="INSERT INTO reserve (r_id, r_adults, r_kids, "
	        		+ "r_checkin, r_checkout, r_type, r_price) VALUES(?,?,?,?,?,?,?)";
	        
	        try {
	        	pstmt = conn.prepareStatement(SQL);
	        	pstmt.setString(1, r_id);				
	        	pstmt.setInt(2, r_adults);				
	        	pstmt.setInt(3, r_kids);				
	        	pstmt.setString(4, r_checkin);				
	        	pstmt.setString(5, r_checkout);				
	        	pstmt.setString(6, r_type);				
	        	pstmt.setInt(7, r_price);				
	            pstmt.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
}
 }