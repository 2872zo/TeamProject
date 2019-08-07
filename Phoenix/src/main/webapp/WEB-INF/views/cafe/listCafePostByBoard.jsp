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
			<c:import url="/WEB-INF/views/common/brand-logo.jsp"/>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<c:import url="/WEB-INF/views/common/cafeToolbar.jsp"></c:import>
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
					</ol>
				</div>
			</div>
			<div id="container-fluid">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">${board.boardName }</h4>
							<div class="table-responsive">
								<form id="boardPage">
									<input type="hidden" name="currentPage">
								</form>
								<p>총 ${postTotalCount }개 중 ${search.startRowNum} - ${search.endRowNum }</p>
								<table class="table header-border">
									<thead class="thead-light">
										<tr>
											<c:if test="${cafeMember.memberGrade eq 'cg100' or cafeMember.memberGrade eq 'cg101'}">
												<th><input type="checkbox"></th>
											</c:if>
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
												<input type="hidden" class="postNo"	value="${noticePost.postNo }" />
												<input type="hidden" class="boardNo" value="${noticePost.boardNo }" />
												<input type="hidden" class="memberNo" value="${noticePost.memberNo }" />
												<input type="hidden" class="boardName" value="${noticePost.boardName }" />
												<c:if test="${cafeMember.memberGrade eq 'cg100' or cafeMember.memberGrade eq 'cg101'}">
													<td></td>
												</c:if>
												<td class="postTitle">
													<c:if test="${noticePost.boardName eq '공지게시판' }">
														<span class="badge badge-danger">공지</span>
													</c:if> <c:if test="${noticePost.boardName ne '공지게시판' }">
														<span class="badge badge-warning">공지</span>
													</c:if> 
													${noticePost.postTitle }
												</td>
												<td>${noticePost.memberNickname }</td>
												<td>${noticePost.regDate }</td>
												<td>${noticePost.viewCount }</td>
												<td>${noticePost.likeCount }</td>
											</tr>
										</c:forEach>

										<c:forEach items="${bestPostList }" var="bestPost">
											<tr style="background: rgba(255, 203, 92, 0.3);">
												<input type="hidden" class="postNo"	value="${bestPost.postNo }" />
												<input type="hidden" class="boardNo" value="${bestPost.boardNo }" />
												<input type="hidden" class="memberNo" value="${bestPost.memberNo }" />
												<input type="hidden" class="boardName" value="${bestPost.boardName }" />
												<c:if test="${cafeMember.memberGrade eq 'cg100' or cafeMember.memberGrade eq 'cg101'}">
													<td></td>
												</c:if>
												<td  class="postTitle">
													<span class="badge" style="background:rgba(235, 223, 61, 1);">Best</span>
													${bestPost.postTitle }
												</td>
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
												<c:if test="${cafeMember.memberGrade eq 'cg100' or cafeMember.memberGrade eq 'cg101'}">
													<td><input type="checkbox"></td>
												</c:if>
												<td class="postTitle">${post.postTitle }</td>
												<td>${post.memberNickname }</td>
												<td>${post.regDate }</td>
												<td>${post.viewCount }</td>
												<td>${post.likeCount }</td>
											</tr>
										</c:forEach>

										<tr>
											<c:if test="${cafeMember.memberGrade eq 'cg100' or cafeMember.memberGrade eq 'cg101'}">
												<td></td>
											</c:if>
											<td colspan="4">
												<c:import url="/WEB-INF/views/common/pageNavigator.jsp">
													<c:param name="subject" value="Post" />
												</c:import>
											</td>
											<td style="text-align: center;">
												<c:if test="${board.boardType eq 'cb100' and (cafeMember.memberGrade eq 'cg100' or cafeMember.memberGrade eq 'cg101') }">
													<span><input type="button" name="addPostButton" class="btn mb-1 btn-outline-dark btn-sm" value="글쓰기"></span>
												</c:if>
												<c:if test="${board.boardType ne 'cb100'}">
													<span><input type="button" name="addPostButton" class="btn mb-1 btn-outline-dark btn-sm" value="글쓰기"></span>
												</c:if>
												
												<c:if test="${cafeMember.memberGrade eq 'cg100' or cafeMember.memberGrade eq 'cg101'}">
													<span><input type="button" name="movePostButton" class="btn mb-1 btn-outline-dark btn-sm" value="이동"></span>
													<span><input type="button" name="deletePostButton" class="btn mb-1 btn-outline-dark btn-sm" value="삭제"></span>
												</c:if>
												<!-- 게시글 이동을 위한 태그 -->
												<input type="hidden" id="targetPostList">
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
	<script>
    	var memberNo = '${cafeMember.memberNo}'
    	var userNo ='${user.userNo}'
    	var cafeNo= '${cafeMember.cafeNo}'
		var cafeURL = "${cafeURL}";
    </script>
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/js/custom/menubarCafe.js"></script>
	<script src="/js/custom/cafeCommon.js"></script>

	<!-- 이 페이지에서 사용하는 스크립트 -->
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
						sweetAlert("게시글 이동 실패","이동할 게시글을 선택하십시오.","error");
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
			            var option = "width = 280, height = 135, top = 100, left = 200, location = no"
			            openWin = window.open(url, name, option);
			            $("#targetPostList").val(targetPostList);
					}
				});	

			});


			
			//체크된 게시글 삭제
			$(function(){
				$("[name=deletePostButton]").on("click", function(){

					swal({
						title:"삭제 확인",
						text:"선택한 게시글을 삭제하시겠습니까?",
						type:"warning",
						showCancelButton:!0,
						confirmButtonColor:"#DD6B55",
						confirmButtonText:"네",
						cancelButtonText:"아니오",
						closeOnConfirm:!1},
						function(){
							countCheck = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked");
							
							var postNoList = "";
							if(countCheck.length < 1){
								sweetAlert("게시글 삭제 실패","삭제할 게시글을 선택하십시오.","error");
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
						}//else end
					});//swal end
				});	//.on end
			});//jquery end
			

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
