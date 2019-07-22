<%@ page contentType="text/html; charset=utf-8"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<div class="nk-nav-scroll">
	<ul class="metismenu" id="menu">
		<li><a id="statistics"
			href="javascript:fncGetStatistics('${cafeURL}')"
			aria-expanded="false"> <i class="icon-speedometer menu-icon"></i>
				<span class="nav-text">카페통계</span>
		</a></li>

		<li><a id="board" href="javascript:fncGetBoard('${cafeURL}')"
			aria-expanded="false"> <i class="icon-speedometer menu-icon"></i>
				<span class="nav-text">게시판관리</span>
		</a></li>

		<li><a id="info" href="javascript:fncGetInfo('${cafeURL}')"
			aria-expanded="false"> <i class="icon-speedometer menu-icon"></i>
				<span class="nav-text">카페정보수정</span>
		</a></li>

		<li><a id="form" href="javascript:fncGetForm('${cafeURL}')"
			aria-expanded="false"> <i class="icon-speedometer menu-icon"></i>
				<span class="nav-text">가입양식관리</span>
		</a></li>

		<li><a id="application"
			href="javascript:fncGetApplication('${cafeURL}')"
			aria-expanded="false"> <i class="icon-speedometer menu-icon"></i>
				<span class="nav-text">가입신청목록</span>
		</a></li>

		<li><a id="grade" href="javascript:fncGetGrade('${cafeURL}')"
			aria-expanded="false"> <i class="icon-speedometer menu-icon"></i>
				<span class="nav-text">카페등급관리</span>
		</a></li>

		<li><a id="member" href="javascript:fncGetMember('${cafeURL}')"
			aria-expanded="false"> <i class="icon-speedometer menu-icon"></i>
				<span class="nav-text">카페멤버목록</span>
		</a></li>

		<li><a id="closed" href="javascript:fncGetClosed('${cafeURL}')"
			aria-expanded="false"> <i class="icon-speedometer menu-icon"></i>
				<span class="nav-text">카페폐쇄</span>
		</a></li>

		<li><a id="notice" href="javascript:fncGetNotice('${cafeURL}')"
			aria-expanded="false"> <i class="icon-speedometer menu-icon"></i>
				<span class="nav-text">공지관리</span>
		</a></li>
	</ul>
</div>

