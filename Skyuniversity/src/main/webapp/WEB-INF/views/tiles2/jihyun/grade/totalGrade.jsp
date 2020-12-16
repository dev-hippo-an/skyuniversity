<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

 div#block2 {
 	display: flex;
 
 }

 table, th, td {
 	border: solid 1px gray;
    border-collapse: collapse;
    text-align: center;
 }
 
 th {
 	width: 100px;
 	height: 50px;
 	background-color: lightgray;
 }
 
 td {
 	height: 40px;
 }
 
</style>

<script type="text/javascript">

</script>

<div id="totalGradeContainer">
	<div id="defaultInfo">
		<label>학번</label><input type="text" readonly/>
		<label>성명</label><input type="text" readonly/>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>신청학점</th>
					<th>취득학점</th>
					<th>총점수</th>
					<th>평균학점</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>n</td>
					<td>n</td>
					<td>n</td>
					<td>n</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div id="block2">
		<div id="">
			<table>
				<thead>
					<tr>
						<th>No</th>
						<th>학기</th>
						<th>이수학점</th>
						<th>평점평균</th>
						<th>최초평점평균</th>
						<th>학사경고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>n</td>
						<td>n</td>
						<td>n</td>
						<td>n</td>
						<td>n</td>
						<td>n</td>
					</tr>
				</tbody>
			</table>
			<p>
			* 평점평균의미  - 재수강 제외한 성적<br>
			* 최초평점평균은 F, 학점포기, 재수강을 포함한 성적입니다. 학사경고, 성적장학금에 적용됩니다.<br>
			* 총최초평점평균은 조기졸업이나 전과시 사용됩니다.<br>
			* P, NP, 괄호학점은 평점에 포함되지 않습니다.<br>
			* ( )괄호학점은 졸업학점에 포함되지 않습니다.
			</p>
		</div>
		<div>
			<table>
				<thead>
					<tr>
						<th>No</th>
						<th>학기</th>
						<th>이수구분</th>
						<th>교과목코드</th>
						<th>교과목명</th>
						<th>학점</th>
						<th>평점</th>
						<th>성적</th>
						<th>이수여부</th>
						<th>재수강여부</th>
						<th>재수강과목명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>n</td>
						<td>n</td>
						<td>n</td>
						<td>n</td>
						<td>n</td>
						<td>n</td>
						<td>n</td>
						<td>n</td>
						<td>n</td>
						<td>n</td>
						<td>n</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</div>