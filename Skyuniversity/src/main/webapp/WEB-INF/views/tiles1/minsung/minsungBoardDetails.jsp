<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style>
	 tbody > tr > td {
	 	text-align : left;
	 }

	table
	 {border: solid gray 1px;
	 margin-bottom : 5%;}
	 
	 div.form-group{
	 border: solid gray 1px;
	 }
	 
	 form#form-group {
	 	width : 100%;
	 }
	
	textarea#main {
		width : 100%;
		height : 250px;
	}
	
	textarea#reply {
		width : 30%;
		height : 25px;
	}
	
	div.content1{
		float : left;
		width: 60%;
		height: 600px;
		border: solid gray 1px;
	 	margin-bottom : 5%;
	 	margin-left : 15%;
	}
	
	div.content2 {
		float : left;
		width: 60%;
		height: 700px;
		border: solid gray 1px;
	 	margin-bottom : 5%;
	 	margin-left : 15%;
	}
	
	
	
	table#contentTable {
		margin-top : 5%;
		margin-bottom : 1%;
		width: 100%;
	}
	
	#contentTable2 {
		margin-top : 5%;
		margin-bottom : 1%;
		width: 80%;
	}
	
	div#sideBar {
		float : right;
		width: 15%;
		border: solid gray 1px;
		margin-right : 7%;
		margin-bottom : 1%;
		
	}
	
	div#include {
		border: solid gray 1px;
		display: inline-block;
		width: 80%;
	}
	
	p3 {
		width : 100%;
	}
	
	div#buttons1 {
		width : 30%;
	}
	
	div#buttons2 {
		float : right;
	}
	
	input#commentContent {
		width : 30%;
	}

	div#replyButtons {
		float : right;
	}
	
	button {
      width: 60px;
      height: 50px;
      margin: 0 5px;
      border-radius: 5%;
      border: none;
      background-color: #0841ad;
      color: white;
   }
   
   button:hover {
      font-weight: bold;
   }
   
   	button#goback {
		float : right;
		width: 80px;
	}
	
	table.form-group {
		width : 100%;
	}
	
	#fileAttach {
		float : left;
	}	
			
</style>

<script type="text/javascript">

	function goView2(fk_boardKindNo, boardNo){
		
		console.log(boardNo);
		console.log(fk_boardKindNo);
		
		var frm = document.goViewFrm2;
		frm.boardNo.value = boardNo;
		frm.boardKindNo.value = fk_boardKindNo;
		frm.method = "GET";
		
		if (fk_boardKindNo <= 6 || (18 <= fk_boardKindNo && fk_boardKindNo <= 22)) {
			frm.action = "<%=request.getContextPath()%>/minsungBoardView.sky";
		} else if (23 <= fk_boardKindNo){
			frm.action = "<%=request.getContextPath()%>/marketBoardDetail.sky";
		} else {
			frm.action = "<%=request.getContextPath()%>/boardDetail.sky";
		}
		
		frm.submit();
		
	}
</script>

