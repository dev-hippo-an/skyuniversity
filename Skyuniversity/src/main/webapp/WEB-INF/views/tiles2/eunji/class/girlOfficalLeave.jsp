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
				return;
			}
			
			// 시간 유효성 검사
			if ($("#alldaychk").is(":checked") == false){
				if($("#starttime").val().trim()=="" || $("#endtime").val().trim()==""){
					alert("시간을 입력해주세요.");
					bool = false;
					return;
				}
			}
			
			var startdate = $("#datepicker1").val();
			var enddate = $("#datepicker2").val();
			var syear = startdate.substring(0,4);
			var smonth = startdate.substring(5,7);
			var sday = startdate.substring(8);
			var eyear = enddate.substring(0,4);
			var emonth = enddate.substring(5,7);
			var eday = enddate.substring(8);
			
			var start = syear+smonth+sday;
			var end = eyear+emonth+eday;
			if(parseInt(start) != parseInt(end)){
				alert("여학생 공결은 1일만 가능합니다. 기간을 다시 선택해주세요.");
				$("#datepicker1").focus();
				bool = false;
				return;
			}

			if(bool){
				// 폼(form) 을 전송(submit)
				confirm("여학생 공결신청하시겠습니까?");
				var frm = document.addFrm;
				frm.method = "POST";
				frm.action = "<%= ctxPath%>/girlOfficalLeaveEnd.sky";
				frm.submit(); 
			}ㅑ
		});
});
</script>
<div style="padding-left: 10px; padding-right: 10px;">
<div>
<span style="font-size: 12pt; font-weight: bold;">여학생 공결신청</span>
	<br>
	<div>
	<form name="addFrm"> 
	<ul style="padding-top: 20px;">
		<li style="display: inline-block;">
			<label>● 공결일자</label>
			<input type="text" id="datepicker1" name="startDate"/> ~
  			<input type="text" id="datepicker2" name="endDate"/>
		</li>
		
		<li style="display: inline-block;">
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;● 전일여부</label>
			<input type="checkbox" id="alldaychk" name="alldaychk"/>
			<label>&nbsp;&nbsp;시간</label>
			<input type="time" id="starttime" name="startTime"/> ~ <input type="time" id="endtime" name="endTime"/>
		</li>
		<li style="display: inline-block; margin-left: 200px;"><button id="addbtn" >신청</button></li>
	</ul>
	</form>
	</div>
</div>
<br/>
<div>
<span style="font-size: 12pt; font-weight: bold;">여학생 공결신청 목록</span>
</div>
</div>