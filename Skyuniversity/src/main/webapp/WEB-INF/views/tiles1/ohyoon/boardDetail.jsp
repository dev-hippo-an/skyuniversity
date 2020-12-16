<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		min-height: 550px;
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
	
	div#buttons1 > button {
		height: 45px;
	}
		
	div#buttons2 {
		float : right;
		margin-right: 30px;
		margin-bottom: 20px;
	}
	
	input#commentContent {
		width : 30%;
	}

	div#replyButtons {
		float : right;
	}
	
	button {
      width: 60px;
      height: 30px;
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
	
	form#replycontent {
		margin-top: 20px;
		width: 95%;
		min-height: 300px;
	}
			
	div.contents {
		text-align: left;
		padding-left: 40px;
		margin-bottom: 20px;
	}
	
	a {
		cursor: pointer;
	}
	
</style>

<script type="text/javascript">
	
	$(document).ready(function() {

		// 추천 버튼을 누르면 ajax로 추천수를 1증가 시킨다.
		$("button#btnUp").click(function() {
			
			var boardInfoFrm = $("form[name=boardInfoFrm]").serialize();
			
			$.ajax({
				url: "<%= request.getContextPath()%>/addBoardUp.sky",
				type: "POST",
				data: boardInfoFrm,
				dataType:"JSON",
				success: function(json){
					
					if (json.n == 0) {
						alert("이미 추천하셨습니다.");
					}else{
						alert("추천되었습니다.");
						var upCount = json.upCount;
						var downCount = json.downCount;

						if (downCount == null || downCount == "") {
							downCount = "0";
						}
						$("span#upCount").text(upCount);
						$("span#downCount").text(downCount);
					}
				},
				error: function(request, status, error){
		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
			});
		});// end of $("button#btnUp").click(function() {});-----------------------------------
			
			
		// 비추천 버튼을 누르면 ajax로 비추천수를 1증가 시킨다.
		$("button#btnDown").click(function() {
			
			var boardInfoFrm = $("form[name=boardInfoFrm]").serialize();
			
			$.ajax({
				url: "<%= request.getContextPath()%>/addBoardDown.sky",
				type: "POST",
				data: boardInfoFrm,
				dataType:"JSON",
				success: function(json){
					
					if (json.n == 0) {
						alert("이미 비추천하셨습니다.");
					}else{
						alert("비추천되었습니다.");
						var upCount = json.upCount;
						var downCount = json.downCount;

						if (upCount == null || upCount == "") {
							upCount = "0";
						}
						$("span#upCount").text(upCount);
						$("span#downCount").text(downCount);
					}
				},
				error: function(request, status, error){
		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
			});
		});// end of $("button#btnDown").click(function() {});-----------------------------------
		
		
		// 신고 버튼을 누르면 ajax로 신고수를 1증가 시킨다.
		$("button#btnReport").click(function() {
			
			var boardInfoFrm = $("form[name=boardInfoFrm]").serialize();
			
			$.ajax({
				url: "<%= request.getContextPath()%>/addBoardReport.sky",
				type: "POST",
				data: boardInfoFrm,
				dataType:"JSON",
				success: function(json){
					if (json.n == 0) {
						alert("이미 신고하셨습니다.");
					}else{
						alert("신고되었습니다.");
					}
				},
				error: function(request, status, error){
		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
			});
			
			
		});// end of $("button").click(function() {});------------------------------------------
		
		
		// 삭제버튼을 누르면 게시물이 삭제되고 다시 리스트로 넘어가도록 함.
		$("button#btnDelete").click(function() {

			var frm = document.boardInfoFrm;
			frm.method = "POST";
			frm.action = "<%= request.getContextPath()%>/deleteBoard.sky";
			frm.submit();
		
		});// end of $("button#btnDelete").click(function() {});---------------------------------------
		
		
		// 수정버튼을 누르면 수정 페이지로 넘어감.
		$("button#btnUpdate").click(function() {

			var frm = document.boardInfoFrm;
			frm.method = "GET";
			frm.action = "<%= request.getContextPath()%>/updateBoard.sky";
			frm.submit();
		
		});// end of $("button#btnUpdate").click(function() {});---------------------------------------
		
		
		
		
		
		
	});// end of $(document).ready(function() {});--------------------------------------------

</script>

<body>
	<div class="content1">
		<div class="contents" class="form-group">
			<h1>${boardvo.subject} <c:if test="${not empty boardvo.fk_categoryNo}"><span>[${boardvo.fk_categoryName}]</span></c:if></h1>
			<h5><span>작성자 : ${boardvo.fk_nickname}</span>ㅣ<span>조회수 : ${boardvo.readCount}</span>ㅣ<span>작성시간 :  ${boardvo.regDate}</span><c:if test="${boardvo.editDate}">ㅣ<span>수정시간 : ${boardvo.editDate} </span></c:if></h5>
			<form action="" id="replycontent" >
				<div style="word-break: break-all;">${boardvo.content}</div>
			</form>
			<c:if test="${boardvo.orgFilename ne null}"><h6>첨부파일 : <a href="<%= request.getContextPath()%>/download.sky?boardKindNo=${boardvo.fk_boardKindNo}&boardNo=${boardvo.boardNo}">${boardvo.orgFilename}</a></h6></c:if>
		</div>
		
		<div id="buttons1">
			<button id="btnUp">
				추천<br><span id="upCount">${boardvo.upCount}</span>
			</button>
			<button id="btnDown">
				비추천<br><span id="downCount">${boardvo.downCount}</span>
			</button>
			<button id="btnReport">
				신고<br><img src="<%= request.getContextPath()%>/resources/images/report.png" style="width: 20px; height: 20px;"/>
			</button>
		</div>
		
		<div id="buttons2">
			<button id="btnUpdate">수정</button>
			<button data-toggle="modal" data-target="#deleteModal">삭제</button> <!-- 삭제 버튼을 클릭하면 삭제확인 모달이 뜬다. -->
		</div>
	
		<form name="boardInfoFrm">
			<input type="hidden" name="boardKindNo" value="${boardvo.fk_boardKindNo}"/>
			<input type="hidden" name="boardNo" value="${boardvo.boardNo}"/>
		</form>
	</div>
	
	<div id="sideBar">
	
		게시판 1
		<table>
			<tr>
				<td>신규글</td>
				<td>인기글</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
		</table>
	</div>
<div id="sideBar">
		게시판 1
		<table>
			<tr>
				<td>신규글</td>
				<td>인기글</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
		</table>
	</div>
<div id="sideBar">
		게시판 1
		<table>
			<tr>
				<td>신규글</td>
				<td>인기글</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
			<tr>
				<td colspan="2">제목1</td>
			</tr>
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
		<button id="goback" onclick="javascript:location.href='${gobackURL}'">목록으로</button>
		
	</div>
	
	
	
	<div id="include">
		<jsp:include page="boardList.jsp" />
	</div>


</body>
</html>

<!-- 삭제 확인 Modal -->
	    <div class="modal" id="deleteModal" role="dialog">
	      <div class="modal-dialog">
	    
	        <!-- 삭제 확인 Modal 내용 -->
	        <div class="modal-content">
	          <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal">&times;</button>
	            <!-- <h4 class="modal-title">삭제 확인</h4> -->
	          </div>
	          <div class="modal-body">
	            <h3>정말 삭제하시겠습니까?</h3>
	          </div>
	          <div class="modal-footer">
	            <button type="button" id="btnDelete" class="btn btn-danger" >삭제</button>
	            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	          </div>
	        </div>
	      
	      </div>
	    </div>