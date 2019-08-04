<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<title>가입신청내역</title>
</head>

<body>
<!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
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
        
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../common/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->

<form id="cafeHomeForm">
<input type="hidden" id="userNo" name="userNo" value="${search.userNo}"/>
<input type="hidden" id="status" name="status" value="${search.status}"/>
<input type="hidden" id="boardNo" name="boardNo" value="${search.boardNo}"/>
</form>
<br/>
	<div class='container'>

<div class='card'>
<div class='card-body'>



	<!--  화면구성 div Start /////////////////////////////////////-->
	
	총 ${totalCount} 건 

	

	
	<c:if test="${!empty applicationList}">

<table class="table">
	<thead>
    <tr>
  	  <th scope="col">카페</th>
      <th scope="col">신청일</th>
      <th scope="col">신청닉네임</th>
      <th scope="col">승인여부</th>
    </tr>
	</thead>
	<tbody>
  
	<c:forEach var="cafeApplication" items="${applicationList}">
	<tr>
	 <th scope="row" style='width:50%;'>
		 <div class="row" style='border: 1px solid black;'>
		 <div class="col-lg-4">
		 <img src="/images/common/700by700.png" class="card-img" alt="..."
		style=" width:50%; border:thin; border-color=red; 
	background: url('/images/uploadFiles/cafeicon/${cafeApplication.cafeIcon}');
	 no-repeat center center; background-size:cover;">
		 </div>
		 <div class="col-lg-5 d-flex align-items-center">
		 ${cafeApplication.cafeName}
		 </div>
		 <div class='col-lg-3 d-flex align-items-center'>
		 <c:if test='${cafeApplication.cafeType=="cc100"}'>친목/모임</c:if>
		 <c:if test='${cafeApplication.cafeType=="cc101"}'>스포츠/레저</c:if>
		 <c:if test='${cafeApplication.cafeType=="cc102"}'>영화</c:if>
		 <c:if test='${cafeApplication.cafeType=="cc103"}'>게임</c:if>
		 <c:if test='${cafeApplication.cafeType=="cc104"}'>음악</c:if>
		 <c:if test='${cafeApplication.cafeType=="cc105"}'>여행</c:if>
		 
		 </div>
		 </div>
	</th>
	 <td >${cafeApplication.regDate}</td>
	 <td >${cafeApplication.memberNickname}</td>
	 <td >
	 <c:if test='${cafeApplication.acceptStatusCode=="ca101"}'><i class="mdi mdi-emoticon-neutral" style='font-size: 15pt;'></i>대기중</c:if>
	 <c:if test='${cafeApplication.acceptStatusCode=="ca102"}'><i class="mdi mdi-emoticon-happy" style='font-size: 15pt;'></i>승인</c:if>
	 <c:if test='${cafeApplication.acceptStatusCode=="ca103"}'><i class="mdi mdi-emoticon-sad" style='font-size: 15pt;'></i>거절</c:if>
	 <c:if test='${cafeApplication.acceptStatusCode=="ca104"}'><i class="mdi mdi-emoticon-cool" style='font-size: 15pt;'></i>자동승인</c:if>
	 </td>
	 </tr>
	 
	</c:forEach>
  
	</tbody>
</table>

</c:if>
	

	
</div>
</div>
</div>
</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
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
	<script src="/js/custom/scroll-top.js"></script>
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
var checkSessionUser = ${empty sessionScope.user};
</script>

<!-- 공통 툴바용 스크립트 -->	
	<script src="/js/custom/toolbarScript.js"></script>
</body>
</html>