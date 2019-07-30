<%@ page contentType="text/html; charset=utf-8"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../common/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->

<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">

<style>
.error-text {
	font-size: 2rem;
	line-height: 5rem;
	color: #FFAF00;
}
img {
    vertical-align: middle;
    border-style: none;
    width: 150px;
}
</style>
<title>SNS TIMELINE</title>
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
				<li class="breadcrumb-item"><a href="javascript:void(0)">SNS</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">TIMELINE</a></li>
			</ol>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-4 col-xl-3">
				<div class="card">
					<div class="card-body">
						<div class="media align-items-center mb-4">
							<img class="mr-3" src="images/avatar/11.png" width="80"
								height="80" alt="">
							<div class="media-body">
								<h3 class="mb-0">지니</h3>
								<p class="text-muted mb-0">Korea</p>
							</div>
						</div>

						<div class="row mb-5">
							<div class="col">
								<div class="card card-profile text-center">
									<span class="mb-1 text-primary"><i class="icon-people"></i></span>
									<h3 class="mb-0">263</h3>
									<p class="text-muted px-4">Following</p>
								</div>
							</div>
							<div class="col">
								<div class="card card-profile text-center">
									<span class="mb-1 text-warning"><i
										class="icon-user-follow"></i></span>
									<h3 class="mb-0">263</h3>
									<p class="text-muted">Followers</p>
								</div>
							</div>
							<div class="col-12 text-center">
								<button class="btn btn-danger px-5">무슨버튼할까</button>
							</div>
						</div>

						<h4>About Me</h4>
						<p class="text-muted">Hi, I'm Pikamy, has been the industry
							standard dummy text ever since the 1500s.</p>
						<ul class="card-profile__info">
							<li class="mb-1"><strong class="text-dark mr-4">Mobile</strong>
								<span>01793931609</span></li>
							<li><strong class="text-dark mr-4">Email</strong> <span>name@domain.com</span></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- 피드시작 -->
			<div class="col-lg-8 col-xl-9">
				<div class="card">
					<div class="card-body">
						<c:set var="i" value="0" />
						<c:forEach var="timeLine" items="${timeLine}">
							<c:set var="i" value="${i+1}" />
							<div class="media media-reply">
								<c:if test="${search.subject eq 100 }">
									<i class="mdi mdi-facebook-box"></i>
								</c:if>
								<c:if test="${search.subject eq 200 }">
									<i class="mdi mdi-instagram"></i>
								</c:if>
								<div class="media-body">
									<div class="d-sm-flex justify-content-between mb-2">
										<h5 class="mb-sm-0">
											${timeLine.postId} 
											<small class="text-muted ml-3">${timeLine.regDate }</small>
										</h5>
										<div class="media-reply__link">
											<button class="btn btn-transparent p-0 mr-3">
												<i class="fa fa-thumbs-up"></i>
											</button>
											${timeLine.likeCount }
											<button
												class="btn btn-transparent text-dark font-weight-bold p-0 ml-2">Reply</button>
										</div>
									</div>

									<p>${timeLine.post }</p>
									
									<c:set var = "j" value = "0"/>
									
									<c:if test="${!empty timeLine.img1List}"> <!-- 이미지1 -->
									<c:forEach var ="img1List" items="${timeLine.img1List }" varStatus="status">
									<c:set var="j" value="${j+1}" />
	           							<a href="${timeLine.img1LinkList[status.index] }"><img alt="" src="${img1List}" style="margin-left:20px; margin-top: 10px"></a>
	           						</c:forEach>
	           						</c:if>
	           						
	           						
	           						<c:if test="${!empty timeLine.img2List}"> <!-- 이미지2 -->
	           						<c:forEach var ="img2List" items="${timeLine.img2List }"  varStatus="status">
	           						<c:set var="j" value="${j+1}" />
	           							<a href="${timeLine.img2LinkList[status.index] }"><img alt="" src="${img2List}" style="margin-left:20px; margin-top: 10px"></a>
	           						</c:forEach>	
	           						</c:if>
	           						
	           						
									<c:if test="${!empty timeLine.img3List}"> <!-- 이미지3 -->
									<c:forEach var ="img3List" items="${timeLine.img3List }"  varStatus="status" >
									<c:set var="j" value="${j+1}" />
	           							<a href="${timeLine.img3LinkList[status.index] }"><img alt="" src="${img3List}" style="margin-left:20px; margin-top: 10px"></a>
	           						</c:forEach>
	           						</c:if>
	           						
	           						<c:if test="${!empty timeLine.img4List}"> <!-- 이미지4 -->
									<c:forEach var ="img4List" items="${timeLine.img4List }"  varStatus="status" >
									<c:set var="j" value="${j+1}" />
	           							<a href="${timeLine.img4LinkList[status.index] }"><img alt="" src="${img4List}" style="margin-left:20px; margin-top: 10px"></a>
	           						</c:forEach>
	           						</c:if>
	           						
									<c:if test="${!empty timeLine.videoList}"> <!-- 동영상 -->
									<c:forEach var ="videoList" items="${timeLine.videoList }"  varStatus="status" >
									<c:set var="j" value="${j+1}" />
	           							<a href="${timeLine.videoLinkList[status.index] }"><video src="${videoList }"></video>blob!!!!</a>
	           						</c:forEach>
										
	           						</c:if>	           						
									
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- 피드끝 -->
		</div>
	</div>
	<!-- #/ container -->


	<!--  화면구성 div end /////////////////////////////////////-->
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
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/js/custom/menubarCafe.js"></script>
	
	<script type="text/javascript">

		$(window).scroll(function(){

			if($(window).scrollTop()>=$(document).height()- $(window).height()){

				
				}

		});
	</script>
	<script src="/js/custom/cafeCommon.js"></script>
</body>
</html>