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
							<form class="form-horizontal" role="form" id="searchForm">
								<div class="form-row">
									<input type="hidden" name="currentPage">
									
									<div class="col">
										<div class="form-group">
											<label for="termStart">기간 시작</label> 
											<div class="input-group">
												<span class="input-group-prepend">
													<span class="input-group-text">
														<i class="mdi mdi-calendar-check"></i>
													</span>
												</span>
												<input class="form-control" type="text" id="termStart" name="termStart" readonly="readonly" style="text-align:center;">
											</div>
										</div>
									</div>
									
									<div class="col">
										<div class="form-group">
											<label for="termEnd">기간 끝</label>
											<div class="input-group"> 
												<span class="input-group-prepend">
													<span class="input-group-text">
														<i class="mdi mdi-calendar-check"></i>
													</span>
												</span>
												<input class="form-control" type="text" id="termEnd" name="termEnd" readonly="readonly" style="text-align:center;">
											</div>
										</div>
									</div>
		
									<div class="col">
										<div class="form-group">
											<label for="boardNo">게시판</label> 
											<select	class="form-control hideOption" name="boardNo">
												<option value="0" class="boardOption">전체</option>
												<c:forEach var="board" items="${boardOption }">
													<option value="${board.boardNo }" class="boardOption">${board.boardName }</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								
								<div class="form-row">
									<div class="col">	
										<div class="form-group">
											<label for="searchCondition">구분</label> <select
												class="form-control hideOption" name="searchCondition">
												<option value="0" class="searchOption">전체</option>
												<option value="1" class="searchOption">제목</option>
												<option value="2" class="searchOption">내용</option>
											</select>
										</div>
									</div>
									
									
									<div class="col">
										<div class="form-group">
											<label for="searchKeyword">키워드</label> 
											<div class="input-group">
												<input type="text" class="form-control" name="searchKeyword" id="advSearchKeyword">
												<div class="input-group-append">
	                                                <button type="submit" class="btn btn-primary" style="margin:0px; padding:7px;" id="advSubmitButton">
														<span class="searchIcon" aria-hidden="true" style="vertical-align:middle;"></span>
													</button>
	                                            </div>
                                            </div>
										</div>
									</div>
								<input type="hidden" name="memberNo" value="${search.memberNo }">
								</div><!-- form-row end -->
							</form><!-- form end -->
							
						</div><!-- row end -->
					</div><!-- card-body end -->
				</div><!-- card end -->
			
			
			
			
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">작성글 검색</h4>
							<div class="table-responsive">
								<form id="boardPage">
									<input type="hidden" name="currentPage">
								</form>
								<p>총 ${postTotalCount }개 중 ${search.startRowNum} - <c:if test="${postTotalCount gt search.endRowNum }">${search.endRowNum }</c:if><c:if test="${postTotalCount le search.endRowNum }">${postTotalCount }</c:if></p>
								<table class="table header-border">
									<thead class="thead-light">
										<tr>
											<tr>
												<td>게시판</td>
												<td>제목</td>
												<td>작성자</td>
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
												<td>${post.memberNickname }</td>
												<td>${post.regDate }</td>
												<td>${post.viewCount }</td>
												<td>${post.likeCount }</td>
											</tr>
										</c:forEach>

										<tr>
											<td colspan="6">
												<c:import url="/WEB-INF/views/common/pageNavigator.jsp">
													<c:param name="subject" value="InnerSearch" />
												</c:import>
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
