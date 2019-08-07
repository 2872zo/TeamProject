<%@ page contentType="text/html; charset=utf-8"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<div class="nk-nav-scroll">

	<ul class="metismenu" id="menu">
	<br>
		<c:if test="${user.userRoleCode=='ur100'}">
		<li><a id="statistics"
			href="javascript:fncUserList()"
			aria-expanded="false"> <i class="icon-note menu-icon"></i>
				<span class="nav-text">회원목록</span>
		</a></li>
		</c:if>
	<br>
		<li><a id="board" href="javascript:fncGetBoard('${cafeURL}')"
			aria-expanded="false"> <i class="icon-note menu-icon"></i>
				<span class="nav-text">신고목록</span>
		</a></li>
	<br>
		<li><a id="info" href="javascript:fncGetInfo('${cafeURL}')"
			aria-expanded="false"> <i class="icon-note menu-icon"></i>
				<span class="nav-text">문의목록</span>
		</a></li>

		
	</ul>
	
</div>

