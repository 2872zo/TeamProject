<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>CafeTabMain</title>



<!--  /////////////////////////  jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {
	$("#addCafe").on("click" , function() {
		$(self.location).attr("href","/cafe/addCafeView");
	});

	$(".cafeListing").on("click" , function() {
		alert("카페종류야");
		//alert($(".cafeListing").index(this).val());
	});

	$(".cafeCategory").on("click" , function() {
		alert("카페카테고리야");
		//alert($(".cafeCategory").index(this).val());
	});
});
</script>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../common/cafeToolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
</head>

<body>



	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

	<br/>
		<button type="button" class="btn btn-outline-warning btn-block" id='addCafe'>카페만들기</button>
	<br/>
	
	<div class="center-block">
	<div class="btn-group btn-group-toggle" data-toggle="buttons" id='cafeListing' style="float:none; margin:0 auto">
  <label class="btn btn-lg btn-outline-primary active">
    <input type="radio" name="options" class ='cafeListing' id="managed" value='managed' autocomplete="off" checked> 운영중인 카페
  </label>
  <label class="btn btn-lg btn-outline-primary">
    <input type="radio" name="options" class ='cafeListing' id="open" value='open' autocomplete="off"> 활동중인 카페
  </label>
  <label class="btn btn-lg btn-outline-primary">
    <input type="radio" name="options" class ='cafeListing' id="favorite" value='favorite' autocomplete="off"> 즐겨찾기 카페
  </label>
  <label class="btn btn-lg btn-outline-primary">
    <input type="radio" name="options" class ='cafeListing' id="application" value='application' autocomplete="off"> 가입 신청내역
  </label>
  <label class="btn btn-lg btn-outline-primary">
    <input type="radio" name="options" class ='cafeListing' id="blocked" value='blocked' autocomplete="off"> 정지당한 카페
  </label>
	<label class="btn btn-lg btn-outline-primary">
    <input type="radio" name="options" class ='cafeListing' id="newsfeed" value='newsfeed' autocomplete="off"> 카페 새게시글
  </label>
	</div>
	</div>
	<br/>
	<br/>
	<br/>
	
	
<div class="center-block">
	<div class="btn-group btn-group-toggle" data-toggle="buttons" id='cafeCategorized' style="float:none; margin:0 auto">
  <label class="btn btn-outline-success active">
    <input type="radio" class ='cafeCategory' name="options" id="friendship" value='friendship' checked> 친목/모임
  </label>
  <label class="btn btn-outline-success">
    <input type="radio" class ='cafeCategory' name="options" id="sports" value='sports'> 스포츠/레저
  </label>
  <label class="btn btn-outline-success">
    <input type="radio" class ='cafeCategory' name="options" id="movie" value='movie'> 영화
  </label>
  <label class="btn btn-outline-success">
    <input type="radio" class ='cafeCategory' name="options" id="game" value='game'> 게임
  </label>
  <label class="btn btn-outline-success">
    <input type="radio" class ='cafeCategory' name="options" id="music" value='music'> 음악
  </label>
  <label class="btn btn-outline-success">
    <input type="radio" class ='cafeCategory' name="options" id="trip" value='trip'> 여행
  </label>
</div>
</div>




	
</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>