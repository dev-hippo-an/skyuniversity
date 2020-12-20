<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String ctxPath = request.getContextPath();
%>

<style>
	 tbody > tr > td {
	 	text-align : left;
	 }

	table {
	 border: solid gray 1px;
	 margin-bottom : 5%;
	 }
	 
	 
	 
	 form#form-group {
	 	width : 100%;
	 }
	
	textarea#main {
		width : 100%;
		height : 250px;
	}
	
	textarea#reply {
		width: 90%;
      margin-top: 20px;
      border: solid 1px gray;

	}
	
	div#marketBoardMain{
		float : left;
      width: 60%;
      min-height: 550px;
     
       margin-bottom : 5%;
       margin-left : 15%;

	}
	
	div#replyContent {
		  float : left;
      width: 60%;
      /* height: 700px; */
      max-height: 1000px;
      border: solid gray 1px;
       margin-bottom : 5%;
       margin-left : 15%;

	}
	
	#replyContentTable {
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
		width : 50%;
	}
	
	div#editAndDel-div {
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
        height: auto;
        margin: 0 5px;
        border-radius: 5%;
        border: none;
        background-color: #0841ad;
        color: white;
        padding: 4px;
    }
   
    button:hover {
    	font-weight: bold;
    }
   
   	button#letsgoback {
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
	$(document).ready(function(){
		getCountComeOn();
		
		// 추천 버튼을 누르면 ajax로 추천수를 1증가 시킨다.
	      $("button#verygooda").click(function() {
	         
	         var boardKindNo = "${boardvo.fk_boardKindNo}";
	         var boardNo = "${boardvo.boardNo}";
	         var loginMemberNo = "${sessionScope.loginuser.commuMemberNo}";
	         var writeMemberNo = "${boardvo.fk_commuMemberNo}";
	         
	         if (loginMemberNo != writeMemberNo) {
	        	 
	        	 
		         $.ajax({
		            url: "<%= request.getContextPath()%>/addMaketBoardUp.sky",
		            type: "POST",
		            data: {"boardKindNo": boardKindNo, "boardNo": boardNo},
		            dataType:"JSON",
		            success: function(json){
		               
		               if (json.n == 0) {
		                  alert("이미 추천하셨습니다.");
		               }else{
		                  alert("추천되었습니다.");
		                  getCountComeOn();
		               }
		            },
		            error: function(request, status, error){
		                     alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		              }
		         });
	         } else {
	        	 alert("본인 글에 추천은 양아치짘ㅋㅋㅋㅋ")
	         }
	      });// end of $("button#btnUp").click(function() {});-----------------------------------
	         
	         
	      // 비추천 버튼을 누르면 ajax로 비추천수를 1증가 시킨다.
	      $("button#verybadda").click(function() {
	         
	    	  var boardKindNo = "${boardvo.fk_boardKindNo}";
		      var boardNo = "${boardvo.boardNo}";
        	 
	         $.ajax({
	            url: "<%= request.getContextPath()%>/addMaketBoardDown.sky",
	            type: "POST",
	            data: {"boardKindNo":boardKindNo, "boardNo": boardNo},
	            dataType:"JSON",
	            success: function(json){
	               
	               if (json.n == 0) {
	                  alert("이미 비추천하셨습니다.");
	               }else{
	                  alert("비추천되었습니다.");
	                  getCountComeOn();
	               }
	            },
	            error: function(request, status, error){
	                     alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	              }
	         });
		     
		     
	      });// end of $("button#btnDown").click(function() {});-----------------------------------
	      
	      
	      // 신고 버튼을 누르면 ajax로 신고수를 1증가 시킨다.
	      $("button#gotopolice").click(function() {
	    	 var boardKindNo = "${boardvo.fk_boardKindNo}";
		     var boardNo = "${boardvo.boardNo}";
	         
	         $.ajax({
	            url: "<%= request.getContextPath()%>/addMarketBoardReport.sky",
	            type: "POST",
	            data: {"boardKindNo":boardKindNo, "boardNo": boardNo},
	            dataType:"JSON",
	            success: function(json){
	               if (json.n == 0) {
	                  alert("이미 신고하셨습니다.");
	               }else{
	                  
	                  if (json.n >= 10 ) {
		                  alert("too much 신고!");
	                	  tooMuchReportSoYouHaveToGoToThePoliceStation ();
	                  } else {
	                	  
		                  alert("신고되었습니다.");
	                  }
	               }
	            },
	            error: function(request, status, error){
	                     alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	              }
	         });
	         
	         
	      });// end of $("button").click(function() {});------------------------------------------

	});
	
	function marketBoardEdit (){
		var frm = document.editAndDeleteFrm;
		frm.action = "<%= ctxPath%>/marketBoardEdit.sky";
		frm.method = "POST";
		frm.submit();
	}
	
	
	
	function marketBoardDelete () {
		var frm = document.editAndDeleteFrm;
		frm.action = "<%= ctxPath%>/marketBoardDelete.sky";
		frm.method = "POST";
		frm.submit();
	}
	
	
	<%-- 공지 수정 및 삭제!!! 시작--%>
	function noticedEdit (){
		var frm = document.editAndDeleteFrm;
		frm.action = "<%= ctxPath%>/noticeEdit.sky";
		frm.method = "POST";
		frm.submit();
	}
	
	
	
	function noticeDelete () {
		var frm = document.editAndDeleteFrm;
		frm.action = "<%= ctxPath%>/noticeDelete.sky";
		frm.method = "POST";
		frm.submit();
	}
	
	<%-- 공지 수정 및 삭제!!! 끝--%>
	
	
	
	function fileDownloadGoGo () {
		var frm = document.editAndDeleteFrm;
		frm.action = "<%= ctxPath%>/fileDownloadGoGo.sky";
		frm.method = "POST";
		frm.submit();
	}
	
	
	
	function getCountComeOn() {
		var boardKindNo = "${boardvo.fk_boardKindNo}";
        var boardNo = "${boardvo.boardNo}";
        
       
        
        $.ajax({
            url: "<%= request.getContextPath()%>/getMarketBoardCount.sky",
            type: "POST",
            data: {"boardKindNo":boardKindNo, "boardNo": boardNo},
            dataType:"JSON",
            success: function(json){
            	
            	var upCount = json.upCount;
                var downCount = json.downCount;
                
            	if (upCount == null || upCount == "") {
                    upCount = "0";
                 }
            	if (downCount == null || downCount == "") {
                    downCount = "0";
                 }
            	
            
            	
            	$("span#verygooda-span").text(upCount);
                $("span#verybadda-span").text(downCount);
            },
            error: function(request, status, error){
                     alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
              }
         });
	}

	
	function tooMuchReportSoYouHaveToGoToThePoliceStation () {
		var frm = document.editAndDeleteFrm;
		frm.action = "<%= ctxPath%>/marketTooMuchReport.sky";
		frm.method = "POST";
		frm.submit();
	}
	
