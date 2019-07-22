<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>카페폐쇄</title>



<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">


</head>

<body>



	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader" style="display: none;">
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
							href="javascript:void(0)">closed</a></li>
					</ol>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">>카페폐쇄</h4>
								<div class="basic-form">
									<form>
										<div class="form-group">
											<label>폐쇄 이유를 입력해주세요</label>
											<textarea class="form-control h-150px" rows="6" id="comment"></textarea>
										</div>
									</form>
								</div>
								<input type="hidden" name="cafeNo" class="cafeNo"
									value="${cafe.cafeNo }" />
								<div align="center">
									<button type="button" name="button"
										class="btn mb-1 btn-outline-warning">카페폐쇄하기</button>
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

			$("button[name=button]").on(
					"click",
					function() {
						alert($(".cafeNo").val())
						alert('${cafe.cafeURL}')

						$("form").attr("method", "POST").attr(
								"action",
								"/cafe/" + '${cafe.cafeURL}'
										+ "/manage/dropCafe").submit();
					});
		});
	</script>

	<script src="/js/custom/cafeCommon.js"></script>
</body>
</html>

