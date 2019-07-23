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

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../common/toolbar.jsp" />
<title>가입신청내역</title>
</head>

<body>
<form id="cafeHomeForm">
<input type="hidden" id="userNo" name="userNo" value="${search.userNo}"/>
<input type="hidden" id="status" name="status" value="${search.status}"/>
<input type="hidden" id="boardNo" name="boardNo" value="${search.boardNo}"/>
</form>


	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	총 ${totalCount} 건 

	

	
	<c:if test="${!empty applicationList}">

<table class="table table-borderless ">
	<thead>
    <tr>
  	  <th scope="col">신청번호</th>
      <th scope="col">유저번호</th>
      <th scope="col">카페번호</th>
      <th scope="col">카페주소</th>
      <th scope="col">카페이름</th>
      <th scope="col">카페아이콘</th>
      <th scope="col">카페종류</th>
      <th scope="col">신청일</th>
      <th scope="col">신청닉네임</th>
    </tr>
	</thead>
	<tbody>
  
	<c:forEach var="cafeApplication" items="${applicationList}">
	<tr>
	 <th scope="row">${cafeApplication.applicationNo}</th>
	 <td>${cafeApplication.userNo}</td>
	 <td>${cafeApplication.cafeNo}</td>
	 <td>${cafeApplication.cafeURL}</td>
	 <td>${cafeApplication.cafeName}</td>
	 <td>${cafeApplication.cafeIcon}</td>
	 <td>${cafeApplication.cafeType}</td>
	 <td>${cafeApplication.regDate}</td>
	 <td>${cafeApplication.memberNickname}</td>
	 </tr>
	</c:forEach>
  
	</tbody>
</table>

</c:if>
	

	
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