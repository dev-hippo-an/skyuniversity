<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ======= #28. tile2 중 header 페이지 만들기  ======= --%>
<%
   String ctxPath = request.getContextPath();
%>

<style>

 span.sname {
 	font-family: "Open Sans", sans-serif;
 	font-size: 20pt;
 	position: absolute;
 	left: 750px;
 	top:70px;
 }
 
 span.sinfo {
 	font-family: "Open Sans", sans-serif;
	font-size: 15pt;
	position: absolute;
	left: 850px;
	top: 80px;	
 }
 
 div#test {
 	vertical-align: middle;
 }
 
 span#logo {
 	position: absolute;
 	left: 50px;
 	top: 10px;
 }
 
 div#header {
 	height: 150px;
 }
 
</style>

<style>
	
	

</style>

<div id="header" align="center">

	
		<span id="logo">
			<img src="<%= ctxPath %>/resources/images/logo_size.jpg" style="width: 250px; height: 130px;">
		</span>
		
	   <c:if test="${sessionScope.loginuser == null}">
	      <span class="sname">${sessionScope.loginuser.name}김뫄뫄</span>
	      <span class="sinfo">롸롸롸롸롸과 솨학년</span>
	   </c:if>
	   
	   <c:if test="${sessionScope.loginuser != null}">
	      <span class="sname">${sessionScope.loginuser.name}</span>
	      <span class="sinfo">롸롸롸롸롸과 솨학년</span>
	   </c:if>
	   
	   <span>커뮤니티</span>
	   <span>로그아웃</span>
	   
</div>
   
   