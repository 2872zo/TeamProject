<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>카페멤버목록</title>

<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">

<style type="text/css">
.goToMember:hover {
cursor: pointer;
}

</style>

</head>

<body>

<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10"></circle>
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->

<div id="main-wrapper">

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/cafeManageTollbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->

		<!--**********************************
            Sidebar start
        ***********************************-->
        
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/common/cafeManageMenubar.jsp"></c:import>
		</div>
		
		<!--**********************************
            Sidebar end
        ***********************************-->

		<div class="content-body" style="min-height: 743px;">
		<form id='memberDetailForm'>
<input type="hidden" name='cafeNo' id='cafeNo' value='${search.cafeNo}'>		
<input type="hidden" name='memberNo' id='memberNo' value='0'>
</form>
		
		<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">카페관리</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">멤버목록조회</a></li>
					</ol>
				</div>
			</div>

<div class="container-fluid">
<div class='card'>
<div class='card-body'>

<form id='memberListingForm'>
<input type="hidden" name='currentPage' value='0' id='memberCurrentPage' >
<input type="hidden" name='cafeNo' 		value='${search.cafeNo}'>
<input type="hidden" name='memberGrade' value='${search.memberGrade}' id='memberGrade'>		
<input type="hidden" name='status' 		value='${search.status}' id='status'>
<input type="hidden" name='sortCode' 	value='${search.sortCode}' id='sortCode'>

<div class='row'>
<div class="col-lg-4">
  <button type="button" class='status btn btn-${ (empty search.status||search.status==0) ? "" : "outline-" }primary'>전체</button>
  <button type="button" class='status btn btn-${ search.status==1 ? "" : "outline-" }success'>활동</button>
  <button type="button" class='status btn btn-${ search.status==2 ? "" : "outline-" }danger'>정지</button>
  <button type="button" class='status btn btn-${ search.status==3 ? "" : "outline-" }secondary'>탈퇴</button>
</div>
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="input-group mb-3">
	  <div class="input-group-prepend">
	   <select class="form-control valid" aria-label="Example select with button addon" name='searchCondition' id='searchCondition'>
	    <option class='searchCondition' selected value="0" ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>닉네임</option>
	   </select>
	    </div>
	    <div class="input-group-append">
	  <input type="text" class="input-default" placeholder="검색어 입력해주세요" aria-label="Text input with dropdown button" aria-describedby="button-addon2" value='${ !empty search.searchKeyword ? search.searchKeyword : "" }' name="searchKeyword" id="searchKeyword">
	 </div>
	 <div class="input-group-append">
	    <button class="btn btn-outline-dark" type="button" id="search">검색</button>
	 </div>
	</div>
	</div>
	
	</div>
</form>	
   <button type="button" class='memberGrade btn btn-${ (empty search.memberGrade||search.memberGrade==0) ? "" : "outline-" }info'>전체</button>
   <c:set var="i" value="0" />
   <c:forEach var="cafeGrade" items="${gradeList}">
   <c:set var="i" value="${ i+1 }" />
  <button type="button" name='${cafeGrade.memberGradeCode}' class='memberGrade btn btn-${ search.memberGrade == i ? "" : "outline-" }info'>
  ${cafeGrade.gradeName}
  </button>
  </c:forEach>
  
  <br/> <br/>
<div class='d-flex justify-content-around'>
  <a href="#" class='sortCode badge badge-${ (empty search.sortCode||search.sortCode==0) ? "dark" : "light" }'>최신가입부터</a>
  <a href="#" class='sortCode badge badge-${ search.sortCode==1 ? "dark" : "light" }'>가입순서대로</a>
  <a href="#" class='sortCode badge badge-${ search.sortCode==2 ? "dark" : "light" }'>닉네임순</a>
  <a href="#" class='sortCode badge badge-${ search.sortCode==3 ? "dark" : "light" }'>닉네임역순</a>
  <a href="#" class='sortCode badge badge-${ search.sortCode==4 ? "dark" : "light" }'>출석많은순</a>
  <a href="#" class='sortCode badge badge-${ search.sortCode==5 ? "dark" : "light" }'>출석적은순</a>
 </div> 

  <table class="table table-hover">
  <thead>
    <tr>
 
      <th scope="col">닉네임</th>
      <th scope="col">등급명</th>
      <th scope="col">멤버상태</th>
      <th scope="col">가입일</th>
      <th scope="col">방문수</th>
      <th scope="col">작성글</th>
      <th scope="col">작성댓글</th>
      
    </tr>
  </thead>
  <tbody>
  
  
  <c:set var="i" value="0" />
  
  <c:forEach var="cafeMember" items="${memberList}">
 <c:set var="i" value="${i+1}" />
  <tr class='goToMember' id='${cafeMember.memberNo}'>
      
     <th scope="row">${cafeMember.memberNickname}</th>
      
      <td>${cafeMember.gradeName}</td>
      <td>
      <c:if test='${cafeMember.memberStatusCode=="cs100"}'>
      <button type="button" class='btn btn-sm btn-success' style='color: white;' disabled >활동</button>
      </c:if>
      <c:if test='${cafeMember.memberStatusCode=="cs101"}'>
     <button type="button" class='btn btn-sm btn-danger' style='color: white;' disabled >정지</button>
     </c:if>
      <c:if test='${cafeMember.memberStatusCode=="cs102"}'>
      <button type="button" class='btn btn-sm btn-secondary' style='color: white;' disabled >탈퇴</button>
      </c:if>
      </td>
      <td>${cafeMember.regDate}</td> 
      <td>${cafeMember.visitCount}</td>
      <td>${cafeMember.postCount}</td>
      <td>${cafeMember.replyCount}</td>
  </tr>
  </c:forEach>

    </tbody>
</table>
  
  <jsp:include page="../common/pageNavigator.jsp" />
 
  	<!-- col-10, #mainContent End -->
	  	<!-- row End -->

</div>
</div>
  </div>
  
  </div>
  
  </div>

<!--**********************************
        Scripts
    ***********************************-->
    <script src="/plugins/common/common.min.js"></script>
    <script src="/js/custom.min.js"></script>
    <script src="/js/settings.js"></script>
    <script src="/js/gleek.js"></script>
    <script src="/js/styleSwitcher.js"></script>
    
    <!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
    
    <script type="text/javascript">
	</script>
	<script src="/js/custom/cafeCommon.js"></script>
	
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
		//var count = $(".memberNo").index(this);
		//$("#memberNo").val($($(".memberNo")[count]).text());
		//$("#memberDetailForm").attr("method" , "POST").attr("action" , "/cafe/"+"${cafeURL}"+"/manage/getCafeMember").submit();
	});
	
	$(".goToMember").on("click" , function() {
			//alert($(this).attr("id"));
			$("#memberNo").val($(this).attr("id"));
			$("#memberDetailForm").attr("method" , "POST").attr("action" , "/cafe/"+"${cafeURL}"+"/manage/getCafeMember").submit();
		});

});
</script>
    

</body>
</html>