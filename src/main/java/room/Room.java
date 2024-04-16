package room;

public class Room {
	private int room_id;			// 각 방에 대한 고유번호 (쉽게 불러오려고)
	private String room_type;		// 방 이름
	private int room_size;			// 방 크기
	private int room_capacity;		// 방 수용인원
	private int room_price;			// 방 가격
	private String room_img;		// 방 이미지 경로
	private int room_count;			// 방 갯수
	
	public int getRoom_count() {
		return room_count;
	}
	public void setRoom_count(int room_count) {
		this.room_count = room_count;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public int getRoom_size() {
		return room_size;
	}
	public void setRoom_size(int room_size) {
		this.room_size = room_size;
	}
	public int getRoom_capacity() {
		return room_capacity;
	}
	public void setRoom_capacity(int room_capacity) {
		this.room_capacity = room_capacity;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public String getRoom_img() {
		return room_img;
	}
	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}
	
	
}
