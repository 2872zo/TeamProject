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
.friends {
	border: 1px solid red;
}

img {
	max-width: 100%; /* 이미지의 최대사이즈 */
	height: auto;
	vertical-align: center;
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

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/chat/chatSideMenu.jsp"></c:import>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->
		<!--**********************************
            Content body start
        ***********************************-->


		<div class="content-body" style="min-height: 600px;">
			<div class="row">
				<div class="col-lg-8">
					<div class='container-fluid'>

						<div class='card'>
							<div class='card-body'>
								<!-- 상단 친구 종류 선택 버튼 메뉴 -->
								<div class="d-flex justify-content-around">

									<i class="mdi mdi-account-multiple-outline" style='font-size: 30pt;'>
									</i>
									<i class="mdi mdi-account-check" id='wannaBeFriend' style='font-size: 30pt;'>
									</i>
									<i class="mdi mdi-account-search" style='font-size: 30pt;'>
									</i>
									 <i class="mdi mdi-sleep-off" style='font-size: 30pt;'>
									 </i>

								</div>

								<!-- 상단 친구 종류 선택 버튼 메뉴 -->
								<form>

									<div class='d-flex justify-content-center'>
										<div class="input-group mb-3 " style='width: 50%;'>
											<input type="text" class="form-control form-control-lg"
												placeholder="검색어를 입력해주세요" name='searchKeyword'
												id='searchKeyword'>
											<div class="input-group-append">
												<button class="btn btn-lg btn-outline-primary" type="button"
													id="explore">
													<i class="mdi mdi-magnify" style='font-size: 18pt;'></i>
												</button>
											</div>
										</div>
									</div>
								</form>
								<!-- 기본 친구목록화면 시작 -->
								<c:if test="${!empty friendsList}">
									<c:forEach items='${friendsList}' var='chatFriend'>

										<div class="card friends">
											<div class="card-body">
												<div class='row'>
													<div class='col-lg-4'>
														<img alt="" src="/images/avatar/1.jpg"
															class='rounded img-fluid' alt="Responsive image">
													</div>
													<div class='col-lg-8'>
														<h5 class="card-title">${chatFriend.chatFriendNo}</h5>
														<p class="card-text">기존친구임 With supporting text below
															as a natural lead-in to additional content.</p>
														<a href="#" class="btn btn-primary">${chatFriend.userNickname}</a>
													</div>
												</div>
											</div>
										</div>

									</c:forEach>

								</c:if>
								<!-- 기본 친구목록화면 끝-->





<!-- 친구되고싶어하는 사람들 나오는 화면 시작 -->
								<c:if test="${!empty wannaBeFreindList}">

									<c:forEach items='${wannaBeFreindList}' var='chatFriend'>

										<div class="card friends">
											<div class="card-body">
												<div class='row'>
													<div class='col-lg-4'>
														<img alt="" src="/images/avatar/1.jpg"
															class='rounded img-fluid' alt="Responsive image">
													</div>
													<div class='col-lg-8'>
														<h5 class="card-title">${chatFriend.userNickname}</h5>
														<p class="card-text">With supporting text below as a
															natural lead-in to additional content.</p>
														<a href="#" class="btn btn-primary">${chatFriend.userNo}</a>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<!-- 친구되고싶어하는 사람들 나오는 화면 끝-->




								<!-- 친구검색시 나오는 화면 시작 -->
								<c:if test="${!empty searchList}">

									<c:forEach items='${searchList}' var='chatFriend'>

										<div class="card friends">
											<div class="card-body">
												<div class='row'>
													<div class='col-lg-4'>
														<img alt="" src="/images/avatar/1.jpg"
															class='rounded img-fluid' alt="Responsive image">
													</div>
													<div class='col-lg-8'>
														<h5 class="card-title">${chatFriend.userNickname}</h5>
														<p class="card-text">With supporting text below as a
															natural lead-in to additional content.</p>
														<a href="#" class="btn btn-primary">${chatFriend.userNo}</a>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<!-- 친구검색시 나오는 화면 끝-->
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
							<div class='card-body'>8888주ㅡㄹㅇ야</div>
						</div>
					</div>

				</div>

				<!-- 오른쪽컬럼끝야 -->


			</div>
			<!-- row 엔드 -->




		</div>
		<!--**********************************
            Content body end
        
        ***********************************-->

		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>
					Copyright &copy; Designed & Developed by <a
						href="https://themeforest.net/user/quixlab">Quixlab</a> 2018
				</p>
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
		var checkSessionUser = ${empty sessionScope.user};

		$("#searchKeyword").focus(function() {
			$(this).attr("style", "border: 2px solid #f5a142");
		});

		$("#searchKeyword").blur(function() {
			$(this).attr("style", "");
		});
		
		$("#explore").on("click", function() {
		var keyword = $("#searchKeyword").val()
		$("form").attr("method", "POST").attr("action",
		"/chat/searchChatFriend").submit();
		});
		
		$("#wannaBeFriend").on("click", function() {
			alert("친구가 되줘요");
			$("form").attr("method", "POST").attr("action",
			"/chat/wannaBeFriend").submit();
			});

	});
</script>

	<!-- 공통 툴바용 스크립트 -->
	<script src="/js/custom/toolbarScript.js"></script>

	<!-- 채팅 사이드 툴바 스크립트 -->
	<script src="/js/custom/chatSideBar.js"></script>


	<!--  ///////////////////////// JavaScript ////////////////////////// -->
</body>

</html>