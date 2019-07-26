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

checkbox
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
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
			
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">작성글 검색</h4>
							
							<!-- tap start --> 
							<div class="default-tab">
                                    <ul class="nav nav-tabs mb-3" role="tablist">
                                        <li class="nav-item"><a class="nav-link <c:if test='${search.status eq 0 }'>active</c:if>" data-toggle="tab" href="#post">게시글</a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link <c:if test='${search.status eq 1 }'>active</c:if>" data-toggle="tab" href="#reply">댓글</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                    
                                        <div class="tab-pane fade <c:if test='${search.status eq 0 }'>show active</c:if>" id="post" role="tabpanel">
                                            <div class="table-responsive">
												<form id="boardPage">
													<input type="hidden" name="currentPage">
												</form>
												<p>총 ${postTotalCount }개 중 ${search.startRowNum} - ${search.endRowNum }</p>
												<table class="table header-border">
													<thead class="thead-light">
														<tr>
															<tr>
																<td>게시판</td>
																<td>제목</td>
																<td>작성일</td>
																<td>조회수</td>
																<td>추천수</td>
															</tr>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${postList }" var="post">
															<tr>
																<input type="hidden" class="postNo" value="${post.postNo }"/>
																<input type="hidden" class="boardNo" value="${post.boardNo }"/>
																<input type="hidden" class="memberNo" value="${post.memberNo }"/>
																<td class="boardName">${post.boardName }</td>
																<td class="postTitle">${post.postTitle }</td>
																<td>${post.regDate }</td>
																<td>${post.viewCount }</td>
																<td>${post.likeCount }</td>
															</tr>
														</c:forEach>
				
														<tr>
															<td colspan="6">
																<div class="container d-flex justify-content-center">
																	 <nav>
																	  <!-- 크기조절 :  pagination-lg pagination-sm-->
																	  <ul class="pagination" style="align-content:  center;">
																	    
																	    <!--  <<== 좌측 nav -->
																	  	<c:if test="${ postPage.currentPage <= postPage.pageUnit }">
																	 		<li class="page-item disabled">
																	 			<span class="page-link">&laquo;</span>
																	 		</li>
																		</c:if>
																		<c:if test="${ postPage.currentPage > postPage.pageUnit }">
																			<li class="page-item">
																				<a class="page-link" href="javascript:fncGetMyPostList('${ postPage.beginUnitPage-1}')">
																					<span style='color:#f5a142;'>&laquo;</span>
																				</a>
																			</li>
																		</c:if>
																	    
																	    <!--  중앙  -->
																		<c:forEach var="i"  begin="${postPage.beginUnitPage}" end="${postPage.endUnitPage}" step="1">
																			
																			<!--  현재 page 가르킬경우 : active -->
																			<c:if test="${ postPage.currentPage == i }">
																			    <li class="page-item active " aria-current="page" 
																			    >
																			    	<span class="page-link" style='background-color:#f5a142; border: 1px solid #f5a142'>
																			    		${ i }
																			    		<span class="sr-only">(current)</span>
																			    	</span>
																			    </li>
																			</c:if>	
																			
																			<!-- 현재 page가 아닐 경우 -->				
																			<c:if test="${ postPage.currentPage != i}">	
																				<li class="page-item">
																					<a class="page-link" href="javascript:fncGetMyPostList('${ i }');" style='color:#f5a142;'>${ i }</a>
																				</li>
																			</c:if>
																		</c:forEach>
																	    
																	     <!--  우측 nav==>> -->
																	     <c:if test="${ postPage.endUnitPage >= postPage.maxPage }">
																	  		<li class="page-item disabled">
																	  			<span class="page-link">
																	  				<span>&raquo;</span>
																	  			</span>
																	  		</li>
																		</c:if>
																		<c:if test="${ postPage.endUnitPage < postPage.maxPage }">
																			<li class="page-item">
																				<a class="page-link"  href="javascript:fncGetMyPostList('${postPage.endUnitPage+1}')">
																		        	<span style='color:#f5a142;'>&raquo;</span>
																		      	</a>
																		    </li>
																		</c:if>
																	  </ul>
																	</nav>
															</div>
															</td>
														</tr>
				
													</tbody>
												</table>
											</div>
                                        </div>
                                        
                                        <div class="tab-pane fade <c:if test='${search.status eq 1 }'>show active</c:if>" id="reply">
                                            <div class="table-responsive">
												<form id="boardPage">
													<input type="hidden" name="currentPage">
												</form>
												<p>총 ${postTotalCount }개 중 ${search.startRowNum} - ${search.endRowNum }</p>
												<table class="table header-border">
													<thead class="thead-light">
														<tr>
															<tr>
																<td>내용</td>
																<td>작성일</td>
																<td>추천수</td>
															</tr>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${replyList }" var="reply">
															<tr>
																<input type="hidden" class="postNo" value="${reply.postNo }"/>
																<input type="hidden" class="memberNo" value="${reply.memberNo }"/>
																<td class="postTitle">${reply.replyContent }</td>
																<td>${reply.regDate }</td>
																<td>${reply.likeCount }</td>
															</tr>
														</c:forEach>
				
														<tr>
															<td colspan="6">
																<div class="container d-flex justify-content-center">
																	 <nav>
																	  <!-- 크기조절 :  pagination-lg pagination-sm-->
																	  <ul class="pagination" style="align-content:  center;">
																	    
																	    <!--  <<== 좌측 nav -->
																	  	<c:if test="${ replyPage.currentPage <= replyPage.pageUnit }">
																	 		<li class="page-item disabled">
																	 			<span class="page-link">&laquo;</span>
																	 		</li>
																		</c:if>
																		<c:if test="${ replyPage.currentPage > replyPage.pageUnit }">
																			<li class="page-item">
																				<a class="page-link" href="javascript:fncGetMyReplyList('${ replyPage.beginUnitPage-1}')">
																					<span style='color:#f5a142;'>&laquo;</span>
																				</a>
																			</li>
																		</c:if>
																	    
																	    <!--  중앙  -->
																		<c:forEach var="i"  begin="${replyPage.beginUnitPage}" end="${replyPage.endUnitPage}" step="1">
																			
																			<!--  현재 page 가르킬경우 : active -->
																			<c:if test="${ replyPage.currentPage == i }">
																			    <li class="page-item active " aria-current="page" 
																			    >
																			    	<span class="page-link" style='background-color:#f5a142; border: 1px solid #f5a142'>
																			    		${ i }
																			    		<span class="sr-only">(current)</span>
																			    	</span>
																			    </li>
																			</c:if>	
																			
																			<!-- 현재 page가 아닐 경우 -->				
																			<c:if test="${ replyPage.currentPage != i}">	
																				<li class="page-item">
																					<a class="page-link" href="javascript:fncGetMyReplyList('${ i }');" style='color:#f5a142;'>${ i }</a>
																				</li>
																			</c:if>
																		</c:forEach>
																	    
																	     <!--  우측 nav==>> -->
																	     <c:if test="${ replyPage.endUnitPage >= replyPage.maxPage }">
																	  		<li class="page-item disabled">
																	  			<span class="page-link">
																	  				<span>&raquo;</span>
																	  			</span>
																	  		</li>
																		</c:if>
																		<c:if test="${ replyPage.endUnitPage < replyPage.maxPage }">
																			<li class="page-item">
																				<a class="page-link"  href="javascript:fncGetMyReplyList('${replyPage.endUnitPage+1}')">
																		        	<span style='color:#f5a142;'>&raquo;</span>
																		      	</a>
																		    </li>
																		</c:if>
																	  </ul>
																	</nav>
															</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											
                                        </div>
                                        
                                    </div>
                                </div>
                               	<!-- tap end --> 
                               
							
							
							
							
							
							
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
	<script src="/plugins/moment/moment.js"></script>
    <script src="/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <script src="/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    
	<script>
			var cafeURL = '${search.cafeURL}';

			//세부검색 시작
			$(function(){
				$("#advSubmitButton").on("click", function(){
					$("[name=currentPage]").val(1);
				});
			});

			//세부검색 시작
			$(function(){
				$("#submitButton").on("click", function(){
					location.href = "/cafe/" + "${cafeURL}" + "/search?searchKeyword=" + $("#searchKeyword").val(); 
				});
			});

			//페이지 이동
			function fncGetInnerSearchList(idx){
				$("[name=currentPage]").val(idx);
				$("#searchForm").attr("method","GET").attr("action","/cafe/" + cafeURL + "/search").submit();	
			};

			//datePicker 생성
			$(function(){
				$('#termStart').datepicker({
			    	format:'yy-mm-dd',
			        autoclose: true,
			        todayHighlight: true
			    });

			    $('#termEnd').datepicker({
			    	format:'yy-mm-dd',
			        autoclose: true,
			        todayHighlight: true
			    });
			});
			
			//검색조건 유지
			$(function(){
				$("[name=currentPage]").val(${search.currentPage });
				$( "#termStart" ).val('${search.termStart}');
			    $( "#termEnd" ).val('${search.termEnd}');	
				$("[name=searchKeyword]").val('${search.searchKeyword}');
				
				$(".boardOption").each(function(){
				    if($(this).val()==${search.boardNo}){
				      $(this).attr("selected","selected");
				    }
				});
				
				$(".searchOption").each(function(){
				    if($(this).val()==${empty search.searchCondition? 0 : search.searchCondition}){
				      $(this).attr("selected","selected");
				    }
				});
			});

			//게시글 조회
			$(function(){
				$(".postTitle").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getPost/" + 	$(this).parent().find(".postNo").val();				
				});			
			});

			//게시판 조회
			$(function(){
				$(".boardName").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getBoard/" + $(this).parent().find(".boardNo").val();
				});
			});
	</script>

	<!-- 이 페이지에서만 사용하는 스크립트 -->
	<script>
			var cafeURL = '${search.cafeURL}';

			//세부검색 시작
			$(function(){
				$("#advSubmitButton").on("click", function(){
					$("[name=currentPage]").val(1);
				});
			});

			//세부검색 시작
			$(function(){
				$("#submitButton").on("click", function(){
					location.href = "/cafe/" + "${cafeURL}" + "/search?searchKeyword=" + $("#searchKeyword").val(); 
				});
			});

			//페이지 이동
			function fncGetMemberPostList(idx){
				$("[name=currentPage]").val(idx);
				$("#searchForm").submit();	
			};

			//datePicker 생성
			$(function(){
				$( "#termStart" ).datepicker({dateFormat:'yy-mm-dd'});
			    $( "#termEnd" ).datepicker({dateFormat:'yy-mm-dd'});
			});
			
			//검색조건 유지
			$(function(){
				$("#searchForm").attr("method","POST").attr("action","/cafe/${cafeURL}/getPostByMember")
				
				$("[name=currentPage]").val(${search.currentPage });
				$( "#termStart" ).val('${search.termStart}');
			    $( "#termEnd" ).val('${search.termEnd}');	
				$("[name=searchKeyword]").val('${search.searchKeyword}');
				$("[name=memberNo]").val('${search.memberNo}');
				
				$(".boardOption").each(function(){
				    if($(this).val()==${search.boardNo}){
				      $(this).attr("selected","selected");
				    }
				});
				
				$(".searchOption").each(function(){
				    if($(this).val()==${empty search.searchCondition? 0 : search.searchCondition}){
				      $(this).attr("selected","selected");
				    }
				});
			});

			//게시글 조회
			$(function(){
				$(".postTitle").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getPost/" + 	$(this).parent().find(".postNo").val();				
				});			
			});

			//게시판 조회
			$(function(){
				$(".boardName").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getBoard/" + $(this).parent().find(".boardNo").val();
				});
			});
	</script>
</body>

</html>
