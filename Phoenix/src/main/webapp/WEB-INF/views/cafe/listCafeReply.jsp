<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
/* 	.replyItem { */
/* 		background-color: #BBDEFB; */
/* 	} */
	
/* 	.reReplyItem{ */
/* 		background-color: #F4FA58; */
/* 	} */

	div.media-reply__link i{
		color:black;
		font-size:20px;
	}
	
	div.media-reply__link i:hover{
		color:black;
	}
	
	div.media-reply__link > i:hover{
		cursor:pointer;
		color:#FF9600;
	}
</style>


	<div class="container">
	
		<c:forEach	items="${replyList }" var="reply">
			<div class="replyItem">
				<div class="media media-reply">
			        <div class="media-body">
			        	<div class="replyItem reReplyItem">
					            <div class="media mt-3">
						            <img class="mr-3 circle-rounded circle-rounded" src="멤버아이콘" width="50" height="50" alt="댓글아이콘" onerror="this.src='/images/default-profile.jpg'">
						            <div class="media-body" style="padding:0px;">
						                <div class="d-sm-flex justify-content-between mb-2">
						                    <h5 class="mb-sm-0">${reply.memberNickname } <small class="text-muted ml-3">${reply.regDate }</small></h5>
						                    
						                    <!-- 아이콘 부분 -->
						                    <div class="media-reply__link">
												<i class="mdi mdi-border-color" name="updateReplyButton" style="position: relative; top:3px;"></i>
												<i class="mdi mdi-delete" name="deleteReplyButton"></i>
												<i class="mdi mdi-reply" name="addReReplyForm"></i>
												
												<form name="replyItem">
													<input type="hidden" name="replyNo" value="${reply.replyNo }">
													<input type="hidden" name="postNo" value="${reply.postNo }">
													<input type="hidden" name="targetReplyNo" value="${reply.replyNo }">
													<input type="hidden" name="targetReplyMember" value="${reply.memberNickname }">
													<input type="hidden" name="postNo" value="${reply.postNo }">
												</form>
						                    </div>
						                    <!-- 아이콘 끝 -->
						                    
						                </div>
						                
										<span style="color:black; overflow:hidden;">
						                	<span style="float:right;">
								                <button type="button" class="btn mb-1 btn-outline-primary btn-xs">
													<i class="far fa-thumbs-up" style="font-size:15px;"></i>
													<i class="count" style="font-size:15px;">${reReply.likeCount }</i>
												</button>
											</span>
						                	<span>
						                		${reply.replyContent }
						                	</span>
						                	<div style="padding-bottom:10px;"></div>
						                </span>

						            </div>
						        </div>
							</div>
			        
			
						<c:forEach	items="${reply.reReplyList }" var="reReply">
							<hr style="margin:5px;"/>
							<div class="replyItem reReplyItem">
					            <div style="margin-left:20px; margin-top:5px;">${reReply.targetReplyMember }</div>
					            <div class="media mt-3" style="margin-left:20px; margin-top:3px !important;">
						            <img class="mr-3 circle-rounded circle-rounded" src="멤버아이콘" width="40" height="40" alt="댓글아이콘" onerror="this.src='/images/default-profile.jpg'">
						            <div class="media-body"  style="padding:0px;">
						                <div class="d-sm-flex justify-content-between mb-2">
						                    <h5 class="mb-sm-0">${reReply.memberNickname } <small class="text-muted ml-3">${reReply.regDate }</small></h5>
						                    
						                    <!-- 아이콘 부분 -->
						                    <div class="media-reply__link">
												<i class="mdi mdi-border-color" name="updateReplyButton" style="position: relative; top:3px;"></i>
												<i class="mdi mdi-delete" name="deleteReplyButton"></i>
												<i class="mdi mdi-reply" name="addReReplyForm"></i>
												
												<form name="replyItem">
													<input type="hidden" name="replyNo" value="${reReply.replyNo }">
													<input type="hidden" name="postNo" value="${reReply.postNo }">
													<input type="hidden" name="targetReplyNo" value="${reReply.targetReplyNo }">
													<input type="hidden" name="targetReplyMember" value="${reReply.memberNickname }">
													<input type="hidden" name="postNo" value="${reReply.postNo }">
												</form>
						                    </div>
						                    <!-- 아이콘 끝 -->
						                    
						                </div>
						                
						                <span style="color:black; overflow:hidden;">
						                	<span style="float:right;">
								                <button type="button" class="btn mb-1 btn-outline-primary btn-xs">
													<i class="far fa-thumbs-up" style="font-size:15px;"></i>
													<i class="count" style="font-size:15px;">${reReply.likeCount }</i>
												</button>
											</span>
						                	<span>
						                		${reReply.replyContent }
						                	</span>
						                	<div style="padding-bottom:10px;"></div>
						                </span>
						                
						            </div>
						        </div>
							</div>
						</c:forEach>
			
				    </div>
				</div>
			</div>
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
				$(this).parent().parent().load("/cafe/${cafeURL}/deleteReply/"+$(this).parent().find("[name=replyNo]").val(), obj);			
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

// 				alert($(this).parent().find("[name=reReplyContnet]").val());
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
