<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

</script>

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


<div id="certificateWrapper">
	<div class="defaultInfo">
		<label style="width: 30px;">학번</label><input type="text" class="defaultInput" value="${loginuser.memberno}" readonly />
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
							<th>수령방법</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>n</td>
							<td>n</td>
							<td></td>
							<td>
								<select></select>
							</td>
							<td>
								<select></select>
							</td>
							<td>n</td>
						</tr>
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