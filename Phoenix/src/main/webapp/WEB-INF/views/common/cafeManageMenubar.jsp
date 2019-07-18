<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



	
	<script type="text/javascript">

	$(function() {

		$(".statistics").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/getCafeStatistics";
		});

		$(".info").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeInfoView";
		});

		$(".menu").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeBoardView";
		});

		$(".form").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeApplicationFormView";
		});

		$(".application").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/getCafeApplicationList";
		});

		$(".grade").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeGradeView";
		});

		$(".member").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/getCafeMemberList";
		});

		$(".closed").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/dropCafeView";
		});
		
	});
		
		
	</script>

	<div id="cafeMangeMenubar">
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	
		<div class="statistics">
			카페통계
		</div>
		<br/>
		<hr>
		
		<div class="menu">
			게시판관리
		</div>
		<br/>
		<hr>

		<div class="info">
			카페정보수정
		</div>
		<br/>
		<hr>
		
		<div class="form">
			가입양식관리
		</div>
		<br/>
		<hr>
		
		<div class="application">
			가입신청목록
		</div>
		<br/>
		<hr>
		
		<div class="grade">
			카페등급관리
		</div>
		<br/>
		<hr>
		
		<div class="member">
			카페멤버목록
		</div>
		<br/>
		<hr>
		
		<div class="closed">
			카페폐쇄
		</div>
		<br/>
		<hr>
		

	</div>
