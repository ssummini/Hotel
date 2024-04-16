<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 로그인 하지 않았을 시 로그인 페이지로 이동
	if(session.getAttribute("userID")==null){
		response.sendRedirect("login.jsp");
	}

	String r_type = request.getParameter("r_type");
	String r_checkin = request.getParameter("r_checkin");
	String r_checkout = request.getParameter("r_checkout");
	String r_adults = request.getParameter("r_adults");
	String r_kids = request.getParameter("r_kids");
	int r_price = Integer.parseInt(request.getParameter("r_price"));
	int diffday = Integer.parseInt(request.getParameter("diffday"));
	int totalprice = r_price * diffday;
	
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>reservation3.jsp : 옵션 선택</title>
	<script type="text/javascript" src="script/script.js"></script>
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
			
		#input{
		    height:20px;
		    width:95px;
		    border:none;
		    text-align:left;
		    font-size:large;
		    font-weight:bold;
			}
	</style>
</head>

<body>
		<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
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
            	<li ><a href="main.jsp">HOME</a></li>
            	 <li><a href="Standard.jsp">객실 정보</a></li>
               <li class="active"><a href="doctorReserve1.jsp">예약</a></li>
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
				<td id="step2">객실 선택</td>
				<td id="step1" style="background-color: #9E9E9E;">예약 정보</td>
			</tr>
		</table>
	
		<table width="80%" align="center" class="reserveOption">
			<tr height="15%">
				<th colspan="4" align="center"><font size="5">예약정보</font></th>
			</tr>
			<tr id="line">
				<td align="center" id="line"><img src="img/<%=r_type%>.jpg" width="280" height="200"></td>
				<td colspan="3" id="line">
					<table width="100%">
						<tr align="left">	
							<td>
								예약 객실 : <b><%=r_type%></b>
							</td>
							<td>
								체크인날짜 : <b><%=r_checkin%></b>
							</td>
						</tr>
						<tr align="left">
							<td>
								체크아웃 날짜 : <b><%=r_checkout%></b>
							</td>
							<td>
								성인 투숙객 수 : <b><%=r_adults%></b>명
							</td>
						</tr>
						<tr align="left">
							<td>
								아동 투숙객 수 : <b><%=r_kids%></b>명
							</td>
							<td> 
								총 금액 : <input type="number" name="r_price" id="input" readonly="readonly" value="<%=totalprice%>" />원
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr id="line">
				<td colspan="4" align="center" id="line">
					<input type="button" id="btn" value="예약하기" onclick="location.href='reservationProc.jsp?r_id=<%=session.getAttribute("userID")%>&r_adults=<%=r_adults%>&r_kids=<%=r_kids%>&r_checkin=<%=r_checkin%>&r_checkout=<%=r_checkout%>&r_type=<%= r_type %>&r_price=<%= totalprice %>'"/>
				</td>
			</tr>
		</table>
	<%@ include file="footer.jsp" %>
</body>
</html>