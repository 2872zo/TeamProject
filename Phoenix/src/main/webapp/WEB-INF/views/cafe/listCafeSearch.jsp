<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>CafeSearch</title>

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
function fncGetList(currentPage) {
	  $("#currentPage").val(currentPage)
	  $("form").attr("method" , "POST").attr("action" , "/cafe/search").submit();
	}
	
$(function() {
	
	$("#addCafe").on("click" , function() {
		$(self.location).attr("href","/cafe/addCafe");
	});
	
	$("#moreCafe").on("click" , function() {
		$("#searchCondition").val(1);
		$("form").attr("method" , "POST").attr("action" , "/cafe/search").submit();
	});

	$("#morePost").on("click" , function() {
		$("#searchCondition").val(2);
		$("form").attr("method" , "POST").attr("action" , "/cafe/search").submit();
	});

	$(".cafeURL").on("click" , function() {
		$("form").attr("method" , "POST").attr("action" , "/cafe/"+$(this).text()+"/manage/getCafeMemberList").submit();
	});

	$(".myCafe").on("click" , function() {
		var moveTo = $(this).attr('name');
		$(self.location).attr("href","/cafe/"+moveTo);
		
	});
	
});
</script>
<jsp:include page="../common/toolbar.jsp" />
</head>

<body>
<div class="container">
  카페검색창입니다.
    <br/>
  <c:if test="${!empty cafeList}">

  <c:if test="${ !empty search.searchCondition && search.searchCondition==1}">
 	카페 검색결과 총 ${totalCount} 건 입니다.
 	</c:if>
    <br/>

 <div class="row d-flex justify-content-between">
  <c:forEach var="cafe" items="${cafeList}">
  
  <div class="card mb-3 myCafe col-lg-6" style="" name ='${cafe.cafeURL}'>
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="/images/common/16by9.png" class="card-img" alt="..." 
      style="background: url('/images/uploadFiles/cafeicon/${cafe.cafeIcon}');
      no-repeat center center; background-size:cover;">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">${cafe.cafeName}</h5>
        <p class="card-text">${cafe.cafeDetail}</p>
        <p class="card-text"><small class="text-muted">${cafe.regDate}</small></p>
      </div>
    </div>
  </div>
</div>
  
  </c:forEach>
  </div>

  <c:if test="${ !empty search.searchCondition && search.searchCondition==0}">
  <button type="button" class="btn btn-outline-primary" id='moreCafe'>카페 더보기</button>
  </c:if>
   <c:if test="${ !empty search.searchCondition && search.searchCondition==1}">
  <jsp:include page="../common/pageNavigator.jsp" />
  </c:if>
  </c:if>
  <br/>
  <c:if test="${!empty postList}">
 	<c:if test="${ !empty search.searchCondition && search.searchCondition==2}">
  	 게시글 검색결과 총 ${totalCount} 건 입니다.
 	</c:if>
 	<br/>
   <table class="table table-borderless">
	<thead>
    <tr> 
      <th scope="col">카페이름</th>
      <th scope="col">카페아이콘</th>
      <th scope="col">게시글제목</th> 
      <th scope="col">작성자닉네임</th>
      <th scope="col">작성시간</th>
      <th scope="col">게시글 번호</th>
    </tr>
	</thead>
	<tbody>
  
  <c:forEach var="post" items="${postList}">
  	<tr>
	  <th scope="row">${post.cafeName}</th>
	  <td>${post.cafeIcon}</td>
	  <td>${post.postTitle}</td>
	  <td>${post.memberNickname}</td>
	  <td>${post.regDate}</td>
	  <td>${post.postNo}</td>
	  
    </tr>
  </c:forEach>
  	</tbody>
</table>
  
  <c:if test="${ !empty search.searchCondition && search.searchCondition==0}">
  <button type="button" class="btn btn-outline-success" id='morePost'>게시글 더보기</button>
  </c:if>
   <c:if test="${ !empty search.searchCondition && search.searchCondition==2}">
  <div class="d-flex justify-content-center">
  <jsp:include page="../common/pageNavigator.jsp" />
  </div>
  </c:if>
  </c:if>
  
  
</div>
</body>
</html>