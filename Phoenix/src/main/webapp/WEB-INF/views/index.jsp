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

<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link href="/css/custom/common-toolbar.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">


<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">
	
	p{
		
		font-family: 'Ubuntu', sans-serif;
	}
	
	.input-group-append{
		
		border-radius :50%;
		box-shadow : 1px 1px 18px 5px #8080804a;
	}
	
	#searchKeyword{
		
		box-shadow : 1px 1px 15px 1px #8080804a;
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
 <form name ="form" >
 		
 		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->
		 
 
 
	<div class='container-fluid'>



		<!--  화면구성 div Start /////////////////////////////////////-->

	</div>

	<div class="card">

		<div class="card-body">
		<br/>
			<p class="text-center" style='color: #f5a142; font-size: 90px; '>Phoenix</p>
			<div class='d-flex justify-content-center'>
				<div class="input-group mb-3 " style='width: 50%;'>
					<input type="text" class="form-control input-rounded form-control-lg " id='searchKeyword'>
					<div class="input-group-append">
						<button class="btn btn-lg btn-rounded btn-primary" type="button" id="explore">
							<i class="mdi mdi-magnify" style='font-size: 18pt;'></i>
						</button>
					</div>
				</div>
			</div>

			<div class="d-flex justify-content-center align-items-center">
				
				<div class="cafeIcon" style='font-size: 75pt; margin:30px;' id="cafe">
					<a title="카페 바로가기"><i class="mdi mdi-coffee"></i> </a>
				</div>
				<div class="mailIcon" style='font-size: 75pt; margin:30px;' id='mail'>
					<a title="메일 바로가기"><i class="mdi mdi-email-outline"></i> </a>
				</div>
				<div class="snsIcon" style='font-size: 75pt; margin:30px;' id='sns'>
					<a title="sns 바로가기"><i class="mdi mdi-heart-box-outline" ></i></a>
				</div>
				<div class="shopIcon" style='font-size: 75pt; margin:30px;' id="shop">
					<a title="쇼핑 바로가기"><i class="mdi mdi-cart-outline"></i></a>
				</div>
			
			</div>
			
			<br/>
			<br/>

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
	
	
	<!--**********************************
        Scripts
    ***********************************-->
	
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
		
	$(function() {

		$("#explore").on("click", function() {
			var keyword = $("#searchKeyword").val()
			$(self.location).attr("href", "/explore/getUnifiedList?searchKeyword="+ keyword);
		});

		$("#searchKeyword").focus(function() {
			$(this).attr("style", "border: 2px solid #f5a142");
		});

		$("#searchKeyword").blur(function() {
			$(this).attr("style", "");
		});

		$("#searchKeyword").on("keyup", function(a) {
			if (a.keyCode == 13) {
				$('#explore').trigger('click');
			}
		});

		$("#cafe").on("click", function() {
			$(self.location).attr("href", "/cafe/main");
		});
		
		$("#mail").on("click", function() {
			$(self.location).attr("href", "/mail/getMailList");
		});
		
		$("#sns").on("click", function() {
			$(self.location).attr("href", "/sns/getTimeLine");
		});
		
		$("#shop").on("click", function() {
			$(self.location).attr("href", "/shopping/getProductList");
		});

	});
	
</script>

<!-- 공통 툴바용 스크립트 -->	
	<script src="/js/custom/toolbarScript.js"></script>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
	</form>
</body>
</html>