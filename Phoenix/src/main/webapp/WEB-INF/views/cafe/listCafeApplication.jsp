<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>가입신청관리</title>

<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">

<stlye>

</stlye>

</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
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
								<h4 class="card-title">>가입신청목록</h4>

								우리 카페에 가입을 신청한 목록입니다. 가입을 승인하거나, 거절할 수 있습니다. <br> <br>


								<div class="col-md-6 text-right">
									<form class="form-inline" name="detailForm" id="detailFrom">
										<input type="hidden" id="status" name="status"
											value="${search.status }" />
										<div class="form-group">
											<select class="form-control" name="searchCondition">
												<option value="0">별명</option>
												<option value="1">userId</option>

											</select>
										</div>
										&nbsp;&nbsp;
										<div class="form-group">
											<label class="sr-only" for="searchKeyword">검색어</label> 
												<input type="text" class="form-control" id="searchKeyword"name="searchKeyword" placeholder="검색어">
										</div>
										&nbsp;&nbsp;
										<button type="button" id="search"class="btn btn-outline-success">검색</button>
										<input type="hidden" id="currentPage" name="currentPage"value="" /> &nbsp;&nbsp; 필터: &nbsp;&nbsp;
										<button type="button" value="100" id="ing"class="btn mb-1 btn-outline-warning btn-xs">처리중</button>
										&nbsp;&nbsp;&nbsp;
										<button type="button" value="101" id="end"class="btn mb-1 btn-outline-warning btn-xs">처리완료</button>

									</form>
								</div>
								<br> &nbsp;&nbsp;&nbsp;
								<button type="button" id="accept"class="btn btn-outline-secondary">가입승인</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" id="reject"class="btn btn-outline-secondary">가입거절</button>


								<br> <br>



								<!--  table Start /////////////////////////////////////-->
								<table class="table header-border">

									<form id="checkBox">
										<input type="hidden" name="boardName" id="boardName"  value="" />
									</form>
									<thead class="thead-light">
										<tr>
											<th><input type="checkbox" id="allCheck"/></th>
											<th align="center">가입신청번호</th>
											<th align="left">회원아이디</th>
											<th align="left">별명</th>
											<th align="left">가입신청일</th>
											<th align="left">처리결과</th>
										</tr>
									</thead>

									<tbody>

										<c:set var="i" value="0" />
										<c:forEach var="cafeApplication" items="${list}">
										
											<tr>
											<c:if test="${cafeApplication.acceptStatusCode eq 'ca100' }">
												<td><input type="checkbox" name ="each" class="applicationCheck" ></td>
											</c:if>	
											<c:if test="${cafeApplication.acceptStatusCode ne 'ca100' }">
												<td><input type="checkbox"  class="applicationCheck" disabled="disabled"></td>
											</c:if>	
												<td align="left" class="applicationNo"value="${cafeApplication.applicationNo}">${cafeApplication.applicationNo}</td>
												<td align="left">${cafeApplication.userId}</td>
												<td align="left" class="nickname"value="${cafeApplication.memberNickname}">${cafeApplication.memberNickname}</td>
												<td align="left">${cafeApplication.regDate}</td>
												<td align="left">
												<c:if test="${cafeApplication.acceptStatusCode eq 'ca100' }">가입대기</c:if>
												<c:if test="${cafeApplication.acceptStatusCode eq 'ca101' }">가입승인</c:if>
												<c:if test="${cafeApplication.acceptStatusCode eq 'ca102' }">가입거절</c:if>
												<c:if test="${cafeApplication.acceptStatusCode eq 'ca103' }">자동가입</c:if>
													<input type="hidden" class="userNo"value="${cafeApplication.userNo}" /> 
													<input type="hidden"class="cafeNo" value="${cafeApplication.cafeNo}" /></td>
											
											</tr>
										</c:forEach>

									</tbody>

								</table>
								<!-- 테이블 끝 -->
								<jsp:include page="../common/pageNavigator.jsp" />
								<!-- 페이지 끝 -->
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>
		<!--  table End /////////////////////////////////////-->
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
		function fncGetList(currentPage) {
			var cafeURL = '${search.cafeURL}'
			$("#currentPage").val(currentPage)
			$("#detailFrom").attr("method", "POST").attr("action","/cafe/" + cafeURL + "/manage/getCafeApplicationList").submit();
		}

		$(function() {
			var cafeURL = '${search.cafeURL}'
			$("#ing").on("click",function() {//처리중
						//alert("!0")
						$("#status").val(100);
						$("#currentPage").val(1)
						$("#detailFrom").attr("method", "POST").attr(
								"action",
								"/cafe/" + cafeURL
										+ "/manage/getCafeApplicationList")
								.submit();
					});
			$("#end").on("click",function() {//처리완료
						//alert("?1")
						$("#status").val(101)
						$("#currentPage").val(1)
						$("#detailFrom").attr("method", "POST").attr(
								"action",
								"/cafe/" + cafeURL
										+ "/manage/getCafeApplicationList")
								.submit();
					});
		});

		$(function() {

			$("#search").on("click", function() {
				alert("검색");
				fncGetList(1);
			});
		});//검색

		$(function() {
			$(".applicationNo").on("click",function() {
						//alert($(this).text());
						var cafeURL = '${search.cafeURL}'
						self.location = "/cafe/" + cafeURL
								+ "/manage/getCafeApplication?applicationNo="
								+ $(this).text().trim();
					});
		});

		$(function() {
			$("#allCheck").click(function() {
						//클릭되었으면
						if ($("#allCheck").not(":disabled").prop("checked")) {
							//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
							$(".applicationCheck").not(":disabled").prop("checked", true);
							//클릭이 안되있으면
						} else {
							//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
							$(".applicationCheck").not(":disabled").prop("checked", false);
						}
					});
			$("#accept").on("click",function() {//승인
						var application = "";
						var num = $('#allCheck:checked').length;
						//alert(num)
						
						
						if(num>0){
								//alert("1")
							$("input[type=checkbox]:checked").not("input[type=checkbox]:first").each(
									function() {
										//alert($(".applicationCheck").index(this));
										var count = $(".applicationCheck").index(
												this);
										application += $($(".nickname")[count])
												.text()
												+ "&"
												+ $($(".userNo")[count]).val()
												+ "&"
												+ $($(".cafeNo")[count]).val()
												+ "&"
												+ $($(".applicationNo")[count])
														.text();
										application += ",";
	
									});
						}else if(num==0){
							//alert("2")
							$("input[type=checkbox]:checked").each(
									function() {
										//alert($(".applicationCheck").index(this));
										var count = $(".applicationCheck").index(
												this);
										application += $($(".nickname")[count])
												.text()
												+ "&"
												+ $($(".userNo")[count]).val()
												+ "&"
												+ $($(".cafeNo")[count]).val()
												+ "&"
												+ $($(".applicationNo")[count])
														.text();
										application += ",";

									});

							}
						//alert(application);
						var cafeURL = '${search.cafeURL}'
						$("#boardName").val(application);
						$("#checkBox").attr("method", "POST").attr("action","/cafe/" + cafeURL+ "/manage/updateCafeApplication").submit();

					});

			$("#reject").on(
					"click",
					function() {//거절
						var reject = '';
						var num = $('#allCheck:checked').length;
						if(num>0){
							$("input[type=checkbox]:checked").not("input[type=checkbox]:first").each(function() {
								var count = $(".applicationCheck").index(this);
								reject += $($(".applicationNo")[count]).text();
								reject += ",";
	
							});
						}else if(num==0){
							$("input[type=checkbox]:checked").each(function() {
								var count = $(".applicationCheck").index(this);
								reject += $($(".applicationNo")[count]).text();
								reject += ",";

							});
						}
						//alert(reject);
						var cafeURL = '${search.cafeURL}'
						$("#boardName").val(reject);
						$("#checkBox").attr("method", "POST").attr("action","/cafe/" + cafeURL+ "/manage/updateCafeApplication").submit();

					});//거절

		});//끝
	</script>
	<script src="/js/custom/cafeCommon.js"></script>
</body>

</html>