<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
   String ctxPath = request.getContextPath();
%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
.info > td {
	width: 550px;
}
.info > td > input {
	border: none;
	color: #0066cc;
	font-weight: bold;
}
</style>

<script type="text/javascript">
	$(function() {
		  $.datepicker.setDefaults({
			    dateFormat: 'yy-mm-dd',
			    prevText: '이전 달',
			    nextText: '다음 달',
			    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			    showMonthAfterYear: true,
			    yearSuffix: '년'
			  });
	
			  $(function() {
			    $("#datepicker1, #datepicker2").datepicker();
			  });
	});
	
	$(document).ready(function() {
		$("#regbtn").click(function() {
		
			var flag = true;
			
			if($('input:radio[name="armyType"]:checked').length < 1){
				alert("병종을 선택해주세요.");
				flag = false;
				return;
			}
			
			// 일자 유효성 검사
			if($("#datepicker1").val().trim()=="" || $("#datepicker2").val().trim()==""){
				alert("일자를 입력해주세요.");
				bool = false;
				return;
			}
			if($("#armyfile").val() == ""){
				alert("군휴학은 파일첨부(입영통지서)가 필수입니다.");
				bool = false;
				return;
			}
			
			if(flag){
				// 폼(form) 을 전송(submit)
				confirm("휴학신청을 하시겠습니까?");
				var frm = document.addFrm;
				frm.method = "POST";
				frm.action = "<%= ctxPath%>/armyLeaveSchoolEnd.sky";
				frm.submit();
			}
		});
	});
</script>
<div style="padding-left: 10px; padding-right: 10px;"	>
<div>
	<span style="font-size: 12pt; font-weight: bold;float: left;">학적정보</span>
</div>
<br><br>
<div style="border: solid 2px #cccccc; padding: 20px; border-radius: 6px;">
	<table>
		<tr class="info">
			<td>
				<label>학번:</label>
				<input type="text" value="${paraMap.deptName}" style="width: 100px;"/>
			</td>
			<td>
				<label>성명:</label>
				<input type="text" value="${paraMap.name}" style="width: 100px;"/></td>
			<td>
				<label>학과:</label>
				<input type="text" value="${paraMap.deptName}"/>
			</td>
			<td>
				<label>학적상태:</label>
				<input type="text" value="${paraMap.status}"/>
			</td>
			<td>
				<label>생년월일:</label>
				<input type="text" value="${paraMap.birth}"/>
			</td>
		</tr>
		<tr class="info">
			<td>
				<label>전화번호:</label>
				<input type="text" value="${paraMap.mobile}"/>
			</td>
			<td>
				<label>이메일:</label>
				<input type="text" value="${paraMap.email}"/>
			</td>
			<td>
				<label>학년:</label>
				<input type="text" value="${paraMap.grade}학년"/>
			</td>
			<td>
				<label>이수학기:</label>
				<input type="text" value="${paraMap.currentSemester}학기"/></td>
		</tr>
		<tr class="info">
			<td colspan="5">
				<label>주소:</label>
				<input type="text" value="${paraMap.address} ${paraMap.extraaddress}  ${paraMap.detailaddress}" style="width: 800px;"/>
			</td>
		</tr>
	</table>
</div>
<br><br>
<div>
	<span style="font-size: 12pt; font-weight: bold;float: left;">휴학신청 상세정보</span>
	<button id="regbtn" style="margin-left: 500px; border: none;">신청</button>
</div>
<br>
<div style="border: solid 2px #cccccc; padding: 15px; border-radius: 6px;">
	<ul>
		<li>
			<label>휴학학기:</label>
			<select name="grades" id="grades">
							<option>학년도</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
			</select>
			/
			<select name="grades" id="grades">
							<option>학기</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
			</select>
			&nbsp;~&nbsp;
			<select name="grades" id="grades">
							<option>학년도</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
			</select>
			/
			<select name="grades" id="grades">
							<option>학기</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
			</select>
		</li>
		
		<li>
			<label>휴학사유:</label><br>
			<textarea rows="12" cols="150" placeholder="최소 100자 이상 작성해주세요." name="etc"></textarea>
		</li>
	</ul>
</div>
<br>
<div id="divbtn">
<span style="font-size: 12pt; font-weight: bold; color: #ff4000">일반휴학 신청시 유의사항</span>
</div>
<br>
<div style="border: solid 2px #cccccc; padding: 15px; border-radius: 6px;">
<ul id="info" >
    <li>휴학학기를 기준으로 복학예정학기가 자동으로 입력됩니다. (복학 예정학기에만 복학이 가능한것은 아닙니다.)</li>
	<li>휴학은 총 8학기까지 가능합니다.</li>
	<li>최소 1 ~ 최대 3일 후에 휴학결과조회 페이지에서 승인여부를 확인해주세요.</li>
	<li>휴학신청 수정이 필요할경우, (학적 >> 휴학결과조회 >> 수정)에서 가능합니다.</li>
</ul>
</div>
<br><br>
</div>