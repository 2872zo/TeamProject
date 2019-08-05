<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
           <div class="nav-header">
            <c:import url="/WEB-INF/views/common/brand-logo.jsp"/>
        </div>

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/toolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>회원목록</title>


<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">
<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">
	<!--  ///////////////////////// CSS ////////////////////////// -->

    
  
	
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
    	
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/common/userAdminMenubar.jsp"></c:import>
		</div>
	<!--**********************************
        Main wrapper start
    ***********************************-->

<div id="main-wrapper">

	<div class="content-body" style="min-height: 743px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">admin</a></li>
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
								<h4 class="card-title">>회원목록</h4>

								우리 포털에 가입한 회원목록입니다.<br> <br>


								<div class="col-md-6 text-right">
									<form class="form-inline" name="detailForm" id="detailFrom">									
										<input type="hidden" id="status" name="status"
											value="${search.status }" />
										<div class="form-group">
											<select class="form-control" name="searchCondition" value='${ !empty search.searchCondition ? search.searchCondition : "" }'>
												
												<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원아이디</option>
												<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원닉네임</option>
												
											</select>
										</div>
										&nbsp;&nbsp;
										<div class="form-group">
											<label class="sr-only" for="searchKeyword" >검색어</label> 
												<input type="text" class="form-control" id="searchKeyword"name="searchKeyword" placeholder="검색어" value='${ !empty search.searchKeyword ? search.searchKeyword : "" }'>
										</div>
										&nbsp;&nbsp;
										<button type="button" id="search"class="btn btn-outline-success">검색</button>
										<input type="hidden" id="currentPage" name="currentPage"value="" /> 
										

									
									</form>
								</div>
								<br>


								<!--  table Start /////////////////////////////////////-->
								<table class="table header-border">

									
									<thead class="thead-light">
										<tr>
											<th></th>
											<th align="center">회원번호</th>
											<th align="left">회원아이디</th>
											<th align="left">회원닉네임</th>
											<th align="left">가입일자</th>
											<th align="left">회원상태</th>
										</tr>
									</thead>
									
									<tbody>

										<c:set var="i" value="0" />
										<c:forEach var="user" items="${list}">
										<c:set var="i" value="${ i+1 }" />
										
											<tr>
												
												<td align="left" class="userNo" name="userNo" value="${user.userNo}"></td>
												<td align="left" class="userNo">${user.userNo}</td>
												<td align="left">${user.userId}</td>
												<td align="left">${user.userNickname}</td>
												<td align="left">${user.regDate }</td>
												<c:if test="${user.userStatusCode=='us100'}">
												<td align="left">회원</td>
												</c:if>
												<c:if test="${user.userStatusCode=='us101'}">
												<td align="left">정지</td>
												</c:if>
												<c:if test="${user.userStatusCode=='us102'}">
												<td align="left">탈퇴</td>
												</c:if>																	
													<td>
													<input type="hidden" class="userNo"value="${user.userNo}" /> 
													</td>
											
											</tr>
										</c:forEach>

									</tbody>
								
								</table>
								<!-- 테이블 끝 -->
								<jsp:include page="../common/pageNavigator.jsp" >
									<jsp:param value="User" name="subject"/>
								</jsp:include>
								<!-- 페이지 끝 -->
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>
 	</div>
 	
 	<!-- PageNavigation Start... -->
	
	<!-- PageNavigation End... -->
	<!--  화면구성 div end /////////////////////////////////////-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>
	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script type="text/javascript">

	 var checkSessionUser = ${empty sessionScope.user};



	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	function fncGetUserList(currentPage) {

		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
	}
	
	
	$(function() {

		$("#search").on("click", function() {
			//alert("검색");
			fncGetUserList(1);
		});
	});//검색
	
	
	//============= userId 에 회원정보보기  Event  처리(Click) =============	
	 $(function() {

			$('#searchKeyword').on("keydown" , function(event){
				
				if(event.keyCode == '13'){
					fncGetUserList(1);
				}
				
			});
	
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(".userNo").on("click" , function() {
			//alert("11");
			 self.location ="/user/getUserInfo?userNo="+ $(this).text().trim();
			//$("td:nth-child(2)").attr("method" , "POST").attr("action" , "/user/getUserInfo").submit();
		});

		//==> userId LINK Event End User 에게 보일수 있도록 
		$( "td:nth-child(2)" ).css("color" , "red");
		
	});	
		
	
	


	</script>
	<script src="/js/custom/userCommon.js"></script>
	<script src="/js/custom/toolbarScript.js"></script>
</body>

</html>