<body>
	<div class="content1">
		<div class="contents" class="form-group">
			<h1>${ boardvo.subject } <span>[${boardvo.fk_categoryName }]</span></h1>
			<h4><span>유저 : ${boardvo.fk_nickname }</span>ㅣ<span>조회수 : ${boardvo.readCount }</span>ㅣ<span>작성시간 : ${boardvo.regDate } </span>ㅣ<span>수정시간 :  ${boardvo.regDate } </span></h4>
			<form action="" id="replycontent" >
				<textarea id="main" readonly> ${boardvo.content }</textarea>
			</form>
		</div>
		
		<div id="buttons1">
			<button>추천<br/>0</button>
			<button>반대<br/>0</button>
			<button>신고<br/>0</button>
		</div>

		<div id="buttons2">
			<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/minsungEdit.sky?boardNo=${boardvo.boardNo}'">수정</button>
			<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/minsungDel.sky?boardNo=${boardvo.boardNo}'">삭제</button>
		</div>
	</div>
	
	<div id="sideBar">
	
		최근 게시판
		<table>
			<c:forEach var="recentBoard" items="${recentBoardList}">
				<tr>
					<td colspan="2">${recentBoard.boardName}</td>
					<td colspan="2"><a class="subject" style="cursor:pointer" 
					onclick="goView2('${recentBoard.fk_boardKindNo}', '${recentBoard.boardNo}')">
					${recentBoard.subject}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
 	<div id="sideBar">
	
		주간 베스트 게시물
		<table>
			<c:forEach var="bestBoard" items="${bestBoardList}">
				<tr>
					<td colspan="2">${bestBoard.boardName}</td>
					<td colspan="2"><a class="subject" style="cursor:pointer" 
					onclick="goView2('${bestBoard.fk_boardKindNo}', '${bestBoard.boardNo}')">
					${bestBoard.subject}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div id="sideBar">
	
		인기 게시물
		<table>
			<c:forEach var="popularBoard" items="${popularBoardList}">
				<tr>
					<td colspan="2">${popularBoard.boardName}</td>
					<td colspan="2"><a class="subject" style="cursor:pointer" 
					onclick="goView2('${popularBoard.fk_boardKindNo}', '${popularBoard.boardNo}')">
					${popularBoard.subject}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div> 

	
	<div class="content2">
		
		<div id="reply">
			<h3 style="margin-top: 50px;">댓글쓰기 &nbsp;&nbsp; <span>로그인유저 ID</span></h3>
			<form name="add	WriteFrm" style="margin-top: 20px;" class="form-group">
				 
				댓글내용 : <textarea id="reply">글 내용을 입력하세요~   </textarea>
				
				<button id="btnComment" type="button" onclick="goAddWrite()">확인</button> 
			</form>
		</div>
	
		<table id="contentTable2">
				<tr>
					<td>유저2&nbsp;&nbsp;2020-12-11 08:00:20(댓글 작성 시간)&nbsp;&nbsp;&nbsp;&nbsp; <div id="replyButtons"></a><button>추천</button>&nbsp;&nbsp;<button>반대</button>&nbsp;&nbsp;<button>신고</button></div></td>
				</tr>
				<tr>
					<td>~~~~~~ 댓글내용 ~~~~~</td>
				</tr>
				<tr>
					<td>유저2&nbsp;&nbsp;2020-12-11 08:00:20(댓글 작성 시간)&nbsp;&nbsp;&nbsp;&nbsp; <div id="replyButtons"></a><button>추천</button>&nbsp;&nbsp;<button>반대</button>&nbsp;&nbsp;<button>신고</button></div></td>
				</tr>
				<tr>
					<td>~~~~~~ 댓글내용 ~~~~~</td>
				</tr>
				<tr>
					<td>유저2&nbsp;&nbsp;2020-12-11 08:00:20(댓글 작성 시간)&nbsp;&nbsp;&nbsp;&nbsp; <div id="replyButtons"></a><button>추천</button>&nbsp;&nbsp;<button>반대</button>&nbsp;&nbsp;<button>신고</button></div></td>
				</tr>
				<tr>
					<td>~~~~~~ 댓글내용 ~~~~~</td>
				</tr>
				<tr>
					<td>유저2&nbsp;&nbsp;2020-12-11 08:00:20(댓글 작성 시간)&nbsp;&nbsp;&nbsp;&nbsp; <div id="replyButtons"></a><button>추천</button>&nbsp;&nbsp;<button>반대</button>&nbsp;&nbsp;<button>신고</button></div></td>
				</tr>
				<tr>
					<td>~~~~~~ 댓글내용 ~~~~~</td>
				</tr>			
		</table>
		<h4>더보기...</h4>
		<button id="goback" type="button" onclick="javascript:location.href='${gobackURL}'">목록보기</button>	                        
		
		
	</div>
	
	<div id="include">
		<jsp:include page="minsungBoardList.jsp" />
	</div>
	
	<form name="goViewFrm2">
		<input type="hidden" id="boardNo" name="boardNo" value="" /> 
		<input type="hidden" id="boardKindNo" name="boardKindNo" value="" /> 
	</form>


</body>
</html>