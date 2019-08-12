<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<style>
		i.mdi.mdi-coffee{
			transition:color 0.2s;
		}
	
		i.mdi.mdi-coffee:hover{
			color:#FFAF00 !important;
		}
	</style>

	<div class="header-content clearfix">
		<div class="nav-control">
			<div class="hamburger">
				<span class="toggle-icon"><i class="icon-menu"></i></span>
			</div>
		</div>
		<div class="header-left">
			<div class="input-group icons">
				<div class="input-group-prepend">
					<a href="javascript:fncGetCafeHome()">
						<i class="mdi mdi-coffee" style='font-size: 30pt; position:relative; top:-6px;' id="cafeHomeButton"></i>
					</a>
					<a href="javascript:fncGetCafeMain('${cafeURL}')"> 
						<span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="cafeName" style="padding-top: 10px; font-size: 1rem;">${fn:substring(cafe.cafeName,0,10)}</span>
					</a>
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
                               	 <c:if test="${user.userRoleCode=='ur100'}">
	                                 <hr class="my-2">
	                                 <li>
	                                     <a href=/user/listUser><i class="icon-list"></i> <span>회원목록</span></a>
	                                 </li>
                                 </c:if>
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