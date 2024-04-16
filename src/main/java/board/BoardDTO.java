package board;

public class BoardDTO {
   private int b_number;       // 게시글 번호
   private String b_title;      // 게시글 제목
   private String userID;      // 게시글 작성자
   private String b_date;      // 게시글 시간
   private String b_content;   // 게시글 내용
   private int b_available;

   public BoardDTO() {
      // TODO Auto-generated constructor stub
   }

   public int getB_number() {
      return b_number;
   }

   public void setB_number(int b_number) {
      this.b_number = b_number;
   }
   
   public String getB_title() {
      return b_title;
   }

   public void setB_title(String b_title) {
      this.b_title = b_title;
   }

   public String getUserID() {
      return userID;
   }

   public void setUserID(String userID) {
      this.userID = userID;
   }

   public String getB_date() {
      return b_date;
   }

   public void setB_date(String b_date) {
      this.b_date = b_date;
   }

   public String getB_content() {
      return b_content;
   }

   public void setB_content(String b_content) {
      this.b_content = b_content;
   }
   
   public int getB_available() {
      return b_available;
   }
   public void setB_available(int b_available) {
      this.b_available = b_available;
   }   
}
