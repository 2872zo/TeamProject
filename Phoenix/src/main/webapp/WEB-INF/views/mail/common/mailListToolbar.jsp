<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


	<div class="header-content clearfix">
		<div class="nav-control">
			<div class="hamburger">
				<span class="toggle-icon"><i class="icon-menu"></i></span>
			</div>
		</div>
		<div class="header-left">
			<div class="input-group icons">
				<div class="input-group-prepend">
					<a href="javascript:fncGetMailMain()"> 
						<span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="mail" style="padding-top: 10px; font-size: 1rem;">Mail</span>
					</a>
					
					<div style="margin:10px; margin-left:20px;">
						<input type="checkbox" class="form-check-input">
					</div>
					
					<button type="button" class="btn btn-primary btn-sm" id="delete" name="deleteMailButton" style="border-radius: 0.25rem; height:37px; margin-right:10px;">삭제</button>
<!-- 					<button type="button" class="btn btn-primary btn-sm" >삭제</button>		 -->
					
					<div class="btn-group" role="group">
						<button type="button" class="btn mb-1 btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">읽음표시</button>
						<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 1px);">
							<a class="dropdown-item" href="#" name="setSeenButton">읽음 표시</a> 
							<a class="dropdown-item" href="#" name="setUnSeenButton">안 읽음 표시</a>
						</div>
					</div>		
					
				</div>
			</div>
		</div>


		<div class="header-right">
					<ul class="clearfix d-flex align-items-center justify-content-around">
					<!-- 로그인상태시 표시되는 부분 -->
					<c:if test="${!empty sessionScope.user}">
						<li class="icons dropdown" style='position: relative;right: 15%;'>
                            <div class="user-img c-pointer position-relative" data-toggle="dropdown" aria-expanded="false">
                                <span class="activity active"></span>
                                <img src="/images/uploadFiles/profileimg/${user.profileImg}" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-132px, 57px, 0px);">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href=/user/getUserInfo?userNo=${user.userNo }><i class="icon-user"></i> <span>회원정보상세</span></a>
                                        </li>
                                        <li>
                                             
                                            <div class="badge gradient-3 badge-pill gradient-1"></div>
                                            
                                        </li>
                                        <hr class="my-2">
                                      <c:if test="${user.userRoleCode=='ur101'}">
                                        <li>
                                            <a href=/user/listUser><i class="icon-list"></i> <span>회원목록</span></a>
                                        </li>
                                        </c:if>
                                        <li><a href="page-login.html"><i class="icon-list"></i> <span>신고목록</span></a></li>
                                        <li><a href="page-login.html"><i class="icon-list"></i> <span>문의목록</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>

                        <!-- 회원관리부분 -->
                        <!-- 채팅부분 -->
                         </c:if>

						<c:if test="${!empty sessionScope.user}">

							<i class="mdi mdi-comment-processing-outline" id='goChat'
								style='font-size: 35pt; position: relative; right: 5%;'></i>
								 <div style='margin-left: 2%;margin-right: 2%;'></div>
							<!-- 채팅 -->
							<!-- 로그아웃버튼 -->
							<button type="button" class="btn btn-primary logout">
								<i class="icon-key">Logout</i>
							</button>
							<!-- 로그아웃버튼 -->
						</c:if>
						<!-- 로그인상태시 표시되는 부분 -->
						<c:if test="${empty sessionScope.user}">
							<button type="button" class="btn btn-primary login"
								data-toggle="modal" data-target="#exampleModalCenter">
								<i class="icon-key">Login</i>
							</button>
						</c:if>
		
					</ul>
				</div>
		</div>

