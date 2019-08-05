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
						<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 0px);">
							<a class="dropdown-item" href="#" name="setSeenButton">읽음 표시</a> 
							<a class="dropdown-item" href="#" name="setUnSeenButton">안 읽음 표시</a>
						</div>
					</div>		
					
				</div>
			</div>
		</div>


		<c:if test='${empty sessionScope.user}'>
			<div class="header-right">
				<div class="input-group icons">
					<div class="input-group-prepend">
						<a href="javascript:fncLogin()"> 
							<span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"	id="login">login</span>
						</a>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${!empty sessionScope.user }">
			<div class="header-right">
				<div class="input-group icons">
					<div class="input-group-prepend">
						<a href="javascript:fncLogout()"> <span
							class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
							id="logout">logout</i></span>
						</a>
					</div>
				</div>
			</div>
		</c:if>

	</div>

