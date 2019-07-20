<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>매니저용 카페 툴바</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/quixlab/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="/css/quixlab/style.css" rel="stylesheet">
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		$(function() {
		
				$("#login").on("click" , function() {
					$(self.location).attr("href","/user/loginView");
				});
	
				$("#logout").on("click" , function() {
					$(self.location).attr("href","/user/logout");
				});
	
				$("#phoenix").on("click", function() {
					alert("g")
					$(self.location).attr("href", "/");
				});
				
				$("#goChat").on("click" , function() {
					$(self.location).attr("href","/chat/main");
				});
						
				
				$("#cafemanage").on("click", function() {
					
					location.href = "/cafe/"+"${cafeURL}"+"/manage/getCafeStatistics";
				});
				
				$("#cafeName").on("click", function() {
					
					$(self.location).attr("href", "/cafe/" + "${cafeURL}" +"/");
				});
		});
	</script>

</head>

<body data-theme-version="light" data-layout="vertical" data-nav-headerbg="color_1" data-headerbg="color_1" data-sidebar-style="full" data-sibebarbg="color_1" data-sidebar-position="static" data-header-position="static" data-container="wide" direction="ltr">
	
	<form name ="form" class="needs-validation" novalidate>
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader" style="display: none;">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"></circle>
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <div class="show" id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header" text-align="center">
            <div class="brand-logo">
                <a id="phoenix" href="#">
                <span class="brand-title" font-size="1.5rem" align="center">
                        Phoenix
                    </span>
                </a>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
       <div class="header" >    
            <div class="header-content clearfix">
                <div class="header-left">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="cafemanage" line-height:initial>manage</span>
                        </div>
                    </div>
                </div>
                <div class="header-left">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="cafeName">my cafe</span>
                        </div>
                    </div>
                </div>
                <c:if test='${empty sessionScope.user}'>
                 <div class="header-right">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="login"><i class="mdi mdi-magnify">login</i></span>
                        </div>
                    </div>
                </div>
                 <div class="header-right">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="logout"><i class="mdi mdi-magnify">logout</i></span>
                        </div>
                    </div>
                </div>
                </c:if>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        

    </div>

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="/plugins/quixlab/common/common.min.js"></script>
    <script src="/js/quixlab/custom.min.js"></script>
    <script src="/js/quixlab/settings.js"></script>
    <script src="/js/quixlab/gleek.js"></script>
    <script src="/js/quixlab/styleSwitcher.js"></script>


	</form>
</body>
</html>