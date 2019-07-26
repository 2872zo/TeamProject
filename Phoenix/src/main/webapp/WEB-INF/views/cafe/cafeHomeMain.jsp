<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">
<!-- 토스터 css -->
<link rel="stylesheet" href="/plugins/toastr/css/toastr.min.css">
<!-- 토스터 css -->
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../common/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<title>CafeTabMain</title>
<!--셀렉터 사이즈 조절-->

<style type="text/css">
.dropdown-toggle{height: 100%; font-size: 16pt;}
#searchKeyword{width:300pt;}
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


	<!--  화면구성 div Start /////////////////////////////////////-->
	<br/>
	<div class="container">

		<form class="form-inline justify-content-center" id='cafeSearch'>
			<input type="hidden" id="currentPage" name="currentPage" value="0" />
			<input type="hidden" name='cafeURL'
				value='${ !empty search.cafeURL ? search.cafeURL : "" }'> <input
				type="hidden" name='boardName'
				value='${ !empty search.boardName ? search.boardName : "" }'>
<div class='card'>
<div class='card-body'>
<input type='hidden' id="condtioner" value='${search.searchCondition}'>
<div class="input-group" >
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
	
	</div><!--카드바디 -->
</div><!--카드 -->

</div><!--인풋그룹-->
</form>

		<form id="cafeHomeForm">
			<input type="hidden" id="userNo" name="userNo"
				value="${search.userNo}" />
			<input type="hidden" id="status" name="status" 
				value="${search.status}" /> 
			<input type="hidden" id="cafeType" name="cafeType" 
				value="${search.cafeType}" />
			<input type="hidden" id="boardNo" name="boardNo" 
				value="0" />
		</form>
		
	<div class="card">
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	
			</div>
	

		<c:if test="${!empty sessionScope.user}">
			
			<div class="card">
			<div class="card-body">
	
			<button type="button" class="btn btn-outline-warning btn-block"
				id='addCafe'>카페 만들기</button>
			</div>
			</div>
			
			<div class="card" id='myCafePosition' style='min-height: 300px;'>
			<div class="card-body">

			<div class="btn-group d-flex justify-content-center" role="group">
				<button type="button" role="group"
					class='btn btn-outline-primary col-lg-3 cafeListing'>활동중인 카페</button>
				<button type="button" role="group"
					class='btn btn-outline-primary col-lg-3 cafeListing'>즐겨찾기 카페</button>
				<button type="button" role="group"
					class='btn btn-outline-primary col-lg-3 cafeListing'>운영중인 카페</button>
				<button type="button" role="group"
					class='btn btn-outline-primary col-lg-3 cafeListing'>정지당한 카페</button>
			</div>
			
			<br/>

			<c:if test="${!empty myCafelist}">

				<div class="row d-flex justify-content-between">
					<c:forEach var="myCafe" items="${myCafelist}">
			
		
						<div class="card myCafe col-lg-6" style=" border: 1px solid #F7790A; "
							name='${myCafe.cafeURL}'>
							<div class="row no-gutters d-flex align-items-center">
								<div class="col-md-4">
									<img src="/images/common/16by9.png" class="card-img" alt="..."
										style="background: url('/images/uploadfiles/cafeicon/${myCafe.cafeIcon}');
      									no-repeat center center; background-size:cover;">
								</div>
								<input type='hidden' class='memberNo' value='${myCafe.memberNo}'>
								<div class="col-md-7">
										<h5 class="card-title">${myCafe.cafeName}</h5>
										<p class="card-text">${myCafe.cafeDetail}</p>	
								</div>
								<div class="col-md-1">
								<c:if test="${myCafe.favorited}">
										<i class="favorited d-flex justify-content-end mdi mdi-bookmark-check ${myCafe.favorited}" style='font-size: 35pt;'></i> 
										</c:if>
										<c:if test="${!myCafe.favorited}">
										<i class="favorited d-flex justify-content-end mdi mdi-bookmark-outline ${myCafe.favorited}" style='font-size: 35pt;'></i> 
										</c:if>
								</div>
							</div>
						</div>

					</c:forEach>

				</div>

			</c:if>
</div>
</div>
		</c:if>

		<br />
