<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	
	<header>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script>
			var cafeURL = '${search.cafeURL}';
			var boardNo = ${search.boardNo};
			
			function fncGetList(idx){
				$("[name=currentPage]").val(idx);
				$("form").attr("method","POST").attr("action", "/cafe/" + cafeURL + "/getBoard/" + boardNo).submit();
			};

			$(function(){
				$("[name=currentPage]").val(${search.currentPage });	
			});
		</script>
		<title>${search.cafeURL}</title>
	</header>
	
	<body>
		<form>
			<input type="hidden" name="currentPage">
		</form>
		<h1>listCafePostByBoard</h1>
		<p>총 ${postTotalCount }개</p>
		<table class="table table-striped table-bordered">
			<tr>
				<td>postNo</td>
				<td>boardNo</td>
				<td>memberNo</td>
				<td>postTitle</td>
				<td>postContent</td>
				<td>regDate</td>
				<td>viewCount</td>
				<td>likeCount</td>
				<td>memberNickname</td>
				<td>postStatusFlag</td>
				<td>postNoticeFlag;</td>
				<td>noticeIndex</td>
			</tr>
			
			<c:forEach items="${postList }" var="post">
				<tr>
					<td>${post.postNo}</td>
					<td>${post.boardNo }</td>
					<td>${post.memberNo }</td>
					<td>${post.postTitle }</td>
					<td>${post.postContent }</td>
					<td>${post.regDate }</td>
					<td>${post.viewCount }</td>
					<td>${post.likeCount }</td>
					<td>${post.memberNickname }</td>
					<td>${post.postStatusFlag }</td>
					<td>${post.postNoticeFlag }</td>
					<td>${post.noticeIndex }</td>				
				</tr>
			</c:forEach>
		</table>
		
		<table>
			<tr>
				<td align="center">
					<c:import url="/WEB-INF/views/common/pageNavigator.jsp"/>
				</td>
			</tr>
		</table>
		
	</body>

</html>