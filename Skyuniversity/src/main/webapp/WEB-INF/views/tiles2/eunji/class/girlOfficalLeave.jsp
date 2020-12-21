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
</script>
<div style="padding-left: 10px; padding-right: 10px;">
<div>
<span style="font-size: 12pt; font-weight: bold;">여학생 공결신청</span>
	<br>
	<div>
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
		<li style="display: inline-block; margin-left: 200px;"><button>신청</button></li>
	</ul>
	</div>
</div>
</div>