</script>


<c:if test="${not empty noticevo}">
	<div id="marketBoardMain">
		<h1 align="left">${tableInfo.boardName}</h1>
		<div id="marketContent" style="min-height: 600px; text-align: left;  border: solid gray 1px;">
			<div id="mainTitle" style=" font-weight: bold; padding-left: 20px;">
				<h2><span>[${noticevo.categoryName}]&nbsp;&nbsp;</span>${noticevo.subject} </h2>
			</div>
			
			<div id="mainSubInfo" style="padding-left: 20px; border-bottom: solid 1px gray;">
				<h5><span>닉네임 : <img src="<%= ctxPath %>/resources/images/levelimg/${noticevo.levelImg}" style="width: 17px; height: 17px;" />&nbsp;${noticevo.nickname}</span>ㅣ<span>조회수 : ${noticevo.readCount}</span>ㅣ<span>작성시간 : ${noticevo.regDate}</span></h5>
			
			</div>
			
			<div id="content-div" style="overflow: auto; word-break: break-all; padding: 30px; min-height: 500px;">
				${noticevo.content}
			
			</div>
		</div>
		<br>
		<br>
		<button type="button" id="letsgoback" onclick="javascript:location.href='${paraMap.gobackURL2}'">목록으로</button>
		
		<br>
		<br>
		<div id="editAndDel-div">
			<c:if test="${noticevo.fk_memberNo eq sessionScope.loginuser.fk_memberNo}">
				<button type="button" onclick="noticedEdit();">수정</button>
				<button type="button" onclick="noticeDelete();">삭제</button>
			</c:if>
		</div>
		
		<form name="editAndDeleteFrm">
			<input type="hidden" name="noticeNo" value="${noticevo.noticeNo}" />
			<input type="hidden" name="boardKindNo" value="${noticevo.fk_boardKindNo}" />
			<input type="hidden" name="gobackURL2" value="${paraMap.gobackURL2}" />
		</form>
		
	</div>

