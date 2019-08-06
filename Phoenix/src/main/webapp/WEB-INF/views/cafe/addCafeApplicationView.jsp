<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
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
            <c:import url="/WEB-INF/views/common/brand-logo.jsp"/>
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
				<div class="header-left">
					<div class="input-group icons">
						<div class="input-group-prepend">
							<span
								class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
								id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
						</div>
						<input type="search" class="form-control"
							placeholder="Search Dashboard" aria-label="Search Dashboard">
						<div class="drop-down   d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
						</div>
					</div>
				</div>

				<div class="header-right">
					<ul class="clearfix">
						<li class="icons dropdown"><a href="javascript:void(0)"
							data-toggle="dropdown"> <i class="mdi mdi-email-outline"></i>
								<span class="badge gradient-1 badge-pill badge-primary">3</span>
						</a>
							<div class="drop-down animated fadeIn dropdown-menu">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									<span class="">3 New Messages</span>

								</div>
								<div class="dropdown-content-body">
									<ul>
										<li class="notification-unread"><a
											href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/images/avatar/1.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Saiful Islam</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hi Teddy, Just wanted
														to let you ...</div>
												</div>
										</a></li>
										<li class="notification-unread"><a
											href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/images/avatar/2.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Adam Smith</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Can you do me a
														favour?</div>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/images/avatar/3.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Barak Obama</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hi Teddy, Just wanted
														to let you ...</div>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/images/avatar/4.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Hilari Clinton</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hello</div>
												</div>
										</a></li>
									</ul>

								</div>
							</div></li>
						<li class="icons dropdown"><a href="javascript:void(0)"
							data-toggle="dropdown"> <i class="mdi mdi-bell-outline"></i>
								<span class="badge badge-pill gradient-2 badge-primary">3</span>
						</a>
							<div
								class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									<span class="">2 New Notifications</span>

								</div>
								<div class="dropdown-content-body">
									<ul>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-success-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Events near you</h6>
													<span class="notification-text">Within next 5 days</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-danger-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Event Started</h6>
													<span class="notification-text">One hour ago</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-success-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Event Ended
														Successfully</h6>
													<span class="notification-text">One hour ago</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-danger-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Events to Join</h6>
													<span class="notification-text">After two days</span>
												</div>
										</a></li>
									</ul>

								</div>
							</div></li>
						<li class="icons dropdown d-none d-md-flex"><a
							href="javascript:void(0)" class="log-user" data-toggle="dropdown">
								<span>English</span> <i class="fa fa-angle-down f-s-14"
								aria-hidden="true"></i>
						</a>
							<div
								class="drop-down dropdown-language animated fadeIn  dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="javascript:void()">English</a></li>
										<li><a href="javascript:void()">Dutch</a></li>
									</ul>
								</div>
							</div></li>
						<li class="icons dropdown">
							<div class="user-img c-pointer position-relative"
								data-toggle="dropdown">
								<span class="activity active"></span> <img
									src="/images/user/1.png" height="40" width="40" alt="">
							</div>
							<div class="drop-down dropdown-profile   dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="app-profile.html"><i class="icon-user"></i>
												<span>Profile</span></a></li>
										<li><a href="email-inbox.html"><i
												class="icon-envelope-open"></i> <span>Inbox</span>
												<div class="badge gradient-3 badge-pill badge-primary">3</div></a>
										</li>

										<hr class="my-2">
										<li><a href="page-lock.html"><i class="icon-lock"></i>
												<span>Lock Screen</span></a></li>
										<li><a href="page-login.html"><i class="icon-key"></i>
												<span>Logout</span></a></li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
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
						<li class="breadcrumb-item"><a href="javascript:void(0)">Member</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">application</a></li>
					</ol>
				</div>
			</div>
			<div id="container-fluid">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">${cafe.cafeName } 카페가입하기</h4>
							<p class="text-muted m-b-15 f-s-12">
								카페가입을 위한 정보를 입력해주세요. 카페내규에 따라
								<code>가입승인, 가입거절</code>
								될 수 있습니다.
							</p>
							<div class="basic-form">
								<!-- form Start /////////////////////////////////////-->
								<form>
									<input type="hidden" name="autoApplicationAcceptFlag"
										value="${cafe.autoApplicationAcceptFlag }" /> <input
										type="hidden" name="memberNicknameFlag"
										value="${cafe.memberNicknameFlag }" /> <input type="hidden"
										name="cafeNo" value="${cafe.cafeNo }" />

									<c:if test="${!empty cafe.cafeDetail}">
										<div class="form-group">
											>카페설명 <input type="text" readonly="readonly"
												class="form-control-plaintext" value="${cafe.cafeDetail }">
										</div>
									</c:if>

									<c:if test="${cafe.memberNicknameFlag eq true }">
                                    >별명
                                        <div class="form-row">
											<div class="col">
												<input type="text" class="form-control input-default"
													id="memberNickname" name="memberNickname"
													placeholder="사용할별명"> <span id="helpBlock"
													class="help-block"> <strong class="text-danger"
													id="here" name="here">중복확인하세요</strong>
												</span>
											</div>
											<div class="col-7"></div>
											<div class="col"></div>
										</div>
									</c:if>
									<br>
									<c:if test="${!empty cafe.applicationQuestion1}">
										<div class="form-group">
											>질문1 <input type="text" readonly="readonly"
												class="form-control-plaintext"
												value="${  cafe.applicationQuestion1}"> <input
												type="hidden" name="question1"
												value="${  cafe.applicationQuestion1}" />
										</div>
										<div class="form-group">
											<input type="text" class="form-control input-default"
												id="answer1" name="answer1" placeholder="질문1에 대한 답변을 입력해주세요">
										</div>
									</c:if>

									<c:if test="${!empty cafe.applicationQuestion2}">
										<div class="form-group">
											>질문2 <input type="text" readonly="readonly"
												class="form-control-plaintext"
												value="${  cafe.applicationQuestion2}"> <input
												type="hidden" name="question2"
												value="${  cafe.applicationQuestion2}" />
										</div>
										<div class="form-group">
											<input type="text" class="form-control input-default"
												id="answer2" name="answer2" placeholder="질문2에 대한 답변을 입력해주세요">
										</div>
									</c:if>

									<c:if test="${!empty cafe.applicationQuestion3}">
										<div class="form-group">
											>질문3 <input type="text" readonly="readonly"
												class="form-control-plaintext"
												value="${  cafe.applicationQuestion3}"> <input
												type="hidden" name="question3"
												value="${  cafe.applicationQuestion3}" />
										</div>
										<div class="form-group">
											<input type="text" class="form-control input-default"
												id="answer3" name="answer3" placeholder="질문3에 대한 답변을 입력해주세요">
										</div>
									</c:if>

									<div align="center">
										질문 답변 시 회원님의 소중한 개인정보가 유출되지 않도록 주의해주시기 바랍니다.
										<br>
										<br>
										<button type="button" name="button"
											class="btn mb-1 btn-outline-warning">가입</button>
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- row -->

			<div class="container-fluid"></div>
			<!-- #/ container -->
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
	<script src="/js/custom/scroll-top.js"></script>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		$(function() {
			var cafeURL = '${cafe.cafeURL}'

			$("button[name=button]").on(
					"click",
					function() {
						//alert("가입");
						$("form").attr("method", "POST").attr("action",
								"/cafe/" + cafeURL + "/addCafeApplication")
								.submit();
					});
		});

		$(function() {
			var cafeNo = '${cafe.cafeNo }'
			var cafeURL = '${cafe.cafeURL}'
			$("#memberNickname").on(
					"keyup",
					function() {
						//alert("durl")
						//alert($("#memberNickname").val())
						//alert(cafeNo)

						$.ajax({
							url : "/cafe/json/" + cafeURL + "/checkNickName",
							type : "POST",
							data : JSON.stringify({
								memberNickname : $("#memberNickname").val(),
								cafeNo : cafeNo
							}),
							dataType : "json",
							contentType : "application/json",
							success : function(JSONData, status) {

								//alert("status : " + status);
								//alert("JSONData.result : \n" + JSONData.result);

								if (JSONData.result == true
										&& JSONData.memberNickname != "") {
									$("#here").html("<h7 style='color:green;'>사용가능</h7>")
								} else if (JSONData.result == false) {
									$("#here").html("<h7>사용불가능</h7>")
								} else if ((JSONData.memberNickname == "")
										&& JSONData.result == true) {
									$("#here").html("<h7 style='color:blue;'>중복확인하세요</h7>")
								}

							},
							error : function(request, status, error) {
								alert("에러남 : " + error);
							}

						});//ajax끝

					});//keyup끝

		});
	</script>

	<script src="/js/custom/cafeCommon.js"></script>

</body>

</html>
