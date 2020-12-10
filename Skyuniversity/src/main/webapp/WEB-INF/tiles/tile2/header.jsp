<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ======= #28. tile2 중 header 페이지 만들기  ======= --%>
<%
   String ctxPath = request.getContextPath();
%>

<<<<<<< HEAD
<div align="center">
   <ul class="nav nav-tabs mynav">
      <li class="dropdown"><a class="dropdown-toggle"
         data-toggle="dropdown" href="#">Home <span class="caret"></span></a>
         <ul class="dropdown-menu">
            <li><a href="<%=ctxPath%>/index.action">Home</a></li>
            <li><a href="#">Submenu 1-2</a></li>
            <li><a href="#">Submenu 1-3</a></li>
         </ul>
      </li>
         
      <li class="dropdown"><a class="dropdown-toggle"
         data-toggle="dropdown" href="#">인사관리 <span class="caret"></span></a>
         <ul class="dropdown-menu">
            <li><a href="<%=ctxPath%>/emp/empList.action">직원목록</a></li>
            <li><a href="<%=ctxPath%>/emp/chart.action">통계차트</a></li>
         </ul>
      </li>   
         
      <li class="dropdown"><a class="dropdown-toggle"
         data-toggle="dropdown" href="#">주문 <span class="caret"></span></a>
         <ul class="dropdown-menu">
            <li><a href="#">주문하기</a></li>
            <li><a href="#">Submenu 1-2</a></li>
            <li><a href="#">Submenu 1-3</a></li>
         </ul>
      </li>
      <li><a href="#">Menu two</a></li>
      <li><a href="#">Menu three</a></li>
   
   <!-- === #49. 로그인이 성공되어지면 로그인되어진 사용자의 이메일 주소를 출력하기 === -->
   <c:if test="${sessionScope.loginuser != null}">
      <div style="float: right; margin-top: 0.5%; border: solid 0px red;">
        <span style="color: navy; font-weight: bold; font-size: 10pt;">${sessionScope.loginuser.email}</span> 님 로그인중.. 
      </div>
   </c:if>
   
   </ul>
=======
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
>>>>>>> parent of cca8490 (학사행정 tiles(header, side) 변경)
</div>
   
   