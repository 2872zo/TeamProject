<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<div class="container">
		<div class="row">
			<div class="replyItem">
				<c:forEach	items="${replyList }" var="reply">
					<p>리플 번호 : ${reply.replyNo }</p>
					<p>글 번호 : ${reply.postNo }</p>
					<p>리플 작성자 멤버 번호 : ${reply.memberNo }</p>
					<p>리플 작성자 : ${reply.memberNickname }</p>
					<p>리플 내용 : ${reply.replyContent }</p>
					<p>리플 작성일 : ${reply.regDate }</p>
					<p>리플 추천수 : ${reply.likeCount }</p>
					<p>리플 삭제상태 : ${reply.replyStatusFlag }</p>
					<input type="button" name="updateReplyButton" value="수정"/>
					<input type="button" name="deleteReplyButton" value="삭제"/>
				</c:forEach>
			</div>
		</div><!-- row End -->
		<input type="text" name="addReplyContent"/>
		<input type="button" name="addReplyButton" value="등록"/>
	</div><!-- container End -->
