<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

	 //로그인 하지 않았을 시 로그인 페이지로 이동
		if(session.getAttribute("userID")==null){
		response.sendRedirect("login.jsp");
	}

	// 오늘 날짜를 나타내는 변수 생성
	Date today = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String now = simpleDateFormat.format(today);

%>
<!DOCTYPE html>
<html>
<head>
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
				<td id="step1" style="background-color: #9E9E9E;">날짜,인원 선택</td>
				<td id="step2">객실 선택</td>
				<td id="step2">예약 정보</td>
			</tr>
		</table>
		
			<table width="80%" align="center" class="reserve1">
				<tr align="center" style="color:#a0a0a0; font-weight:bold;">
					<td>체크인</td>
					<td>체크아웃</td>
					<td width="10%">성인</td>
					<td width="10%">어린이</td>
				</tr>
				<tr align="center">
					<td><input type="date" id="r_checkin" name="r_checkin" min='<%=now %>' pattern = "yyyy-MM-dd" /></td>
					<td><input type="date" id="r_checkout" name="r_checkout"  pattern = "yyyy-MM-dd" /></td>
					<td><input type="number" id="r_adults" name="r_adults" min="1" value="1"/></td>
					<td><input type="number" id="r_kids" name="r_kids" value="0" min="0" /></td>
					<td><input type="submit" value="검색" id="btn" onclick="submitForm()"/></td>
				</tr>
				<script>
					function submitForm() {
					  var r_checkin = new Date(document.getElementById("r_checkin").value);
					  var r_checkout = new Date(document.getElementById("r_checkout").value);
					  
					  // 날짜 간의 차이 계산
					  var timeDiff = r_checkout.getTime() - r_checkin.getTime();
					  var diffday = Math.ceil(timeDiff / (1000 * 3600 * 24));
					  
					  var r_adults = document.getElementById("r_adults").value;
					  var r_kids = document.getElementById("r_kids").value;
					  
					  var url = "reservation2.jsp?";
					  url += "r_checkin=" + encodeURIComponent(r_checkin.toISOString());
					  url += "&r_checkout=" + encodeURIComponent(r_checkout.toISOString());
					  url += "&r_adults=" + r_adults;
					  url += "&r_kids=" + r_kids;
					  url += "&diffday=" + diffday;
					  
					  location.href = url;
					}
				</script>
				<tr align="center">
					<td colspan="5">예약을 원하는 날짜,인원을 선택해주세요</td>
				</tr>
		</table>
		
		<br /><br /><br /><br /><br /><br /><br />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   	<script src="js/bootstrap.js"></script>
	<%@ include file="footer.jsp" %>
</body>
</html>