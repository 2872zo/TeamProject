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

/* textarea 글자수 카운터를 위한 설정	 */
.wrap {
    width: 300px;
    height: auto;
    position: relative; 
    display: inline-block; 
 	border:0px;
	padding:0px;
}
.wrap textarea {
    width: 100%;
    resize: none;
    min-height: 4.5em;
    line-height:1.6em;
    max-height: 9em;
}
.wrap span {
    position: absolute;
    bottom: 5px;
    right: 5px;
}
.counter {
  padding: 0 .5em 0 .5em;
  font-size: 0.75em;
}
/* textarea 글자수 카운터를 위한 설정 끝	 */
</style>




	<div class="container">
		<c:forEach	items="${bestReplyList }" var="bestReply">
			<div class="media media-reply"  style="background: rgba(255, 203, 92, 0.3);">
				<div class="media-body">
				
					<!-- 삭제 댓글 확인 -->
					<c:if test="${bestReply.replyStatusFlag == '0' }">
						<div class="replyItem bestReplyItem">
				            <div style="margin-left:20px; margin-top:5px;"><span class="badge" style="background:rgba(235, 223, 61, 1);">Best</span></div>
				            <div class="media mt-3" style="margin-left:20px; margin-top:3px !important;">
					            <img class="mr-3 circle-rounded circle-rounded" src="/images/uploadfiles/profileimg/${bestReply.memberIcon }" width="40" height="40" alt="댓글아이콘" onerror="this.src='/images/default-profile.jpg'">
					            <div class="media-body"  style="padding:0px;">
					                <div class="d-sm-flex justify-content-between mb-2">
					                    <h5 class="mb-sm-0">${bestReply.memberNickname } <small class="text-muted ml-3">${bestReply.regDate }</small></h5>
					                    
					                </div>
					                
					                <div style="color:black; overflow:hidden;" class="replyContent flex-row">
					                	<span class="d-flex justify-content-start">
					                		${bestReply.replyContent }
					                	</span>
					                	<span class="d-flex justify-content-end" style="vertical-align:baseline;">
							                <button type="button" class="btn mb-1 btn-outline-primary btn-xs replyLikeButton" >
												<i class="far fa-thumbs-up" style="font-size:15px;"></i>
												<i class="count" style="font-size:15px;">${bestReply.likeCount }</i>
											</button>
										</span>
					                </div>
					                
					                <form name="replyItem">
										<input type="hidden" name="replyNo" value="${bestReply.replyNo }">
										<input type="hidden" name="postNo" value="${bestReply.postNo }">
										<input type="hidden" name="targetReplyNo" value="${bestReply.targetReplyNo }">
										<input type="hidden" name="targetReplyMember" value="${bestReply.memberNickname }">
										<input type="hidden" name="postNo" value="${bestReply.postNo }">
										<input type="hidden" name="currentPage" value="${search.currentPage }">
									</form>
					            </div>
					        </div>
				            <div class="bestReplyForm" style="margin:0px;padding-bottom:10px;"></div>
						</div>
					</c:if>
					<c:if test="${bestReply.replyStatusFlag != '0' }">
						<c:import url="/WEB-INF/views/cafe/deleteReplyView.jsp"></c:import>
					</c:if>
					
				</div>
			</div>
		</c:forEach>
	
	
		<c:forEach	items="${replyList }" var="reply">
			<div class="replyItem">
				<div class="media media-reply">
			        <div class="media-body">
			        	<!-- 삭제댓글 확인 -->
		        		<c:if test="${reply.replyStatusFlag == '0' }">
			        		<div class="replyItem">
					            <div class="media mt-3">
						            <img class="mr-3 circle-rounded circle-rounded" src="/images/uploadfiles/profileimg/${reply.memberIcon }" width="50" height="50" alt="댓글아이콘" onerror="this.src='/images/default-profile.jpg'">
						            <div class="media-body" style="padding:0px;">
						                <div class="d-sm-flex justify-content-between mb-2">
						                    <h5 class="mb-sm-0">${reply.memberNickname } <small class="text-muted ml-3">${reply.regDate }</small></h5>
						                    
						                    <!-- 아이콘 부분 -->
						                    <div class="media-reply__link">
						                    	<c:if test="${cafeMember.memberNo eq reply.memberNo or cafeMember.memberGrade eq 'cg100' or cafeMember.memberGrade eq 'cg101' or user.userRoleCode eq 'ur100'}">
													<i class="mdi mdi-border-color" name="updateReplyButton" style="position: relative; top:3px;"></i>
													<i class="mdi mdi-delete" name="deleteReplyButton"></i>
												</c:if>
												<i class="mdi mdi-reply" name="addReReplyForm"></i>
						                    </div>
						                    <!-- 아이콘 끝 -->
						                    
						                </div>
						                
						                <div class="replyContent d-flex align-items-center justify-content-between mb-3">
						                	<span class="col-11">
						                		${reply.replyContent }
						                	</span>
						                	<span class="col-1" style="min-width:60px;">
								                <button type="button" class="btn btn-outline-primary btn-xs replyLikeButton" >
													<i class="far fa-thumbs-up" style="font-size:15px;"></i>
													<i class="count" style="font-size:15px;">${reply.likeCount }</i>
												</button>
											</span>
						                </div>
						                
						                
										<form name="replyItem">
											<input type="hidden" name="replyNo" value="${reply.replyNo }">
											<input type="hidden" name="postNo" value="${reply.postNo }">
											<input type="hidden" name="targetReplyNo" value="${reply.replyNo }">
											<input type="hidden" name="targetReplyMember" value="${reply.memberNickname }">
											<input type="hidden" name="currentPage" value="${search.currentPage }">
										</form>
						            </div>
						        </div>
				               	<div class="reReplyForm" style="padding-bottom:10px;"></div>
							</div>
			        	</c:if>
			        	<c:if test="${reply.replyStatusFlag != '0' }">
							<c:import url="/WEB-INF/views/cafe/deleteReplyView.jsp"></c:import>
						</c:if>
			
						<c:forEach	items="${reply.reReplyList }" var="reReply">
							<hr style="margin:15px;"/>
							<!-- 삭제 댓글 확인 -->
							<c:if test="${reReply.replyStatusFlag == '0' }">
								<div class="replyItem reReplyItem">
						            <div style="margin-left:20px; margin-top:5px;">${reReply.targetReplyMember }</div>
						            <div class="media mt-3" style="margin-left:20px; margin-top:3px !important;">
							            <img class="mr-3 circle-rounded circle-rounded" src="/images/uploadfiles/profileimg/${reReply.memberIcon }" width="40" height="40" alt="댓글아이콘" onerror="this.src='/images/default-profile.jpg'">
							            <div class="media-body"  style="padding:0px;">
							                <div class="d-sm-flex justify-content-between mb-2">
							                    <h5 class="mb-sm-0">${reReply.memberNickname } <small class="text-muted ml-3">${reReply.regDate }</small></h5>
							                    
							                    <!-- 아이콘 부분 -->
							                    <div class="media-reply__link">
													<c:if test="${cafeMember.memberNo eq reply.memberNo or cafeMember.memberGrade eq 'cg100' or cafeMember.memberGrade eq 'cg101' or user.userRoleCode eq 'ur100'}">
														<i class="mdi mdi-border-color" name="updateReplyButton" style="position: relative; top:3px;"></i>
														<i class="mdi mdi-delete" name="deleteReplyButton"></i>
													</c:if>
													<i class="mdi mdi-reply" name="addReReplyForm"></i>
							                    </div>
							                    <!-- 아이콘 끝 -->
							                    
							                </div>
							                
							                <div style="color:black; overflow:hidden;" class="replyContent flex-row">
							                	<span class="d-flex justify-content-start">
							                		${reReply.replyContent }
							                	</span>
							                	<span class="d-flex justify-content-end" style="vertical-align:baseline;">
									                <button type="button" class="btn mb-1 btn-outline-primary btn-xs replyLikeButton" >
														<i class="far fa-thumbs-up" style="font-size:15px;"></i>
														<i class="count" style="font-size:15px;">${reReply.likeCount }</i>
													</button>
												</span>
							                </div>
							                
							                <form name="replyItem">
												<input type="hidden" name="replyNo" value="${reReply.replyNo }">
												<input type="hidden" name="postNo" value="${reReply.postNo }">
												<input type="hidden" name="targetReplyNo" value="${reReply.targetReplyNo }">
												<input type="hidden" name="targetReplyMember" value="${reReply.memberNickname }">
												<input type="hidden" name="currentPage" value="${search.currentPage }">
											</form>
							            </div>
							        </div>
						            <div class="reReplyForm" style="margin:0px;padding-bottom:10px;"></div>
								</div>
							</c:if>
							<c:if test="${reReply.replyStatusFlag != '0' }">
								<c:import url="/WEB-INF/views/cafe/deleteReplyView.jsp"></c:import>
							</c:if>
						</c:forEach>
			
				    </div>
				</div>
			</div>
		</c:forEach>
		
		<c:if test="${!empty replyList }">
			<c:import url="/WEB-INF/views/common/pageNavigator.jsp">
				<c:param name="subject" value="Reply"/>
			</c:import>
		<hr/>
		</c:if>
		
		<div class="input-group">
			<div class="wrap form-control" >
				<textarea class="form-control" name="addReplyContent"  maxlength="300"></textarea>
			    <span class="counter">0/300</span>
			</div>
			
			<div class="input-group-append">
				<input type="button" class="btn btn-primary" name="addReplyButton" value="등록"/>
            </div>
		</div>
		
		</div>
		<script>
			//수정 버튼 클릭
			$(".replyItems ").on("click", "[name=updateReplyButton]", function(){
				$(this).parent().parent().parent().find(".replyContent").load("/cafe/${cafeURL}/updateReply/"+$(this).parent().parent().parent().find("[name=replyNo]").val());
			});

			//삭제 버튼 클릭
			$(".replyItems").on("click", "[name=deleteReplyButton]", function(){
				var obj = {currentPage : ${page.currentPage}, postNo : ${postNo} };
				$(this).parent().parent().parent().parent().parent().load("/cafe/${cafeURL}/deleteReply/"+$(this).parent().parent().parent().find("[name=replyNo]").val(), obj);			
			});

			//댓글 등록
			$("[name=addReplyButton]").on("click", function(){
// 				alert("add 실행됨!");
				
				var formObj = $("form[name=replyItem]").serializeArray();

				console.log(formObj);
				console.log(typeof(formObj));
				var obj = { replyContent : $("[name=addReplyContent]").val().replace(/(?:\r\n|\r|\n)/g, '<br />'), postNo : ${search.postNo} };

				$(".replyItems").unbind();
				$(this).parent().parent().parent().parent(".replyItems").load("/cafe/${cafeURL}/addReply", obj);
			});

			//대댓글 등록 폼 요청
			$(".replyItems").on("click", "[name=addReReplyForm]", function(){
// 				alert("form 요청 실행됨!")
				$(this).parent().parent().parent().parent().parent().find(".reReplyForm").replaceWith("<div class='input-group'><div class='wrap form-control'><textarea class='form-control' name='reReplyContent'></textarea><span class='counter'>0/300</span></div> <div class='input-group-append'><input class='btn btn-primary' type='button' name='addReReplyButton' value='등록'></div></div>");
			});

			//대댓글 등록
			$(".replyItems").on("click", "[name=addReReplyButton]", function(){
// 				alert("reReply add!")
				formObj = $(this).parent().parent().parent().find("form").serializeArray();

// 				alert($(this).parent().find("[name=reReplyContnet]").val());
				formObj.push({ name : "replyContent", value : $(this).parent().parent().find("[name=reReplyContent]").val().replace(/(?:\r\n|\r|\n)/g, '<br />')});

				$("[name=addReReplyButton]").unbind("click");
				$("[name=addReReplyButton]").click(function(){
					$(".replyItems").wrapInner("<div id='removeItem'><div>");
					$("#removeItem").remove();
					$(".replyItems").load("/cafe/${cafeURL}/addReReply", formObj);
				});
				$("[name=addReReplyButton]").trigger("click");
			});

			$(function() {
			      $(document).on('keyup','textarea',function (e){
			          var content = $(this).val();
			          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			          $(this).next().html(content.length + '/300');
			      });
			      $('textarea').keyup();
			});

			$(function(){
				$(".replyItems").on("click", ".replyLikeButton", function(){
					var JSONPostNo =  JSON.stringify(
							{cafeURL : "${cafeURL}", 
							 replyNo:$(this).parent().parent().next().find("[name=replyNo]").val(), 
							 userNo:${user.userNo}, 
							 searchCondition : "1"});
					 
					console.log(JSONPostNo); 

					var count = $(this).find(".count");
//	 				debugger;
					
					$.ajax({
							type : "POST",
							contentType: "application/json",
							url : "/cafe/${cafeURL}/json/addLike",
							dataType : "JSON",
							data: JSONPostNo,
							success : function(data) {
//	 							alert("success");
								
//	 							debugger;
								if(data.result == false){
									swal("추천 실패","이미 추천한 댓글입니다.","error");
								}else{
									count.text(data.likeCount);
								}
								
							},
							error : function(data) {
								alert("error : " + data);
//	 							debugger;
							}
					});
				});
			});
		</script>
	</div><!-- container End -->
