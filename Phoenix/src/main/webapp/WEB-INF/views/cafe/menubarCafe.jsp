<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	
	<div class="nk-nav-scroll">
		<ul class="metismenu" id="menu">
		<li>
			<span class="nav-text">
				<div class="card">
					<div class="card-body">
					    <!-- Nav tabs -->
					    <ul class="nav nav-tabs mb-3" role="tablist">
					        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#home8" style="width:92.5px; padding-left:40px; padding-right:40px;"><span><i class="ti-home"></i></span></a>
					        </li>
					        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#profile8" style="width:92.5px; padding-left:40px; padding-right:40px;"><span><i class="ti-user"></i></span></a>
					        </li>
					    </ul>
					    <!-- Tab panes -->
					    <div class="tab-content tabcontent-border">
					    	<div class="tab-pane fade show active" id="home8" role="tabpanel">
					             	
					           		<div class="media align-items-center mb-4">
					           			<c:if test="${empty cafe.cafeIcon}">
					     					<img class="mr-3" src="/images/default-cafe-icon.jpg" width="80" height="80" style="object-fit: cover; border-radius: 50%;" alt="">
					           			</c:if>
					           			<c:if test="${!empty cafe.cafeIcon}">
					     					<img class="mr-3" src="/images/uploadfiles/cafeIcon/${cafe.cafeIcon}" width="80" height="80" style="object-fit: cover; border-radius: 50%;" alt="">
					           			</c:if>
	                               
	                                    <div class="media-body">
	                          				<p class="text-muted mb-0">매니저 </p>
	                          				${cafe.managerNickname}
	                                    </div>
	                                </div>
	                                
	                                <ul class="card-profile__info">
	                                    <li class="mb-1"><strong class="text-dark mr-4" style="margin-left: 10px;">since</strong>
	                                     <span style="float: right; margin-right: 10px;"><fmt:formatDate value="${cafe.regDate}" pattern="yyyy.MM.dd"/></span>
	                                    </li>
	                                    <li class="mb-1"><strong class="text-dark mr-4" style="margin-left: 10px;"><i class="fa fa-users"></i></strong> <span style="float: right; margin-right: 10px;">${cafe.members}</span></li>
	                                    <li class="mb-1 getCafeGrade">
	                                    	<strong class="text-dark mr-4" style="margin-left: 10px;"><i class="icon-grid"></i></strong>
	                                    	<h6 style="float: right; margin-right: 10px;">멤버등급안내</h6>
	                                    </li>
	                                    <c:if test="${!empty cafeMember && cafeMember.userNo == cafe.manageUserNo}">
	                                    	<li class="mb-1"><strong class="text-dark mr-4 manage cursor" style="margin-left: 10px;"><i class="icon-settings"></i>&nbsp;카페설정</strong></li>
	                                    </c:if>
	                                    
	                                </ul>
	                                <c:if test="${empty cafeMember && cafeApplication.acceptStatusCode ne 'ca100' }">
										<div class="media align-items-center mb-4" style= "margin:auto;">
											<button class="btn mb-1 btn-rounded btn-outline-dark addMember">카페가입</button>
										</div>
									</c:if>
									
								
	                                
					           
					        </div>
					        <div class="tab-pane fade" id="profile8" role="tabpanel">
					        	<c:if test="${!empty cafeMember }">
	                                <div class="media align-items-center mb-4">
	                                    <img class="mr-3" src="/images/default-profile.jpg" width="80" height="80" style="object-fit: cover; border-radius: 50%;" alt="">
	                                    <div class="media-body">
	                                        <h3 class="mb-0">${cafeMember.memberNickname}</h3>
	                                        <p class="text-muted mb-0">${cafeMember.gradeName}</p>
	                                    </div>
	                                </div>
	                                <ul class="card-profile__info">
	                                    <li class="mb-1"><strong class="text-dark mr-4" style="margin-left: 10px;">가입일</strong> <span style="float: right; margin-right: 10px;">${cafeMember.regDate}</span></li>
	                                    <li class="mb-1"><strong class="text-dark mr-4" style="margin-left: 10px;">출석</strong> <span style="float: right; margin-right: 10px;">${cafeMember.visitCount}</span></li>
	                                    <li class="mb-1"><strong class="text-dark mr-4 myPost cursor" style="margin-left: 10px;">내가 쓴 글 보기</strong> <span class="myPost cursor" style="float: right; margin-right: 10px;">${cafeMember.postCount }</span></li>
	                                    <li class="mb-1"><strong class="text-dark mr-4 myReply cursor" style="margin-left: 10px;">내가 쓴 댓글보기</strong> <span class="myReply cursor" style="float: right; margin-right: 10px;">${cafeMember.replyCount }</span></li>
	                                    <li style="text-align: center;">
	                                    	<button class="btn mb-1 btn-rounded btn-outline-dark updateProfile">
	                                    		프로필수정
	                                    	</button>
	                                    </li>
	                                    
										<c:if test="${cafeMember.memberGrade eq 'cg100' }">
											<li style="text-align: center;">
												<button class="btn mb-1 btn-rounded btn-outline-dark" name="toManage">내 카페 관리</button>
											</li>
										</c:if> 
										
	                                </ul>
                                </c:if>
													        
								<c:if test="${empty cafeMember && cafeApplication.acceptStatusCode ne 'ca100'}">
									<div class="media align-items-center mb-4">
										<button class="btn mb-1 btn-rounded btn-outline-dark addMember">카페가입</button>
									</div>
								</c:if>
								
								<c:if test="${empty cafeMember && cafeApplication.acceptStatusCode eq 'ca100' }">
								<i class="mdi mdi-tumblr-reblog" style="font-size: 19px;" ></i>
								<strong class="text-dark mr-4" style="margin-left: 10px;">가입 승인 대기중입니다 </strong>
								</c:if>
					        
					        </div>
					    </div>
					</div>
	            </div>
            </span>
        </li>
			
		
		

		<li>
			<span class="nav-text">
				<form name="InnerSearch">
						<input type="text" class="form-control input-rounded" id="menubarSearch" name="searchKeyword" placeholder="카페 내부 검색" style="width:200px; margin:20px; text-align: center;">
				</form>
			</span>
		</li>
			
			
			
			<c:forEach var="board" items="${boardList}">
				<li style="text-align: center;">
					<c:if test="${board.boardType != 'cb102'}">
		         		<a href="javascript:fncGetBoardPostList('${board.boardNo}','${cafeURL }')" aria-expanded="false">
			            	<i class="icon-note menu-icon"></i>
			            	<span class="nav-text">
								${board.boardName}
							</span>
				     	</a>
		         	</c:if>
		         	<c:if test="${board.boardType == 'cb102'}">
		         		<a aria-expanded="false">
		         			<hr/>
		         		</a>
		         	</c:if>
			     </li>
			
			</c:forEach>

			
			<c:if test="${!empty cafeMember.memberNo}">
				<!-- /# column -->
				<li>
					<span class="nav-text">
			            <div class="card">
			                <div class="card-body">
			                    <div class="card-content">
			                        <div class="sweetalert m-t-30" style="text-align: center;">
			                            <button class="btn btn-primary sweet-withdraw">카페 탈퇴</button>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            <!-- /# card -->
		            </span>
				</li>
			</c:if>
			
		</ul>
	</div>
				
			
	<div class="scroll-top-wrapper ">
		<span class="scroll-top-inner">
			<i class="fa fa-2x fa-arrow-circle-up"></i>
		</span>
	</div>