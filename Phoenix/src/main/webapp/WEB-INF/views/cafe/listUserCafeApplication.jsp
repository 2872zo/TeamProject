<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>CafeTabMain</title>

<!-- ////////////////////////////// jQuery CDN ////////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
 integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
 crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
 integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
 crossorigin="anonymous"></script>
<!-- ////////////////////////////// bootstrap CDN ////////////////////////////// -->
<link rel="stylesheet"
 href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
 crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
 integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
 crossorigin="anonymous"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {

});
</script>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../common/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
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

</body>
</html>