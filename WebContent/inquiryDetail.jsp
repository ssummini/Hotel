<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDTO"%>
<%@ page import="board.BoardDAO"%>



<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>호텔 C&S - Q&A 상세 내역</title>
   <link rel="stylesheet" href="css/inquiryCSS.css?ver=1">
   <link rel="stylesheet" href="css/bootstrap.css">
   <script type="text/javascript" src="script/script.js"></script>
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

      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
      //int b_number = 0;
      if (request.getParameter("b_number") != null) {
         b_number = Integer.parseInt(request.getParameter("b_number"));
      }
      if (b_number == 0) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
           script.println("alert('유효하지 않은 글입니다')");
           script.println("location.href = 'inquiryList.jsp'");
           script.println("</script>");
      }
      BoardDTO dto = new BoardDAO().getBoardDTO(b_number);

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
   &nbsp;&nbsp;&nbsp; <font size="20">Q&A<br /></font>
   
   <div id="detailcomment">
      호텔 C&S는 언제나 고객님의 목소리에 귀기울이고 있습니다.<br />
      고객님들의 소중한 충고와 격려, 또는 제안의 말씀을 주시면 더 나은 서비스로 보답하겠습니다.
   </div>
   
   <form action="inquiryUpdate.jsp">
      <table align="center" class="inquiryDetail">
         <tr>
            <tbody>
                  <tr>
                     <td style="width: 20%;">글 제목</td>
                     <td colspan="2"><%= dto.getB_title() %></td>
                  </tr>
                  <tr>
                     <td>작성자</td>
                     <td colspan="2"><%= dto.getUserID() %></td>
                  </tr>
                  <tr>
                     <td>내용</td>
                     <td colspan="2" style="min-height: 200px; text-align: left;"><%= dto.getB_content() %></td>
                  </tr>
                  <tr>
                     <td>작성일자</td>
                        <td colspan="2"><%= dto.getB_date().substring(0, 11) + dto.getB_date().substring(11, 13) + 
                        "시" + dto.getB_date().substring(14, 16) + "분" %></td>            
                   </tr>
            </tbody>
         </tr>
      </table>
      <div style="text-align: center;">
         <input type="button" id="btn" value="목록" onclick="location.href='inquiryList.jsp'"/>
         
      <%
         if (userID != null && userID.equals(dto.getUserID())) {
      %>   
         
         <input type="button" id="btn" value="수정" onclick="location.href='inquiryUpdate.jsp?b_number=<%= b_number %>'"/>
         
         <input type="button" id="btn" value="삭제" onclick="location.href='deleteAction.jsp?b_number=<%= b_number %>'"/>
      </div>
      <%   
         }
      %>   
   </form>
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
   <%@ include file="footer.jsp" %>
</body>
</html>