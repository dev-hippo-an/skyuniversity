<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
   String ctxPath = request.getContextPath();
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* Style tab links */
.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 500px;
  
}

.tablink:hover {
  background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: white;
  display: none;
  padding: 100px 20px;
  height: 100%;
}

#Home {background-color: red;}
#News {background-color: green;}
#Contact {background-color: blue;}
#About {background-color: orange;}

#trth > th{
}

.trtd > td{
} 
#trth, .trtd {
   text-align: center;
   font-weight: normal;
}
.title{
   width: 300px;
}
.content{
   width: 1200px;
   height: 200px;
}
#plan, #worknotice {
   text-align: center;
   color:black;
}
#tbldiv {
   margin: 0 auto;
   width: 1500px;
}
#include {
   margin: 0 auto;
   width: 1600px;
}
#includenext {
   border: solid 1px #f2f2f2;
   width: 800px;
   height: 650px;
}
#nextol > li {
   font-size: 18pt;
}
#container {
   height: 1000px;
}
#classli {
   font-size: 15pt;

}
#classul {
   width: 300px;
}
#title {
   font-size: 18pt;
}
#div1 {
   width:500px;
}
.ulstyle {
   background-color: white;
   border: none;   
}
.ulstyle:hover{
   background-color: white;
   border: none;
}
.ulstyle:click{ 
   background-color: white;
   color: red;
   border: none;
}
#contain {
   width: 1000px;
   margin: 0 auto;
}
#full {
   text-align: center;
}
#includes {
	width: 1200px;
	margin-left: 180px;
	padding-top: 20px;
	height: 400px;
}
#subtitle{
	display: block;
}
</style>

<script type="text/javascript">

   $(document).ready(function() {
      //$(".tabcontent").hide();

   
   });
   function openPage(pageName,elmnt,color) {
      $(".tabcontent").hide();
      $("#"+pageName).show();
   }
   // Get the element with id="defaultOpen" and click on it
   //document.getElementById("defaultOpen").click();
   
   function subject(){
	   alert("dd");
   }
</script>
<div id="full">
<div id="contain">
<table>
   <tr>
      <td>
         <div id="div1">
            <div id="title">
            <div>
               <table>
                  <th>
                     <td></td>
                     <td></td>
                     <td></td>
                  </th>
               </table>수강강좌 총강좌수: 5개 
            </div>
            </div>
            <div id="classli">
               <ul id="classul">
                  <li><a onclick="subject();">데이터베이스</a></li>
                  <li>객체지향프로그래밍</li>
                  <li>자료구조</li>
                  <li>빅데이터프로그래밍</li>
                  <li>시스템분석설계</li>
               </ul>
            </div>
         </div>
      </td>
      <td>
         <div>
            <table>
               <tr>
                  <td>Today's</td>
                  <td><span>0</span>건</td>
               </tr>
               <tr>
                  <td>2020.12.20</td>
                  <td>
                     <ul id="classul">
                        <li><a class="ulstyle" data-toggle="modal" data-target="#myModal">데이터베이스 기말고사</a></li>
                        <li>ER분석 및 설계</li>
                        <li>Error Detection 기법</li>
                     </ul>
                     
                     <!-- Modal -->
                     <div id="myModal" class="modal fade" role="dialog">
                       <div class="modal-dialog">
                     
                         <!-- Modal content-->
                         <div class="modal-content">
                           <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal">&times;</button>
                             <h4 class="modal-title">   ER 분석 및 EB 설계 자률과제</h4>
                           </div>
                           <div class="modal-body">
                             <table>
                                <tr>
                                   <td>과목</td>
                                   <td>데이터베이스</td>
                                </tr>
                                <tr>
                                   <td>시간</td>
                                   <td>2020년 12월 6일 오전 0시 0분 ~ 2020년 12월 13일 오후 23시 59분</td>
                                </tr>
                                <tr>
                                   <td>설명</td>
                                   <td>
                                      o 첨부된 파일의 과제를 수행하시오.
                                    <br>   
                                    o 이 과제는 자율과제이므로 결과를 제출하지 않아도 됩니다.
                                    <br>
                                    o 과제 결과를 재출하면&nbsp;채점과 코멘트를 해줄 것입니다.
                                 </td>
                                </tr>
                             </table>    
                           </div>
                           <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                           </div>
                         </div>
                     
                       </div>
                     </div>
                  </td>
               </tr>
            </table>
         </div>
      </td>
</tr>
</table>
</div>

<div id="includes">
<jsp:include page="a.jsp"/>
</div>
</div>

<div id="container">
<button class="tablink" onclick="openPage('subnotice', this, 'red');">과목공지</button>
<button class="tablink" onclick="openPage('worknotice', this, 'green')" id="defaultOpen">과제공지</button>
<button class="tablink" onclick="openPage('plan', this, 'blue')">강의계획서</button>

<div id="subnotice" class="tabcontent">
  dd
</div>

<div id="worknotice" class="tabcontent">

   
</div>

<div id="plan" class="tabcontent">
<div id="tbldiv">
 <table id="plantbl">
    <tr id="trth">
       <th class="title">과목명</th>
       <th class="content" style="text-align: left; height: 100px;" >데이터베이스 프로그래밍</th>
    </tr>
    <tr class="trtd">
       <td class="title">수업목표</td>
       <td class="content" style="text-align: left;">
       o 본 강좌는 컴퓨터공학부의 핵심 과목으로 선수과목인 1학기 고급프로그래밍 강좌에서 학습한 기본적인 Java 프로그래밍과 객체지향 개념에 기초하여 학생들에게 중/소규모 프로젝트에 대한 체계적인 개발 경험을 갖도록 한다.<br>
        o 본 강좌를 성공적으로 완수하기 위해 학생들은 선수과목인 1학기 고급프로그래밍 수업을 성공적으로 이수했거나 객체지향 프로그래밍에 대한 경험이 반드시 필요하다. (선수과목: 고급프로그래밍)
         </td>
    </tr>
    <tr class="trtd">
       <td class="title">수업진행방식</td>
       <td class="content" style="text-align: left;">
          o 본 강좌는 강의와 실습을 병행하여 진행<br>
         <br>
         o 코로나19로 인해 원격화상 수업 및 온라인 블랜디드 수업으로 진행<br>
         - 9/1 ~ 10/5 : 원격 화사수업(Google Meet)<br>
         - 10/6 이후: 온라인 블랜디드 수업(Google Meet 50% + LMS 50%)<br>
         <br>
         o 프로젝트를 학기말에 수행하고 프로젝트 개발 과정에서 생성되는 다양한 결과물(제안서,설계서,결과보고서)을 제출한다.<br>
         o 프로젝트는 자유주제로 선정되며 약간의 제한조건이 주어진다. 또한 학생들은 제출한 결과물에 대한여 발표한다.<br>
         o 학기 초에 학생들의 Java 프로그래밍 기초능력을 테스트하는 수준테스트가 시행되며 이는 평가에 포함된다.<br>
         o 평가지침: 중간고사 35, 기말고사 35%, 프로젝트: 10%, 퀴즈 및 과제물 10%, 출석 10%<br>
          <br>
       </td>
    </tr>
 </table>
 </div>
</div>
</div>