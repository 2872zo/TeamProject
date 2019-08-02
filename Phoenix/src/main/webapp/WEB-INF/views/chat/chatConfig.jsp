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
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

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

     	<!--**********************************
            Sidebar start
        ***********************************-->
			<c:import url="/WEB-INF/views/chat/chatSideMenu.jsp"></c:import>
		<!--**********************************
            Sidebar end
        ***********************************-->

    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

  
	<!--**********************************
            Content body start
        ***********************************-->
        
        
		<div class="content-body" style="min-height: 600px;">
	<div class="row">
        <div class="col-lg-8">
        
        <!--  
        
			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
					
					 
						<li class="breadcrumb-item"><a href="javascript:void(0)">manage</a></li>
						<li class="breadcrumb-item active"><a href="javascript:void(0)">application</a></li>
						
						
					</ol>
				</div>
			</div>
			
		-->
		
			<div class='container-fluid'>

				<div class='card'>
					<div class='card-body'>
						
						<div id="tableLayer"
							style="overflow-x: hidden; overflow-y: scroll; height: 400px; border: 1px solid black;">

							aaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
							QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
							QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
							QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
							QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaa
							aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
							QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ</div>


					</div>

					<!-- card body -->
				</div>
				<!-- card -->
			</div>

			<!-- #/ container -->
		
		 </div>
        <!-- 왼쪽 컬럼 엔드 -->
        
        <!-- 오른컬럼이야 -->
         
        <div class="col-lg-4">
        
	        <div class='container-fluid'>
	
					<div class='card'>
						<div class='card-body'>
	        				8888주ㅡㄹㅇ야
	        			</div>
	        		</div>
	        </div>
        
        </div>
        
        <!-- 오른쪽컬럼끝야 -->
		
		
		</div>   <!-- row 엔드 -->
        

		
       
        </div>
        <!--**********************************
            Content body end
        
        ***********************************-->
      
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
        </div>
        <!--**********************************
            Footer end
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
	<script src="/js/custom/scroll-top.js"></script>


	<!--**********************************
        Scripts
    ***********************************-->

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

//툴바 스크립트용 세션체커
var checkSessionUser = ${empty sessionScope.user};
		
	
		
	$(function() {

		

	});
</script>

	<!-- 공통 툴바용 스크립트 -->
	<script src="/js/custom/toolbarScript.js"></script>
	
	<!-- 채팅 사이드 툴바 스크립트 -->
	<script src="/js/custom/chatSideBar.js"></script>


	<!--  ///////////////////////// JavaScript ////////////////////////// -->
</body>

</html>