<div class="card" style='min-height: 300px;'>
<div class="card-body" id='cafeCategoryPosition'>

		<div class="btn-group d-flex justify-content-center" role="group">
			<button type="button" role="group"
				class='btn btn-outline-success col-lg-2 cafeCategory'>친목/모임</button>
			<button type="button" role="group"
				class='btn btn-outline-success col-lg-2 cafeCategory'>스포츠/레저</button>
			<button type="button" role="group"
				class='btn btn-outline-success col-lg-2 cafeCategory'>영화</button>
			<button type="button" role="group"
				class='btn btn-outline-success col-lg-2 cafeCategory'>게임</button>
			<button type="button" role="group"
				class='btn btn-outline-success col-lg-2 cafeCategory'>음악</button>
			<button type="button" role="group"
				class='btn btn-outline-success col-lg-2 cafeCategory'>여행</button>
		</div>
		
		<br/>

		<c:if test="${!empty categorizedCafeList}">

			<div class="row d-flex justify-content-between">
				<c:forEach var="categoryCafe" items="${categorizedCafeList}">


					<div class="card myCafe col-lg-6" name='${categoryCafe.cafeURL}' style=" border: 1px solid #F7790A; ">
						<div class="row no-gutters">
							<div class="col-md-4 d-flex align-items-center">
							<img src="/images/common/16by9.png" class="card-img" alt="..."
								style=" border:thin; border-color=red; 
										background: url('/images/uploadFiles/cafeicon/${categoryCafe.cafeIcon}');
 										no-repeat center center; background-size:cover;">
							</div>
							<div class="col-md-8">
								<div class="card-body">
								<h5 class="card-title">${categoryCafe.cafeName}</h5>
								<p class="card-text">${categoryCafe.cafeDetail}</p>
								<p class="card-text">
								<small class="text-muted">${categoryCafe.regDate}</small>
								</p>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>
				
			</div>
		</c:if>
	</div>
		</div>

	</div>
	

	<!--  화면구성 div Start /////////////////////////////////////-->
	
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
	<!-- 토스트기 -->
	<script src="/plugins/toastr/js/toastr.min.js"></script>
    	
	
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


$(function() {
	
		$($(".cafeListing")[$("#status").val()]).attr("class",
				"btn btn-primary col-lg-3 cafeListing");

		$($(".cafeCategory")[$("#cafeType").val()]).attr("class",
				"btn btn-success col-lg-2 cafeCategory");
		
		if(${search.boardNo != 0}){
			if(${search.boardNo == 1}){
				var goTo = $('#myCafePosition').offset(); 
				}
			if(${search.boardNo == 2}){
				var goTo = $('#cafeCategoryPosition').offset(); 
			}
       		$('html').animate({scrollTop : goTo.top}, 0);
		}
		
		$("#addCafe").on("click", function() {
			$(self.location).attr("href", "/cafe/addCafeView");
		});

		$(".cafeListing").on(
				"click",
				function() {
					$("#boardNo").val("1");
					var count = $(".cafeListing").index(this);
					$("#status").val(count);
					$("#cafeHomeForm").attr("method", "POST").attr("action",
							"/cafe/main").submit();
				});

		$(".cafeCategory").on(
				"click",
				function() {
					$("#boardNo").val("2");
					var count = $(".cafeCategory").index(this);
					$("#cafeType").val(count);
					$("#cafeHomeForm").attr("method", "POST").attr("action",
							"/cafe/main").submit();
				});

		$(".myCafe").on("click", function(aaa) {
			//alert($(aaa.target).html());
			var moveTo = $(this).attr('name');
			if (!$(aaa.target).hasClass("favorited")) {
				$(self.location).attr("href", "/cafe/" + moveTo);
			}

		});

		$(".favorited").on(
				"click",
				function() {
					var targetTag = $(this);
					var checker = $(this).hasClass("true");
					var reChecker = !checker;
					//alert(reChecker);
			
					var memberJson = $(
							$(".memberNo")[$(".favorited").index(this)]).val();

					var jsoned = {
						memberNo : memberJson,
						favoriteFlag : reChecker
					};
					jsoned = JSON.stringify(jsoned);
					$.ajax({
						type : "POST",
						url : "/cafe/main/json/updateFavorite",
						data : jsoned,
						contentType : "application/json", //보내는 컨텐츠의 타입
						//dataType : "json",      //받아올 데이터의 타입 필요없음
						success : function(serverData, status) {
							if(reChecker==false){
								targetTag.attr("class","favorited d-flex justify-content-end mdi mdi-bookmark-outline "+reChecker);

								toastr.error(
										"즐겨찾기메뉴에서 확인 가능합니다.",
										"즐겨찾기에서 삭제되었습니다.",
										{positionClass:"toast-bottom-right",
										timeOut:3e3,closeButton:!0,debug:!1,
										newestOnTop:!0,
										progressBar:!0,
										preventDuplicates:!1,
										onclick:null,
										showDuration:"300",hideDuration:"1000",
										extendedTimeOut:"1000",
										showEasing:"swing",hideEasing:"linear",
										showMethod:"fadeIn",
										hideMethod:"fadeOut",
										tapToDismiss:!1}
										);
								}
							if(reChecker==true){
								targetTag.attr("class","favorited d-flex justify-content-end mdi mdi-bookmark-check "+reChecker);

								toastr.success(
										"즐겨찾기메뉴에서 확인 가능합니다.",
										"즐겨찾기에 추가되었습니다.",
										{positionClass:"toast-bottom-right",
										timeOut:3e3,closeButton:!0,debug:!1,
										newestOnTop:!0,
										progressBar:!0,
										preventDuplicates:!1,
										onclick:null,
										showDuration:"300",hideDuration:"1000",
										extendedTimeOut:"1000",
										showEasing:"swing",hideEasing:"linear",
										showMethod:"fadeIn",
										hideMethod:"fadeOut",
										tapToDismiss:!1}
										);
								
								}
							
						},
						error : function(request, status, error) {
							alert("에러남 : " + error);
						}
					});
				});

	});
</script>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
<!-- 공통 툴바용 스크립트 -->	
	<script src="/js/custom/toolbarScript.js"></script>

</body>
</html>