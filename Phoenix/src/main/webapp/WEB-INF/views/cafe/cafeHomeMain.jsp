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

	$($(".cafeListing")[$("#status").val()]).attr("class","btn btn-primary cafeListing");
	$($(".cafeCategory")[$("#cafeType").val()]).attr("class","btn btn-success cafeCategory");

	$("#addCafe").on("click" , function() {
		$(self.location).attr("href","/cafe/addCafeView");
	});
		
	$(".cafeListing").on("click" , function() {
		var count = $(".cafeListing").index(this);
		$("#status").val(count);
		$("#cafeHomeForm").attr("method" , "POST").attr("action" , "/cafe/main").submit();	
	});
	
	$(".cafeCategory").on("click" , function() {
		var count = $(".cafeCategory").index(this);
		$("#cafeType").val(count);
		$("#cafeHomeForm").attr("method" , "POST").attr("action" , "/cafe/main").submit();	
	});

	$("#memberList").on("click" , function() {
		$("#memberListingForm").attr("method" , "POST").attr("action" , "/cafe/randomCafe/manage/getCafeMemberList").submit();
	});

	$(".myCafe").on("click" , function(aaa) {
		//alert($(aaa.target).html());
		var moveTo = $(this).attr('name');
		if(!$(aaa.target).hasClass("favorited")){
			$(self.location).attr("href","/cafe/"+moveTo);
		}
		
	});

	$(".favorited").on("click" , function() {
		var targetTag = $(this);
		var checker = $(this).text();

		if(checker == "true"){
			checker = "false";
		}
		else if(checker == "false"){
			checker = "true";
		}
		
		var memberJson = $($(".memberNo")[$(".favorited").index(this)]).val();
		
		var jsoned = {memberNo : memberJson, favoriteFlag : checker};
		jsoned = JSON.stringify(jsoned);
			$.ajax(
					{
					type : "POST",
					url : "/cafe/json/updateFavorite",
					data : jsoned,
					contentType: "application/json", //보내는 컨텐츠의 타입
					//dataType : "json",      //받아올 데이터의 타입 필요없음
					success : function(serverData, status) {
										
										targetTag.text(checker);	
									},
					error : function(request,status,error){
								        alert("에러남 : "+error);
								       }
					}
				);
	});

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
<input type="hidden" id="cafeType" name="cafeType" value="${search.cafeType}"/>
</form>


	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<c:if test="${!empty sessionScope.user}">

	<br/>
		<button type="button" class="btn btn-outline-warning btn-block" id='addCafe'>카페만들기</button>
	<br/>
	
	<div class="btn-group d-flex justify-content-center" role="group">
	  <button type="button" role="group" class='btn btn-outline-primary cafeListing'>활동중인 카페</button>
	  <button type="button" role="group" class='btn btn-outline-primary cafeListing'>즐겨찾기 카페</button>
	  <button type="button" role="group" class='btn btn-outline-primary cafeListing'>운영중인 카페</button>
	  <button type="button" role="group" class='btn btn-outline-primary cafeListing'>정지당한 카페</button>	
	  </div>
	  
	<br/>
	
	<c:if test="${!empty myCafelist}">
	 <div class="row d-flex justify-content-between">
	<c:forEach var="myCafe" items="${myCafelist}">
	
<div class="card mb-3 myCafe col-lg-6" style="" name ='${myCafe.cafeURL}'>
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="/images/common/16by9.png" class="card-img" alt="..." 
      style="background: url('/images/uploadFiles/cafeicon/${myCafe.cafeIcon}');
      no-repeat center center; background-size:cover;">
   </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">${myCafe.cafeName}</h5>
        <p class="card-text">${myCafe.cafeDetail}</p>
        <input type='hidden'class='memberNo' value='${myCafe.memberNo}'>
      	<a href="#" class="btn btn-primary favorited">${myCafe.favorited}</a>
      </div>
    </div>
  </div>
</div>


	</c:forEach>
  
</div>

	</c:if>

</c:if>	

	<br/>
	<br/>
	<br/>
	
	
<div class="btn-group d-flex justify-content-center" role="group">
  <button type="button" role="group" class='btn btn-outline-success col-lg-2 cafeCategory'>친목/모임</button>
  <button type="button" role="group" class='btn btn-outline-success col-lg-2 cafeCategory'>스포츠/레저</button>
  <button type="button" role="group" class='btn btn-outline-success col-lg-2 cafeCategory'>영화</button>
  <button type="button" role="group" class='btn btn-outline-success col-lg-2 cafeCategory'>게임</button>
  <button type="button" role="group" class='btn btn-outline-success col-lg-2 cafeCategory'>음악</button>
  <button type="button" role="group" class='btn btn-outline-success col-lg-2 cafeCategory'>여행</button>
</div>
<br/>
<c:if test="${!empty categorizedCafeList}">

  <div class="row d-flex justify-content-between">
	<c:forEach var="categoryCafe" items="${categorizedCafeList}">
	
	
	<div class="card mb-3 myCafe col-lg-6" style="" name ='${categoryCafe.cafeURL}'>
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="/images/common/16by9.png" class="card-img" alt="..." 
      style="background: url('/images/uploadFiles/cafeicon/${categoryCafe.cafeIcon}');
      no-repeat center center; background-size:cover;">
   </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">${categoryCafe.cafeName}</h5>
        <p class="card-text">${categoryCafe.cafeDetail}</p>
        <p class="card-text"><small class="text-muted">${categoryCafe.regDate}</small></p>
      </div>
    </div>
  </div>
</div>

	</c:forEach>
</div>
</c:if>

<br/>
<br/>
<br/>

<div class = 'container'>
	
</div>



	
</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>