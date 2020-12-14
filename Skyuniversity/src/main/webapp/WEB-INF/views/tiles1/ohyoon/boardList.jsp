<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
table {
   border-collapse: collapse;
   border-spacing: 0;
   width: 80%;
  /*  border: 1px solid #ddd; */
}

th, td {
   text-align: center;
   padding: 8px;
   border: 1px solid #ddd;
}

thead {
	background-color: #0841ad;
	font-size: 10pt;
	color: white;
}

tbody {
	font-size: 10pt;
}

tbody > tr > td:nth-child(3), td:nth-child(4) {
	text-align: left;
}

tbody > tr > td:nth-child(3) {
	width: 400px;
}

tr:nth-child(even) {
   background-color: #f2f2f2;
}

li.pageBtn {
   font-size: 15pt;
   display: inline-block;
   width: 32px;
   height: 32px;
   margin: 0 5px;
}

li.pageBtn:hover {
   cursor: pointer;
} 

ul.nav > li:last-child {
	float: right;
}

button#searchBtn {
	background-color: #ebebe0;
	border: none;
}

ul.pager {
	margin-bottom: 50px;
}

tbody > tr > td:nth-child(1), td:nth-child(2), td:nth-child(6), td:nth-child(7) {
	width: 70px;
}

button#register {
	width: 80px;
	height: 30px;
	border-radius: 5%;
	border: none;
	background-color: #0841ad;
	color: white;
	margin-top: 20px;
} 

button:hover {
	font-weight: bold;
}

tr.board:hover {
	cursor: pointer;
	background-color: #a8d2fe;
}

</style>


<script type="text/javascript">

   	$(document).ready(function() {
      
      	$("div#tags li").click(function() {
        	$(this).siblings().removeClass("active");
        	$(this).addClass("active");
	   	});
      
      	// 글쓰기 버튼을 누르면 파라미터 값으로 게시판 번를 가지고 작성 페이지로 넘어간다.
      	$("button#register").click(function() {
		
      		var frm = document.boardInfo;
      		frm.action = "<%= request.getContextPath()%>/boardRegister.sky";
      		frm.submit();
			
      	});
      
   	});// end of $(document).ready(function() {});-------------------------------------

   	// 검색 버튼을 누르면 list 페이지로 searchType과 searchWord를 보낸다.
	function goSearch() {
		
		var frm = document.searchFrm;
		frm.action = "<%= request.getContextPath()%>/boardList.sky";
		frm.method = "GET";
		frm.submit();
		 
	}// end of function goSearch() {}-------------------------------
	

</script>
</head>


<div class="container" style="width: 80%;">
	<h1 align="left">${paraMap.boardName}</h1>
	<div id="tags">
		<ul class="nav nav-tabs">
			<c:if test="${not empty cateList}">
            	<li class="active" class="selectCategory" value="0"><a>전체</a></li>
            	<c:forEach var="category" items="${cateList}">
            		<input type="hidden" class="selectCategory" value="${category.categoryNo}" />
            		<li><a href="">${category.categoryName}</a></li>
            	</c:forEach>
			</c:if>
			<li>
				<form name="searchFrm" style="margin-top: 10px;">
		      		<input type="hidden" name="boardKindNo" value="${paraMap.boardKindNo}"/> 
		      		<select name="searchType" id="searchType" style="height: 25px;">
		         		<option value="subject">글제목</option>
		         		<option value="nickname">작성자</option>
		      		</select>
		      		<input type="text" name="searchWord" id="searchWord" size="40" style="width:120px;" autocomplete="off" /> 
	      			<button type="button" onclick="goSearch()">검색</button>
   				</form>
			</li>
		</ul>
	</div>
	<div style="overflow-x: auto; width: 100%;">
		<table style="width: 100%;">
            <thead>
	            <tr>
	                <th>글번호</th>
	                <th>분류</th>
	                <th>글제목</th>
	                <th>작성자</th>
	                <th>작성시간</th>
	                <th>추천</th>
	                <th>조회수</th>
	            </tr>
            </thead>
            <tbody>
            	<c:if test="${not empty boardList}">
	            	<c:forEach var="board" items="${boardList}" varStatus="status">
		            	<tr class="board">
		                	<td>${board.boardNo}</td>
		                	<td>${board.categoryName}</td>
		                	<td>${board.subject}</td>
		                	<td>${board.nickname}</td>
		                	<td>${board.regDate}</td>
		                	<td>
		                		<c:if test="${empty board.upCount}">
		                			0
		                		</c:if>
		                		<c:if test="${not empty board.upCount}">
			                		${board.upCount}
		                		</c:if>
		                	</td>
		                	<td>${board.readCount}</td>
		            	</tr>
	            	</c:forEach>
            	</c:if>
            	<c:if test="${empty boardList}">
            		<tr>
            			<td colspan="7" style="color: red; font-size: 30pt; font-weight: bold; height: 500px;">게시물이 없습니다.</td>
            		</tr>
            	</c:if>
            </tbody>
		</table>
	</div>

	<div align="right"><button id="register">글쓰기</button></div>
	
	<form name="boardInfo"> <!-- 글쓰기 버튼을 눌렀을 때 넘어갈 정보들 -->
		<input type="hidden" name="boardKindNo" value="${paraMap.boardKindNo}"/>
		<input type="hidden" name="boardName" value="${paraMap.boardName}"/>
	</form>
	
	${pageBar}
	
</div>
    