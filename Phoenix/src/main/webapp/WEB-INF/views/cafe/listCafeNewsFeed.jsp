<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">

<title>카페뉴스피드</title>
</head>

<body>
<!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
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
            <c:import url="/WEB-INF/views/common/brand-logo.jsp"/>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->
        
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../common/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<br/>
	<div class='container'>

<div class='card'>
<div class='card-body'>
		<c:forEach var = 'post' items='${newsFeed}'>
		<input type='hidden' class='cafeURL' value='${post.cafeURL}'>
		<input type='hidden' class='postNo'  value='${post.postNo}'>
		<div class="card goToPost" style=" border: 1px solid #F7790A; height: 50%;">
			<div class="card-body" style='padding: 1%;'>
			<div class='row'>
				<div class='col-lg-2'>
				<div class="card-body">
				<h5>${post.cafeName}</h5>
				</div>
				</div>
				<div class='col-lg-2'>
					<img src="/images/common/16by9.png" class="card-img"
					style="background: url('/images/uploadFiles/cafeicon/${post.cafeIcon}');
		     		background-size: cover; 
					background-repeat: no-repeat; 
					background-position: center;
		     		height:auto; width:100%;">
				</div>
				<div class='col-lg-3'>
					<div class="card-body">
					<h5 class="card-title">${post.postTitle}</h5>
					</div>
				</div>
				<div class='col-lg-2'>
					<div class="card-body">
					<h5>${post.memberNickname}</h5>
					</div>
				</div>
				<div class='col-lg-3'>
					<div class="card-body">
					<h5>${post.regDate}</h5>
					</div>
				</div>
			</div>
			</div>
		</div>
		</c:forEach>
		
		</div>
		</div>
	
	</div>
	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	
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
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(".goToPost").on("click", function() {
	var countNo=$(".goToPost").index(this);
	var cafeURL = $($(".cafeURL")[countNo]).val();
	var postNo = $($(".postNo")[countNo]).val();
	$(self.location).attr("href", "/cafe/"+cafeURL+"/getPost/"+postNo);
});

</script>

<!-- 공통 툴바용 스크립트 -->	
	<script src="/js/custom/toolbarScript.js"></script>
</body>
</html>