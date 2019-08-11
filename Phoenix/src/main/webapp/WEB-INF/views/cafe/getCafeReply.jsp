<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${reply.replyStatusFlag == '0' }">
	<c:if test="${empty reply.targetReplyMember }">
		<div class="replyItem">
				
			<div class="media mt-3">
	            <img class="mr-3 circle-rounded circle-rounded" src="/images/uploadfiles/profileimg/${reply.memberIcon }" width="50" height="50" alt="댓글아이콘" onerror="this.src='/images/default-profile.jpg'">
				<div class="media-body" style="padding:0px;">
					<div class="d-sm-flex justify-content-between mb-2">
			   			<h5 class="mb-sm-0">${reply.memberNickname } <small class="text-muted ml-3">${reply.regDate }</small></h5>
			
						<!-- 아이콘 부분 -->
						<div class="media-reply__link">
							<i class="mdi mdi-border-color" name="updateReplyButton" style="position: relative; top:3px;"></i>
							<i class="mdi mdi-delete" name="deleteReplyButton"></i>
							<i class="mdi mdi-reply" name="addReReplyForm"></i>
			
							
						</div>
			              <!-- 아이콘 끝 -->
					</div>
			            
					<div style="color:black; overflow:hidden;" class="replyContent row">
	                	<span class="col-10">
	                		${reply.replyContent }
	                	</span>
	                	<span class="col-2">
			                <button type="button" class="btn mb-1 btn-outline-primary btn-xs" >
								<i class="far fa-thumbs-up" style="font-size:15px;"></i>
								<i class="count" style="font-size:15px;">${reply.likeCount }</i>
							</button>
						</span>
	                	<div style="padding-bottom:10px;"></div>
	                </div>
		            
		            <form name="replyItem">
						<input type="hidden" name="replyNo" value="${reply.replyNo }">
						<input type="hidden" name="postNo" value="${reply.postNo }">
						<input type="hidden" name="targetReplyNo" value="${reply.replyNo }">
						<input type="hidden" name="targetReplyMember" value="${reply.memberNickname }">
						<input type="hidden" name="postNo" value="${reply.postNo }">
					</form>
				</div>
			</div>
		</div>
	</c:if>
	
	<c:if test="${!empty reply.targetReplyMember }">
		<div class="replyItem reReplyItem">
			<div style="margin-left:20px; margin-top:5px;">${reply.targetReplyMember }</div>
			<div class="media mt-3" style="margin-left:20px; margin-top:3px !important;">
				<img class="mr-3 circle-rounded circle-rounded" src="/images/uploadfiles/profileimg/${reply.memberIcon }" width="50" height="50" alt="댓글아이콘" onerror="this.src='/images/default-profile.jpg'">
				<div class="media-body"  style="padding:0px;">
					<div class="d-sm-flex justify-content-between mb-2">
	   					 <h5 class="mb-sm-0">${reply.memberNickname } <small class="text-muted ml-3">${reply.regDate }</small></h5>
						 
						 <!-- 아이콘 부분 -->
					     <div class="media-reply__link">
						     <i class="mdi mdi-border-color" name="updateReplyButton" style="position: relative; top:3px;"></i>
						     <i class="mdi mdi-delete" name="deleteReplyButton"></i>
						     <i class="mdi mdi-reply" name="addReReplyForm"></i>
	             		 </div>
	             		 <!-- 아이콘 끝 -->
	    
					</div>
				
					<div style="color:black; overflow:hidden;" class="replyContent row">
	                	<span class="col-10">
	                		${reply.replyContent }
	                	</span>
	                	<span class="col-2">
			                <button type="button" class="btn mb-1 btn-outline-primary btn-xs" >
								<i class="far fa-thumbs-up" style="font-size:15px;"></i>
								<i class="count" style="font-size:15px;">${reply.likeCount }</i>
							</button>
						</span>
	                	<div style="padding-bottom:10px;"></div>
	                </div>
	                
	               	<form name="replyItem">
						<input type="hidden" name="replyNo" value="${reply.replyNo }">
						<input type="hidden" name="postNo" value="${reply.postNo }">
						<input type="hidden" name="targetReplyNo" value="${reply.targetReplyNo }">
						<input type="hidden" name="targetReplyMember" value="${reply.memberNickname }">
						<input type="hidden" name="postNo" value="${reply.postNo }">
					</form>
	           </div>
	       </div>
		</div>
	</c:if>
</c:if>
<c:if test="${reply.replyStatusFlag != '0' }">
	<c:import url="/WEB-INF/views/cafe/deleteReplyView.jsp"></c:import>
</c:if>