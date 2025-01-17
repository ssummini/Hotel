<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<title>호텔 오버튼 - 객실 정보</title>
	<link rel="stylesheet" href="css/roomCSS.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
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
            	 <li class="active"><a href="Standard.jsp">객실 정보</a></li>
               <li><a href="reservation1.jsp">예약</a></li>
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
	<div class="roomList" style="background-color: #EEEEEE; height: 370px;">
		<table class="table">
			<tr>
				<th>객실</th>
			</tr>
			<tr>
				<td><a href="Standard.jsp">스탠다드</a></td>
			</tr>
			<tr>
				<td id="select" style="background-color: #C2C2C2;"><a href="Deluxe.jsp" style="color: white;">디럭스 <button id="next">&#10095;</button></a></td>
			</tr>
			<tr>
				<td><a href="Sweet.jsp">스위트</a></td>
			</tr>
			<tr>
				<td><a href="Royal.jsp">로열</a></td>
			</tr>
		</table>
	</div>	
		<div class="roomImg">
			<div id="Img">
				<img src="img/deluxe.jpg">
				<img src="img/deluxe2.jpg">
				<img src="img/deluxebathroom.jpg">
				<button id="imgPrev">&#10094;</button>
				<button id="imgNext">&#10095;</button>
			</div>
		</div >	
		<div class="roomInfo" >
			<div id="roomContent">
				<h1 style="color:#6e583e;">디럭스 룸</h1><br />
				디럭스 룸에서 최고급 침구류와 <br />
				함께 생애 최고의 휴식을 경험해보시기 바랍니다.
			</div>
			
				<div id="infoContent">
					<h4>객실정보</h4>
					<ul>
					<li>크기&nbsp;62㎡&nbsp;&nbsp;|&nbsp;&nbsp;수용인원&nbsp;4</li>
					<li>구성&nbsp;&nbsp;침실1, 욕실1, 화장실1</li>
					<li>전망 &nbsp;시티뷰 또는 빌리지뷰</li>
					<li>침대&nbsp;&nbsp;더블(킹 사이즈), 트윈</li>
					</ul>
				</div>			
				<div id="amenityContent">
					<h4>부대시설</h4>
					<ul>
					<li>피트니스 센터 무료 이용</li>
					<li>피트니스 센터는 매월 세 번쨰 수요일 정기 휴일입니다.</li>
					<li>실내 수영장 무료 이용(만 13세 이상 입장 가능)</li>
					<li>사우나 이용 시 유료</li>
					<li>투숙 기간 내 무료 주차 가능</li>
					</ul>
				</div>	
		</div >	
		<div class="hotelInfo" style="background-color: #EEEEEE;">
			<table id="hotelTable">
				<tr>
					<td align="center"><h2>Hotel Info</h2></td>
				</tr>
				<tr>
					<td>
						<h4>조식 이용 안내</h4>
						<ul>
							<li>다이닝 존(뷔페) : 07:30 ~ 10:30</li>
						</ul>
					</td>
				</tr>
				
				<tr>
					<td>
						<h4>체크인 / 체크아웃 시간</h4>
						<ul>
							<li>체크인 : 오후 2시 이후</li>
							<li>체크아웃 : 11시</li>
						</ul>
					</td>
				</tr>
				
				<tr>
					<td>
						<h4>예약 취소/변경 및 No-Show 안내</h4>
						<ul>
							<li>숙박 예정일 7일 전: 위약금 없음</li>
							<li>숙박 예정일 6일 전 ~ 1일 전 : <br />1박 요금의 20%</li>
							<li>숙박 예정일 1일 전(18시 이후 취소 및 변경): 1박 요금의 80%</li>
						</ul>
					</td>
				</tr>
			</table>
		</div >
	<%@ include file="footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   	<script src="js/bootstrap.js"></script>
	<script type="text/javascript" src="script/script.js"></script>
</body>
</html>