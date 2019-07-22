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
					            <div class="p-t-15">
					            	<br/>가입 : ${cafeMember.regDate}
									<br/><strong>닉네임 : ${cafeMember.memberNickname}</strong>
									<br/>등급 : ${cafeMember.gradeName}
									<br/>출석 : ${cafeMember.visitCount}
									<br/><span class="myPost cursor">내가 쓴 글 보기</span> <span class="myPost cursor" style="text-align: right;">${cafeMember.postCount }</span>
									<br/><span class="myReply cursor"">내가 쓴 댓글보기</span> <span class="myReply cursor">${cafeMember.replyCount }</span>
									<c:if test="${cafeMember.memberGrade eq 'cg100' }">
										<input type="button" value="내 카페 관리" name="toManage">
									</c:if> 
									
									<c:if test="${empty cafeMember}">
									<br/>
									<div class="addMember">
										카페가입
									</div>
									</c:if>
									<br/>
									<c:if test="${!empty cafeMember.memberNo}">
									<div class="updateProfile cursor">
										프로필수정
									</div>
									</c:if>
					            </div>
					        </div>
					        <div class="tab-pane fade" id="profile8" role="tabpanel">
					        	
					        	<!-- ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ -->
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
		                                    <li style="margin-left: 40px; margin-right: 80px;"><button type="button" class="btn mb-1 btn-rounded btn-outline-dark updateProfile">프로필수정</button></li>
		                                </ul>
					        <!-- ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ -->
					        
					        
									<c:if test="${cafeMember.memberGrade eq 'cg100' }">
										<input type="button" value="내 카페 관리" name="toManage">
									</c:if> 
									
									<c:if test="${empty cafeMember}">
									<br/>
									<div class="addMember">
										카페가입
									</div>
									</c:if>
									<br/>
									<c:if test="${!empty cafeMember.memberNo}">
									
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
						<input type="text" class="form-control input-rounded" id="menubarSearch" name="searchKeyword" placeholder="카페 내부 검색" style="width:200px; margin:20px">
				</form>
			</span>
		</li>
			
			
			
			<c:forEach var="board" items="${boardList}">
				<li>
					<c:if test="${board.boardType != 'cb102'}">
		         		<a href="javascript:fncGetBoardPostList('${board.boardNo}','no1cafe')" aria-expanded="false">
			            	<i class="icon-badge menu-icon"></i>
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
			                        <div class="sweetalert m-t-30">
			                            <button class="btn btn-warning sweet-withdraw" style="background-color:#FFAF00;">카페 탈퇴</button>
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