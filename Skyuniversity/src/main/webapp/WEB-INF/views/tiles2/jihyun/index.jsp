<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

	#noticeBlock, #mysubjectsBlock, #scheduleBlock {
		/* border: solid 1px gray; */
		width: 100%;
	}
	
	#notice, #mysubjects, #schedule {
		border: solid 1px gray;
		width: 100%; 
	}
	
	div#indexContainer {
		/* border: solid 1px red; */
	}
	
	div#block1 {
		/* border: solid 1px blue; */
		display: flex;
		padding: 20px;
		justify-content: space-between;
	}
	
	div#block2 {
		display: flex;
		flex-direction: column;
		width: 40%;
	}
	
	#noticeBlock {
		/* border: solid 1px gray; */
		height: 400px;
	}
	
	#mysubjectsBlock {
		/* border: solid 1px gray; */
		height: 300px;		
		
	}
	
	#scheduleBlock {
		width: 50%;
	}

	

</style>

<script type="text/javascript">

</script>

<div id="indexContainer">

	<div id="block1">
		<div id="block2">
			<div id="noticeBlock">
				<h2>공지사항</h2>
				<div id="notice"></div>
			</div>
			<div id="mysubjectsBlock">
				<h2>수강과목</h2>
				<div id="mysubjects"></div>
			</div>
		</div>
		
		<div id="scheduleBlock">
			<h2>학사일정</h2>
			<div id="schedule"></div>
		</div>
		
	</div>
</div>