</c:if>
<c:if test="${empty noticevo}">
	<div id="marketBoardMain">
		<h1 align="left">${tableInfo.boardName}</h1>
		<div id="marketContent" style="min-height: 600px; text-align: left; border: solid gray 1px;">
			<div id="mainTitle" style="font-weight: bold; padding-left: 20px;">
				<h2><span>[${boardvo.categoryName}]&nbsp;&nbsp;</span>${boardvo.subject} </h2>
			</div>
			
			<div id="mainSubInfo" style=" padding-left: 20px; border-bottom: solid 1px gray;">
				<h5><span>닉네임 : <img src="<%= ctxPath %>/resources/images/levelimg/${boardvo.levelImg}" style="width: 17px; height: 17px;" />&nbsp;${boardvo.nickname}</span>ㅣ<span>조회수 : ${boardvo.readCount}</span>ㅣ<span>작성시간 : ${boardvo.regDate}</span>
				<c:if test="${boardvo.editDate != null}">
					ㅣ<span>수정시간 : ${boardvo.editDate} </span>
				</c:if>
				&nbsp;&nbsp;&nbsp;<span style="font-size: 12pt; font-weight: bold; float: right; margin-right: 20px;"><fmt:formatNumber value="${boardvo.price}" pattern="#,###" />원</span>
				</h5>
			
			</div>
			
			<div id="content-div" style="overflow: auto; word-break: break-all;  padding: 30px; min-height: 500px;">
				${boardvo.content}
			
			</div>
			<div id="fileDownload" style=" font-weight: bold; padding-left: 20px;">
				<a href="javascript:fileDownloadGoGo();">${boardvo.orgFileName}</a>				
				
			</div>
		</div>
		<br>
		<br>
		<c:if test="${not empty paraMap.gobackURL2}">
			<button type="button" id="letsgoback" onclick="javascript:location.href='${paraMap.gobackURL2}'">목록으로</button>
		</c:if>
		<c:if test="${empty paraMap.gobackURL2}">
			<button type="button" id="letsgoback" onclick="javascript:location.href='<%= ctxPath%>/marketboardList.sky?boardKindNo=${paraMap.boardKindNo}'">목록으로</button>	
		</c:if>
			<div id="buttons1">
				<button type="button" id="verygooda">추천<br><span id="verygooda-span"></span></button>
				<button type="button" id="verybadda">반대<br><span id="verybadda-span"></span></button>
				<button type="button" id="gotopolice">신고<br><span id="gotopolice-span"><img src="<%= request.getContextPath()%>/resources/images/sehyeong/call.png" style="width: 20px; height: 20px;"/></span></button>
			</div>
		
		<br>
		<br>
		<div id="editAndDel-div">
			<c:if test="${boardvo.commuMemberNo eq sessionScope.loginuser.commuMemberNo}">
				<button type="button" onclick="marketBoardEdit();">수정</button>
				<button type="button" onclick="marketBoardDelete();">삭제</button>
			</c:if>
		</div>
		
		<form name="editAndDeleteFrm">
			<input type="hidden" name="boardNo" value="${boardvo.boardNo}" />
			<input type="hidden" name="boardKindNo" value="${boardvo.fk_boardKindNo}" />
			<input type="hidden" name="gobackURL2" value="${paraMap.gobackURL2}" />
		</form>
		
	</div>
</c:if>

	<!-- 
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
	 -->
	<div id="replyContent">
		
		<div id="reply-div">
			<h3 style="margin-top: 50px;">댓글쓰기 &nbsp;&nbsp; <span>${sessionScope.loginuser.nickname}</span></h3>
			<form name="add	WriteFrm" style="margin-top: 20px;" class="form-group">
				 
				댓글내용 : <textarea id="reply">글 내용을 입력하세요~   </textarea>
				
				<button id="btnComment" type="button" onclick="goAddWrite()">확인</button> 
			</form>
		</div>
	
		<table id="replyContentTable">
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
		
		
	</div>
	
	
	
	<div id="include">
		<jsp:include page="marketBoardList.jsp" />
	</div>
