<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>

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

	<!--**********************************
        Main wrapper start
    ***********************************-->

<div id="main-wrapper">

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
												<option value="0">회원아이디</option>
												<option value="1">회원닉네임</option>
												<option value="2">회원번호</option>
												

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
										

									</form>
									
								</div>
								<br>


								<!--  table Start /////////////////////////////////////-->
								<table class="table header-border">

									
									<thead class="thead-light">
										<tr>
											<th><input type="checkbox" id="allCheck" /></th>
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
												
												<td align="left" class="applicationNo" name="userNo" value="${user.userNo}"></td>
												<td align="left">${user.userNo}</td>
												<td align="left">${user.userId}</td>
												<td align="left">${user.userNickname}</td>
												<td align="left">${user.regDate }</td>
												<td align="left"></td>
																												
													<td>
													<input type="hidden" class="userNo"value="${cafeApplication.userNo}" /> 
													<input type="hidden"class="cafeNo" value="${cafeApplication.cafeNo}" /></td>
											
											</tr>
										</c:forEach>

									</tbody>

								</table>
								
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



	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
	}
	
	
	//============= "검색"  Event  처리 =============	
	 $(function() {
		 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 //$( "button.btn.btn-default" ).on("click" , function() {
		//	fncGetUserList(1);
		//});
	 });
	
	
	//============= userId 에 회원정보보기  Event  처리(Click) =============	
	 $(function() {
	
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "td:nth-child(2)" ).on("click" , function() {
			 self.location ="/user/getUser?userId="+$(this).text().trim();
		});
					
		//==> userId LINK Event End User 에게 보일수 있도록 
		$( "td:nth-child(2)" ).css("color" , "red");
		
	});	
	
	
	//============= userId 에 회원정보보기  Event  처리 (double Click)=============
	 $(function() {
		 
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(  "td:nth-child(5) > i" ).on("click" , function() {

				var userId = $(this).next().val();
			
				$.ajax( 
						{
							url : "/user/json/getUser/"+userId ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								var displayValue = "<h6>"
															+"아이디 : "+JSONData.userId+"<br/>"
															+"이  름 : "+JSONData.userName+"<br/>"
															+"이메일 : "+JSONData.email+"<br/>"
															+"ROLE : "+JSONData.role+"<br/>"
															+"등록일 : "+JSONData.regDate+"<br/>"
															+"</h6>";
								$("h6").remove();
								$( "#"+userId+"" ).html(displayValue);
							}
					});
					////////////////////////////////////////////////////////////////////////////////////////////
				
		});
		
		//==> userId LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		//==> 아래와 같이 정의한 이유는 ??
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});	

	</script>
	<script src="/js/custom/cafeCommon.js"></script>
</body>

</html>