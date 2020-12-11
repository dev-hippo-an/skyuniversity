<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();
%>
<script type="text/javascript">
	$(document).ready(function(){
		autoSlide();
		
	});
	
	var index = 0;
	
	function autoSlide() {
		var slides = $(".caro");
		var dots = $(".dot");
		
		
		slides.each(function(index, item) {
			item.style.display = "none";
		});
		
		index++;
		
		if (index > slides.length) {
			index = 1
		}
		
		for (var i = 0; i < dots.length; i++) {
	        dots[i].className = dots[i].className.replace(" sehyeong", "");
	    }
		
		slides[index-1].style.display = "block";
		dots[index-1].className += " sehyeong";
		setTimeout("autoSlide()", 5000); // Change image every 2 seconds
	} 
	
	
	function showSlides(n) {
	    var slides = $(".caro");
	    var dots = $(".dot");
	  
	    index = n;
	    
	    if (n > slides.length) {
			slideIndex = 0;
		}
	    
	    if (n < 1) {
	    	slideIndex = slides.length
	    }
	    
	    slides.each(function(index, item) {
	    	item.style.display = "none";
	    });
	    
	    for (i = 0; i < dots.length; i++) {
	        dots[i].className = dots[i].className.replace(" sehyeong", "");
	    }
	    
	    slides[n].style.display = "block";
	    dots[n].className += " sehyeong";

	}
	
	function openWin(url){  
	    window.open(url, "_blank");  
	}  

	
	
</script>

