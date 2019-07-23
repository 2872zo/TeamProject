<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<jsp:include page="../common/toolbar.jsp" />
<title>CafeSearch</title>


<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
function fncGetList(currentPage) {
	  $("#currentPage").val(currentPage)
	  $("form").attr("method" , "POST").attr("action" , "/cafe/search").submit();
	}
	
$(function() {

	$("#cafeExplore").on("click" , function() {
		$("#cafeSearch").attr("method" , "POST").attr("action" , "/cafe/search").submit();
	});
	
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

</head>

<body>
<br/>
<div class="container">
  
  	<!--  카페검색창 /////////////////////////////////////-->
  <div class="card">

		<form class="form-inline justify-content-center" id='cafeSearch'>
		<jsp:include page="common/cafeSearcher.jsp" />
			<input type="hidden" id="currentPage" name="currentPage" value="0" />
			<input type="hidden" name='cafeURL'
				value='${ !empty search.cafeURL ? search.cafeURL : "" }'> <input
				type="hidden" name='boardName'
				value='${ !empty search.boardName ? search.boardName : "" }'>








		</form>
		
			</div>
			
			<!--  카페검색창 끝 /////////////////////////////////////-->

  <c:if test="${!empty cafeList}">
  <div class='card'>
<div class="card-body">

  <c:if test="${ !empty search.searchCondition && search.searchCondition==1}">
 	카페 검색결과 총 ${totalCount} 건 입니다.
 	</c:if>
    <br/>

 <div class="row d-flex justify-content-between">
  <c:forEach var="cafe" items="${cafeList}">
  
  <div class="card myCafe col-lg-6" style="border: 1px solid #F7790A;" name ='${cafe.cafeURL}' >
  <div class="row no-gutters">
    <div class="col-md-4 d-flex align-items-center">
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
  
  </div>
</div>
  </c:if>
  <br/>
  <c:if test="${!empty postList}">
  <div class='card'>
<div class="card-body">
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
  
  </div>
  </div>
  </c:if>
  
</div>

</body>
</html>