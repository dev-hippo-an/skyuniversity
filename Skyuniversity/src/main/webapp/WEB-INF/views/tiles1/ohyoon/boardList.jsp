<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

td.left {
	text-align: left;
}

th.wide {
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

th.narrow {
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

img.photo {
	width: 20px;
	height: 20px;
}

</style>


<script type="text/javascript">

   	$(document).ready(function() {
      
   		// 선택한 카테고리(분류)에 active css가 적용되어 있도록 한다.
   		$("div#tags .selectCategory").each(function(index,item) {
			if ($(this).val() == "${paraMap.categoryNo}") {
				$(this).siblings().removeClass("active");
	        	$(this).addClass("active");	
			}
		});

   		
   		// 글쓰기 버튼을 누르면 파라미터 값으로 게시판 번호를 가지고 작성 페이지로 넘어간다.
      	$("button#register").click(function() {
      		location.href="<%= request.getContextPath()%>/boardRegister.sky?boardKindNo=${paraMap.boardKindNo}";
      	});
      

   		// 각 게시물을 누르면 해당 게시물의 상세 페이지로 넘어간다.
   		$("tr.board").click(function() {
   			var boardNo = $(this).children("td.boardNo").text();
   			$("input[name=boardNo]").val(boardNo);
   			
   			var frm = document.urlFrm;
   			frm.method = "get";
   			frm.action = "<%= request.getContextPath()%>/boardDetail.sky"; 
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
            	<li class="selectCategory" value="0"><a href="boardList.sky?boardKindNo=${paraMap.boardKindNo}&categoryNo=0">전체</a></li>
            	<c:forEach var="category" items="${cateList}">
            		<li class="selectCategory" value="${category.categoryNo}"><a href="boardList.sky?boardKindNo=${paraMap.boardKindNo}&categoryNo=${category.categoryNo}">${category.categoryName}</a></li>
            	</c:forEach>
			</c:if>
			<li>
				<form name="searchFrm" style="margin-top: 10px;">
		      		<input type="hidden" name="boardKindNo" value="${paraMap.boardKindNo}"/> 
		      		<input type="hidden" name="categoryNo" value="${paraMap.categoryNo}"/> 
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
	                <th class="narrow">글번호</th>
	                <c:if test="${not empty cateList}">
	                	<th class="narrow">분류</th>
	                </c:if>
	                <th class="wide">글제목</th>
	                <th>작성자</th>
	                <th>작성시간</th>
	                <th class="narrow">추천</th>
	                <th class="narrow">조회수</th>
	            </tr>
            </thead>
            <tbody>
            	<c:if test="${not empty boardList}">
	            	<c:forEach var="board" items="${boardList}" varStatus="status">
		            	<tr class="board">
		                	<td class="boardNo">${board.boardNo}</td>
		                	<c:if test="${board.fk_categoryName ne null}">
		                		<td>${board.fk_categoryName}</td>
		                	</c:if>
		                	<td class="left">${board.subject} <c:if test="${fn:contains(board.content, '<img src=')}"><img src="/skyuniversity/resources/images/picture.png" class="photo"></c:if></td>
		                	<td class="left"><img src="<%= request.getContextPath()%>/resources/images/levelimg/${board.levelImg}" class="photo" />${board.fk_nickname}</td>
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
	
	${pageBar}

	<form name="urlFrm">
		<input type="hidden" name="boardKindNo" value="${paraMap.boardKindNo}"/>
		<input type="hidden" name="boardNo" value=""/>
		<input type="hidden" name="gobackURL" value="${gobackURL}"/>
	</form>	
</div>
    