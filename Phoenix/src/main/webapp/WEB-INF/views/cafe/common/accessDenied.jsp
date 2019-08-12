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

.error-text {
	font-size: 2rem;
	line-height: 5rem;
	color: #FFAF00;
}
</style>

<title>카페가입</title>
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
			<c:import url="/WEB-INF/views/common/brand-logo.jsp" />
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<c:import url="/WEB-INF/views/common/cafeToolbar.jsp"></c:import>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/cafe/menubarCafe.jsp"></c:import>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">카페</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">카페가입</a></li>
				</ol>
			</div>
		</div>
		<div class="login-form-bg h-100">
			<div class="container h-100">
				<div class="row justify-content-center h-100">
					<div class="col-xl-8">
						<div class="error-content">
							<div class="card mb-0">
								<div class="card-body text-center">
									<h1 class="error-text text-primary"><strong>${board.memberGradeName }</strong>등급이 되시면<br/> 접근 가능한 게시판입니다.</h1>
									<h4 class="mt-4">현재  <strong>${cafeMember.memberNickname}</strong> 님은  <strong>${cafeMember.gradeName }</strong> 등급 입니다.</h4>
									<p>${cafe.cafeName}</p>
<%-- 									<c:forEach var="grade" items="${cafeGradeList}"> --%>
<%-- 										<p><strong>${grade.gradeName}</strong> 설명</p> --%>
<%-- 									</c:forEach> --%>
<!-- 									<form class="mt-5 mb-5"> -->

<!-- 										<div class="text-center mb-4 mt-4"> -->
<%-- 											<a href="javascript:fncAddCafeApplication('${cafeURL}')" class="btn btn-primary">멤버등급안내</a> --%>
<!-- 										</div> -->
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		</div>
		<!--**********************************
            Content body end
        ***********************************-->

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
	<script>
    	var memberNo = '${cafeMember.memberNo}'
    	var userNo ='${user.userNo}'
    	var cafeNo= '${cafeMember.cafeNo}'
		var cafeURL = "${cafeURL}";
    </script>
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/js/custom/menubarCafe.js"></script>
	<script src="/js/custom/cafeCommon.js"></script>



</body>

</html>
