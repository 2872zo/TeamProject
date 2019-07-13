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
	$("#addCafe").on("click" , function() {
		$(self.location).attr("href","/cafe/addCafeView");
	});
	
	$(".cafeListing").on("click" , function() {
		alert($(".cafeListing").index(this));
	});

	$(".cafeCategory").on("click" , function() {
		var count = $(".cafeCategory").index(this);
		$("#boardNo").val(count);
		$("#cafeCategorizing").attr("method" , "POST").attr("action" , "/cafe/category").submit();	
	});

	$("#memberList").on("click" , function() {
		$("#memberListingForm").attr("method" , "POST").attr("action" , "/cafe/randomCafe/manage/getCafeMemberList").submit();
	});

});
</script>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../common/cafeToolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
</head>

<body>
<form id="cafeCategorizing">
<input type="hidden" id="boardNo" name="boardNo" value="0"/>
</form>


	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

	<br/>
		<button type="button" class="btn btn-outline-warning btn-block" id='addCafe'>카페만들기</button>
	<br/>
	
	
	<div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-outline-primary cafeListing">운영중인 카페</button>
  <button type="button" class="btn btn-outline-primary cafeListing">활동중인 카페</button>
  <button type="button" class="btn btn-outline-primary cafeListing">즐겨찾기 카페</button>
  <button type="button" class="btn btn-outline-primary cafeListing">가입신청 내역</button>
  <button type="button" class="btn btn-outline-primary cafeListing">정지당한 카페</button>
  <button type="button" class="btn btn-outline-primary cafeListing">카페 새게시글</button>
</div>
	
	<c:if test="${!empty myCafeList}">
<table class="table table-borderless">
	<thead>
    <tr>
  	  <th scope="col">카페번호</th>
      <th scope="col">카페URL</th>
      <th scope="col">카페이름</th>
      <th scope="col">카페아이콘</th>
      <th scope="col">카페설명</th>
      <th scope="col">개설일</th>
    </tr>
	</thead>
	<tbody>
  <tr>
	<c:forEach var="myCafe" items="${myCafeList}">
	 <th scope="row">${myCafe.cafeNo}</th>
	 <td>${myCafe.url}</td>
	 <td>${myCafe.cafeName}</td>
	 <td>${myCafe.cafeIcon}</td>
	 <td>${myCafe.cafeDetail}</td>
	 <td>${myCafe.regDate}</td>
	</c:forEach>
  </tr>
	</tbody>
</table>
</c:if>
	

	<br/>
	<br/>
	<br/>
	
	
<div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-outline-success cafeCategory">친목/모임</button>
  <button type="button" class="btn btn-outline-success cafeCategory">스포츠/레저</button>
  <button type="button" class="btn btn-outline-success cafeCategory">영화</button>
  <button type="button" class="btn btn-outline-success cafeCategory">게임</button>
  <button type="button" class="btn btn-outline-success cafeCategory">음악</button>
  <button type="button" class="btn btn-outline-success cafeCategory">여행</button>
</div>
<br/>
<c:if test="${!empty categoryCafeList}">
<table class="table table-borderless">
	<thead>
    <tr>
  	  <th scope="col">카페번호</th>
      <th scope="col">카페URL</th>
      <th scope="col">카페이름</th>
      <th scope="col">카페아이콘</th>
      <th scope="col">카페설명</th>
      <th scope="col">개설일</th>
      <th scope="col">카페카테고리</th>
    </tr>
	</thead>
	<tbody>
  
	<c:forEach var="categoryCafe" items="${categoryCafeList}">
	<tr>
	 <th scope="row">${categoryCafe.cafeNo}</th>
	 <td>${categoryCafe.URL}</td>
	 <td>${categoryCafe.cafeName}</td>
	 <td>${categoryCafe.cafeIcon}</td>
	 <td>${categoryCafe.cafeDetail}</td>
	 <td>${categoryCafe.regDate}</td>
	 <td>${categoryCafe.cafeType}</td>
	  </tr>
	</c:forEach>
 
	</tbody>
</table>
</c:if>

<br/>
<br/>
<br/>

<div class = 'container'>

	<form id='memberListingForm'>
		<div class="input-group">
		<input type="text" class="form-control" placeholder="카페번호" name = 'cafeNo'  aria-describedby="button-addon1">
		<div class="input-group-append" id="button-addon1">
	    <button class="btn btn-outline-warning" type="button" id = 'memberList'>맴버리스트</button>
	    </div>
	    </div>
	</form>
	
</div>



	
</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>