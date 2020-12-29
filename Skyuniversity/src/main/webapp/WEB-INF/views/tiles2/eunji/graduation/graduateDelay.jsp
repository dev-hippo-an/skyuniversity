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
#info {
	color: #737373;
	font-size: 9.5pt;
	padding-left: 5px;
}
#info > li {
	padding-bottom: 10px;
}
.info > td {
	width: 550px;
}
.info > td > input {
	border: none;
	color: #0066cc;
	font-weight: bold;
}
table#scroltbl {
	border-collapse:collapse; width:100%;
}
#scrolth {
	float:left; width:100%;
}
#bodys {
	overflow-y:auto; overflow-x:hidden; float:left; width:100%; height:350px;
}
#subli {
	display: table; width: 1370px;
}
.sublicl {
	display:table; width:1370px;
} 
.sublicl > td {
	font-size: 9pt;
	text-align: center;	
}
#subli > td {
	width:280px;
	font-size: 9pt;
	text-align: center;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	 
	 var now = new Date();
	 var year = now.getFullYear() + 1;
	 var month = now.getMonth() + 1; 
	 $("#year").text(year);
});
var cnt = 0;

function funcCome(index){

}

function funcdel(index){
	var no = $("#no"+index).val();
	var check = confirm("복학신청을 취소하시겠습니까?");
	if(check){
		location.href="<%=ctxPath%>/comeSchool.sky?seq="+no;
	}
	else{
		return;
	}
}
</script>
<div style="padding-left: 10px; padding-right: 10px;">
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
	</table>
</div>
<br>
<div>
	<span style="font-size: 12pt; font-weight: bold;float: left;">졸업연기신청</span>
</div>
<br><br>
<div style="border: solid 2px #cccccc; padding: 20px; border-radius: 6px; float: left; width: 49%; height: 350px;">
	<ul style="list-style: none; padding-left: 0px; padding-right: 0px;">
		<li>
			<label>총 이수학기: </label>
			<span></span>학기
		</li>
		<li>
			<label>교양 총 이수학점: </label>
			<span></span>학점
			&nbsp;&nbsp;
			<label>전공 총 이수학점: </label>
			<span>${summajor}</span>학점
			&nbsp;&nbsp;
			<label>총 이수학점: </label>
			<span>${sumcredits}</span>학점
		</li>
		<br>
		<li>
			<label>신청년도: </label>
			<span id="year"></span>년도
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 5pt; color: red;">졸엽연기 신청 시, 최대 1년까지 신청가능합니다.</span>
		</li>
		<li>
			<label>신청사유:</label>
			<textarea rows="8" cols="80" placeholder="최소 50자 이상 작성해주세요." name="reason" style="border: solid 1px #cccccc;" id="reason"></textarea>
		</li>
		<li>
			<button style="margin-left: 550px;">신청</button>
		</li>
	</ul>
</div>
<div style="border: solid 2px #cccccc; padding: 20px; border-radius: 6px;  float: right; width: 49%; height: 350px; margin-bottom: 10px;">
	<div style="color:red; font-weight: bold;">졸업연기 신청시 유의사항</div>
	<br>
	<ul id="info">
		<li>휴학시작학기는 해당학기를 기준으로 그 다음학기가 휴학 시작 학기로 정해집니다. 유의해주세요.</li>
	    <li>휴학학기를 기준으로 복학예정학기가 자동으로 입력됩니다. (복학 예정학기에만 복학이 가능한것은 아닙니다.)</li>
		<li>휴학은 총 8학기까지 가능하며 연속 휴학 가능학기는 최대 4개 학기(2년)로 제한됩니다. </li>
		<li>최소 1 ~ 최대 3일 후에 휴학결과조회 페이지에서 승인여부를 확인해주세요.</li>
		<li>휴학신청 수정이 필요할경우, (학적 >> 휴학결과조회 >> 수정)에서 가능합니다.</li>
	</ul>
</div>
<br><br>
<div style="clear: both;">
	<span style="font-size: 12pt; font-weight: bold;float: left;">복학신청내역</span>
</div>
<br><br>
<div style="border: solid 2px #cccccc;border-radius: 6px; height: 350px;">
	<table class="table table-striped" id="scroltbl">
		<thead id="scrolth">
			<tr id="subli">
				<td style="width: 200px;">신청일자</td>
				<td style="width: 100px;">신청년도</td>
				<td style="width: 100px;">승인여부</td>
				<td style="width: 200px;">반려이유</td>
				<td style="width: 200px;">취소</td>
			</tr>
		</thead>
		<tbody id="bodys">
			<c:forEach items="${list}" var="vo" varStatus="status">
			<tr class='sublicl'>
				<td style="width: 200px;">${vo.comeSemester}</td>
				<td style="width: 100px;">${vo.regDate}</td>
				<td style="width: 100px;" id="type${status.index}">${vo.type}</td>
				<td style="width: 200px;">${vo.approve}</td>
				<td style="width: 200px;">${vo.noReason}</td>
				<c:if test="${vo.fileName == null}">
				<td style="width: 200px;"></td>
				</c:if>
				<c:if test="${vo.fileName != null}">
				<td style="width: 200px;"><a href='<%= request.getContextPath()%>/downloadComeSchoolInfo.sky?seq=+${vo.comeSeq}+'><img src='<%= request.getContextPath() %>/resources/images/disk.gif'/></a></td>
				</c:if>
				<c:if test="${vo.approve == '승인전'}">
					<td style="width: 100px;"><button onclick="funcdel(${status.index})">취소</button>
					<input type="text" value="${vo.comeSeq}" id="no${status.index}" hidden="true"/>
					</td>
				</c:if>
				<c:if test="${vo.approve == '승인완료'}">
					<td style="width: 100px;"></td>
				</c:if>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</div>