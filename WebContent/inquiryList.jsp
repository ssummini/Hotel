<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="board.BoardDTO" %> 
<%@ page import="java.util.ArrayList"%>
<%@ page import="board.BoardDAO"%>

   
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/inquiryCSS.css">

<title>호텔 예약 시스템</title>
</head>
<body>
   <%
      if(session.getAttribute("userID")==null){
         PrintWriter script = response.getWriter();
            script.println("<script>");
           script.println("alert('로그인을 하세요.')");
           script.println("location.href = 'login.jsp'");
           script.println("</script>");
         }

           String userID = null;
         if (session.getAttribute("userID") != null){
            userID = (String) session.getAttribute("userID");
         }
         int pageNumber = 1;
         if (request.getParameter("pageNumber") != null) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
         }
      
      int initNumber = (pageNumber - 1) * 5 + 1; // 초기 번호 설정

      
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
                <li><a href="doctor1.jsp">객실 정보</a></li>
               <li><a href="doctorReserve1.jsp">예약</a></li>
               <li><a href="check.jsp">예약내역</a></li>
               <li class="active"><a href="inquiryList.jsp">Q&A</a></li>

            </ul>
            <%
               if (userID == null){
      
            %>
            <ul class="nav navbar-nav navbar-right">
               <li class="dropdown">
                     <a href="#" class="dropdown-toggle"
                        data-toggle="dropdown" role="button" aria-haspopup="true"
                        aria-expanded="false">접속하기<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">로그인</a></li>
                        <li><a href="join.jsp">회원가입</a></li>
                     </ul>
               </li>
             </ul>
            <%
                 }else {
            %>
            <ul class="nav navbar-nav navbar-right">
               <li class="dropdown">
                     <a href="#" class="dropdown-toggle"
                        data-toggle="dropdown" role="button" aria-haspopup="true"
                        aria-expanded="false">회원관리<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="logoutAction.jsp">로그아웃</a></li>
                     </ul>
               </li>
             </ul>              
            <%    
                 }
            %>

         </div> 
   </nav>
   <div class="container">
      <div class="jumbotron">
         <div class="container">
            <h3>Q&A</h3>
            <p>고객님들의 문의사항을 써주세요.:)</p>
         </div>
      </div>
   </div>
   <div class="container">
    <div class="row">
         <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
               <tr>
                  <th style="background-color: #eeeeee; text-align: center;">번호</th>
                  <th style="background-color: #eeeeee; text-align: center;">제목</th>
                  <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                  <th style="background-color: #eeeeee; text-align: center;">작성일</th>
               </tr>
            </thead>
            <tbody>
               <%
                  BoardDAO dao = new BoardDAO();
                  ArrayList<BoardDTO> list = dao.getList(pageNumber);
                  for(int i = 0; i < list.size(); i++) {
               %>
               <tr>
               
                  <td><%= list.get(i).getB_number() %></td>
                  <td><a href="inquiryDetail.jsp?b_number=<%= list.get(i).getB_number() %>">
                  <%=list.get(i).getB_title() %></a></td>
                  <td><%= list.get(i).getUserID() %></td>
                  <td><%= list.get(i).getB_date().substring(0, 11) + list.get(i).getB_date().substring(11, 13) + 
                  "시" + list.get(i).getB_date().substring(14, 16) + "분" %></td>
                  
               </tr>

               <%
                  }
               %>
            </tbody>
         </table>
         <%
            if (pageNumber != 1) {
         %>
            <a href="inquiryList.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
         <% 
            } if (dao.nextPage(pageNumber + 1)) {
         %>
            <a href="inquiryList.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-right">다음</a>
         <%
            }
         %>
         <a href="inquiryWrite.jsp" class="btn btn-primary pull-right">글쓰기</a>      
      </div>
   </div>
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
</body>
</html>