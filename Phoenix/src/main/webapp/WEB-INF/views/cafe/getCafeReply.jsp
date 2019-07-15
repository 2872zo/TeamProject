<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="replyItem">
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
		<input type="button" name="addReReplyForm" value="대댓글"/>
		<form name="replyItem">
			<input type="hidden" name="replyNo" value="${reply.replyNo }">
			<input type="hidden" name="postNo" value="${reply.postNo }">
			<input type="hidden" name="targetReplyNo" value="${reply.replyNo }">
			<input type="hidden" name="targetReplyMember" value="${reply.memberNickname }">
			<input type="hidden" name="postNo" value="${reply.postNo }">
		</form>
</div>
