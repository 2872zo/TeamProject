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
	
});
</script>
<jsp:include page="../common/cafeToolbar.jsp" />
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
 <table class="table table-borderless">
	<thead>
    <tr>
  	  <th scope="col">카페번호</th>
      <th scope="col">카페이름</th>
      <th scope="col">카페설명</th>
      <th scope="col">카페주소</th>
      <th scope="col">카페회원수</th>
      <th scope="col">매니저닉네임</th>
    </tr>
	</thead>
	<tbody>
 
  <c:forEach var="cafe" items="${cafeList}">
   <tr>
  <th scope="row">${cafe.cafeNo}</th>
  <td>${cafe.cafeName}</td>
  <td>${cafe.cafeDetail}</td>
  <td>${cafe.URL}</td>
  <td>${cafe.members}</td>
  <td>${cafe.managerNickname}</td>
    </tr>
  </c:forEach>

	</tbody>
</table>

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
  <jsp:include page="../common/pageNavigator.jsp" />
  </c:if>
  </c:if>
  
  
</div>
</body>
</html>