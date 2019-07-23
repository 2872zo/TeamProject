<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div style="width:100%">
	<form id="updateReplyForm">
		<div class="input-group">
			<div class="wrap form-control" >
				<textarea class="form-control" name="replyContent" maxlength="300">${reply.replyContent }</textarea>
			    <span class="counter">0/300</span>
			</div>
			
			<div class="input-group-append">
				<input type="button" class="btn btn-primary" name="save" value="저장"/>
            </div>
		</div>
	
		<input type="hidden" name="replyNo" value="${reply.replyNo }">
	</form>
		
	<script>
		$('textarea').keyup();
	
		$(document).on("click", "[name=save]", function(){
			var formObj = $(this).parent().parent().parent().serializeArray();
			
			$(this).parent().parent().parent().parent().parent().parent().parent().parent().load("/cafe/${cafeURL}/updateReply/"+$(this).parent().parent().find("[name=replyNo]").val(), formObj, function(response, status, xhr){
				console.log(response);
			});
		});
	</script>
</div>