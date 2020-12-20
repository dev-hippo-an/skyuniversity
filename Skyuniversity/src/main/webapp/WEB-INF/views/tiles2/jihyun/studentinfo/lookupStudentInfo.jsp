<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>

<style>

 div#stundentInfoContainer {
 	display: flex;
 	flex-direction: column;
 	align-items: center;	
 }
 
 div#sPhoto {
 	/* border: solid 1px gray; */
 	/* width: 15%; */
 	display: flex; 
 	flex-direction: column; 
 	justify-content: center;
 }

 label.miniTitle {
 	width: 100px;
 }
 
 label.miniTitle2 {
 	width: 70px;
 }
 
 input.readInfo {
 	width: 100px;
 }

 #block1, #block2 {
 	display: flex;
 	justify-content: space-between;
 	/* margin: 10px auto; */
 	width: 80%;
 }
 
 div#changeAdd, div#changePhoto {
 	border: solid 1px gray;
 	border-radius: 10px;
 	padding: 40px 30px;
 	margin-top: 30px;
 }
 
 div#changeAdd {
 	display: flex;
 	justify-content: space-between;
 	width: 60%;
 	margin-right: 1%;
 }
 
 div#changePhoto {
 	display: flex; 
 	justify-content: center;
 	width: 49%;
 }
 
 div#sInfomation {
 	border: solid 1px gray;
 	border-radius: 10px;
 	padding: 40px 20px;
 	width: 100%;
 }
 
 span.detailInfo {
 	margin-left: 20px;
 }
 
 .readInfo {
 	outline:none;
 	}

.btnChange {
	font-family: 'Lato', sans-serif;
	box-sizing: border-box;
	margin: 5px;
	color: white;
	padding: 10px 30px;
	position: relative;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom: 4px solid rgba(0,0,0,0.21);
	border-radius: 4px;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
	text-decoration: none;
	display: block;
	width: 60%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	background: linear-gradient(to bottom, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
 }

	
	.mybtn {
		background-color: #2b79c2;
		color: white;
		font-weight: bold;
	}
	
	.mybtn:hover {
		background-color: #1d85e6;
		color: white;
	}
	
	.mybtn:focus {
		outline: none;
		color: white;
	}
	
	.yourbtn:focus {
		outline: none;
	}
	
</style>

<script type="text/javascript">

</script>

<div id="stundentInfoContainer">
	
	<div id="block1">
		<div id="sInfomation" style="display: flex; justify-content: space-between;">
			<div id="sPhoto"><img src="<%=ctxPath%>/resources/images/studentImg/imgtest_jh.png" width="170px;"/></div>
			<span class="detailInfo">
				<br>
				<label class="miniTitle">성명</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">학번</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">성별</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">학년</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">최종등록학년도</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">총취득학점</label><input class="readInfo" type="text" value="" readonly/><br>
			</span>
			<span class="detailInfo">
				<label class="miniTitle">입학일자</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">한자성명</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">소속대학</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">이수대학</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">재적학기</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">최종등록학기</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">평점평균</label><input class="readInfo" type="text" value="" readonly/><br>
			</span>
			<span class="detailInfo">
				<label class="miniTitle">졸업일자</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">영문성명</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">소속학부(과)</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">이수학부(과)</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">학적상태</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">등록구분</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">복수전공</label><input class="readInfo" type="text" value="" readonly/><br>
			</span>
			<span class="detailInfo">
				<label class="miniTitle">남은휴학학기수</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">영문성명</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">소속전공</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">이수전공</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">학생구분</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">등록일자</label><input class="readInfo" type="text" value="" readonly/><br>
				<label class="miniTitle">부전공</label><input class="readInfo" type="text" value="" readonly/><br>
			</span>
		
		</div>
	</div>
	<div id="block2">
		<div id="changeAdd">
			<div>
				<div>
					<label class="miniTitle2">우편번호</label><input type="text" class="caInput" name="postcode"/>
					<button type="button" class="btn btn-default yourbtn" style="margin: 0 10px;;">주소찾기</button>
					<button type="button" class="btn mybtn" style="margin-left: 40px;">저장</button>
				</div>
				<label class="miniTitle2">주소</label><input type="text" class="caInput" name="address"/><br>
				<label class="miniTitle2">상세주소</label><input type="text" class="caInput" name="detailaddress"/><br>
				<label class="miniTitle2">연락처</label><input type="text" class="caInput" name="mobile"/><br>
				<label class="miniTitle2">이메일</label><input type="text" class="caInput" name="email"/><br>
				<label class="miniTitle2">한자명</label><input type="text" class="caInput" name="chinaname"/><br>
				<label class="miniTitle2">영문명</label><input type="text" class="caInput" name="engname"/>
			</div>
		</div>
		<div id="changePhoto">
			<div style="width: 150px; height: 200px; border: solid 1px gray;">등록할사진</div>
				<div style="display: flex; flex-direction: column; justify-content:flex-end; margin-left: 20px;">
					<span style="border: solid 1px gray; width: 200px;">사진파일을 첨부해주세요</span>
					<button type="button" class="btn mybtn" style="margin-top: 20px;">사진업로드</button>
					<button type="button" class="btn mybtn" style="margin-top: 20px;">사진변경신청</button>
				</div>
			</div>
		
		</div>
	
</div>