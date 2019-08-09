<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">

<title>카페가입신청상세조회</title>



<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">


</head>

<body>


	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader" >
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10"></circle>
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

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/cafeManageTollbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/common/cafeManageMenubar.jsp"></c:import>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->


		<div class="content-body" style="min-height: 743px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">manage</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">application</a></li>
					</ol>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">>가입신청상세조회</h4>
								<div align="right">
								
								<c:if test="${cafeApplication.acceptStatusCode eq 'ca100' }">
									<button type="button" id="accept"
										class="btn btn-outline-secondary">가입승인</button>
									<button type="button" id="reject"
										class="btn btn-outline-secondary">가입거절</button>
								</c:if>
								
								</div>
								<br> <br>
								<form id="whether">
									<input type="hidden" name="boardName" id="boardName" value="" />
								</form>

								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>가입신청번호</strong>
									</div>
									<div class="col-xs-8 col-md-4" id="applicationNo">${cafeApplication.applicationNo}</div>
								</div>

								<hr />

								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>회원번호</strong>
									</div>
									<div class="col-xs-8 col-md-4">${cafeApplication.userNo}</div>
								</div>

								<hr />

								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>카페번호</strong>
									</div>
									<div class="col-xs-8 col-md-4">${cafeApplication.cafeNo}</div>
								</div>

								<hr />

								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>가입신청일</strong>
									</div>
									<div class="col-xs-8 col-md-4">${cafeApplication.regDate}</div>
								</div>

								<hr />

								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>멤버닉네임</strong>
									</div>
									<div class="col-xs-8 col-md-4">${cafeApplication.memberNickname}</div>
								</div>

								<hr />

							<c:if test="${! empty cafeApplication.question1 }">
								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>질문1</strong>
									</div>
									<div class="col-xs-8 col-md-4">${cafeApplication.question1}</div>
								</div>
								<hr />
							</c:if>

								
							<c:if test="${! empty cafeApplication.question2 }">
								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>질문2</strong>
									</div>
									<div class="col-xs-8 col-md-4">${cafeApplication.question2}</div>
								</div>
								<hr />
							</c:if>
								
								
							<c:if test="${! empty cafeApplication.question3 }">
								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>질문3</strong>
									</div>
									<div class="col-xs-8 col-md-4">${cafeApplication.question3}</div>
								</div>
								<hr />
							</c:if>
								
				
							<c:if test="${! empty cafeApplication.answer1 }">
								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>답변1</strong>
									</div>
									<div class="col-xs-8 col-md-4">${cafeApplication.answer1}</div>
								</div>
								<hr />
							</c:if>
								
							
							<c:if test="${! empty cafeApplication.answer2 }">
								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>답변2</strong>
									</div>
									<div class="col-xs-8 col-md-4">${cafeApplication.answer2}</div>
								</div>
								<hr />
							</c:if>
								
							<c:if test="${! empty cafeApplication.answer3 }">
								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>답변3</strong>
									</div>
									<div class="col-xs-8 col-md-4">${cafeApplication.answer3}</div>
								</div>
								<hr />
							</c:if>
								

								<div class="row">
									<div class="col-xs-4 col-md-2">
										<strong>가입승인상태</strong>
									</div>
									<div class="col-xs-8 col-md-4">
									<c:if test="${cafeApplication.acceptStatusCode eq 'ca100' }">가입대기</c:if>
									<c:if test="${cafeApplication.acceptStatusCode eq 'ca101' }">가입승인</c:if>
									<c:if test="${cafeApplication.acceptStatusCode eq 'ca102' }">가입거절</c:if>
									<c:if test="${cafeApplication.acceptStatusCode eq 'ca103' }">자동가입</c:if>
									</div>
								</div>

								<hr />

								<div align="center">
									<button type="button" class="btn btn-outline-warning">확인</button>
								</div>


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

	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>


	<script type="text/javascript">
		$(function() {
			var cafeURL = '${cafeApplication.cafeIcon}'
			$(".btn-outline-warning").on(
					"click",
					function() {
						self.location = "/cafe/" + cafeURL
								+ "/manage/getCafeApplicationList"
					})
		});

		$(function() {
			var cafeURL = '${cafeApplication.cafeIcon}'
			$("#accept").on(
					"click",
					function() {
						//alert($("#applicationNo").text())
						var whether = "true" + $("#applicationNo").text();
						$("#boardName").val(whether);
						$("#whether").attr("method", "POST").attr(
								"action",
								"/cafe/" + cafeURL
										+ "/manage/updateCafeApplication")
								.submit();
					})

			$("#reject").on(
					"click",
					function() {
						//alert($("#applicationNo").text())
						var whether = "false" + $("#applicationNo").text();
						$("#boardName").val(whether);
						$("#whether").attr("method", "POST").attr(
								"action",
								"/cafe/" + cafeURL
										+ "/manage/updateCafeApplication")
								.submit();
					})
		});
	</script>
	<script src="/js/custom/cafeCommon.js"></script>
</body>
</html>