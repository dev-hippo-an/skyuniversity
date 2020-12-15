ㅇㄷ<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
   String ctxPath = request.getContextPath();
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
#infodiv {
	font-size: 15pt;
	background-color: #e6eeff;
	height: 70px;
	text-align: center;	
}
#tbldiv {
	margin: 0 auto;
}
#infotr > td {
	padding-left: 40px;
	padding-right: 40px;
	height: 70px;
}
#classtr > td {
	padding-left: 40px;
	padding-right: 40px;
	height: 70px;
	
}
#regdiv {
	height: 300px;
}
.sublicl > td {
	width:500px;
	font-size: 9pt;
	text-align: center;	
}
#subli > td {
	width:280px;
	font-size: 9pt;
	text-align: center;
}
table#scroltbl {
	border-collapse:collapse; width:100%;
}
#scrolth {
	float:left; width:100%;
}
#tb {
	overflow-y:auto; overflow-x:hidden; float:left; width:100%; height:190px;
}
.sublicl {
	display:table; width:100%;
} 

#subli {
	display: table; width: 1550px;
}




</style>
<script type="text/javascript">

	$(document).ready(function() {
	
		$("#subjects").hide();
		
		$("#depts").change(function() {
			var dept = "";
			$("#depts option:selected").each(function() {
				dept = $(this).val();
			});
			var grades = $("#grades option:selected").val();
			$.ajax({
				url: "<%= request.getContextPath() %>/deptSelect.sky",
				data: {"dept":dept,
					   "grade":grades},
				type: "GET",
				dataType: "json",
				success: function(json) {
					$("#firstsub").hide();
					$("#subjects").show();
					var html = "<option>전체</option>";
					$.each(json, function(index, item){
						
						html += "<option>"+item.subject+"</option>";
					});
	
					$("#subjects").html(html);
				},
				error: function(request, status, error){
		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
				
			});	//------------------end of ajax
			
		});
		
		$("#grades").change(function() {
			var grades = "";
			$("#grades option:selected").each(function() {
				 grades = $(this).val();	
			});
			
			var dept = $("#depts option:selected").val();
			$.ajax({
				url: "<%= request.getContextPath() %>/deptSelect.sky",
				data: {"dept":dept,
					   "grade":grades},
				type: "GET",
				dataType: "json",
				success: function(json) {
					$("#firstsub").hide();
					$("#subjects").show();
					var html = "<option>전체</option>";
					$.each(json, function(index, item){
						
						html += "<option>"+item.subject+"</option>";
					});
	
					$("#subjects").html(html);
				},
				error: function(request, status, error){
		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
				
			});	//------------------end of ajax
		});
		
		$("#searchbtn").click(function() {
			var dept = $("#depts option:selected").val();
			var grades = $("#grades option:selected").val();
			var subjects = $("#subjects option:selected").val();
			var firstsub = $("#firstsub option:selected").val();
			
			$.ajax({
				url: "<%= request.getContextPath() %>/subSelect.sky",
				data: {"dept":dept,
					   "grade":grades,
					   "subject":subjects,
					   "firstsub":firstsub},
				type: "GET",
				dataType: "json",
				success: function(json) {
					var html="";
					$.each(json, function(index, item){						
						html += "<tr class='sublicl'>";
						html += "<td>"+item.subjectno+"</td>"
							   +"<td>"+item.subjectname+"</td>"
							   +"<td>"+item.credits+"</td>"
							   +"<td>"+item.name+"</td>"
							   +"<td>"+item.day+" / " + item.period+"</td>"
							   +"<td>"+item.curpeoplecnt + " / " + item.peoplecnt+"</td>"
							   +"<td><button>신청</button></td>";
						html += "</tr>";
					});
					$("#tb").html(html);
				},
				error: function(request, status, error){
		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
				
			});	//------------------end of ajax
			
		
		});	// ---------------- end of button click func
		
	});	//-------------------------------- end of document.ready()
</script>

<div id="container">
	<div id="infodiv">
		<table>
			<tr id="infotr">
				<td style="padding-left: 400px;">${year}년 / ${mvo.currentSemester}학기</td>
				<td>이름: ${mvo.name}</td>
				<td>학번: ${mvo.memberNo}</td>
				<td>학과: ${mvo.deptName}</td>
			</tr>
		</table>
	</div>
	
	<div id="regdiv">
		<div id="classlist">
			<table>
				<tr id="classtr">
					<td style="padding-left: 400px;">
						<label>학과: </label>
						<select name="depts" id="depts">
						  <option>전체</option>
						  <c:forEach items="${deptlist}" var ="dept" >
						  	<option>${dept}</option>
						  </c:forEach> 	 	
						</select>
					</td>
					<td>
						<label>학년: </label>
						<select name="grades" id="grades">
							<option>전체</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
						</select>
					</td>
					<td>
						<label>과목명: </label>
						<select name="subjects" id="subjects">
						</select>
						<select name="firstsub" id="firstsub">
						  <option>전체</option>
						  <c:forEach items="${subjectlist}" var ="sub" >
						  	<option>${sub}</option>
						  </c:forEach> 
						</select>
					</td>
					<td>
						<button id="searchbtn">검색</button>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<table id="scroltbl" class="table">
			<thead id="scrolth">
				<tr id="subli">
					<td style="padding-left: 20px;">과목코드</td>
					<td>과목명</td>
					<td>학점</td>
					<td style="padding-right: 35px;">교수님</td>
					<td style="padding-right: 40px;">요일 / 교시</td>
					<td>수강가능인원</td>
					<td>수강신청</td>
				</tr>
			</thead>
			<tbody id="tb">
				
			</tbody>
			</table>
		</div>
	</div>
</div>