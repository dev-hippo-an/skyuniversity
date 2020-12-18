<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

 div.defaultInfo {
	 	margin-bottom: 30px;
	 }
	 
 input.defaultInput {
	 	width: 100px;
	 	margin-right: 20px;
	 	outline: none;
	 	}
	 	
 div#pwdChageContainer {
 	margin: 50px auto;
 	display: flex;
 	flex-direction: column;
 	align-items: center;
 	border: solid 2px #0843ad;
 	border-radius: 10px;
 	width: 60%;
 	padding: 50px;
 	font-size: 11pt;
 }
 
 .changeInput {
 	width: 50%;
 	
 }
 
 label.pcLabel {
 	margin-top: 10px;
 	width: 100px;
 }
 
 input.pcInput {
 	width: 100%;
 	outline: none;
 	border: none;
 	border-bottom: solid 1px lightgray;
 	margin-bottom: 10px;
 }

.btnChange {
	background-color: #0843ad; 
	/* border-color: #0843ad;  */
	/* -webkit-box-shadow: 0 3px 0 #088d74;  */
	/* box-shadow: 0 3px 0 #088d74; */
	color: white;
	border-radius: 20px;
	height: 30px;
	width: 50%;
}
.btnChange:hover {
	background-color:#2b79c2;
	outline: none;
}

.btnChange:active { 
	/* top: 3px;  */
	outline: none; 
	-webkit-box-shadow: none; 
	box-shadow: none;
}
.btnChange:focus {
	outline: none;
}


</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		
	});
	
	function goChagePwd() {
		
	}
</script>

<div id="pwdChageContainer">

	<div class="defaultInfo">
		<label style="width: 35px;">학번</label><input type="text" class="defaultInput" readonly/>
		<label style="width: 35px;">이름</label><input type="text" class="defaultInput" readonly/>
	</div>
	<form name="pwdChangeFrm" class="changeInput">
		<label class="pcLabel">현재 비밀번호</label><br>
		<input class="pcInput" type="password"/><br>
		<p class="error"></p>    	
		<label class="pcLabel">새 비밀번호</label><br>
		<input class="pcInput" type="password" name="pwd"/><br>
		<p class="error"></p>    	
		<label class="pcLabel">비밀번호 확인</label><br>
		<input class="pcInput" type="password" /><br>
		<p class="error"></p>    	
	</form>  	
	<button type="button" class="btnChange" onclick="goChagePwd();">비밀번호 변경</button>
</div>