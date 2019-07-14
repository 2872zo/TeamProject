<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<div class="container">
		<div class="replyItem">
			<form id="updateReplyForm">
				<p>리플 번호 : ${reply.replyNo }</p>
				<p>글 번호 : ${reply.postNo }</p>
				<p>리플 작성자 멤버 번호 : ${reply.memberNo }</p>
				<p>리플 작성자 : ${reply.memberNickname }</p>
				<p>리플 내용 : ${reply.replyContent }</p>
				<p>리플 작성일 : ${reply.regDate }</p>
				<p>리플 추천수 : ${reply.likeCount }</p>
				<p>리플 삭제상태 : ${reply.replyStatusFlag }</p>
				<textarea name="replyContent">${reply.replyContent }</textarea>
				<input type="button" name="save" value="저장"/>
				<input type="hidden" name="replyNo" value="${reply.replyNo }">
			</form>
		</div>
		
		<script>
			$(document).on("click", "[name=save]", function(){
				var formObj = $("#updateReplyForm").serializeArray();
				
				$(this).parent().parent().parent().parent().load("/cafe/${cafeURL}/updateReply/${reply.replyNo}", formObj, function(response, status, xhr){
					console.log(response);
				});
			});
		</script>
	</div><!-- container End -->
