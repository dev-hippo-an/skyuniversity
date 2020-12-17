<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
   String ctxPath = request.getContextPath();
%>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
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
	
	$("#alldaychk").click(function() {
		if ($("#alldaychk").is(":checked") == true){
			$("#starttime").attr('disabled', 'disabled');
			$("#endtime").attr('disabled', 'disabled');
		}
		else{
			$('#starttime').removeAttr("disabled");
			$('#endtime').removeAttr("disabled");
		}
	});
	
	$("#addbtn").click(function() {
		
		var date1 = $("#datepicker1").val().substring(8);
		var date2 = $("#datepicker2").val().substring(8);
		var min = parseInt(date2)-parseInt(date1);
		var bool = true;
		// 일자 유효성 검사
		if($("#datepicker1").val().trim()=="" || $("#datepicker1").val().trim()==""){
			alert("일자를 입력해주세요.");
			bool = false;
		}
		
		// 시간 유효성 검사
		if ($("#alldaychk").is(":checked") == false){
			if($("#starttime").val().trim()=="" || $("#endtime").val().trim()==""){
				alert("시간을 입력해주세요.");
				bool = false;
			}
		}
		
		// 사유 유효성 검사
		var str = $("#reason option:selected").val();
		if(str == "전체"){
			alert("공결 사유를 선택해주세요.");
			bool = false;
		}
		else if(str == "본인 및 형제자매 결혼[허용기간:1일]"){
			if(min >= 1){
				alert("선택하신 일자는 해당 사유의 허용기간을 초과했습니다. 다시 선택해주세요.");
				bool = false;
				$("#datepicker1").focus();
			}
		}
		else if(str == "형제, 부모, 조부모, 외조부모의 사망[허용기간:5일]"){
			if(min >= 5){
				alert("선택하신 일자는 해당 사유의 허용기간을 초과했습니다. 다시 선택해주세요.");
				bool = false;
				$("#datepicker1").focus();
			}
		}
		else if(str == "수술, 중병으로 인한 입원[허용기간:2주]" || str == "전염성 질병으로 인한 격리[허용기간:2주]"){
			if(min >= 14){
				alert("선택하신 일자는 해당 사유의 허용기간을 초과했습니다. 다시 선택해주세요.");
				bool = false;
				$("#datepicker1").focus();
			}
		}
		
		if(bool){
			alert("공결신청이되었습니다.");
			// 폼(form) 을 전송(submit)
			var frm = document.addFrm;
			frm.method = "POST";
			frm.action = "<%= ctxPath%>/officalLeaveEnd.sky";
			frm.submit(); 
		}
	});
});	

</script>

<div>
<div>
	<span>공결신청</span>
</div>

<div>
	<button id="newbtn">신규</button>
	<button id="addbtn">신청</button>
</div>

<div>
	<table class="table table-bordered">
		<tr>
			<td>학년도</td>
			<td>학기</td>
			<td>시작일자</td>
			<td>종료일자</td>
			<td>사유</td>
			<td>승인구분</td>
			<td>승인/반려일자</td>
			<td>반려이유</td>
		</tr>
		<%-- <c:forEach> --%>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<%-- </c:forEach> --%>
	</table>
</div>

<div>
 <form name="addFrm" enctype="multipart/form-data"> 
	<table>
		<tr>
			<td>일자</td>
			<td>
			<input type="text" id="datepicker1" name="startDate"/> ~
  			<input type="text" id="datepicker2" name="endDate"/>
  			</td>
		</tr>
		<tr>
			<td>전일</td>
			<td><input type="checkbox" id="alldaychk" name="alldaychk"/></td>
			<td>시간</td>
			<td><input type="time" id="starttime" name="startTime"/> ~ <input type="time" id="endtime" name="endTime"/></td>
		</tr>
		<tr>
			<td>사유</td>
			<td>
				<select name="reason" id="reason">
					<option>전체</option>
					<option>본인 및 형제자매 결혼[허용기간:1일]</option>
					<option>형제, 부모, 조부모, 외조부모의 사망[허용기간:5일]</option>
					<option>수술, 중병으로 인한 입원[허용기간:2주]</option>
					<option>전염성 질병으로 인한 격리[허용기간:2주]</option>
					<option>징병검사 등 병무[통지서에 명시된 일수]</option>
					<option>교육실습 등으로 인한 경우[실습기간]</option>
					<option>기타 총장이 부득이하다고 인정하는 경우</option>				
				</select>
			</td>
		</tr>
		<tr>
			<td>파일첨부</td>
			<td><input type="file" name="attach"/></td>
		</tr>
	</table>
</form>
</div>
</div>