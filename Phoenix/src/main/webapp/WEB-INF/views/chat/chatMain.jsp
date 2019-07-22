<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">




<style>
#div_menu {
	width: 20%;
	height: 500px;
	float: left;
	background-color: #82FA58;
}

#div_con {
	width: 80%;
}

.cursor {
	cursor: pointer;
}

.cursor:hover {
	text-decoration: underline;
}
</style>
</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<div class="brand-logo">
				<a href="/"> <b class="logo-abbr"> <b
						class="align-middle font-weight-bolder text-center"
						style='color: white; font-size: x-large;'>P</b>
				</b> <span
					class="brand-title align-middle font-weight-bolder text-center"
					style='color: white; font-size: x-large;'>Phoenix</span>
				</a>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content clearfix">

				<div class="nav-control">
					<div class="hamburger">
						<span class="toggle-icon"><i class="icon-menu"></i></span>
					</div>
				</div>
				<div class="header-left d-flex align-items-center">
				<form class="form-inline" id='cafeSearch'>
		<input type="hidden" id="currentPage" name="currentPage" value="0"/>
		<input type ="hidden" name = 'cafeURL' value='${ !empty search.cafeURL ? search.cafeURL : "" }'>
		<input type ="hidden" name = 'boardName' value='${ !empty search.boardName ? search.boardName : "" }'>
	
	   <select class="custom-select" aria-label="Example select with button addon" name='searchCondition' id='searchCondition'>
	    <option class='searchCondition' selected value="0"   ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>카페+게시글</option>
	    <option class='searchCondition' value="1"   ${ !empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>카페</option>
	    <option class='searchCondition' value="2"   ${ !empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>게시글</option>
	   </select>
	
	  <input type="text" class="form-control" placeholder="검색어 입력해주세요" aria-label="Text input with dropdown button" aria-describedby="button-addon2" value='${ !empty search.searchKeyword ? search.searchKeyword : '' }' name="searchKeyword" id="searchKeyword">
	  <button class="btn btn-outline-light" type="button" id="cafeExplore">검색</button>
	</form>
				
				</div>

				<div class="header-right d-flex align-items-center">
					<button type="button" class="btn btn-outline-success" id='goChat'>
						<i class="fa fa-paper-plane">Chat</i>
					</button>

					<button type="button" class="btn btn-outline-primary login">
						<i class="icon-key">Login</i>
					</button>

					<button type="button" class="btn btn-primary logout">
						<i class="icon-key">Logout</i>
					</button>
				</div>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<div class="nk-sidebar" style='width: 0%;'></div>
		<div class='content-body'></div>





	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>

	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.init.js"></script>

	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
	<script type="text/javascript">
	    	$(function(){
		    	
		    	//로그인 안해서 세션에 유저가 없을 때
	    		if(${empty sessionScope.user}){
		    		$(".logout").remove();
	    		}
	    		
	    		//로그인해서 세션에 유저가 있을 때
	    		if(${!empty sessionScope.user}){
		    		$("#goChat").remove();
		    		$(".login").remove();
	    		}

	    		$(".login").on("click" , function() {
	    			$(self.location).attr("href","/user/loginView");
	    		});

	    		$(".logout").on("click" , function() {
	    			$(self.location).attr("href","/user/logout");
	    		});
	    		
	    		$("#goChat").on("click" , function() {
	    			$(self.location).attr("href","/chat/chatRoomList");
	    		});

	    		
	    	});
		
	</script>


</body>
<style type="text/css">
.card{border: thick; border-color: red;}
</style>

</html>
