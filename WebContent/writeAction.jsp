<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="board.BoardDAO" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="board.BoardDTO" scope="page"/>
<jsp:setProperty name="dto" property="b_title"/>
<jsp:setProperty name="dto" property="b_content"/>
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
    } else {
       if (dto.getB_title() == null || dto.getB_content() == null) {
             script.println("<script>");
            script.println("alert('입력 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
       } else {
          BoardDAO dao = new BoardDAO();
            int result = dao.write(dto.getB_title(), userID, dto.getB_content());
            if (result == -1){
                script.println("<script>");
                script.println("alert('글쓰기에 실패했습니다.')");
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