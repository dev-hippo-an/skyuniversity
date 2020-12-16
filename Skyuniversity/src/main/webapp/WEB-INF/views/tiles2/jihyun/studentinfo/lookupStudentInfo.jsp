<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>

<style>
 span#sPhoto {
 	
 }

 label.miniTitle {
 	width: 100px;
 }
 
 input.readInfo {
 	width: 100px;
 }

 #block1, #block2 {
 	display: flex;
 	margin: 50px auto;
 }
 
 div#changeAdd, div#changeName {
 	border: solid 1px gray;
 	border-radius: 10px;
 	padding: 40px 30px;
 }
 
 div#sInfomation {
 	border: solid 1px gray;
 	border-radius: 10px;
 	padding: 40px 30px;
 	margin-left: 30px;
 }
 
 span.detailInfo {
 	margin-left: 20px;
 }
 
 .readInfo {
 	outline:none;
 	
 }
 
</style>

<script type="text/javascript">

</script>

<div id="stundentInfoContainer">
	
	<div id="block1">
		<div id="sPhoto"><img src="<%=ctxPath%>/resources/images/studentImg/imgtest_jh.png" width="170px;"/></div>
		<div id="sInfomation" style="display: flex;">
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
			<label class="miniTitle">우편번호</label><input type="text" name="postcode"/><button type="button">주소찾기</button><br>
			<label class="miniTitle">주소</label><input type="text" name="address"/><br>
			<label class="miniTitle">상세주소</label><input type="text" name="detailaddress"/><br>
			<label class="miniTitle">연락처</label><input type="text" name="mobile"/><br>
			<label class="miniTitle">이메일</label><input type="text" name="email"/><br>
		</div>
		<div id="changeName">
			<label class="miniTitle">한자명</label><input type="text" name="email"/><br>
			<label class="miniTitle">영문명</label><input type="text" name="email"/><br>
			<span style="border: solid 1px gray; width: 100px; height: 150px;">사진파일을 첨부해주세요</span>
			<button>사진업로드</button>
			<button>사진변경신청</button>
		</div>
		
	</div>
	
</div>