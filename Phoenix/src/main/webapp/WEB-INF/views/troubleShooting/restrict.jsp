<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>정지</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/images/favicon.png">
    <link href="/css/style.css" rel="stylesheet">
</head>

<body class="h-100">
    
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
    
    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="error-content">
                        <div class="card mb-0">
                            <div class="card-body text-center">
                                <h1 class="error-text text-primary">정지</h1>
                                <h4 class="mt-4"><i class="fa fa-thumbs-down text-danger"></i>이용정지 상태입니다.</h4>
                                <p>에 정지가 만료됩니다.</p>
                                <p>정지사유 : </p>
                                <!-- <p id='countDown'>3초후 메인페이지로 이동합니다.</p> -->
                                <form class="mt-5 mb-5">
                                    
                                    <div class="text-center mb-4 mt-4"><a href="/" class="btn btn-primary">홈페이지로 이동</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="/plugins/common/common.min.js"></script>
    <script src="/js/custom.min.js"></script>
    <script src="/js/settings.js"></script>
    <script src="/js/gleek.js"></script>
    <script src="/js/styleSwitcher.js"></script>
    
<!--  ///////////////////////// JavaScript ////////////////////////// -->

<script type="text/javascript">
/*
setTimeout(function() {
	$("#countDown").text("2초후 메인페이지로 이동합니다.");
	}, 1000);
setTimeout(function() {
	$("#countDown").text("1초후 메인페이지로 이동합니다.");
	}, 2000);
setTimeout(function() {
	$(self.location).attr("href", "/");
	}, 3000);
*/
</script>

<!--  ///////////////////////// JavaScript ////////////////////////// -->

</body>
</html>





