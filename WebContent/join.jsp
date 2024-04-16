<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/joinCSS.css">
<title>호텔 예약 시스템</title>
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
                	  	<li><a href="login.jsp">로그인</a></li>
                  		<li class="active"><a href="join.jsp">회원가입</a></li>
               		</ul>
            	</li>
         	</ul>
     	 </div> 
	</nav>
	<div class="container">
      		<form method="post" action="joinAction.jsp">
		<table align="center" class="joinform" style="background-color: #EEEEEE;">
			<tr>
				<td colspan="2" align="center" id="comment">
					C&S 호텔에 오신 것을 환영합니다.<br/>
					※ 모든 항목에 개인정보를 입력해주시기를 바랍니다
				</td>
			</tr>
			<tr>
				<td colspan="2">아이디</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="userID" size="30" placeholder="아이디" />

				</td>
			</tr>
			<tr>
				<td colspan="2">비밀번호</td>
			</tr>
			<tr>
				<td colspan="2"><input type="password" name="userPW" size="30" /></td>
			</tr>
			<tr>
				<td colspan="2">성함</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="userName" size="30" placeholder="성함" /></td>
			</tr>

			<tr>
				<td colspan="2">E-mail</td>
			</tr>
			<tr>
				<td colspan="2"><input type="email" name="userEmail" placeholder="E-mail" size="30"></td>
			</tr>
			<tr>
				<td colspan="2">전화번호</td>
			</tr>
			<tr>
				<td colspan="2"><input type="tel" name="userPhone" placeholder="Tel" size="30"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="회원가입"  id="btn" />
				</td>
			</tr>
		</table>
	</form>
      	</div>
      	
 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   	<script src="js/bootstrap.js"></script>
</body>
</html>