<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	
	<header>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<style>
			.postTitle{
				text-decoration: underline;
			}
			.postTitle:hover{
				color: blue;
			}
		</style>
		
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

			//게시글 조회
			$(function(){
				$(".postTitle").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getPost/" + 	$(this).parent().find(".postNo").val();				
				});			
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
			<table class="table table-striped table-bordered">
			<tr>
<!-- 				<td>게시글 번호</td> -->
<!-- 				<td>게시판 번호</td> -->
<!-- 				<td>memberNo</td> -->
				<td>게시판</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>추천수</td>
<!-- 				<td>postStatusFlag</td> -->
<!-- 				<td>postNoticeFlag;</td> -->
<!-- 				<td>noticeIndex</td> -->
			</tr>
			
			<c:forEach items="${postList }" var="post">
				<tr>
					<input type="hidden" class="postNo" value="${post.postNo }"/>
					<input type="hidden" class="boardNo" value="${post.boardNo }"/>
					<input type="hidden" class="memberNo" value="${post.memberNo }"/>
					<td class="boardName">${post.boardName }</td>
					<td class="postTitle">${post.postTitle }</td>
					<td>${post.memberNickname }</td>
					<td>${post.regDate }</td>
					<td>${post.viewCount }</td>
					<td>${post.likeCount }</td>
<%-- 					<td>${post.postStatusFlag }</td> --%>
<%-- 					<td>${post.postNoticeFlag }</td> --%>
<%-- 					<td>${post.noticeIndex }</td> --%>
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