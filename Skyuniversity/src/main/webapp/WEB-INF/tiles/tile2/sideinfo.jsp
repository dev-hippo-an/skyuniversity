<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ======= #28. tile2 중 sideinfo 페이지 만들기  ======= --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
/*   .sidenav {
  height: 100%;
  width: 250px;
  position: fixed;
  top: 100px;
  left: 0;
  background-color: #ffff;
  padding-top: 60px;
} */

 li.menu1 {
 	border: 1px solid lightgray;
 	height: 30px;
 	margin: 2px;
 	border-radius: 5px;
 	cursor: pointer;
 }
 
 li.menu2 {
  	height: 30px;
 	margin: 2px;
 	cursor: pointer;
 	background-color: rgb(234,234,234, 0.8);
 	margin:0;
 }
 
 ul {
 	list-style-type: none;
 	width: 225px;
 	margin: 0;
 	padding: 0;
 	
 }
 
 div#search {
 	margin: 50px auto;
 }
 
 .choice {
 	font-weight: bold;
 }
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("li.menu2").hide();
		
		$("li").hover(function(){
			$(this).addClass("choice");
		}, function(){
			$(this).removeClass("choice");
		});
		
		$("li#stuentInfo").click(function(){
			$("li.stuentInfo").toggle();
		});
		
		
		$("li#clases").click(function(){
			$("li.clases").toggle();
		});
		
		
		$("li#resister").click(function(){
			$("li.resister").toggle();
		});
		
		
		$("li#grade").click(function(){
			$("li.grade").toggle();
		});
		
		
		$("li#graduate").click(function(){
			$("li.graduate").toggle();
		});
		
		
		
	});
 


 
</script>

<div align="center">

	<div id="search">
		<input id="searchInput"/>
		<button>검색</button>
	</div>
	
	<div id="menu">
		<ul>
			<li id="stuentInfo" class="menu1">학생정보</li>
				<li class="stuentInfo menu2">학생정보조회</li>
				<li class="stuentInfo menu2" >비밀번호변경</li>
				<li class="stuentInfo menu2">학사일정</li>
				<li class="stuentInfo menu2">증명서발급</li>
			<li id="clases" class="menu1">수업</li>
				<li class="clases menu2">수강신청</li>
				<li class="clases menu2">수강과목</li>
				<li class="clases menu2">강의평가</li>
				<li class="clases menu2">공결신청 및 공결신청내역 조회</li>
			<li id="resister" class="menu1">학적관리</li>
				<li class="resister menu2">학적변동</li>
				<li class="resister menu2">전과신청</li>
				<li class="resister menu2">복수정공,부전공신청</li>
				<li class="resister menu2">학적변동내역조회</li>
			<li id="grade" class="menu1">성적</li>
				<li class="grade menu2">기이수성적조회</li>
				<li class="grade menu2">당학기성적조회</li>
				<li class="grade menu2">성적표출력</li>
				<li class="grade menu2">교양 및 전공필수 이수현황</li>
			<li id="graduate" class="menu1">졸업</li>
				<li class="graduate menu2">졸업연기</li>
				<li class="graduate menu2">졸업적부심사</li>
				<li class="graduate menu2">조기졸업신청 및 결과조회</li>
		</ul>
	</div>

</div>

