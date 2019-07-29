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

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">

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
	<br />
	<div class='container-fluid'>



		<!--  화면구성 div Start /////////////////////////////////////-->

	</div>

	<div class="card">

		<div class="card-body">
		<br/>
			<p class="text-center" style='color: #f5a142; font-size: xx-large;'>Phoenix</p>
		<br/>
		<br/>
			<div class='d-flex justify-content-center'>
				<div class="input-group mb-3 " style='width: 50%;'>
					<input type="text" class="form-control form-control-lg"
						placeholder="검색어를 입력해주세요" id='searchKeyword'>
					<div class="input-group-append">
						<button class="btn btn-lg btn-outline-primary" type="button"
							id="explore">
							<i class="mdi mdi-magnify" style='font-size: 18pt;'></i>
						</button>
					</div>
				</div>
			</div>

			<br/>
			<br/>
			<div class="d-flex justify-content-around align-items-center">
				<i class="mdi mdi-coffee" style='font-size: 75pt;' id="cafe"></i> 
				<i class="mdi mdi-email-outline" style='font-size: 75pt;' id='mail'></i>
				<i class="mdi mdi-heart-box-outline" style='font-size: 75pt;' id='sns'></i>
				<i class="mdi mdi-cart-outline" style='font-size: 75pt;' id="shop"></i>
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

//툴바 스크립트용 세션체커
var checkSessionUser = ${empty sessionScope.user};
		
	
		
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
			$(self.location).attr("href", "/sns/main");
		});
		
		$("#shop").on("click", function() {
			$(self.location).attr("href", "/shopping/myCartList");
		});

	});
</script>

<!-- 공통 툴바용 스크립트 -->	
	<script src="/js/custom/toolbarScript.js"></script>


<!--  ///////////////////////// JavaScript ////////////////////////// -->

</body>
</html>