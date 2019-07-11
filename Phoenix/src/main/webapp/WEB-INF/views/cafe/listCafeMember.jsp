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
	
	
});
</script>
<jsp:include page="../common/cafeToolbar.jsp" />
</head>

<body>
<div class="container">
  카페멤버리스트조회 화면입니다
  
  <br/>
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
<br/><br/><br/>
  <div class = 'container'>

<div class="input-group">
<form id='memberListingForm'>
	<input type="hidden" id="memberCurrentPage" name="currentPage" value="0"/>
	<input type="text" class="form-control" placeholder="카페번호" name = 'cafeNo' value='${ !empty search.cafeNo ? search.cafeNo : "" }'  aria-describedby="button-addon4">
	<input type="text" class="form-control" placeholder="멤버번호" name = 'boardName' value='${ !empty search.boardName ? search.boardName : "" }' aria-describedby="button-addon4">
	</form>
	<div class="input-group-append" id="button-addon4">
    <button class="btn btn-outline-warning" type="button" id = 'memberList'>맴버리스트</button>
    <button class="btn btn-outline-success" type="button" id= 'memberDetail'>멤버상세</button>
  </div>
</div>

</div>
  
  <jsp:include page="../common/pageNavigator.jsp" />
</div>
</body>
</html>