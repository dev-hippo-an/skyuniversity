<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.net.InetAddress"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<%-- ======= #27. tile1 중 header 페이지 만들기  ======= --%>
<%
   String ctxPath = request.getContextPath();

   // === #165. (웹채팅관련3) === 
   // === 서버 IP 주소 알아오기(사용중인 IP주소가 유동IP 이라면 IP주소를 알아와야 한다.) ===
   InetAddress inet = InetAddress.getLocalHost(); 
   String serverIP = inet.getHostAddress();
   
   //System.out.println("serverIP : " + serverIP);
   // serverIP : 192.168.56.65
   
   // String serverIP = "192.168.50.65"; 만약에 사용중인 IP주소가 고정IP 이라면 IP주소를 직접입력해주면 된다.
   
   // === 서버 포트번호 알아오기   ===
   int portnumber = request.getServerPort();
   //System.out.println("portnumber : " + portnumber);
   // portnumber : 9090
   
   String serverName = "http://"+serverIP+":"+portnumber; 
   //System.out.println("serverName : " + serverName);
   //serverName : http://192.168.50.65:9090 
%>


<div id="header-content" align="center" class="hanna">
	<div id="logo-div" class="header-content-detail" >
		<img src="<%= ctxPath %>/resources/images/logo_size.jpg" style="cursor: pointer; width:90%; height: 90%;" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">
	</div>

	<div id="menu-div" class="header-content-detail">
		<div class="menu-list-div">
			<label>학교</label>
			<ul>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">공지사항</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">학생회 게시판</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">전공 게시판</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">동아리 게시판</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">졸업생 게시판</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">학교 비판 게시판</li>
			</ul>
		</div>
		<div class="menu-list-div">
			<label>커뮤니티</label>
			<ul>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">익명 게시판</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">자유 게시판(반말)</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">자유 게시판(존대)</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">유머 게시판</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">정치 사회 이슈</li>
			</ul>
		</div>
		<div class="menu-list-div">
			<label>관심사</label>
			<ul>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">mbti</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">맛집</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">연애</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">취미</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">헬스</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">다이어트</li>
			</ul>
		</div>
		<div class="menu-list-div">
			<label>정보</label>
			<ul> 
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">스터디 게시판</li>
				<li class="boardList" class="boardList"onclick="javascript:location.href='<%= ctxPath%>/index.sky'">자격증 정보</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">취업 게시판</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">구인/구직</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">분실물 게시판</li>
			</ul>
		</div>
		<div class="menu-list-div">
			<label>장터</label>
			<ul>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">복덕복덕방</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">중고서점</li>
				<li class="boardList" onclick="javascript:location.href='<%= ctxPath%>/index.sky'">중고거래</li>
				
			</ul>
			<ul style="margin-top: 60px;">
				<li style="border: none; cursor: none;"><input type="text" name="search" placeholder="Search.." autocomplete="off" /></li>	
			</ul>
			
			
		</div>
	
	</div>

	<div id="mypage-div" class="header-content-detail" >
		<ul style="margin-top: 45%;">
			<li onclick="javascript:location.href='<%= ctxPath%>/index.sky'">로그인</li>
			<li onclick="javascript:location.href='<%= ctxPath%>/index.sky'">학사행정</li>
			
		</ul>
	</div>
	
	
</div>
