package room;

import room.Room;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class RoomDAO {
	private Connection conn = null;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public RoomDAO() {
		 try {
	         String dbURL = "jdbc:mysql://localhost:3306/hotel?serverTimezone=Asia/Seoul&useSSL=false";
	         String dbID = "root";
	         String dbPassword = "a2330680^^";
	         
	         Class.forName("com.mysql.cj.jdbc.Driver");
	         this.conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	         
	         System.out.println("연결되었습니다!!!!!!!!!!!!!!!!");
	     }catch (Exception e) {
	         e.printStackTrace();
	         
	     }
	}
	
	/** 모든 방의 정보를 반환하는 메소드 **/
	public ArrayList<Room> getAllRoom(){
		ArrayList<Room> v = new ArrayList<Room>();	
		Room bean = null;
		
		try {
			String sql = "select * from room";
			pstmt = this.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean = new Room();
				bean.setRoom_id(rs.getInt("room_id"));
				bean.setRoom_type(rs.getString("room_type"));
				bean.setRoom_size(rs.getInt("room_size"));
				bean.setRoom_capacity(rs.getInt("room_capacity"));
				bean.setRoom_price(rs.getInt("room_price"));
				bean.setRoom_img(rs.getString("room_img"));
				bean.setRoom_count(rs.getInt("room_count"));
				v.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	
}

