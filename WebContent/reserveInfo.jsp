<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="reserve.ReserveDAO" %>  
<%@ page import="reserve.Reserve" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="user" class="reserve.ReserveDAO" scope="page"/> 
<% int index=1; 

	// 로그인 하지 않았을 시 로그인 페이지로 이동
	if(session.getAttribute("userID")==null){
		response.sendRedirect("login.jsp");
	}

	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>호텔 오버튼 - 예약 내역 조회</title>
	<link rel="stylesheet" href="css/userCSS.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
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
		#reserveComment{
			width:100%;
			height: 546px;
			text-align: center;
			line-height:546px;
			font-size: xx-large;
		 }	

	</style>
</head>

<body>
	<%

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
            	<li ><a href="main.jsp">HOME</a></li>
            	 <li><a href="Standard.jsp">객실 정보</a></li>
               <li><a href="reservation1.jsp">예약</a></li>
               <li class="active"><a href="reserveInfo.jsp">예약내역</a></li>
               <li><a href="inquiryList.jsp">Q&A</a></li>

            </ul>
            <%
            	if(userID == null){
            		
      
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
              	}else{
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
	<br/><br />
	<table align="center" class="reserveInfo" >
		<tr align="center" id="list" >
			<td style="background-color: #EEEEEE;">no</td>
			<td style="background-color: #EEEEEE;">성인 투숙객 수(명)</td>
			<td style="background-color: #EEEEEE;">어린이 투숙객 수(명)</td>
			<td style="background-color: #EEEEEE;">체크인</td>
			<td style="background-color: #EEEEEE;">체크아웃</td>
			<td style="background-color: #EEEEEE;">객실</td>
			<td style="background-color: #EEEEEE;">금액(원)</td>
		</tr>
<%
	ReserveDAO rDAO = new ReserveDAO();
	String uID = session.getAttribute("userID").toString();
	ArrayList<Reserve> rID = rDAO.getAllReserve(uID);
	
	for (Reserve rs : rID) {
        String r_id = rs.getR_id();
        int r_adults = rs.getR_adults();
        int r_kids = rs.getR_kids();
        String r_checkin = rs.getR_checkin(); 
        String r_checkout = rs.getR_checkout(); 
        String r_type = rs.getR_type(); 
        int r_price = rs.getR_price(); 
        int r_number = rs.getR_number();
        
%>
		<tr align="center">
			<td><%=index++ %></td>
			<td><%=r_adults %></td>
			<td><%=r_kids %></td>
			<td><%=r_checkin %></td>
			<td><%=r_checkout %></td>
			<td><%=r_type %></td>								
			<td><%=r_price %></td>
		</tr>						
<%
    }
%>
		<tr align="center">
			<td colspan="8">
				<input type="submit" id="btn" value="예약 취소" onclick="location.href='reserveCancel.jsp'" />
			</td>
		</tr>
	</table>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   	<script src="js/bootstrap.js"></script>
	<%@ include file="footer.jsp" %>
</body>
</html>