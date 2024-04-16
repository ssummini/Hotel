<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDTO"%>
<%@ page import="board.BoardDAO"%>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>호텔 C&S - Q&A 게시글 수정</title>
   <link rel="stylesheet" href="css/bootstrap.css">
   <link rel="stylesheet" href="css/inquiryCSS.css">
   <style>
   
      #btn{
         margin-top:15px;
         margin-bottom:15px;
         background-color: #382f24;
          width:120px;
          height:50px;
          border: none;
          font-size:medium;
          color:#f1ebd5;
         }
   </style>
</head>

<body>
<%
   int b_number = Integer.parseInt(request.getParameter("b_number"));

   PrintWriter script = response.getWriter();

   String userID = null;
   if (session.getAttribute("userID") != null) {
      userID = (String) session.getAttribute("userID");
   }
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
   }
%>
   <nav class="navbar navbar-default">
      <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
               data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
               aria-expanded="false">
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main.jsp">HOTEL C&S</a>
         </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
               <li><a href="main.jsp">HOME</a></li>
                <li><a href="Standard.jsp">객실 정보</a></li>
               <li><a href="reservation1.jsp">예약</a></li>
               <li><a href="check.jsp">예약내역</a></li>
               <li class="active"><a href="inquiryList.jsp">Q&A</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
               <li class="dropdown">
                     <a href="#" class="dropdown-toggle"
                        data-toggle="dropdown" role="button" aria-haspopup="true"
                        aria-expanded="false">접속하기<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="active"><a href="login.jsp">로그인</a></li>
                        <li><a href="join.jsp">회원가입</a></li>
                     </ul>
               </li>
            </ul>
         </div> 
   </nav>
   <br/><br />
   &nbsp;&nbsp;&nbsp; <font size="20">Q&A 수정<br /></font>
   
   <div id="detailcomment">
      호텔 C&S는 언제나 고객님의 목소리에 귀기울이고 있습니다.<br />
      고객님들의 소중한 충고와 격려, 또는 제안의 말씀을 주시면 더 나은 서비스로 보답하겠습니다.
   </div>
   
   <form action="updateAction.jsp?b_number=<%= dto.getB_number() %>" method="post">
      <table align="center" class="inquiryDetail">
         <tr>
            <td id="detail" style="background-color: #EEEEEE;">TITLE</td>
            <td><input type="text" name="b_title" maxlength="30" 
            value="<%=dto.getB_title() %>" required="required" id="writeTitle"/></td>
         </tr>
         <tr>
            <td id="detail" style="background-color: #EEEEEE;">CONTENT</td>
            <td><textarea name="b_content" rows="20" cols="100" id="writeContent"
            required="required"><%=dto.getB_content() %></textarea></td>
         </tr>
         <tr align="center">
            <td colspan="2">
            <input type="submit" id="btn" class="btn btn-primary pull-right" value="수정완료">
            <input type="button" id="btn" value="취소" onclick="location.href='inquiryList.jsp'" />
            <input type="button" id="btn" value="목록" onclick="location.href='inquiryList.jsp'" />
            </td>
         </tr>
      </table>
   </form>
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
   <%@ include file="footer.jsp" %>
</body>
</html>