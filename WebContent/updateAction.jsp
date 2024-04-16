<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="board.BoardDTO" %>   
<%@ page import="board.BoardDAO" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A</title>
</head>
<body>
   <%
        PrintWriter script = response.getWriter();
     
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
      if (userID == null) {
         script.println("<script>");
          script.println("alert('로그인을 하세요.')");
          script.println("location.href = 'login.jsp'");
          script.println("</script>");
      } 
      int b_number = 0;
      if (request.getParameter("b_number") != null) {
         b_number = Integer.parseInt(request.getParameter("b_number"));
      }
      if (b_number == 0) {
         script.println("<script>");
           script.println("alert('유효하지 않은 글입니다')");
           script.println("location.href = 'inquiryList.jsp'");
           script.println("</script>");
      }
      BoardDTO dto = new BoardDAO().getBoardDTO(b_number);
      if (!userID.equals(dto.getUserID())) {
         script.println("<script>");
           script.println("alert('권한이 없습니다.')");
           script.println("location.href = 'inquiryList.jsp'");
           script.println("</script>");
      } else {
            if (request.getParameter("b_title") == null || request.getParameter("b_content") == null
                  || request.getParameter("b_title").equals("") || request.getParameter("b_content").equals("")) {
                  script.println("<script>");
                  script.println("alert('입력 안된 사항이 있습니다.')");
                  script.println("history.back()");
                  script.println("</script>");
           } else {
                    BoardDAO dao = new BoardDAO();
                    int result = dao.update(b_number, request.getParameter("b_title"), request.getParameter("b_content"));
                   if (result == -1){
                       script.println("<script>");
                       script.println("alert('글 수정에 실패했습니다.')");
                       script.println("history.back()");
                       script.println("</script>");
                   }
                   else {
                      script.println("<script>");
                      script.println("location.href = 'inquiryList.jsp'");
                      script.println("</script>");
                   }
           }
      }
   %>
</body>
</html>