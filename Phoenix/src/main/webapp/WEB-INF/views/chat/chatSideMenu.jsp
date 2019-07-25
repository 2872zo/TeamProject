<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<style type="text/css">
li:hover {
	
	cursor: pointer;
	
}
</style>
<div class="nk-nav-scroll">
	<ul class="metismenu" id="menu">
		<li id='friendsList'><a id="statistics"
			aria-expanded="false"> <i class="mdi  mdi-account-multiple" style='font-size: 25pt'></i>
				<span class="nav-text align-middle" style='font-size: 15pt'>친구목록</span>
		</a></li>

		<li id='chatRoomList'><a id="board" 
			aria-expanded="false"> <i class="mdi mdi-server" style='font-size: 25pt'></i>
				<span class="nav-text align-middle" style='font-size: 15pt'>채팅방목록</span>
		</a></li>

		<li id='config'><a id="info"
			aria-expanded="false"> <i class="mdi mdi-settings" style='font-size: 25pt'></i>
				<span class="nav-text align-middle" style='font-size: 15pt'>환경설정</span>
		</a></li>

		<li><a id="form" 
			aria-expanded="false"> <i class="icon-note menu-icon"></i>
				<span class="nav-text" id=''>가입양식관리</span>
		</a></li>

		<li><a id="application"
			
			aria-expanded="false"> <i class="icon-menu menu-icon"></i>
				<span class="nav-text">가입신청목록</span>
		</a></li>

		<li><a id="grade" 
			aria-expanded="false"> <i class="icon-note menu-icon"></i>
				<span class="nav-text">카페등급관리</span>
		</a></li>

		<li><a id="member" 
			aria-expanded="false"> <i class="icon-menu menu-icon"></i>
				<span class="nav-text">카페멤버목록</span>
		</a></li>

		<li><a id="closed" 
			aria-expanded="false"> <i class="icon-speedometer menu-icon"></i>
				<span class="nav-text">카페폐쇄</span>
		</a></li>

		<li><a id="notice" 
			aria-expanded="false"> <i class="icon-notebook menu-icon"></i>
				<span class="nav-text">공지관리</span>
		</a></li>
	</ul>
</div>

