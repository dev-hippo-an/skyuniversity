<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style type="text/css">
table {
   border-collapse: collapse;
   border-spacing: 0;
   width: 80%;
   border: 1px solid #ddd;
}

th, td {
   text-align: left;
   padding: 8px;
}

tr:nth-child(even) {
   background-color: #f2f2f2
}

li.pageBtn {
   font-size: 15pt;
   display: inline-block;
   width: 32px;
   height: 32px;
   /* border: solid 1px blue; */
}

li.pageBtn:hover {
   background-color: #ebebe0;
   cursor: pointer;
} 



</style>


<script type="text/javascript">

   $(document).ready(function() {
      
      $("div#tags li").click(function() {
         $(this).siblings().removeClass("active");
         $(this).addClass("active");
      });
      
   });// end of $(document).ready(function() {});-------------------------------------


</script>
</head>

   <div class="container" style="width: 60%; height: 100%; border: solid 1px red;">
      <div id="tags">
         <ul class="nav nav-tabs">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">Menu 1</a></li>
            <li><a href="#">Menu 2</a></li>
            <li><a href="#">Menu 3</a></li>
         </ul>
      </div>
      <br>
      <div style="overflow-x: auto; border: solid 1px black; width: 100%;">
         <table style="width: 100%;">
            <tr>
               <th>글번호</th>
               <th>분류</th>
               <th>글제목</th>
               <th>작성자</th>
               <th>작성시간</th>
               <th>추천</th>
               <th>조회수</th>
               
            </tr>
            <tr>
               <td>Jill</td>
               <td>Smith</td>
               <td>50</td>
               <td>50</td>
               <td>50</td>
               <td>50</td>
               <td>50</td>
               
            </tr>
            <tr>
               <td>Eve</td>
               <td>Jackson</td>
               <td>94</td>
               <td>94</td>
               <td>94</td>
               <td>94</td>
               <td>94</td>
               
            </tr>
            <tr>
               <td>Adam</td>
               <td>Johnson</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               
            </tr>
            <tr>
               <td>Adam</td>
               <td>Johnson</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               
            </tr>
            <tr>
               <td>Adam</td>
               <td>Johnson</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               
            </tr>
            <tr>
               <td>Adam</td>
               <td>Johnson</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               
            </tr>
            <tr>
               <td>Adam</td>
               <td>Johnson</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               
            </tr>
            <tr>
               <td>Adam</td>
               <td>Johnson</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               
            </tr>
            <tr>
               <td>Adam</td>
               <td>Johnson</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               <td>67</td>
               
            </tr>
         </table>
      </div>
      <ul class="pager">
         <li class="previous"><a href="#">Previous</a></li>
         <li class="pageBtn">1</li>
         <li class="pageBtn">2</li>
         <li class="pageBtn">3</li>
         <li class="pageBtn">4</li>
         <li class="pageBtn">5</li>
         <li class="pageBtn">6</li>
         <li class="pageBtn">7</li>
         <li class="pageBtn">8</li>
         <li class="pageBtn">9</li>
         <li class="pageBtn">10</li>
         <li class="next"><a href="#">Next</a></li>
      </ul>
   </div>
    