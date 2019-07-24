<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
<title>CafeSearch</title>
<style type="text/css">
.dropdown-toggle{height: 100%; font-size: 16pt;}
#searchKeyword{width:300pt;}
</style>


</head>

<body>
<br/>
<div class="container">
  
  	
  	
  	
		<form class="form-inline justify-content-center" id='cafeSearch'>
  	<div class='card'>
<div class='card-body'>
  	<input type='hidden' id="condtioner" value='${search.searchCondition}'>
<div class="input-group d-flex justify-content-center" >
  <div class='input-group-prepend'>
  <select class="selectpicker" name='searchCondition' id='searchCondition'>
	<option class='searchCondition' value="0">카페+게시글</option>
	<option class='searchCondition' value="1">카페</option>
	<option class='searchCondition' value="2">게시글</option>
  </select>
  </div>
  <div class='input-group-append'>
  &nbsp;<input type="text" class="form-control form-control-lg" placeholder="검색어 입력해주세요" name="searchKeyword" id="searchKeyword" >
  </div>
  <div class='input-group-append'>
  &nbsp;<button class="btn btn-sm btn-outline-primary" type="button" id="cafeExplore"><i class="mdi mdi-magnify" style='font-size: 18pt;'></i></button>
	</div>
</div>
  	
  		</div><!--카드바디 -->
</div><!--카드 -->
  	
  	
  	
  	
  <div class="card">




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

<!--**********************************
        Scripts
    ***********************************-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>

	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.init.js"></script>

	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
var checkSessionUser = ${empty sessionScope.user};

$(function() {
	
	if(${!empty search.searchKeyword}){
		$("#searchKeyword").val(${search.searchKeyword});
		}
	
	if(${!empty search.searchCondition}){
		
		var count = $("#condtioner").val();
		
		if (count==0){
			$(".filter-option-inner-inner").text("카페+게시글");
			}
		if (count==1){
			$(".filter-option-inner-inner").text("카페");
			}
		if (count==2){
			$(".filter-option-inner-inner").text("게시글");
			}
		$($(".searchCondition")[count]).prop("selected",true);
	}
	
	
	$("#cafeExplore").on(
			"click",
			function() {
				$("#cafeSearch").attr("method", "POST").attr("action",
						"/cafe/main/search").submit();
			});

});


function fncGetList(currentPage) {
	  $("#currentPage").val(currentPage)
	  $("form").attr("method" , "POST").attr("action" , "/cafe/main/search").submit();
	}
	
$(function() {

	$("#cafeExplore").on("click" , function() {
		$("#cafeSearch").attr("method" , "POST").attr("action" , "/cafe/main/search").submit();
	});
	
	$("#addCafe").on("click" , function() {
		$(self.location).attr("href","/cafe/addCafe");
	});
	
	$("#moreCafe").on("click" , function() {
		$("#searchCondition").val(1);
		$("form").attr("method" , "POST").attr("action" , "/cafe/main/search").submit();
	});

	$("#morePost").on("click" , function() {
		$("#searchCondition").val(2);
		$("form").attr("method" , "POST").attr("action" , "/cafe/main/search").submit();
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

<!-- 공통 툴바용 스크립트 -->	
	<script src="/js/custom/toolbarScript.js"></script>
	
	<!-- 카페 검색용 스크립트 -->		
	<script src="/js/custom/cafeSearcher/cafeSearcher.js"></script>
</body>
</html>