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
	
	메뉴관리
	<button type="button" id ="cancel"> 취소 </button>
	<button type="button" id ="save"> 저장하기</button>
	<br/>
	<br/>
	<br/>
	
	추가메뉴

	<select name="addableBoard" size="2">
		<option value="자유게시판" selected="selected">자유게시판</option>
		<option value="구분선">구분선</option>
	</select>
	
	<button type="button" id ="plusBoard"> +게시판추가 </button>
	<br/>
	<br/>
	<button type="button" id ="goDown"> 아래로</button>
	<button type="button" id ="goUp"> 위로</button>
	<button type="button" id ="goStart"> 맨위로 </button>
	<button type="button" id ="goEnd"> 맨아래로 </button>
	<button type="button" id ="delete"> 삭제 </button>
	
	
	<!--  게시판 리스트 불러오기 -->
		
		
		<br/>
		<br/>
		
		<select name="board" size=10>
    		
    		<c:set var="i" value="0" />  
			
			<c:forEach var="board" items="${boardList}">
				<c:set var="i" value="${ i+1 }" />
			
			
			<c:if test="${i eq 1}">
				<option  value="${board.boardName}" id="${board.boardNo}" selected="selected">${board.boardName}</option>
			</c:if>
			
			<c:if test="${i ne 1}">
				<option value="${board.boardName}" id="${board.boardNo}">${board.boardName}</option>
			</c:if>
			
			</c:forEach>
			
   			
		</select>
		<input type="hidden" id="totalBoardsize" value="${i}">
		
		
		<div class="boardDetail">
		<c:set var="j" value="0" />  
		<c:forEach var="board" items="${boardList}">
				<c:set var="j" value="${ j+1 }" />
		
			<div class ="boardDetail${j}">
				
				<br/>
				<br/>
				메뉴명  <input type="text" name="boardName" value="${board.boardName}" />
				<br />
				메뉴설명 <input type="text"  name="boardDetail" width="50" value="${board.boardDetail}">
				<br/>
				<br/>
		
				게시판 공개여부를 설정합니다. 멤버공개를 선택시, 게시판은 멤버에게만 보여집니다.
				<br/>
				<br/>
		
			</div>
		</c:forEach>
		
		</div>
		

</body>
</html>