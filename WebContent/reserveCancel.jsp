<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="reserve.ReserveDAO" %>  
<%@ page import="reserve.Reserve" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="user" class="reserve.ReserveDAO" scope="page"/> <% 
	int index=1; /** 고객의 예약 내역의 번호 지정, 1번부터 시작 **/
	int i=0; /** 고객의 예약 내역의 정보가 담긴 배열의 index**/
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약 내역 조회</title>
	<script type="text/javascript" src="script/script.js"></script>
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
            	 <li ><a href="Standard.jsp">객실 정보</a></li>
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
	<form action="reservecancel">
						<table align="center" class="reserveCancel">
							<tr align="center" id="list" >
								<td style="background-color: #C2C2C2;">no</td>
								<td style="background-color: #C2C2C2;">성인 투숙객 수(명)</td>
								<td style="background-color: #C2C2C2;">어린이 투숙객 수(명)</td>
								<td style="background-color: #C2C2C2;">체크인</td>
								<td style="background-color: #C2C2C2;">체크아웃</td>
								<td style="background-color: #C2C2C2;">객실</td>
								<td style="background-color: #C2C2C2;">금액(원)</td>
								<td style="background-color: #C2C2C2;">선택</td>
							</tr>
<script>
    function cancelReservation() {
        var checkboxes = document.getElementsByName("r_number");
        var selectedNumber = null;

        // 첫 번째로 선택된 체크박스의 값을 가져옴
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                selectedNumber = checkboxes[i].value;
                break;
            }
        }
        // 선택된 예약 번호로 페이지 이동
        if (selectedNumber != null) {
            location.href = 'cancelProc.jsp?r_number=' + selectedNumber;
        } else {
            alert("취소할 예약 내역을 선택해주세요.");
        }
    }
</script>
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
            <td>
                <input type="checkbox" name="r_number" value="<%= r_number %>">
            </td>
        </tr> 
    <%
    }
%> 
<tr align="center">
    <td colspan="9">
        <br />
        <b>취소하고 싶은 예약 내역을 체크 후 취소 확인 버튼을 클릭해주시길 바랍니다.</b><br /><br />
        <input type="button" id="btn" value="취소 확인" onclick="cancelReservation()">
    </td>
</tr>
</table>
</form>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   	<script src="js/bootstrap.js"></script>
	<%@ include file="footer.jsp" %>
</body>
</html>