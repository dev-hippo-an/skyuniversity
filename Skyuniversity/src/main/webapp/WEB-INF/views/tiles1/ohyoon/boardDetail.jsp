<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% String ctxPath = request.getContextPath();  %>

<style>
/* 
 	body {
		background-image: url("data:image/jpeg;base64,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");
		background-repeat:no-repeat;
		background-position: bottom;
		background-size: cover;
	} 
*/
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
		width: 75px;
	}
	
	button.btn {
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
		font-weight: bold;
	}
	
	tr.notification:hover {
		cursor: pointer;
		background-color: #a8d2fe;
	}
	
	img.photo {
		width: 18px;
		height: 18px;
	}
	
	tr.notification {
	   
	   background-color: rgba(8,65,173,0.2);
	}
	
	tr.notification td:nth-child(3):hover{
	   font-weight: normal;
	}
	tr.notification td {
	   font-weight: bold;
	}	
	
	/* 리스트 css end */
	
	 tbody > tr > td {
	 	text-align : left;
	 }

	 table {
	 	border: solid gray 1px;
	 	margin-bottom : 5%;
	 }
	 
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
	
	div#reply {
		width: 90%;
		margin-top: 20px;
		border: solid 1px gray;
		
	}
	
	div#reply > div:first-child {
		text-align: left;
	}
	
	div#reply > div:first-child > span {
		margin: 10px 10px; 
	}

	div#reply > div:first-child > span:first-child {
		font-size: 20pt;
	}
	
	
	div#reply > div:first-child > span:last-child {
		font-size: 10pt;
 	  	color: #9900e6;   
		font-weight: bold;
		border-radius: 20px;
		padding: 5px 5px;
	}
	
	div#reply > div:last-child {
		text-align: right;
	}
	
	textarea#cmtContent {
		height: 130px;
		resize: none;
	}
	
	button#btnComment {
		margin: 10px 35px;
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
		/* height: 700px; */
		/* max-height: 1000px; */
		border: solid gray 1px;
	 	margin-bottom : 5%;
	 	margin-left : 15%;
	 	padding-bottom: 40px;
	}
	
	
	
	table#contentTable {
		margin-top : 5%;
		margin-bottom : 1%;
		width: 100%;
	}
	
	#contentTable2 {
		margin-top : 5%;
		margin-bottom : 1%;
		width: 90%;
		/* min-height: 50px; */
		text-align: left; 
		line-height: 25px; 
		word-break: break-all; 
		margin-bottom: 20px;
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
		margin-right: 20px;
		margin-bottom: 20px;
	}
	
	table.form-group {
		width : 100%;
	}
	
	#fileAttach {
		float : left;
	}	
	
	div#content {
		margin-top: 20px;
		width: 95%;
		min-height: 300px;
	}
			
	div.contents {
		text-align: left;
		padding-left: 40px;
		margin-bottom: 20px;
	}
	
	img {
		max-width: 100%;
	}
	
	a {
		cursor: pointer;
	}
	
	form.form-group {
		margin-bottom: 0;
	}

	img.photo {
		width: 18px;
		height: 18px;
	}
	
	h4.more:hover {
		font-weight: bolder;
		cursor: pointer;
	}
	
	span.button {
		margin: 0 10px;
	}
	
	span.button:hover {
		font-weight: bolder;
		cursor: pointer;
	}
	
	span.name {
		color: #9900e6;
		font-weight: bold;
	}
	
	span.name:hover {
		cursor: pointer;
		color: #7700b3;
	}
	
	button.myComment {
		float:right; 
		color : red;
		font-style: italic; 
		margin: 0 10px;
		background-color: #f2f2f2;
		border: none;
	}

	button:focus {
		outline: none;
	}	
	
</style>

