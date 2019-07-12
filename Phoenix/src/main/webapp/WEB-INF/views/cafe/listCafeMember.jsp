<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>카페멤버조회화면임</title>

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
	  $("#memberCurrentPage").val(currentPage)
	  $("#memberListingForm").attr("method" , "POST").attr("action" , "/cafe/randomURL/getCafeMemberList").submit();
	}
	
$(function() {
	$(".userCondition").on("click" , function() {
		alert($(".userCondition").index(this));
	});
	
});
</script>
<jsp:include page="../common/cafeToolbar.jsp" />
</head>

<body>
<div class="container">
  카페멤버리스트조회 화면입니다
  <br/>



<form id='memberListingForm'>
		<input type="hidden" name = 'cafeNo' value='${search.cafeNo}'>
		<input type="hidden" name='currentPage' id='memberCurrentPage' value='0'>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	   <select class="custom-select custom-select" aria-label="Example select with button addon" name='searchCondition' id='searchCondition'>
	    <option class='searchCondition' selected value="0"   ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>닉네임</option>
	   </select>
	    </div>
	  <input type="text" class="form-control form-control" placeholder="검색어 입력해주세요" aria-label="Text input with dropdown button" aria-describedby="button-addon2" value='${ !empty search.searchKeyword ? search.searchKeyword : '' }' name="searchKeyword" id="searchKeyword">
	 <div class="input-group-append">
	    <button class="btn btn-outline-dark" type="button" id="search">검색</button>
	 </div>
	</div>
</form>	




	    
<br/>
 상태별 검색:
  <button type="button" class="userCondition btn btn-primary ">전체</button>
  <button type="button" class="userCondition btn btn-outline-success">활동중</button>
  <button type="button" class="userCondition btn btn-outline-danger">일시정지</button>
  <button type="button" class="userCondition btn btn-outline-dark">영구정지</button>
  <br/>
  
  등급별 검색:
  <button type="button" class="userGrade btn btn-info">전체</button>
  <button type="button" class="userGrade btn btn-outline-info">매니저</button>
  <button type="button" class="userGrade btn btn-outline-info">스태프</button>
  <button type="button" class="userGrade btn btn-outline-info">5단계회원</button>
  <button type="button" class="userGrade btn btn-outline-info">4단계회원</button>
  <button type="button" class="userGrade btn btn-outline-info">3단계회원</button>
  <button type="button" class="userGrade btn btn-outline-info">2단계회원</button>
  <button type="button" class="userGrade btn btn-outline-info">1단계회원</button>
  <br/>
  정렬 :
  <a href="#" class="orderBy badge badge-light">최신가입순</a>
  <a href="#" class="orderBy badge badge-light">가입오래된순</a>
  <a href="#" class="orderBy badge badge-light">닉네임순</a>
  <a href="#" class="orderBy badge badge-light">출석순</a>
  
  
  <table class="table table-borderless">
  <thead>
    <tr>
      <th scope="col">멤버번호</th>
      <th scope="col">닉네임</th>
      <th scope="col">가입일</th>
      <th scope="col">카페번호</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="cafeMember" items="${memberList}">
  <tr>
      <th scope="row">${cafeMember.memberNo}</th>
      <td>${cafeMember.memberNickname}</td>
      <td>${cafeMember.regDate}</td>
      <td>${cafeMember.cafeNo}</td>
  </tr>
  </c:forEach>
    </tbody>
</table>

<br/>
<br/>
<br/>

<div class = 'container'>

	

</div>
  
  <jsp:include page="../common/pageNavigator.jsp" />
</div>
</body>
</html>