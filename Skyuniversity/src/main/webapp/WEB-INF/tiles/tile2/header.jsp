<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ======= #28. tile2 중 header 페이지 만들기  ======= --%>
<%
   String ctxPath = request.getContextPath();
%>

<style>

 div#header {
 	font-family: "Open Sans", sans-serif, 돋움;
 }

 div#header {
 	height: 150px;
 	display: flex;
 	justify-content: space-between;
 }
 
 ul {
 	list-style-type: none;
 }

 div#loginStudent {
 	align-self: flex-end;
 	padding-bottom: 30px;
 
 }

 span.sname {
 	font-size: 25pt;
 	font-weight: 600;
 }
  
  span.sinfo {
 	font-family: "Open Sans", sans-serif;
	font-size: 18pt;
	font-weight: 500;
 }

 div#logo {
 	padding-left: 30px;
 }
 
 span.btn {
 	cursor: pointer;
    margin: 3px;
    border: solid 2px #0843ad;
    background-color: white;
    border-radius: 20px;
    font-weight: bold;
    font-size: 12pt;
 }
 
</style>

<style>
	
	

</style>

<div id="header">

	<div id="logo">
		<img src="<%= ctxPath %>/resources/images/logo_size.jpg" style="width: 250px; height: 130px;">
	</div>
	<div id="loginStudent">
	      <span class="sname">${sessionScope.loginuser.name}김뫄뫄</span>
	      <span class="sinfo">롸롸롸롸롸과 솨학년</span>
	 </div>
	 <div>
	   <span class="btn">커뮤니티</span>
	   <span class="btn">로그아웃</span>
	 </div>
</div>
   
   