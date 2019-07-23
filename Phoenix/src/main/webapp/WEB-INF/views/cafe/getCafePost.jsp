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

<!-- Date picker plugins css -->
<link href="/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">
<link rel="stylesheet" href="/css/custom/advenced-search.css">
<script src="https://kit.fontawesome.com/e589319d43.js"></script>

<!-- 이페이지에서만 사용 -->
<link href="/css/custom/form-validation.css" rel="stylesheet">

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

<style>

.postTitle:hover, .boardName:hover {
	cursor : pointer;
	text-decoration: underline;
}

#layerPopup {
	padding: 20px;
	border: 4px solid #ddd;
	position: absolute;
	left: 100px;
	top: 100px;
	background: #fff;
}

#layerPopup button {
	cursor: pointer;
}

.writer:hover{
	color:#76838f;
	text-decoration: underline;
}

</style>

<title>${search.cafeURL}</title>
</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"	stroke-width="3" stroke-miterlimit="10" />
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
							<div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="javascript:void()">English</a></li>
										<li><a href="javascript:void()">Dutch</a></li>
									</ul>
								</div>
							</div>
						</li>
						
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
			<div class="row page-titles mx-0" style="margin:0px;">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">${cafeURL }</li>
                        <li class="breadcrumb-item active">${post.boardName }</li>
                    </ol>
                </div>
            </div>
			
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="card-title" style="color:#000000;" style="overflow:hidden;">
								<span>${post.postTitle }</span> 
								<span style="float:right;">
									<span style="color:#76838f; font-size:0.75em;">${post.regDate }&nbsp; </span>
									<a href="#" name="update" class="badge badge-dark">수정</a>
									<a href="#"	name="delete" class="badge badge-dark">삭제</a>
								</span>
							</div>
							<div>

								<input type="hidden" name="cafeURL"> 
								<input type="hidden" name="memberNo"> 
								<input type="hidden" name="memberNickname">
								<input type="hidden" name="boardName">
										
								<div>
									<a class="writer" href="#">
										<span style="font-weight:bold;">${post.memberNickname }</span>
										<input type="hidden" name="memberNo" value="${post.memberNo }">
									</a> &nbsp; 조회수 &nbsp;${post.viewCount }
								</div>
								
								<hr/>
								
								<div class="text-center" style="overflow:hidden;">${post.postContent }</div><br/>
								
								<div style="text-align: center;">
									<button type="button" id="postLikeButton" class="btn mb-1 btn-flat btn-outline-dark">
										<span class="far fa-thumbs-up"></span>&nbsp;<span class="count">${post.likeCount }</span>
									</button>
								</div>
								<hr/>
								
								<div class="replyItems"></div>

							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- row -->

		</div>
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

	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.init.js"></script>
	
	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script>
    	var memberNo = '${cafeMember.memberNo}'
    	var userNo ='${user.userNo}'
    	var cafeNo= '${cafeMember.cafeNo}'
		var cafeURL = "${cafeURL}";
    </script>
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/js/custom/menubarCafe.js"></script>
	<script src="/js/custom/cafeCommon.js"></script>

	<!-- 이 페이지 전용 script -->
	<script>
		$(function() {
			$("[name=cafeURL]").val('${cafeURL}');
			$("form").attr("method", "POST").attr("action",	"addPost");

			$("#submitButton").on("click",function(e){
				$("[name=boardName]").val( $("[name=boardNo] option:selected").text());
			});

			fncGetReplyList(1);
			
			$("[name=update]").on("click",function(){
				location.href = "/cafe/${cafeURL}/updatePost/${search.postNo}";
			});

			$("[name=delete]").on("click",function(){
				location.href = "/cafe/${post.cafeURL}/deletePost?postNo=${post.postNo}&boardNo=${post.boardNo}";
			});

			$(".writer").on("click", function(){
				var tmpForm = document.createElement("form");
				tmpForm.setAttribute("charset", "UTF-8");
				tmpForm.setAttribute("method", "Post");
				tmpForm.setAttribute("action", "/cafe/${cafeURL}/getPostByMember");

				var tmpInputCafeURL = document.createElement("input");
				tmpInputCafeURL.setAttribute("type", "hidden");
				tmpInputCafeURL.setAttribute("name", "cafeURL");
				tmpInputCafeURL.setAttribute("value", "${cafeURL}");
				tmpForm.appendChild(tmpInputCafeURL);

				var tmpInputMemberNo = document.createElement("input");
				tmpInputMemberNo.setAttribute("type", "hidden");
				tmpInputMemberNo.setAttribute("name", "memberNo");
				tmpInputMemberNo.setAttribute("value", $(this).parent().find("input[name=memberNo]").val());
				tmpForm.appendChild(tmpInputMemberNo);

				document.body.appendChild(tmpForm);
				tmpForm.submit();
			});
		});

		function fncGetReplyList(currentPage){
			$("div .replyItems").unbind();
			$("div .replyItems").load("/cafe/${post.cafeURL}/getReplyList/${post.postNo}", {currentPage:currentPage});
		}

		
		$(function(){
			$("#postLikeButton").on("click",function(){
				var JSONPostNo =  JSON.stringify({cafeURL : "${cafeURL}", postNo:${post.postNo}, userNo:${user.userNo}, searchCondition : "0"});
				console.log(JSONPostNo); 

				$.ajax({
						type : "POST",
						contentType: "application/json",
						url : "/cafe/${cafeURL}/json/addLike",
						dataType : "JSON",
						data: JSONPostNo,
						success : function(data) {
// 							alert("success");
							
// 							debugger;
							if(data.result == false){
								alert("이미 추천한 게시글입니다.")
							}else{
								$("#postLikeButton").find(".count").text(data.likeCount);
							}
							
						},
						error : function(data) {
							alert("error : " + data)
// 							debugger;
						}
					});

				
				});

			});

		<%--
				function updatePost(){
					var getPost = $("#mainContent").html();

					$("#mainContent").load("/cafe/${post.cafeURL}/updatePost/${post.postNo} #mainContent", function(response, status, xhr){
		 				alert("response : " + response);
`
						var obj = response.trim();
						history.replaceState(getPost, "getPost", "/cafe/${post.cafeURL}/getPost/${post.postNo}");
						history.pushState(obj,"updatePost","/cafe/${post.cafeURL}/updatePost/${post.postNo}");
					});

					window.CKEDITOR_BASEPATH = "/ckeditor/";
					$.getScript("/ckeditor/ckeditor.js", function(data, status, xhr){
						$.getScript("/js/form-validation.js");
						$.getScript("/js/updatePost.js");
					});
				}

				$(window).on('popstate', function(event) {
					console.log(event.originalEvent.state);
					$("#mainContent").html( event.originalEvent.state);
				});
			--%>
		
	</script>
	
</body>

</html>
