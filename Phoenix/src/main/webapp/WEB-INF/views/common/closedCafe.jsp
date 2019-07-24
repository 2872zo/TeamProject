<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../common/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->


<style>

.error-text {
	font-size: 2rem;
	line-height: 5rem;
	color: #FFAF00;
}
</style>
<title>dropCafeMain</title>
<!--셀렉터 사이즈 조절-->


<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	$(function() {

	});
</script>

</head>

<body>

	<!--  화면구성 div start /////////////////////////////////////-->

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">카페</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">폐쇄카페</a></li>
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
								<h1 class="error-text text-primary">폐쇄된 카페 입니다</h1>
								<h4 class="mt-4">${cafe.cafeName}는</h4>
								<p>${cafe.closeReason }사유로 폐쇄되었습니다</p>
								<form class="mt-5 mb-5">

									<div class="text-center mb-4 mt-4">
										<a href="/cafe/main"
											class="btn btn-primary">피닉스카페 바로가기</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  화면구성 div end /////////////////////////////////////-->

</body>
</html>