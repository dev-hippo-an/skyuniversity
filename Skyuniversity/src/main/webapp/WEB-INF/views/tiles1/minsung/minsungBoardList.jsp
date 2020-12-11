<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	background-color: white;
	font-size: 10pt;
}

tbody {
	font-size: 10pt;
}

tbody>tr>td:nth-child(3), td:nth-child(4) {
	text-align: left;
}

tbody>tr>td:nth-child(3) {
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
	/* border: solid 1px blue; */
}

li.pageBtn:hover {
	background-color: #ebebe0;
	cursor: pointer;
}

ul.nav>li:last-child {
	float: right;
}

button#searchBtn {
	background-color: #ebebe0;
	border: none;
}

ul.pager {
	margin-bottom: 50px;
}

tbody>tr>td:nth-child(1), td:nth-child(2), td:nth-child(6), td:nth-child(7)
	{
	width: 70px;
}

.subjectStyle {
	font-weight: bold;
	color: navy;
	cursor: pointer;
}
</style>


<script type="text/javascript">

   $(document).ready(function() {
      
		$("div#tags li").click(function() {
		   $(this).siblings().removeClass("active");
		   $(this).addClass("active");
		});
     
		$("span.subject").bind("mouseover", function(event){
			var $target = $(event.target);
			$target.addClass("subjectStyle");
		});
		
		$("span.subject").bind("mouseout", function(event){
			var $target = $(event.target);
			$target.removeClass("subjectStyle");
		});
		
		$("input#searchWord").keyup(function(event){
			if(event.keyCode == 13) {
				// 엔터를 했을 경우 
				goSearch();
			}
		});
      
   });// end of $(document).ready(function() {});-------------------------------------

	function goSearch() {
		var frm = document.searchFrm;
		frm.method = "GET";
		frm.action = "<%=request.getContextPath()%>/minsungBoardList.sky";
		frm.submit();
	}// end of function goSearch() {}-----------------------
	
	function goView(boardNo) {
		
		var frm = document.goViewFrm;		
		frm.method = "GET";
		frm.action = "<%=request.getContextPath()%>/minsungBoardView.sky";
		frm.submit();
	}
</script>
</head>


<div class="container" style="width: 80%;">
	<h1 align="left">${kindBoard}</h1>
	<div id="tags">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">전체</a></li>
			<c:forEach var="categoryvo" items="${categoryList}">

				<li><a href="#">${categoryvo.categoryName}</a></li>

			</c:forEach>
			<li>
				<form name="searchFrm" style="margin-top: 10px;">
					<select name="searchType" id="searchType" style="height: 25px;">
						<option value="subject">글제목</option>
						<option value="name">작성자</option>
					</select> <input type="text" name="searchWord" id="searchWord" size="40"
						style="width: 120px;" autocomplete="off" />
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
				<c:forEach var="boardvo" items="${boardList}">
					<tr>
						<td>${boardvo.boardNo}</td>
						<td>${boardvo.categoryName}</td>
						<td><span class="subject"
							onclick="goView('${boardvo.boardNo}')">${boardvo.subject}</span></td>
						<td>${boardvo.nickname}</td>
						<td>${boardvo.regDate}</td>
						<td>추천</td>
						<td>${boardvo.readCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div align="center"
		style="width: 70%; border: solid 0px gray; margin: 20px auto;">
		${pageBar}</div>

	<form name="goViewFrm">
		<input type="hidden" name="${boardvo.boardNo}" /> <input
			type="hidden" name="gobackURL" value="${gobackURL}" />
	</form>
</div>
