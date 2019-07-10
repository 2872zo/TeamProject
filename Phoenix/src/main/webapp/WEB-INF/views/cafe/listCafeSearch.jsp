<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>CafeSearch</title>



<!--  /////////////////////////  jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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


  카페전체검색창입니다.
  <c:if test="${!empty cafeList}">
  <br/>
  카페번호/카페이름/카페설명/카페유알엘/카페회원수/매니저닉네임
  <br/>
  <c:forEach var="cafe" items="${cafeList}">
  ${cafe.cafeNo}/${cafe.cafeName}/${cafe.cafeDetail}/${cafe.url}/${cafe.members}
  <br/>
  </c:forEach>
  <c:if test="${ !empty search.searchCondition && search.searchCondition==0}">
  <button type="button" class="btn btn-outline-primary" id='moreCafe'>카페 더보기</button>
  </c:if>
   <c:if test="${ !empty search.searchCondition && search.searchCondition==1}">
  <jsp:include page="../common/pageNavigator.jsp" />
  </c:if>
  </c:if>
  <br/>
  <c:if test="${!empty postList}">
  아래는 게시글임
  <br/>
  <c:forEach var="post" items="${postList}">
  ${post.cafeUrl}/${post.cafeName}/${post.cafeIcon}/${post.postTitle}/${post.postNo}/${post.memberNickname}
  <br/>
  </c:forEach>
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