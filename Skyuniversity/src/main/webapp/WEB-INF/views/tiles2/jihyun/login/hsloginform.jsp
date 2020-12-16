<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>        
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<style>

 div#logincontainer {
 	font-family: "Open Sans", sans-serif, 돋움;
 }

 div#loginheader {
 	height: 150px;
 	display: flex;
 	justify-content: space-between;
 	border-bottom: solid 2px #0843ad;
 }
 
 ul {
 	list-style-type: none;
 }

 span.sname {
 	font-size: 30pt;
 	font-weight: 600;
 }
  
  span.sinfo {
 	font-family: "Open Sans", sans-serif;
	font-size: 18pt;
	font-weight: 500;
 }

 div#logo {
 	padding-left: 30px;
 }
 
 span.btn {
 	cursor: pointer;
    margin: 3px;
    background-color: #0843ad;
    color: white;
    border-radius: 20px;
    font-weight: bold;
    font-size: 12pt;
 }
 
    @media ( min-width : 769px) and ( max-width : 991px) {
      .custom-border {
       }
      .custom-loginFrm {
         margin: 40px 0 0 0;
      }
      .custom-input {
         padding: 0 0 30px 0;
      }
      .custom-login-submit {
         padding: 45px 0 0 20px;
      }
   }
   
   @media ( min-width : 992px) {
      .custom-border {
       }
      .custom-loginFrm {
         margin: 40px 0 0 0;
      }
      .custom-input {
         padding: 0 0 30px 0;
      }
      .custom-login-submit {
         padding: 45px 0 0 20px;
      }
   }
 
</style>

<script type="text/javascript">
$(document).ready(function(){
    
    $("button#btnLOGIN").click(function() {
       func_Login();
    }); // end of $("#btnLOGIN").click();-----------------------
    
    $("input#pwd").keydown(function(event){
       
       if(event.keyCode == 13) { // 엔터를 했을 경우
          func_Login();
       }
    }); // end of $("#pwd").keydown();-----------------------   
    
}); // end of $(document).ready()---------------------------    

function func_Login() {
    
    var userid = $("#userid").val(); 
    var pwd = $("#pwd").val(); 
   
    if(userid.trim()=="") {
        alert("아이디를 입력하세요!!");
       $("#userid").val(""); 
       $("#userid").focus();
       return;
    }
   
    if(pwd.trim()=="") {
       alert("비밀번호를 입력하세요!!");
       $("#pwd").val(""); 
       $("#pwd").focus();
       return;
    }

    var frm = document.loginFrm;
    
    frm.action = "<%=ctxPath%>/loginhsEnd.sky";
    frm.method = "POST";
    frm.submit();
    
 } // end of function func_Login(event)-----------------------------
</script>

<body>
	<div id="logincontainer">
      <div id="loginheader">
      
	      <div id="logo">
			<img src="<%= ctxPath %>/resources/images/logo_size.jpg" style="width: 250px; height: 100px;">
		 </div>
	      <div id="loginStudent">
		      <span class="sname">통합로그인</span>
		 </div>
		 <div id="btn" style="margin-right: 30px; margin-top: 20px;">
		   <span class="btn">커뮤니티</span>
		 </div>
      
      </div>
      
      <div id="mycontent">
      
		<div class="row col-md-8 col-md-offset-2 custom-border">
      <h2 class="text-primary">로그인</h2>
	  <hr>
      
      <form name="loginFrm">
      <div class="row custom-loginFrm custom-border">    
          <div class="col-sm-8 col-lg-8 custom-border">
            <div class="form-group custom-input">  <%-- 폼에서는 class form-group 을 사용해야 하며, 그 뜻은 폼에서 사용되어지는 1개 행 즉, 클래스 row 와 같은 용도로 사용되어지는 것이다. --%>
               <div class="col-sm-3 col-lg-3">
                  <label for="userid">학번</label>
               </div>
               <div class="col-sm-9 col-lg-9">
                  <input type="text" class="form-control" name="userid" id="userid" value=""/> <%-- 부트스트랩에서 input 태그에는 항상 class form-control 이 사용되어져야 한다. --%>
               </div>
            </div>   
               
            <div class="form-group custom-input">
               <div class="col-sm-3 col-lg-3">
                  <label for="pwd">비밀번호</label>
               </div>
               <div class="col-sm-9 col-lg-9">
                  <input type="password" class="form-control" name="pwd" id="pwd" value="" /> 
               </div>
            </div>
         </div>
         
         <div class="col-sm-4 col-lg-4 custom-login-submit custom-border">
            <button class="btn btn-success" type="button" id="btnLOGIN" >로그인</button> 
         </div>    
      </div>
      </form>
   </div>
		      		
      </div>
   </div>
</body>
</html>