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

	$(".favorited").on("click" , function() {
		var targetTag = $(this);
		var checker = $(this).text();

		if(checker == "true"){
			checker = "false";
		}
		else if(checker == "false"){
			checker = "true";
		}
		
		var memberJson = $($(".memberNo")[$(".favorited").index(this)]).text();
		
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
										alert(status);
										alert("server에서 온 Data : \n" + serverData);
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
	  <button type="button" class='btn btn-${ search.status==0 ? "" : "outline-" }primary cafeListing'>활동중인 카페</button>
	  <button type="button" class='btn btn-${ search.status==1 ? "" : "outline-" }primary cafeListing'>즐겨찾기 카페</button>
	  <button type="button" class='btn btn-${ search.status==2 ? "" : "outline-" }primary cafeListing'>운영중인 카페</button>
	  <button type="button" class='btn btn-${ search.status==3 ? "" : "outline-" }primary cafeListing'>정지당한 카페</button>
	</div>
	
	<c:if test="${!empty myCafelist}">

<table class="table table-borderless ">
	<thead>
    <tr>
  	  <th scope="col">카페번호</th>
      <th scope="col">카페URL</th>
      <th scope="col">카페이름</th>
      <th scope="col">카페아이콘</th>
      <th scope="col">카페설명</th>
      <th scope="col">개설일</th>
      <c:if test="${search.status==0||search.status==1}">
      <th scope="col">즐찾여부</th>
      </c:if>
      <th scope="col">멤버번호</th>
    </tr>
	</thead>
	<tbody>
  
	<c:forEach var="myCafe" items="${myCafelist}">
	 <tr>
	 <th scope="row">${myCafe.cafeNo}</th>
	 <td>${myCafe.cafeURL}</td>
	 <td>${myCafe.cafeName}</td>
	 <td>${myCafe.cafeIcon}</td>
	 <td>${myCafe.cafeDetail}</td>
	 <td>${myCafe.regDate}</td>
	 <c:if test="${search.status==0||search.status==1}">
	 <td class='favorited'>${myCafe.favorited}</td>
	 </c:if>
	 <td class='memberNo'>${myCafe.memberNo}</td>
	 </tr>
	</c:forEach>
  
	</tbody>
</table>

	</c:if>

</c:if>	

	<br/>
	<br/>
	<br/>
	
	
<div class="btn-group d-flex justify-content-center" role="group">
  <button type="button" class='btn btn-${ search.cafeType==0 ? "" : "outline-" }success cafeCategory'>친목/모임</button>
  <button type="button" class='btn btn-${ search.cafeType==1 ? "" : "outline-" }success cafeCategory'>스포츠/레저</button>
  <button type="button" class='btn btn-${ search.cafeType==2 ? "" : "outline-" }success cafeCategory'>영화</button>
  <button type="button" class='btn btn-${ search.cafeType==3 ? "" : "outline-" }success cafeCategory'>게임</button>
  <button type="button" class='btn btn-${ search.cafeType==4 ? "" : "outline-" }success cafeCategory'>음악</button>
  <button type="button" class='btn btn-${ search.cafeType==5 ? "" : "outline-" }success cafeCategory'>여행</button>
</div>
<br/>
<c:if test="${!empty categorizedCafeList}">
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
  
	<c:forEach var="categoryCafe" items="${categorizedCafeList}">
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