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
$(function() {
	$("#addCafe").on("click" , function() {
		$(self.location).attr("href","/cafe/addCafe");
	});
	$("#explore").on("click" , function() {
		$("form").attr("method" , "POST").attr("action" , "/cafe/search").submit();
	});
	$(".searchCondition").on("click" , function() {
		$("#searchCondition").val($(".searchCondition").index(this));
	});
	
});
</script>
<jsp:include page="../common/cafeToolbar.jsp" />
</head>

<body>
<div class="container">
<br/>
<form>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	   <select class="custom-select custom-select-lg" aria-label="Example select with button addon" name='searchCondition' id='searchCondition'>
	    <option class='searchCondition' value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>카페+게시글</option>
	    <option class='searchCondition' value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>카페이름</option>
	    <option class='searchCondition' value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>게시글</option>
	   </select>
	    </div>
	  <input type="text" class="form-control form-control-lg" placeholder="검색어 입력해주세요" aria-label="Text input with dropdown button" aria-describedby="button-addon2" name="searchKeyword" id="searchKeyword" value='${! empty search.searchKeyword ? search.searchKeyword : '' }'>
	 <div class="input-group-append">
	    <button class="btn btn-outline-secondary" type="button" id="explore">검색</button>
	 </div>
	</div>
</form>	


  카페전체검색창입니다.
  <c:if test="${!empty cafeList}">
  <br/>
  카페번호/카페이름/카페설명/카페유알엘
  <br/>
  <c:forEach var="cafe" items="${cafeList}">
  ${cafe.cafeNo}/${cafe.cafeName}/${cafe.cafeDetail}/${cafe.url}
  <br/>
  </c:forEach>
  </c:if>
  <br/>
  <c:if test="${!empty postList}">
  아래는 게시글임
  <br/>
  <c:forEach var="post" items="${postList}">
  ${post.cafeUrl}/${post.cafeName}/${post.cafeIcon}/${post.postTitle}/${post.postNo}
  <br/>
  </c:forEach>
  </c:if>
  
  
</div>
</body>
</html>