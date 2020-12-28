<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>

	div#certificateWrapper {
		padding: 30px;
	}
	
	div#block0 {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
	}

	#block1, #block2 {
		/* border: solid 1px gray; */
		height: 700px;
	}
	
	#block1 {
		width: 55%;
	}
	
	#block2 {
		width: 44%;
	}

 input.defaultInput {
	 	width: 85px;
	 	margin-right: 30px;
	 	outline: none;
	 }
	 
	 div.defaultInfo {
	 	margin-bottom: 50px;
	 }
	 
	
 .bordered {
	    *border-collapse: collapse; /* IE7 and lower */
	    border-spacing: 0;
	    width: 100%;
	    border: solid #ccc 1px;
	    -moz-border-radius: 6px;
	    -webkit-border-radius: 6px;
	    border-radius: 6px;
	    -webkit-box-shadow: 0 1px 1px #ccc;
	    -moz-box-shadow: 0 1px 1px #ccc;
	    box-shadow: 0 1px 1px #ccc;
	}
	 
	.bordered tr:hover {
	    background: #fbf8e9;
	    -o-transition: all 0.1s ease-in-out;
	    -webkit-transition: all 0.1s ease-in-out;
	    -moz-transition: all 0.1s ease-in-out;
	    -ms-transition: all 0.1s ease-in-out;
	    transition: all 0.1s ease-in-out;
	}
	 
	.bordered td, .bordered th {
	    border-left: 1px solid #ccc;
	    border-top: 1px solid #ccc;
	    padding: 10px;
	    text-align: center;
	}
	 
	.bordered th {
	    background-color: #dce9f9;
	    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
	    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
	    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
	    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
	    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
	    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
	    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
	    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;
	    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
	    border-top: none;
	    text-shadow: 0 1px 0 rgba(255,255,255,.5);
	}
	 
	.bordered td:first-child, .bordered th:first-child {
	    border-left: none;
	}
	 
	.bordered th:first-child {
	    -moz-border-radius: 6px 0 0 0;
	    -webkit-border-radius: 6px 0 0 0;
	    border-radius: 6px 0 0 0;
	}
	 
	.bordered th:last-child {
	    -moz-border-radius: 0 6px 0 0;
	    -webkit-border-radius: 0 6px 0 0;
	    border-radius: 0 6px 0 0;
	}
	 
	.bordered th:only-child{
	    -moz-border-radius: 6px 6px 0 0;
	    -webkit-border-radius: 6px 6px 0 0;
	    border-radius: 6px 6px 0 0;
	}
	 
	.bordered tr:last-child td:first-child {
	    -moz-border-radius: 0 0 0 6px;
	    -webkit-border-radius: 0 0 0 6px;
	    border-radius: 0 0 0 6px;
	}
	 
	.bordered tr:last-child td:last-child {
	    -moz-border-radius: 0 0 6px 0;
	    -webkit-border-radius: 0 0 6px 0;
	    border-radius: 0 0 6px 0;
	}
	
	#applicationRecord, #application {
		border: solid 1px gray;
		border-radius: 20px;
		padding: 30px;
	}
	
	.mybtn {
		width: 100%;
		background-color: #2b79c2;
		color: white;
		font-weight: bold;
		margin-top: 20px;
	}
	
	.mybtn:hover {
		background-color: #1d85e6;
		color: white;
	}
	
	.mybtn:focus {
		outline: none;
		color: white;
	}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	 $(document).ready(function(){
		
		var charge = 0;
		var count = 0;
		var spinner = $("input.spinner").spinner();
		
		spinner.val(0);
		spinner.spinner({
			min:0,
			max:10,
			step:1,
			spin:function(event,ui){
				count = ui.value;
				// 스피너가 작동한 곳의 value값을 가져온다.
				// 스피너 이벤트가 일어난 태그의 형제 태그중 ".charge"의 값을 가져온다.
				// 스피너 이벤트가 일어난 태그의 값 * ".charge" 값 을 
				// 형제태그중 ".sumInput"에 넣어주기
				
				var charge = $(this).parent().parents("td").html();
				console.log(charge);
				//var sum = count*charge;
				//console.log(sum);
				//console.log($(this).val());
				//var c = $(event.target).val();
				//console.log(c);
			}
		});
		
		$('.ui-spinner-button').click(function(){
			var c = $(this).parents().html();
		});
	});// end of $(document).ready(function(){});------------------------
	 
	function sum(charge, count){
		
		
	}
</script>


<div id="certificateWrapper">
	<div class="defaultInfo">
		<label style="width: 30px;">학번</label><input type="text" class="defaultInput" value="${loginuser.memberNo}" readonly />
		<label style="width: 30px;">성명</label><input type="text" class="defaultInput" value="${loginuser.name}"  readonly />
	</div>
	<div id="block0">
		<div id="block1">
			<h4>증명서 발급 신청내역</h4>
			<div id="applicationRecord">
				<table class="bordered">
					<thead>
						<tr>
							<th>No</th>
							<th>신청자</th>
							<th>증명서종류</th>
							<th>발급부수</th>
							<th>사유</th>
							<th>신청일자</th>
							<th>발급일자</th>
							<th>발급번호</th>
							<th>상태</th>
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
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div id="block2">
			<h4>증명서 발급 신청</h4>
			<div id="application">
				<table class="bordered">
					<thead>
						<tr>
							<th>No</th>
							<th>증명서종류</th>
							<th>수수료</th>
							<th>국문/영문</th>
							<th>발급부수</th>
							<th>수령방법</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${not empty certificateKindList}">
						<c:forEach var="ck" items="${certificateKindList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${ck.certificateName}</td>
								<td class="charge">${ck.charge}</td>
								<td>
									<select class="lang" name="lang">
										<c:if test="${ck.lang eq '1'}">
				                               <option value="" selected>선택</option>
				                               <option value="1">국문</option>
				                               <option value="2">영문</option>
										</c:if>
										<c:if test="${ck.lang ne '1' }">
											   <option value="" selected>선택</option>
				                               <option value="1">국문</option>
										</c:if>
		                            </select>
								</td>
								<td class="spinner"><input class="spinner" name="count"/></td>
								<td>
									<select class="recieve" name="recieve">
										<option value="" selected>선택</option>
										<option value="1">직접수령</option>
										<option value="2">등기수령</option>
									</select>
								</td>
								<td class="sum"><input class="sumInput"/></td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" style="font-weight: bold;">총액</td>
							<td>n</td>
						</tr>
					</tfoot>
				</table>
				<button type="button" onclick="goApplication();" class="btn mybtn">발급신청</button>
			</div>
		</div>
	</div>
</div>