<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	
	<header>
		<style>
			table, td, tr{
				border:1px solid #444444;
			}
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
			$(function(){
				var cafeURL = "aaaa";

				$("[type=submit]").on("click", function(){
					alert("aa");
					$("form").attr("method","POST").attr("action","/cafe/" + cafeURL + "/search").submit();	
				});
			});
		</script>
		<title>index</title>
	</header>
	
	<body>
		<h1>listCafePostByBoard</h1>
		<table>
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
			
			<c:forEach items="${postList}" var="post">
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
	</body>

</html>