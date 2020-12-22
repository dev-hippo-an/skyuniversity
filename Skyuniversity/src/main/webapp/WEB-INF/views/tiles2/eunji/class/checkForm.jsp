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
.olnone {
	list-style: none;
}
.olnone >li {
	display: inline-block;
}
</style>

<script type="text/javascript">
</script>
<div style="text-align: center;">
<div style="border: solid 1px red; width: 700px; margin: 0 auto;">
<div>
	<span style="font-size: 12pt; font-weight: bold;float: left;">강의평가</span>
</div>
<br><br>
<div>
<form>
	<div>
			<div>{1} 수업진행은 체계적이다.</div>
			<br>
			<ol class="olnone">
				<li>
					<label for="btype1">1</label>
					<input type="radio" name="bloodtype" id="a" value="1"/>
				</li>
				<li>
					<label for="btype2">2</label>
					<input type="radio" name="bloodtype" id="b" value="2"/>
				</li>
				<li>
					<label for="btype3">3</label>
					<input type="radio" name="bloodtype" id="c" value="3"/>
				</li>
				<li>
					<label for="btype4">4</label>
					<input type="radio" name="bloodtype" id="d" value="4"/>
				</li>
				<li>
					<label for="btype4">5</label>
					<input type="radio" name="bloodtype" id="e" value="5"/>
				</li>
			</ol>
	</div>
	
	<div>
			<div>{2} 수업진도는 적절하다.</div>
			<br>
			<ol class="olnone">
				<li>
					<label for="btype1">1</label>
					<input type="radio" name="bloodtype" id="a" value="1"/>
				</li>
				<li>
					<label for="btype2">2</label>
					<input type="radio" name="bloodtype" id="b" value="2"/>
				</li>
				<li>
					<label for="btype3">3</label>
					<input type="radio" name="bloodtype" id="c" value="3"/>
				</li>
				<li>
					<label for="btype4">4</label>
					<input type="radio" name="bloodtype" id="d" value="4"/>
				</li>
				<li>
					<label for="btype4">5</label>
					<input type="radio" name="bloodtype" id="e" value="5"/>
				</li>
			</ol>
	</div>
	
	<div>
			<div>{3} 수업 난이도는 적절하다.</div>
			<br>
			<ol class="olnone">
				<li>
					<label for="btype1">1</label>
					<input type="radio" name="bloodtype" id="a" value="1"/>
				</li>
				<li>
					<label for="btype2">2</label>
					<input type="radio" name="bloodtype" id="b" value="2"/>
				</li>
				<li>
					<label for="btype3">3</label>
					<input type="radio" name="bloodtype" id="c" value="3"/>
				</li>
				<li>
					<label for="btype4">4</label>
					<input type="radio" name="bloodtype" id="d" value="4"/>
				</li>
				<li>
					<label for="btype4">5</label>
					<input type="radio" name="bloodtype" id="e" value="5"/>
				</li>
			</ol>
	</div>
	
	<div>
			<div>{4} 이 수업을 다른 사람에게 추천해주고 싶다.</div>
			<br>
			<ol class="olnone">
				<li>
					<label for="btype1">1</label>
					<input type="radio" name="bloodtype" id="a" value="1"/>
				</li>
				<li>
					<label for="btype2">2</label>
					<input type="radio" name="bloodtype" id="b" value="2"/>
				</li>
				<li>
					<label for="btype3">3</label>
					<input type="radio" name="bloodtype" id="c" value="3"/>
				</li>
				<li>
					<label for="btype4">4</label>
					<input type="radio" name="bloodtype" id="d" value="4"/>
				</li>
				<li>
					<label for="btype4">5</label>
					<input type="radio" name="bloodtype" id="e" value="5"/>
				</li>
			</ol>
	</div>
	
	<div>
			<div>{5} 강의자료가 적절히 활용되어 학습에 도움이 되었다.</div>
			<br>
			<ol class="olnone">
				<li>
					<label for="btype1">1</label>
					<input type="radio" name="bloodtype" id="a" value="1"/>
				</li>
				<li>
					<label for="btype2">2</label>
					<input type="radio" name="bloodtype" id="b" value="2"/>
				</li>
				<li>
					<label for="btype3">3</label>
					<input type="radio" name="bloodtype" id="c" value="3"/>
				</li>
				<li>
					<label for="btype4">4</label>
					<input type="radio" name="bloodtype" id="d" value="4"/>
				</li>
				<li>
					<label for="btype4">5</label>
					<input type="radio" name="bloodtype" id="e" value="5"/>
				</li>
			</ol>
	</div>
	
	<div>
			<div>{6} 시험, 과제 등 성적평가의 기준이 적절하며 공정하였다.</div>
			<br>
			<ol class="olnone">
				<li>
					<label for="btype1">1</label>
					<input type="radio" name="bloodtype" id="a" value="1"/>
				</li>
				<li>
					<label for="btype2">2</label>
					<input type="radio" name="bloodtype" id="b" value="2"/>
				</li>
				<li>
					<label for="btype3">3</label>
					<input type="radio" name="bloodtype" id="c" value="3"/>
				</li>
				<li>
					<label for="btype4">4</label>
					<input type="radio" name="bloodtype" id="d" value="4"/>
				</li>
				<li>
					<label for="btype4">5</label>
					<input type="radio" name="bloodtype" id="e" value="5"/>
				</li>
			</ol>
	</div>
	
	<div>
			<div>{7} 교수는 열성을 갖고 수업을 진행하였다. </div>
			<br>
			<ol class="olnone">
				<li>
					<label for="btype1">1</label>
					<input type="radio" name="bloodtype" id="a" value="1"/>
				</li>
				<li>
					<label for="btype2">2</label>
					<input type="radio" name="bloodtype" id="b" value="2"/>
				</li>
				<li>
					<label for="btype3">3</label>
					<input type="radio" name="bloodtype" id="c" value="3"/>
				</li>
				<li>
					<label for="btype4">4</label>
					<input type="radio" name="bloodtype" id="d" value="4"/>
				</li>
				<li>
					<label for="btype4">5</label>
					<input type="radio" name="bloodtype" id="e" value="5"/>
				</li>
			</ol>
	</div>
	
	<div>
			<div>{8} 전체적으로 본 강의에 만족하였다. </div>
			<br>
			<ol class="olnone">
				<li>
					<label for="btype1">1</label>
					<input type="radio" name="bloodtype" id="a" value="1"/>
				</li>
				<li>
					<label for="btype2">2</label>
					<input type="radio" name="bloodtype" id="b" value="2"/>
				</li>
				<li>
					<label for="btype3">3</label>
					<input type="radio" name="bloodtype" id="c" value="3"/>
				</li>
				<li>
					<label for="btype4">4</label>
					<input type="radio" name="bloodtype" id="d" value="4"/>
				</li>
				<li>
					<label for="btype4">5</label>
					<input type="radio" name="bloodtype" id="e" value="5"/>
				</li>
			</ol>
	</div>
	<div>
		<div> - 수업 및 교수님께 전하고 싶은 말 - </div>
		<div>
			<textarea rows="7" cols="80">dd</textarea>
		</div>
	</div>
</form>
</div>
</div>
</div>