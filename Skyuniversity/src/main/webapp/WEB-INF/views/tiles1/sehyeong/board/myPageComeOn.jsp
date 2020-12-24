<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<c:forEach items="${myBoardList}" var="myBoard">
	${myBoard.fk_boardKindNo}-${myBoard.subject}-${myBoard.readCount}-${myBoard.boardName}-${myBoard.boardNo}-${myBoard.fk_memberNo}-${myBoard.categoryName}
	<br>
</c:forEach>