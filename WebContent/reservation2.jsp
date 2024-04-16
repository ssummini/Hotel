<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="room.Room" %>
<%@ page import="room.RoomDAO" %>
<%@ page import="reserve.ReserveDAO" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="user" class="room.RoomDAO" scope="page"/>

<%
	// 로그인 하지 않았을 시 로그인 페이지로 이동
	if(session.getAttribute("userID")==null){
		response.sendRedirect("login.jsp");
	}

	String r_checkin = request.getParameter("r_checkin");
	String r_checkout = request.getParameter("r_checkout");
	String r_adults = request.getParameter("r_adults");
	String r_kids = request.getParameter("r_kids");
	int diffday = Integer.parseInt(request.getParameter("diffday"));


	Date today = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String now = simpleDateFormat.format(today);
	
	r_checkin = simpleDateFormat.format(simpleDateFormat.parse(r_checkin));
	r_checkout = simpleDateFormat.format(simpleDateFormat.parse(r_checkout));	
	
	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/custom.css">
		<link rel="stylesheet" href="css/reserveCSS.css">
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
			
		input{
		    height:20px;
		    width:70%;
		    border:none;
		    text-align:center;
		    font-size:large;
		    font-weight:bold;
			}
	</style>
</head>

<body>
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
               <li class="active"><a href="reservation1.jsp">예약</a></li>
               <li><a href="reserveInfo.jsp">예약내역</a></li>
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
	</nav>
	<br/><br />
		<table align="center" class="reservelist1">
			<tr id="list1">
				<td id="step2">날짜,인원 선택</td>
				<td id="step1" style="background-color: #9E9E9E;">객실 선택</td>
				<td id="step2">예약 정보</td>
			</tr>
		</table>
		
		<table width="80%" align="center" class="reserve1">
			<tr align="center" id="list1" style="color:#a0a0a0; font-weight:bold;">
				<td>체크인</td>
				<td>체크아웃</td>
				<td width="10%" align="center"><img src="img/night.png" width="30" height="30"></td>
				<td width="10%" >성인</td>
				<td width="10%">어린이</td>
			</tr>
			<tr align="center">
				<td><input type="date" name="r_checkin" min="<%=now %>"  value=<%=r_checkin%> pattern = "yyyy-MM-dd"/></td>
				<td><input type="date" name="r_checkout" value=<%=r_checkout%> pattern = "yyyy-MM-dd"/></td>
				
				<td><input type="number" name="diffday" size="10" value=<%=diffday%> readonly="readonly"/></td>
				<td><input type="number" name="r_adults" size="10" min="1" value="<%=r_adults%>"/></td>
				<td>
					<input type="number" name="r_kids" size="10" min="0" value="<%=r_kids%>"/>
				</td>
				<td><input type="submit" id="btn" value="검색" onclick="location.href='reservation2.jsp'"/></td>
			</tr>
		</table>

	<%

	ReserveDAO reDAO = new ReserveDAO();
	
	int adults = Integer.parseInt(r_adults);
	int kids = Integer.parseInt(r_kids);
	ArrayList<Room> r_type = reDAO.selectRoomByPeople(adults+kids, r_checkin);

	
	for(Room rm: r_type){
		 int room_id = rm.getRoom_id();
         String room_type = rm.getRoom_type();
         int room_size = rm.getRoom_size(); 
         int room_capacity = rm.getRoom_capacity();
         int room_price = rm.getRoom_price();
         String room_img = rm.getRoom_img();
         String room_count = String.valueOf(rm.getRoom_count());   
         int totalprice = diffday*room_price;
           %>          
			<table width="80%" align="center" class="reserveResult">
					<tr align="center" id="line">
						<td width="30%" id="line"><img src="img/<%=room_img %>" width="280" height="200"></td>
						<td width="30%" id="line">
							<table>
								<tr align="center">
									<th><%=room_type %></th>
								</tr>
								<tr align="left">
									<td>객실크기 : <%=room_size %>㎡</td>
								</tr>
								<tr align="left">
									<td>최대 수용 인원 : <%=room_capacity %>명</td>
								</tr>
							</table>
						</td>
						<td width="25%" id="line"><b> <%= room_price %>원  (1박)</b></td>
						<td id="line"><input type="button" id="btn2" value="예약하기" style="background-color: #595959;" onclick="location.href='reservation3.jsp?r_type=<%= room_type %>&r_checkin=<%=r_checkin%>&r_checkout=<%=r_checkout%>&r_adults=<%=r_adults%>&r_kids=<%=r_kids%>&r_price=<%=room_price%>&diffday=<%=diffday%>'"></td>
					</tr>
			</table>	
	  <%
      
    }
%>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<%@ include file="footer.jsp" %>
</body>
</html>