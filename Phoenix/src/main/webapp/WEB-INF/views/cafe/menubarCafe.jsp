<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html lang="ko">

<head>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<script type="text/javascript">


	</script>

</head>


<body>
	
	<c:forEach var="board" items="${boardList}">
		<br/>
		<c:if test="">
		
		</c:if>
		<a href="javascript:fncGetBoardPostList('${board.boardNo}');">${board.boardName}</a>
		<br/>
	</c:forEach>
	
	나는 메뉴바
	<br/>
	개발개발자
	안대안대 왜?? git때문에 
	<br/>
	

</body>
</html>