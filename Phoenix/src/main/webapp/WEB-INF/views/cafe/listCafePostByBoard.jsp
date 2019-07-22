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
.postTitle:hover {
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

.noticeIcon {
	height: 28px;
	margin: 0px;
	padding-top: 0px;
	padding-bottom: 0px;
}

.thisNotice {
	background: #F1795E;
	border-color: #F1795E;
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
			<div class="brand-logo">
				<a href="index.html"> <b class="logo-abbr"><img
						src="/images/logo.png" alt=""> </b> <span class="logo-compact"><img
						src="/images/logo-compact.png" alt=""></span> <span
					class="brand-title"> <img src="/images/logo-text.png" alt="">
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
			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
					</ol>
				</div>
			</div>
			<div id="container-fluid">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">${search.boardName }</h4>
							<div class="table-responsive">
								<form id="boardPage">
									<input type="hidden" name="currentPage">
								</form>
								<p>총 ${postTotalCount }개 중 ${search.startRowNum} - ${search.endRowNum }</p>
								<table class="table header-border">
									<thead class="thead-light">
										<tr>
											<th><input type="checkbox"></th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
											<th>추천수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${noticePostList }" var="noticePost">
											<tr style="background: #E1DFDE;">
												<input type="hidden" class="postNo"	value="${bestPost.postNo }" />
												<input type="hidden" class="boardNo" value="${bestPost.boardNo }" />
												<input type="hidden" class="memberNo" value="${bestPost.memberNo }" />
												<input type="hidden" class="boardName" value="${bestPost.boardName }" />
												<td></td>
												<td class="postTitle">
													<c:if test="${noticePost.boardName eq '공지게시판' }">
														<span class="badge badge-danger">공지</span>
													</c:if> <c:if test="${noticePost.boardName ne '공지게시판' }">
														<span class="badge badge-warning">공지</span>
													</c:if> ${noticePost.postTitle }</td>
												<td>${noticePost.memberNickname }</td>
												<td>${noticePost.regDate }</td>
												<td>${noticePost.viewCount }</td>
												<td>${noticePost.likeCount }</td>
											</tr>
										</c:forEach>

										<c:forEach items="${bestPostList }" var="bestPost">
											<tr style="background: blue;">
												<input type="hidden" class="postNo"	value="${bestPost.postNo }" />
												<input type="hidden" class="boardNo" value="${bestPost.boardNo }" />
												<input type="hidden" class="memberNo" value="${bestPost.memberNo }" />
												<input type="hidden" class="boardName" value="${bestPost.boardName }" />
												<td></td>
												<td>${bestPost.memberNickname }</td>
												<td>${bestPost.regDate }</td>
												<td>${bestPost.viewCount }</td>
												<td>${bestPost.likeCount }</td>
											</tr>
										</c:forEach>

										<c:forEach items="${postList }" var="post">
											<tr>
												<input type="hidden" class="postNo" value="${post.postNo }" />
												<input type="hidden" class="boardNo" value="${post.boardNo }" />
												<input type="hidden" class="memberNo" value="${post.memberNo }" />
												<input type="hidden" class="boardName" value="${post.boardName }" />
												<td><input type="checkbox"></td>
												<td class="postTitle">${post.postTitle }</td>
												<td>${post.memberNickname }</td>
												<td>${post.regDate }</td>
												<td>${post.viewCount }</td>
												<td>${post.likeCount }</td>
											</tr>
										</c:forEach>

										<tr>
											<td colspan="3"></td>
											<td>
												<c:import url="/WEB-INF/views/common/pageNavigator.jsp">
													<c:param name="subject" value="Post" />
												</c:import>
											</td>
											<td colspan="1"></td>
											<td style="text-align: center;">
												<span><input type="button" name="addPostButton" class="btn mb-1 btn-outline-dark btn-sm" value="글쓰기"></span>
												<span><input type="button" name="movePostButton" class="btn mb-1 btn-outline-dark btn-sm" value="이동"></span>
												<span><input type="button" name="deletePostButton" class="btn mb-1 btn-outline-dark btn-sm" value="삭제"></span>
											</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- row -->

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
	<script src="/js/custom/cafeCommon.js"></script>
	<script src="/js/custom/scroll-top.js"></script>
	<script type="text/javascript">
	    	$(function(){
	    		$(".showMyDetail").on("click",function(){
	    			if(${cafeMember.userNo}=='400')//1. 로그인이 안되어있으면
	    			{
	    				alert("로그인하세요! (로그인창 띄우기)");
	    			}
	    			else if(${cafeMember.userNo}=='500')//카페멤버가 아니면
	    			{
	    				alert("카페에 가입하세요!(카페에가입하시겠습니까?띄우기)");
	    			}
	    			else //카페멤버라면
	    			{
// 	    				$(".myDetail").show(); 
	    			}
	    		});
	
	    		$("[name=InnerSearch]").attr("method", "GET").attr("action", "/cafe/${cafeURL}/search");
	    		
	    		$("[name=menubarSubmit]").on("click", function(){
	    			location.href = "/cafe/" + "${cafeURL}" + "/search?searchKeyword=" + $("#menubarSearch").val(); 
	    		});	
	
	    		$("[name=toManage]").on("click", function(){
	    			location.href = "/cafe/${cafeURL}/manage/getCafeStatistics";
	    		});
	    		
	    	});
	
	    	$(function(){//카페탈퇴
	    		document.querySelector(".sweet-withdraw").onclick =
		    		function(){
		    			swal({
		    				title:"카페에서 탈퇴하시겠습니까?",
		    				text:"카페 탈퇴시 작성된 게시글은 자동으로 삭제되지 않습니다.",
		    				type:"warning",
		    				showCancelButton:!0,
		    				confirmButtonColor:"#DD6B55",
		    				confirmButtonText:"예",
		    				cancelButtonText:"아니오",
		    				closeOnConfirm:!1
		    				},
		    				function(){
		    					swal("카페 탈퇴 완료","회원 탈퇴 되었습니다.","success")
		    				})
		    			}
	

				
// 	    		$(".deleteMember").on("click",function(){
// 	    			$( "#dialog" ).dialog("open");
// 	    			});
// 	    		var memberNo = '${cafeMember.memberNo}'
// 	    		$( "#dialog" ).dialog({ 
// 	    			 autoOpen: false, 
// 	    			  width: 400, 
// 	    			  modal: true, 
// 	    			  buttons: [ { 
// 	    				   text: "확인", 
// 	    				   click: function() { 
// 	    					   location.href = "/cafe/" + "${cafeURL}" + "/updateCafeMember?memberNo="+memberNo;
// 	    					  } 
// 	    			  }, 
// 	    			  { 
// 	    				   text: "취소", 
// 	    				    click: function() { 
// 	    					   $( this ).dialog( "close" ); 
// 	    					   } 
// 	    			   } 
// 	    			   ] 
// 	    		   });
	    	});
	    	
	    	$(function(){//프로필수정
	    		var memberNo = '${cafeMember.memberNo}'
	    		$(".updateProfile").on("click",function(){
	    			alert("여기")
	    			window.open("/cafe/" + "${cafeURL}"+ "/updateCafeMemberProfileView?memberNo="+memberNo,"_blank","width=600,height=700");
	    		
	    			});
	    		
	    		});
	
	    	$(function(){//카페가입
	    		$(".addMember").on("click", function(){
	    			 location.href = "/cafe/" + "${cafeURL}" + "addCafeApplicationView";
	    		});
	    		
	    	});
    </script>

	<script>
			var cafeURL = '${search.cafeURL}';
			var boardNo = ${search.boardNo};
			var openWin;
			
			function fncGetPostList(idx){
				$("[name=currentPage]").val(idx);
				$("#boardPage").attr("method","POST").attr("action", "/cafe/" + cafeURL + "/getBoard/" + boardNo).submit();
			};

			$(function(){
				$("[name=currentPage]").val(${search.currentPage });	
			});

			//게시글 조회
			$(function(){
				$(".postTitle").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getPost/" + 	$(this).parent().find(".postNo").val();				
				});			
			});

			//게시글 작성
			$(function(){
				$("[name=addPostButton]").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/addPost?boardNo=" + "${search.boardNo}";
				});
			});

			//체크된 게시글 이동을 위한 팝업레이어 출력
			$(function(){
				
				$("[name=movePostButton]").on("click", function(){
					countCheck = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked");
					
					var targetPostList = "";
					if(countCheck.length < 1){
						alert("이동할 게시글을 선택하십시오.");
						return;
					}else{
						for(var i = 0; i < countCheck.length; i++){
							if(targetPostList == ""){
								targetPostList = countCheck.eq(i).parent().parent().find(".postNo").val();
							}else{
								targetPostList = targetPostList + "," + countCheck.eq(i).parent().parent().find(".postNo").val();
							}
						}

						var url = "/cafe/${cafeURL}/movePost/${search.boardNo}?targetPostList=" + targetPostList;
			            var name = "게시글 이동";
			            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
			            openWin = window.open(url, name, option);
			            $("#targetPostList").val(targetPostList);
					}
				});	

			});


			
			//체크된 게시글 삭제
			$(function(){
				$("[name=deletePostButton]").on("click", function(){
					countCheck = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked");
					
					var postNoList = "";
					if(countCheck.length < 1){
						alert("삭제할 게시글을 선택하십시오.");
						return;
					}else{
						for(var i = 0; i < countCheck.length; i++){
							if(postNoList == ""){
								postNoList = countCheck.eq(i).parent().parent().find(".postNo").val();
							}else{
								postNoList = postNoList + "," + countCheck.eq(i).parent().parent().find(".postNo").val();
							}
						}

						var tmpForm = document.createElement("form");
						tmpForm.setAttribute("charset", "UTF-8");
						tmpForm.setAttribute("method", "Post");
						tmpForm.setAttribute("action", "/cafe/" + cafeURL + "/deletePostList");

						var tmpInputBoardNo = document.createElement("input");
						tmpInputBoardNo.setAttribute("type", "hidden");
						tmpInputBoardNo.setAttribute("name", "boardNo");
						tmpInputBoardNo.setAttribute("value", boardNo);
						tmpForm.appendChild(tmpInputBoardNo);

						tmpInputPostNoList = document.createElement("input");
						tmpInputPostNoList.setAttribute("type", "hidden");
						tmpInputPostNoList.setAttribute("name", "postNoList");
						tmpInputPostNoList.setAttribute("value", postNoList);
						tmpForm.appendChild(tmpInputPostNoList);

						document.body.appendChild(tmpForm);
						
						tmpForm.submit();
					}
				});	
			});
			

			function countCheckBox(){
				countCheck = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked").length;
				
				if(countCheck == $(":checkbox").not(":checkbox:first").length){
					$(":checkbox:first").prop("checked",true);
				}else{
					$(":checkbox:first").prop("checked",false);
				}
			}
			
			function checkAll(obj){
				$(":checkbox").prop("checked",true);
			}
			
			function unCheckAll(obj){
				$(":checkbox").prop("checked",false);
			}

			$(function(){
				var countCheck;
				
				$(":checkbox:first").on("click",function(){
					if($(":checkbox:first").is(":checked")){
						checkAll($(this));
					}else{
						unCheckAll($(this));
					}
				})
				
				$(":checkbox").on("click",function(){
					countCheckBox();
				});
			});
			
		</script>



</body>

</html>
