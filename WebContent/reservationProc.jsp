<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="reserve.reservation" %>
<%
	reservation reserveDAO = new reservation(request.getParameter("r_id"),
			Integer.parseInt(request.getParameter("r_adults")),
			Integer.parseInt(request.getParameter("r_kids")),
			request.getParameter("r_checkin"), request.getParameter("r_checkout"), 
			request.getParameter("r_type"),
			Integer.parseInt(request.getParameter("r_price")));
%>
<script>
		alert("예약이 완료되었습니다, 감사합니다 ^^");
		location.href="main.jsp";
</script>
