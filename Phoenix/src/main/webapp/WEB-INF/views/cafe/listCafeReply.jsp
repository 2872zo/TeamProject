<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
	.replyItem {
		background-color: #BBDEFB;
	}
	
	.reReplyItem{
		background-color: #F4FA58;
	}
</style>

	<div class="container">
		<c:forEach	items="${replyList }" var="reply">
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
			<c:forEach	items="${reply.reReplyList }" var="reReply">
				<div class="replyItem reReplyItem">
					<h2>대댓글 - ${reReply.targetReplyMember }</h2>
					<p>	&nbsp;&nbsp;&nbsp;&nbsp;대댓글 번호 : ${reReply.replyNo }</p>
					<p>	&nbsp;&nbsp;&nbsp;&nbsp;글 번호 : ${reReply.postNo }</p>
					<p>	&nbsp;&nbsp;&nbsp;&nbsp;대댓글 작성자 멤버 번호 : ${reReply.memberNo }</p>
					<p>	&nbsp;&nbsp;&nbsp;&nbsp;대댓글 작성자 : ${reReply.memberNickname }</p>
					<p>	&nbsp;&nbsp;&nbsp;&nbsp;대댓글 내용 : ${reReply.replyContent }</p>
					<p>	&nbsp;&nbsp;&nbsp;&nbsp;대댓글 작성일 : ${reReply.regDate }</p>
					<p>	&nbsp;&nbsp;&nbsp;&nbsp;대댓글 추천수 : ${reReply.likeCount }</p>
					<p>	&nbsp;&nbsp;&nbsp;&nbsp;대댓글 삭제상태 : ${reReply.replyStatusFlag }</p>
					<input type="button" name="updateReplyButton" value="수정"/>
					<input type="button" name="deleteReplyButton" value="삭제"/>
					<input type="button" name="addReReplyForm" value="대댓글"/>
					<form name="replyItem">
						<input type="hidden" name="replyNo" value="${reReply.replyNo }">
						<input type="hidden" name="postNo" value="${reReply.postNo }">
						<input type="hidden" name="targetReplyNo" value="${reReply.targetReplyNo }">
						<input type="hidden" name="targetReplyMember" value="${reReply.memberNickname }">
						<input type="hidden" name="postNo" value="${reReply.postNo }">
					</form>
				</div>
			</c:forEach>
			<hr/>
		</c:forEach>
		<c:import url="/WEB-INF/views/common/pageNavigator.jsp">
			<c:param name="subject" value="Reply"/>
		</c:import>
		<hr/>
		<textarea name="addReplyContent"></textarea>
		<input type="button" name="addReplyButton" value="등록"/>
		
		<script>
			$(".replyItems ").on("click", "[name=updateReplyButton]", function(){
				$(this).parent().load("/cafe/${cafeURL}/updateReply/"+$(this).parent().find("[name=replyNo]").val());
			});

			$(".replyItems").on("click", "[name=deleteReplyButton]", function(){
				var obj = {currentPage : ${page.currentPage}, postNo : ${postNo} };
				$(this).parent().load("/cafe/${cafeURL}/deleteReply/"+$(this).parent().find("[name=replyNo]").val(), obj);			
			});

			$("[name=addReplyButton]").on("click", function(){
// 				alert("add 실행됨!");
				
				var formObj = $("form[name=replyItem]").serializeArray();

				console.log(formObj);
				console.log(typeof(formObj));
				var obj = { replyContent : $("[name=addReplyContent]").val(), postNo : ${search.postNo} };

				$(".replyItems").unbind();
				$(this).parent().parent(".replyItems").load("/cafe/${cafeURL}/addReply", obj);
			});

			$("[name=addReReplyForm]").on("click", function(){
// 				alert("form 요청 실행됨!")
				$(this).replaceWith("<br/><textarea name='reReplyContnet'></textarea> <input type='button' name='addReReplyButton' value='등록'>");
			});
			
			$(".replyItems").on("click", "[name=addReReplyButton]", function(){
// 				alert("reReply add!")
				formObj = $(this).parent().find("form").serializeArray();

				alert($(this).parent().find("[name=reReplyContnet]").val());
				formObj.push({ name : "replyContent", value : $(this).parent().find("[name=reReplyContnet]").val()});

				$("[name=addReReplyButton]").unbind("click");
				$("[name=addReReplyButton]").click(function(){
					$(".replyItems").wrapInner("<div id='removeItem'><div>");
					$("#removeItem").remove();
					$(".replyItems").load("/cafe/${cafeURL}/addReReply", formObj);
				});
				$("[name=addReReplyButton]").trigger("click");
			});
		</script>
	</div><!-- container End -->
