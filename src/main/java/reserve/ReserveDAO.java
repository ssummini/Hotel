package reserve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;

import room.Room;

public class ReserveDAO {
	private Connection conn = null;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// select userName, userBirthday, checkDate, DoctorName, DoctorInfo from reserve, user, doctor where user.userID = reserve.uID and doctor.DoctorID = reserve.dID and user.userID="sumin";
	
	public ReserveDAO() {
		 try {
	         String dbURL = "jdbc:mysql://localhost:3306/hotel?serverTimezone=Asia/Seoul&useSSL=false";
	         String dbID = "root";
	         String dbPassword = "a2330680^^";
	         
	         Class.forName("com.mysql.cj.jdbc.Driver");
	         this.conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	         
	         System.out.println("연결되었습니다!!");
	     }catch (Exception e) {
	         e.printStackTrace();	         
	     }
	}
	
	public ArrayList<Reserve> getAllReserve(String userID){
		ArrayList<Reserve> v = new ArrayList<Reserve>();
		Reserve bean = null;
		try {
			String sql = "select r_id, r_adults, r_kids, r_checkin, r_checkout, r_type, r_price, r_number "
					+ "from reserve, user where user.userID = ?;";
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, userID);	
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				bean = new Reserve();
				bean.setR_id(rs.getString("r_id"));
				bean.setR_adults(Integer.parseInt(rs.getString("r_adults")));
				bean.setR_kids(Integer.parseInt(rs.getString("r_kids")));
				bean.setR_checkin(rs.getString("r_checkin"));
				bean.setR_checkout(rs.getString("r_checkout"));
				bean.setR_type(rs.getString("r_type"));
				bean.setR_price(Integer.parseInt(rs.getString("r_price")));
				bean.setR_number(Integer.parseInt(rs.getString("r_number")));
				v.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	public ArrayList<Room> selectRoomByPeople(int people, String r_checkin){
		ArrayList<Room> result = null;
		Room bean = null;
		String sql = null;
		
		try {
			result = new ArrayList<Room>();
			sql = "SELECT rm.room_id, rm.room_type, rm.room_size, rm.room_capacity, rm.room_price, "
					+ "rm.room_img, rm.room_count, count(rsv.r_type) AS cnt "
					+ "FROM room AS rm "
					+ "LEFT OUTER JOIN "
					+ "(SELECT r_type FROM reserve WHERE r_checkin >= ? AND ? <= r_checkout) AS rsv ON "
					+ "rm.room_type = rsv.r_type WHERE room_capacity >= ? "
					+ "GROUP BY rm.room_id, rm.room_type, rm.room_size, rm.room_capacity, rm.room_price, rm.room_img, rm.room_count "
					+ "HAVING rm.room_count > cnt;";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r_checkin);
			pstmt.setString(2, r_checkin);
			pstmt.setInt(3, people);
		
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
				result.add(bean);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
	/** 예약 내역의 번호를 매개변수로 받아서 해당 예약 내역을 db에서 삭제하는 메서드 **/
	public int cancelReservation(int r_number) {
		int num = 0;
		String sql = null;
		
		try {
			sql = "delete from reserve where r_number=?";
			pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, r_number);
	        num = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return num;
	}

}