<div id="index-div">
	<div id="index-div-content">
	
		<div id="index-show-board">
			<div class="row">
  				<div class="column">
    				<div class="index-board hot">
    					<div class="board-header"> 
    						<span class="board-title">최근 게시물</span>
    					</div>
    					<table class="board-body">
    						<thead class="board-body-header">
    							<tr>
    								<th>게시판</th>
    								<th>글 제목</th>
    							</tr>
    						</thead>
    						<tbody>
    							<c:forEach begin="0" end="10" var="i" varStatus="status">
    								<tr>
    									<td>${i}</td>
    									<td>${i}</td>
    								</tr>
    							</c:forEach>
    						</tbody>
    					</table>
    				</div>
  				</div>
  				<div class="column">
    				<div class="index-board hot">
    					<div class="board-header"> 
    						<span class="board-title">주간 베스트 게시물</span>
    					</div>
    					<table class="board-body">
    						<thead class="board-body-header">
    							<tr>
    								<th>게시판</th>
    								<th>글 제목</th>
    							</tr>
    						</thead>
    						<tbody>
    							<c:forEach begin="0" end="10" var="i" varStatus="status">
    								<tr>
    									<td>${i}</td>
    									<td>${i}</td>
    								</tr>
    							</c:forEach>
    						</tbody>
    					</table>
    				</div>
  				</div>
  				<div class="column">
    				<div class="index-board hot">
    					<div class="board-header"> 
    						<span class="board-title">인기 게시물</span>
    					</div>
    					<table class="board-body">
    						<thead class="board-body-header">
    							<tr>
    								<th>게시판</th>
    								<th>글 제목</th>
    							</tr>
    						</thead>
    						<tbody>
    							<c:forEach begin="0" end="10" var="i" varStatus="status">
    								<tr>
    									<td>${i}</td>
    									<td>${i}</td>
    								</tr>
    							</c:forEach>
    						</tbody>
    					</table>
    				</div>
  				</div>
			</div>
			
			<c:if test="${not empty bannerList}">
				<div id="index-show-carousel" class="column">
					<a>
					<c:forEach items="${bannerList}" var="banner">
						<img class="caro" src="/skyuniversity/resources/images/${banner.iname}" onclick="openWin('${banner.ilink}')" />
					</c:forEach>
						
					</a>
					<div style="text-align:center">
						<c:forEach items="${bannerList}" varStatus="status">
							<span class="dot" onclick="showSlides(${status.index})"></span>
						</c:forEach>
					</div>
				</div>
				
			</c:if>
			
			
			<div class="row">
  				<div class="column">
    				<div class="index-board">
    					<div class="board-header"> 
    						<span class="board-title">자유 게시판(반말)</span>
    					</div>
    					<table class="board-body">
    						<thead class="board-body-header">
    							<tr>
    								<th>카테고리</th>
    								<th>글 제목</th>
    							</tr>
    						</thead>
    						<tbody>
    							<c:forEach begin="0" end="5" var="i" varStatus="status">
    								<tr>
    									<td>${i}</td>
    									<td>${i}</td>
    								</tr>
    							</c:forEach>
    						</tbody>
    					</table>
    				</div>
  				</div>
  				<div class="column">
    				<div class="index-board">
    					<div class="board-header"> 
    						<span class="board-title">공지사항</span>
    					</div>
    					<table class="board-body">
    						<thead class="board-body-header">
    							<tr>
    								<th>카테고리</th>
    								<th>글 제목</th>
    							</tr>
    						</thead>
    						<tbody>
    							<c:forEach begin="0" end="5" var="i" varStatus="status">
    								<tr>
    									<td>${i}</td>
    									<td>${i}</td>
    								</tr>
    							</c:forEach>
    						</tbody>
    					</table>
    				</div>
  				</div>
  				<div class="column">
    				<div class="index-board">
    					<div class="board-header"> 
    						<span class="board-title">익명 게시판</span>
    					</div>
    					<table class="board-body">
    						<thead class="board-body-header">
    							<tr>
    								<th>게시판</th>
    								<th>글 제목</th>
    							</tr>
    						</thead>
    						<tbody>
    							<c:forEach begin="0" end="5" var="i" varStatus="status">
    								<tr>
    									<td>${i}</td>
    									<td>${i}</td>
    								</tr>
    							</c:forEach>
    						</tbody>
    					</table>
    				</div>
  				</div>
			</div>
			
			<div class="row">
  				<div class="column">
    				<div class="index-board">
    					<div class="board-header"> 
    						<span class="board-title">복덕방 게시판</span>
    					</div>
    					<table class="board-body">
    						<thead class="board-body-header">
    							<tr>
    								<th>카테고리</th>
    								<th>글 제목</th>
    							</tr>
    						</thead>
    						<tbody>
    							<c:forEach begin="0" end="5" var="i" varStatus="status">
    								<tr>
    									<td>${i}</td>
    									<td>${i}</td>
    								</tr>
    							</c:forEach>
    						</tbody>
    					</table>
    				</div>
  				</div>
  				<div class="column">
    				<div class="index-board">
    					<div class="board-header"> 
    						<span class="board-title">중고서적</span>
    					</div>
    					<table class="board-body">
    						<thead class="board-body-header">
    							<tr>
    								<th>카테고리</th>
    								<th>글 제목</th>
    							</tr>
    						</thead>
    						<tbody>
    							<c:forEach begin="0" end="5" var="i" varStatus="status">
    								<tr>
    									<td>${i}</td>
    									<td>${i}</td>
    								</tr>
    							</c:forEach>
    						</tbody>
    					</table>
    				</div>
  				</div>
  				<div class="column">
    				<div class="index-board">
    					<div class="board-header"> 
    						<span class="board-title">중고 거래</span>
    					</div>
    					<table class="board-body">
    						<thead class="board-body-header">
    							<tr>
    								<th>카테고리</th>
    								<th>글 제목</th>
    							</tr>
    						</thead>
    						<tbody>
    							<c:forEach begin="0" end="5" var="i" varStatus="status">
    								<tr>
    									<td>${i}</td>
    									<td>${i}</td>
    								</tr>
    							</c:forEach>
    						</tbody>
    					</table>
    				</div>
  				</div>
			</div>
			
		</div>

	</div>

</div>




    				