<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>카페멤버명단</title>

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
	  $("#memberCurrentPage").val(currentPage)
	  $("#memberListingForm").attr("method" , "POST").attr("action" , "/cafe/"+"${cafeURL}"+"/manage/getCafeMemberList").submit();
	}
	
$(function() {

	$("#search").on("click" , function() {
		$("#memberListingForm").attr("method" , "POST").attr("action" , "/cafe/"+"${cafeURL}"+"/manage/getCafeMemberList").submit();
	});

	$(".status").on("click" , function() {
		var count = $(".status").index(this);
		 $("#status").val(count);
		 $("#memberListingForm").attr("method" , "POST").attr("action" , "/cafe/"+"${cafeURL}"+"/manage/getCafeMemberList").submit();
	});

	$(".memberGrade").on("click" , function() {
		var count = $(".memberGrade").index(this);
		 $("#memberGrade").val(count);
		 $("#memberListingForm").attr("method" , "POST").attr("action" , "/cafe/"+"${cafeURL}"+"/manage/getCafeMemberList").submit();
	});

	$(".sortCode").on("click" , function() {
		var count = $(".sortCode").index(this);
		 $("#sortCode").val(count);
		 $("#memberListingForm").attr("method" , "POST").attr("action" , "/cafe/"+"${cafeURL}"+"/manage/getCafeMemberList").submit();
	});

	$(".memberNo").on("click" , function() {
		var count = $(".memberNo").index(this);
		$("#memberNo").val($($(".memberNo")[count]).text());
		$("#memberDetailForm").attr("method" , "POST").attr("action" , "/cafe/"+"${cafeURL}"+"/manage/getCafeMember").submit();
	});

	$(".memberStatusCode").on("click" , function() {
		var count = $(".memberStatusCode").index(this);
		alert($($(".memberNo")[count]).text());
	});

});
</script>
	<jsp:include page="../common/cafeManageTollbar.jsp" />
</head>

<body>
<div class="container">

<div class="row">
			<div class="col-2">
				<c:import url="/WEB-INF/views/common/cafeManageMenubar.jsp"></c:import>
			</div>
			
			<div class="col-10">


  <br/>

<form id='memberListingForm'>
<input type="hidden" name='currentPage' value='0' id='memberCurrentPage' >
<input type="hidden" name='cafeNo' 		value='${search.cafeNo}'>
<input type="hidden" name='memberGrade' value='${search.memberGrade}' id='memberGrade'>		
<input type="hidden" name='status' 		value='${search.status}' id='status'>
<input type="hidden" name='sortCode' 	value='${search.sortCode}' id='sortCode'>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	   <select class="custom-select custom-select" aria-label="Example select with button addon" name='searchCondition' id='searchCondition'>
	    <option class='searchCondition' selected value="0" ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>닉네임</option>
	   </select>
	    </div>
	  <input type="text" class="form-control form-control" placeholder="검색어 입력해주세요" aria-label="Text input with dropdown button" aria-describedby="button-addon2" value='${ !empty search.searchKeyword ? search.searchKeyword : "" }' name="searchKeyword" id="searchKeyword">
	 <div class="input-group-append">
	    <button class="btn btn-outline-dark" type="button" id="search">검색</button>
	 </div>
	</div>
</form>	
<form id='memberDetailForm'>
<input type="hidden" name='memberNo' value='0' id='memberNo'>
<input type="hidden" name ='cafeNo'  value='${memberList[0].cafeNo}'>
</form>
	    
<br/>

 상태별 검색:
  <button type="button" class='status btn btn-${ (empty search.status||search.status==0) ? "" : "outline-" }primary'>전체</button>
  <button type="button" class='status btn btn-${ search.status==1 ? "" : "outline-" }success'>활동중</button>
  <button type="button" class='status btn btn-${ search.status==2 ? "" : "outline-" }danger'>정지중</button>
  <button type="button" class='status btn btn-${ search.status==3 ? "" : "outline-" }secondary'>탈퇴한회원</button>
  <br/>
  
  등급별 검색:
   <button type="button" class='memberGrade btn btn-${ (empty search.memberGrade||search.memberGrade==0) ? "" : "outline-" }info'>전체</button>
   <c:set var="i" value="0" />
   <c:forEach var="cafeGrade" items="${gradeList}">
   <c:set var="i" value="${ i+1 }" />
  <button type="button" class='memberGrade btn btn-${ search.memberGrade == i ? "" : "outline-" }info'>
  ${cafeGrade.gradeName}
  </button>
  </c:forEach>
  
  <br/>
  정렬 :
  <a href="#" class='sortCode badge badge-${ (empty search.sortCode||search.sortCode==0) ? "dark" : "light" }'>최신가입부터</a>
  <a href="#" class='sortCode badge badge-${ search.sortCode==1 ? "dark" : "light" }'>가입순서대로</a>
  <a href="#" class='sortCode badge badge-${ search.sortCode==2 ? "dark" : "light" }'>닉네임순</a>
  <a href="#" class='sortCode badge badge-${ search.sortCode==3 ? "dark" : "light" }'>닉네임역순</a>
  <a href="#" class='sortCode badge badge-${ search.sortCode==4 ? "dark" : "light" }'>출석많은순</a>
  <a href="#" class='sortCode badge badge-${ search.sortCode==5 ? "dark" : "light" }'>출석적은순</a>
  

  <table class="table table-borderless">
  <thead>
    <tr>
      <th scope="col">멤버번호</th>
      <th scope="col">닉네임</th>
      <th scope="col">가입일</th>
      <th scope="col">카페번호</th>
      <th scope="col">방문수</th>
      <th scope="col">등급</th>
      <th scope="col">등급명</th>
      <th scope="col">멤버상태</th>
      
    </tr>
  </thead>
  <tbody>
  
  
  <c:set var="i" value="0" />
  
  <c:forEach var="cafeMember" items="${memberList}">
 <c:set var="i" value="${i+1}" />
  <tr>
      <th scope="row" class='memberNo'>${cafeMember.memberNo}</th>
      <td>${cafeMember.memberNickname}</td>
      <td>${cafeMember.regDate}</td>
      <td>${cafeMember.cafeNo}</td>
      <td>${cafeMember.visitCount}</td>
      <td>${cafeMember.memberGrade}</td>
      <td>${cafeMember.gradeName}</td>
      <td class='memberStatusCode'>${cafeMember.memberStatusCode}</td>
  </tr>
  </c:forEach>

    </tbody>
</table>
	
<br/>
<br/>


<br/>



  
  <jsp:include page="../common/pageNavigator.jsp" />
 
  	</div><!-- col-10, #mainContent End -->
	  	</div><!-- row End -->
  </div>


</body>
</html>