<script type="text/javascript">
	
	
	$(document).ready(function() {

		$("span#alert").hide();		
		
		$("input#startNo").val("1");
		$("h4.more").show();		
		goViewComment();
		
		// 추천 버튼을 누르면 ajax로 추천수를 1증가 시킨다.
		$("button#btnUp").click(function() {
			
			var boardInfoFrm = $("form[name=boardInfoFrm]").serialize();
			
			$.ajax({
				url: "<%= ctxPath%>/addBoardUp.sky",
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
				url: "<%= ctxPath%>/addBoardDown.sky",
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
				url: "<%= ctxPath%>/addBoardReport.sky",
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
			frm.action = "<%= ctxPath%>/deleteBoard.sky";
			frm.submit();
		
		});// end of $("button#btnDelete").click(function() {});---------------------------------------
		
		
		// 수정버튼을 누르면 수정 페이지로 넘어감.
		$("button#btnUpdate").click(function() {

			var frm = document.boardInfoFrm;
			frm.method = "GET";
			frm.action = "<%= ctxPath%>/updateBoard.sky";
			frm.submit();
		
		});// end of $("button#btnUpdate").click(function() {});---------------------------------------
		
		
		// "더보기..." 클릭 이벤트
		$("h4.more").click(function() {
			goViewComment($("input#startNo").val());
		});// end of $("h4.more").click(function() {});-----------------
		
		
		// 댓글 작성중에 글자수가 나타나도록 한다.
		$("textarea#cmtContent").keyup(function() {
			var characters = $(this).val().length;
			$("span#characters").text(characters);
			if (characters >= 200) {
				$("span#alert").show();
			}else{
				$("span#alert").hide();
			}
		});
		
	});// end of $(document).ready(function() {});--------------------------------------------

	////////////////////////////////////////////////////////////////////////////////////////
	var cmtLength = 8; // "더보기..." 버튼을 클릭하면 가져올 댓글의 수
	
	// 댓글 가져와서 보여주기 
	function goViewComment() {
		
		var startNo = $("input#startNo").val();

		$.ajax({
			url: "<%= ctxPath%>/commentList.sky",
			data: {"startNo": startNo, "cmtLength": cmtLength, "fk_boardKindNo": "${boardvo.fk_boardKindNo}", "fk_boardNo": "${boardvo.boardNo}" },
			type: "POST",
			dataType: "JSON",
			success: function(json){
				
				var html = "";
				
				if (startNo == "1" && json.length == 0) { // 처음부터 댓글 데이터가 존재하지 않는 경우
					html += "<div style='color:#0841ad; font-size: 30px; text-align: center; margin-top: 25px;'>첫번째 댓글을 등록해보세요.</div><br>";
					$("table#contentTable2").html(html);
					$("h4.more").hide();
				}
				
				var totalCount;
				if (json.length > 0) {
					
					$.each(json, function(index,item) {
						
						html += "<tr style='height:30px;'>" +
									"<td style='text-align:left;'><img src=/skyuniversity/resources/images/levelimg/"+item.levelImg+" class='photo' /><span class='name' onclick='addTag()'>"+item.fk_nickname+"</span> | "+item.regDate+"<div id='replyButtons'>"+
										"<span class='button' onclick='commentUp("+item.commentNo+")'>추천<span id='cmtUpCount"+item.commentNo+"'>"+item.cmtUpCount+"</span></span>&nbsp;&nbsp;"+
										"<span class='button' onclick='commentDown("+item.commentNo+")'>비추천<span id='cmtDownCount"+item.commentNo+"'>"+item.cmtDownCount+"</span></span>&nbsp;&nbsp;"+
										"<span class='button' style='height:30px; width: 70px; ' onclick='commentReport("+item.commentNo+")'>신고&nbsp;<img src='/skyuniversity/resources/images/report3.png' style='width: 15px; height: 15px;'/></span></div>"+
									"</td>"+
								"</tr>" + 
								"<tr style='height:30px; border-bottom-color: black;'>"+
									"<td style='text-align:left;'>";
						
						var comment = item.cmtContent;
						comment = comment.replaceAll("\n", "<br>");

						// 댓글 내용에 ##문자가 있으면 ##+바로 뒤에 오는 문자열이 파란색을 띄도록 함. 
						var arrFirst = []; // "##"이 나오는 index들을 넣을 배열
						var arrLast = []; // "##"다음의 공백(" ")이 나오는 index들을 넣을 배열
						
						var first = comment.indexOf("##");
						var last = 0;
						
						while (first != -1) { // "##"문자열의 index가 리턴이 되는동안  
							
							last = comment.indexOf(" ", first);	// 그 다음 공백(" ") index도 알아낸다.
							
							if (last == -1) { // 만일 공백(" ") index가 리턴되지 않았다면 comment의 마지막 index(comment의 길이)를 넣는다.
								last = comment.length;
							}

							arrFirst.push(first); // 배열에 "##"문자열 index를 넣는다.
							arrLast.push(last); // 배열에 공백(" ") 문자열 index를 넣는다.
							
							first = comment.indexOf("##", last); // 공백(" ")문자의 다음 index부터 "##" 문자가 또 있는지 찾아내어 index를 알아낸다.
						}

						var firstString = ""; // "##" 문자직전까지의 문자열.
						var secondString = ""; // "##" 문자열에서 공백(" ") 문자열까지의 문자열.
						var lastString = ""; // 공백(" ")이후의 문자열.

						var arrFirstString = []; // "##" 문자직전까지의 문자열을 넣을 배열. 
						var arrSecondString = []; // "##" 문자열에서 공백(" ") 문자열까지의 문자열을 넣을 배열.(span태그로 감쌀 문자열들) 
						var arrLastString = []; // 공백(" ")이후의 문자열을 넣을 배열.
						
						if (arrFirst.length != 0) { // "##"가 하나라도 존재했다면
							
							for (var i = 0; i < arrFirst.length; i++) { // arrFirst 배열의 길이만큼 반복한다.  
							
								if (i == 0 && arrFirst.length == 1) { // 첫번째 순서이면서 arrFirst 배열의 길이가 1이면 한번만 진행하므로 아래처럼 한다. 
									arrFirstString.push( comment.substring( 0, arrFirst[i] ) );
									arrSecondString.push( comment.substring( arrFirst[i], arrLast[i] ) );								
									arrLastString.push( comment.substring(arrLast[i]) );
								}else if (i == 0 && arrFirst.length != 1) { // 첫번째 순서이면서 arrFirst 배열의 길이가 1이 아니면 여러번 진행하므로 lastString이 공백문자에서 그다음 "##"문자의 index까지이다.
									arrFirstString.push( comment.substring( 0, arrFirst[i] ) );
									arrSecondString.push( comment.substring( arrFirst[i], arrLast[i] ) );								
									arrLastString.push( comment.substring( arrLast[i], arrFirst[i+1] ) );
								}else if (i != 0 && i != arrFirst.length){ // 첫번째 순서가 아니면서 마지막 순서도 아니라면
									arrFirstString.push( comment.substring( arrFirst[i], arrFirst[i] ) );
									arrSecondString.push( comment.substring( arrFirst[i], arrLast[i] ) );
									arrLastString.push( comment.substring( arrLast[i], arrFirst[i+1] ) );
								}else{
									arrFirstString.push( comment.substring( arrFirst[i], arrFirst[i] ) );
									arrSecondString.push( comment.substring( arrFirst[i], arrLast[i] ) );
									arrLastString.push( comment.substring(arrLast[i]) );
								}
							}

							comment = "";
							for (var i = 0; i < arrFirstString.length; i++) {
								comment += arrFirstString[i];
								comment += "<span style='color:blue;'>";
								comment += arrSecondString[i];
								comment += "</span>";
								comment += arrLastString[i];
							}
							
						}

						html += comment;
						
						if ("${sessionScope.loginuser.fk_memberNo}" == item.fk_memberNo) { // 로그인한 유저가 댓글 작성자일 때, 수정 삭제 버튼이 나타나게 한다.
							html += "<div><button class='myComment' onclick='goDeleteComment("+item.commentNo+")'>삭제</button>";
							html += "<button class='myComment' value='"+item.cmtContent+"' onclick='goChangeComment("+item.commentNo+")'>수정</button></div>";
						} 
						
						html +=     "</td>" +
								"</tr>";
						
						totalCount = item.totalCount;		
						
						// <input type='hidden' name='cc' value='"+item.cmtContent+"' />
						
					});
					
					// 불러온 댓글 데이터를 넣어줌.
					$("table#contentTable2").append(html);
					
					// "더보기..." 버튼을 누를 때 시작값이 바뀌도록 input#cmtCount에 저장한다.
					$("input#startNo").val( Number(startNo) + cmtLength);
					
					// 지금까지 출력된 상품의 개수를 누적한다.
					$("input#cmtCount").val( Number($("input#cmtCount").val()) + json.length );

					// 전체 댓글 개수와 지금까지 출력된 댓글 개수가 같으면
					if ( Number($("input#cmtCount").val()) == Number(totalCount) ) {
						$("h4.more").hide();
						$("input#cmtCount").val("0");
						$("input#startNo").val("1");
					}
					
				}
				
			},
			error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
		});
	}// end of function goViewComment(startNo) {}-----------------------------------
	
	
	// 댓글쓰기 부분 - 확인 버튼을 누르면 댓글이 저장되고 아래에 나타나게함.
	function goAddWrite() {
		
		var cmtContent = $("textarea#cmtContent").val().trim();
		
		if (cmtContent == null || cmtContent == "") {
			alert("댓글을 입력해 주세요.");
			return false;
		}
		
		var frm = $("form[name=addWriteFrm]").serialize();
		
		$.ajax({
			url: "<%= request.getContextPath()%>/commentRegister.sky",
			data: frm,
			type: "POST",
			dataType:"JSON",
			success: function(json){
					
				if (json.n == 0) {
					alert("댓글쓰기에 실패했습니다.");
				}else if (json.n == 1){

					// 댓글 개수를 다시 초기화하기 위함.
					$("textarea#cmtContent").val("");
					$("input#startNo").val("1");
					$("input#cmtCount").val("0");
					$("table#contentTable2").html("");
					$("h4.more").show();
					
					// 댓글 작성란의 글자수를 세기 위함. 
					var characters = $("textarea#cmtContent").val().length;
					$("span#characters").text(characters);
					if (characters >= 200) {
						$("span#alert").show();
					}else{
						$("span#alert").hide();
					}
					
					goViewComment();
				}else{
					alert("길이제한을 초과하여 등록할 수 없습니다.");
				}
				
			},
			error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
			
		});
	}// end of function goAddWrite() {}----------------------------------
	
	
	// 댓글의 추천을 누르면 추천수가 1 증가하는 메서드
	function commentUp(commentNo) {
		
		var fk_boardKindNo = $("input[name=fk_boardKindNo]").val(); 
		var fk_boardNo = $("input[name=fk_boardNo]").val(); 
		
		$.ajax({
			url: "<%= ctxPath%>/addCommentUp.sky",
			type: "POST",
			data: {"fk_boardKindNo":fk_boardKindNo, "fk_boardNo":fk_boardNo, "commentNo":commentNo},
			dataType:"JSON",
			success: function(json){
				
				if (json.n == 0) {
					alert("이미 추천하셨습니다.");
				}else{
					alert("추천되었습니다.");
					var cmtUpCount = json.cmtUpCount;
					var cmtDownCount = json.cmtDownCount;

					if (cmtDownCount == null || cmtDownCount == "") {
						cmtDownCount = "0";
					}
					$("span#cmtUpCount"+commentNo).text(cmtUpCount);
					$("span#cmtDownCount"+commentNo).text(cmtDownCount);
				}
			},
			error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
		});

	}// end of function commentUp() {}-------------------------------------------
	
	
	// 댓글의 비추천을 누르면 비추천수가 1 증가하는 메서드
	function commentDown(commentNo) {
		
		var fk_boardKindNo = $("input[name=fk_boardKindNo]").val(); 
		var fk_boardNo = $("input[name=fk_boardNo]").val(); 

		$.ajax({
			url: "<%= ctxPath%>/addCommentDown.sky",
			type: "POST",
			data: {"fk_boardKindNo":fk_boardKindNo, "fk_boardNo":fk_boardNo, "commentNo":commentNo},
			dataType:"JSON",
			success: function(json){
				
				if (json.n == 0) {
					alert("이미 비추천하셨습니다.");
				}else{
					alert("비추천되었습니다.");
					var cmtUpCount = json.cmtUpCount;
					var cmtDownCount = json.cmtDownCount;

					if (cmtUpCount == null || cmtUpCount == "") {
						cmtUpCount = "0";
					}
					$("span#cmtUpCount"+commentNo).text(cmtUpCount);
					$("span#cmtDownCount"+commentNo).text(cmtDownCount);
				}
			},
			error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
		});

	}// end of function commentDown() {}-------------------------------------------

	
	// 댓글의 신고를 누르면 신고수가 1 증가하는 메서드
	function commentReport(commentNo) {
		
		var fk_boardKindNo = $("input[name=fk_boardKindNo]").val(); 
		var fk_boardNo = $("input[name=fk_boardNo]").val(); 

		$.ajax({
			url: "<%= ctxPath%>/addCommentReport.sky",
			type: "POST",
			data: {"fk_boardKindNo":fk_boardKindNo, "fk_boardNo":fk_boardNo, "commentNo":commentNo},
			dataType:"JSON",
			success: function(json){
				
				if (json.n == 0) {
					alert("이미 신고하셨습니다.");
				}else{
					alert("신고되었습니다.");
					
					// 댓글목록이 초기화 되도록 함.
					$("input#startNo").val("1");
					$("input#cmtCount").val("0");
					$("table#contentTable2").html("");
					$("h4.more").show();
					
					goViewComment();
					
				}
			},
			error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
		});

	}// end of function commentReport() {}-------------------------------------------
	
	
	// 댓글 삭제 버튼을 누르면 댓글을 삭제해주는 메서드. 
	function goDeleteComment(commentNo) {
		
		var fk_boardKindNo = $("input[name=fk_boardKindNo]").val(); 
		var fk_boardNo = $("input[name=fk_boardNo]").val(); 

		$.ajax({
			url: "<%= ctxPath%>/deleteComment.sky",
			type: "POST",
			data: {"fk_boardKindNo":fk_boardKindNo, "fk_boardNo":fk_boardNo, "commentNo":commentNo},
			dataType:"JSON",
			success: function(json){
				
				if (json.n == 0) {
					alert("삭제에 실패했습니다.");
				}else{
					alert("댓글이 삭제되었습니다.");
					
					// 댓글목록이 초기화 되도록 함.
					$("input#startNo").val("1");
					$("input#cmtCount").val("0");
					$("table#contentTable2").html("");
					$("h4.more").show();
					
					goViewComment();
				}
			},
			error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
		});
		
		
	}// end of function goDeleteComment() {}---------------------------------
	
	
	// 댓글 수정 버튼을 누르면 댓글을 수정할 수 있도록 폼을 바꿔주는 메서드. 
	function goChangeComment(commentNo) {
		
		var $target = $(event.target); // 이벤트가 발생한 선택자를 가져와 $target이라는 변수로 설정한다.
		
		var comment = $target.val();
		comment = comment.replaceAll("<br>","\n");
		
		var html = "<textarea class='form-control myContent' style='resize: none;' rows='3'>"+comment+"</textarea>"+
				   "<button class='myComment' value='"+$target.val()+"' onclick='goResetUpdate("+commentNo+")'>취소</button>"+
				   "<button class='myComment' onclick='goUpdateComment("+commentNo+")'>수정</button>";
		
		$($target).parent().parent().html(html); // 해당 선택자의 부모선택자인 td 태그안에 새로운 코드를 넣어준다.
		
	}// end of function goChangeComment() {}---------------------------------
	
	
	// 바뀐 댓글 창에서 수정버튼을 누르면 해당 내용으로 다시 댓글을 바꿔주는(update) 메서드.
	function goUpdateComment(commentNo) {
		
		var $target = $(event.target);
		
		var cmtContent = $target.siblings("textarea").val();
		
		var fk_boardKindNo = $("input[name=fk_boardKindNo]").val(); 
		var fk_boardNo = $("input[name=fk_boardNo]").val(); 

		$.ajax({
			url: "<%= ctxPath%>/updateComment.sky",
			type: "POST",
			data: {"fk_boardKindNo":fk_boardKindNo, "fk_boardNo":fk_boardNo, "commentNo":commentNo, "cmtContent": cmtContent},
			dataType:"JSON",
			success: function(json){

				if (json.n == 0) {
					alert("수정에 실패했습니다.");
				}else{
					alert("댓글이 수정되었습니다.");
					
					// 댓글목록이 초기화 되도록 함.
					$("input#startNo").val("1");
					$("input#cmtCount").val("0");
					$("table#contentTable2").html("");
					$("h4.more").show();
					
					goViewComment();
				} 
			},
			error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
		});
	}// end of function goUpdateComment(commentNo) {}------------------------------------
	
	
	// 댓글 수정중 취소를 눌렀을 때 
	function goResetUpdate(commentNo) {
		
		var $target = $(event.target); // 이벤트가 발생한 선택자를 가져와 $target이라는 변수로 설정한다.
		
		var comment = $target.val();

		var html = comment +
				  "<div><button class='myComment' onclick='goDeleteComment("+commentNo+")'>삭제</button>" +
				  "<button class='myComment' value='"+comment+"' onclick='goChangeComment("+commentNo+")'>수정</button></div>";
			
		$($target).parent().html(html); // 해당 선택자의 부모선택자인 td 태그안에 새로운 코드를 넣어준다.
		
	}// end of function goResetUpdate(commentNo) {}----------------------------------------
	
	
	// 각 댓글의 작성자 이름을 클릭시, 댓글 입력창에 ##닉네임이 생성되도록 한다.
	function addTag() {
		
		var $target = $(event.target);
		var nickname = $($target).text();
		var content = $("textarea#cmtContent").val();
		content += "##"+nickname+" ";
		$("textarea#cmtContent").val(content);
		
		var characters = content.length;
		$("span#characters").text(characters);		
		
		if (characters >= 200) {
			$("span#alert").show();
		}else{
			$("span#alert").hide();
		}
		
	}// end of function addTag(nickname) {}----------------------------
	
	
	// 우측 신규글, 인기글 사이드바
    function goView2(fk_boardKindNo, boardNo){
	      
		<% session.setAttribute("readCountPermission", "yes"); %>
		
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

<!-- <body> -->
	<div class="content1">
		<div class="contents" class="form-group">
			<h1>${boardvo.subject} <c:if test="${not empty boardvo.fk_categoryNo}"><span>[${boardvo.fk_categoryName}]</span></c:if></h1>
			<h5><span>작성자 : <img src="<%= ctxPath%>/resources/images/levelimg/${boardvo.levelImg}" class="photo" />${boardvo.fk_nickname}</span>ㅣ<span>조회수 : ${boardvo.readCount}</span>ㅣ<span>작성시간 :  ${boardvo.regDate}</span><c:if test="${boardvo.editDate ne null}">ㅣ<span>수정시간 : ${boardvo.editDate} </span></c:if></h5>
			<div id="content" style="word-break: break-all;">${boardvo.content}</div>
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
	<button id="goback" onclick="javascript:location.href='${gobackURL}'" style="clear:both; margin-right: 35px;">목록으로</button>
	</div>
	
	
	<div id="sideBar">
	   <div>
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
	   
	   <div>
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
	   
	   <div>
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
	   
	    <form name="goViewFrm2">
	    	<input type="hidden" id="boardNo" name="boardNo" value="" /> 
	        <input type="hidden" id="boardKindNo" name="boardKindNo" value="" /> 	
		</form>
  	</div> 
   
	
	<div class="content2">
		
		<div id="reply" >
			<div><span>댓글쓰기</span><span><img  class="photo" src="<%= ctxPath%>/resources/images/levelimg/level${sessionScope.loginuser.fk_levelNo}.png"/>${sessionScope.loginuser.nickname}</span></div>
			<form name="addWriteFrm" style="margin-top: 5px; width: 90%; height: 125px;" class="form-group">
				<textarea id="cmtContent" name="cmtContent" class="form-control"></textarea>
				<input type="hidden" name="fk_boardKindNo" value="${boardvo.fk_boardKindNo}"/>
				<input type="hidden" name="fk_boardNo" value="${boardvo.boardNo}"/>
			</form>
			<div>
				<span id="alert" style="color:red; margin-right: 20px;">200자가 넘으면 댓글을 등록할 수 없습니다.</span><span id="characters" style="">0</span><span> / 200</span>
				<button id="btnComment" type="button" onclick="goAddWrite()">확인</button>
			</div> 
		</div>
		<hr>
		
		<!-- 댓글 부분 -->
		<table id="contentTable2" class="form-group" ></table>
		<h4 class="more">더보기...</h4>
		<input type="hidden" id="startNo" value="1"/>
		<input type="hidden" id="cmtCount" value="0"/>
		
	</div>
	
<!-- 
	<div id="include">
		<jsp:include page="boardList.jsp" />
	</div>

</body>
</html> -->

<!-- 삭제 확인 Modal -->
	    <div class="modal" id="deleteModal" role="dialog">
	      <div class="modal-dialog">
	    
	        <!-- 삭제 확인 Modal 내용 -->
	        <div class="modal-content">
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