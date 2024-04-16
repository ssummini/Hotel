<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/loginCSS.css">
<title>병원 예약 시스템</title>
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
            	<li class="active"><a href="main.jsp">HOME</a></li>
            	 <li><a href="Standard.jsp">객실 정보</a></li>
               <li><a href="reservation1.jsp">예약</a></li>
               <li><a href="reserveInfo.jsp">예약내역</a></li>
               <li><a href="inquiryList.jsp">Q&A</a></li>

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
	<div class="container">
      		<form method="post" action="loginAction.jsp">
			<table align="center" class="log" style="background-color: #EEEEEE;" >
				<tr align="center">
					<th align="center" colspan="3">LOGIN</th>
				</tr>
				<tr align="center">
					<td colspan="2">
						호텔 C&S에 오신 것을 진심으로 환영합니다.<br />
						아이디와 비밀번호를 입력해 주시기 바랍니다.
					</td>
				</tr>
				<tr align="center">
					<td id="text"><b>아이디</b></td>
					<td><input type="text" name="u_id" size="24" id="input"/></td>
				</tr>
				<tr align="center">
					<td id="text"><b>비밀번호</b></td>
					<td><input type="password" name="u_pwd" size="24" id="input"/></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="로그인" id="btn" />
						<input type="button" value="회원가입" onclick="location.href='join.jsp'" id="btn"/>
					</td>
				</tr>
			</table>
		</form>
      </div>
 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   	<script src="js/bootstrap.js"></script>
</body>
</html>