<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>카페정보수정</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- Bootstrap CDN -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">


		

	
		<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-success" ).on("click" , function() {
				alert("수정");
				
				$("form").attr("method" , "POST").attr("action" , "/cafe/${cafe.cafeURL}/manage/updateCafeInfo")
				.attr("enctype","multipart/form-data").submit();
			});
		});	

		 $(function() {

				$("input[name='cafeName']").on('keyup',function() {
									var inputed = $("input[name='cafeName']").val();
									 //alert("입력  : "+inputed);
											$.ajax({
												url : "/cafe/json/checkCafeNameDuplication",
												method : "POST",
												dataType : "json",
												headers : {
													"Accept" : "application/json",
													"Content-Type" : "application/json"
												},
												data : JSON.stringify({
													cafeName : inputed,
												}),

												success : function(JSONData) {
													//alert(JSONData); 
													//alert(typeof(JSONData));
									
													if (JSONData && inputed != "") {
														$("#check").children("strong")
																.remove();
														$("#check")
																.append(
																		"<strong class=\"text-success\">사용 가능합니다.</strong>");
													} else {
														$("#check").children("strong")
																.remove();
														$("#check")
																.append(
																		"<strong  class=\"text-danger\">사용 불가능합니다.</strong>");
													}
													if (inputed == "${cafe.cafeName}") {
														$("#check").children("strong")
																.remove();
														$("#check")
																.append(
																		"<strong class=\"text-success\">현재사용중인이름</strong>");
													
													}
												}
											});
										});
									});
					
			
		</script>
		</head>
		
<body>

<!--*******************
        Preloader start
    ********************-->
	<div id="preloader" style="display: none;">
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

		<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body" style="min-height: 743px;">



<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">			
					<h4 class="text-center">카페정보수정</h4>		
					<div class="basic-form">			
						<form>
						<input type="hidden" name="cafeNo" value="${cafe.cafeNo }"/>
		
  	<div class="form-group">
    <label for="exampleFormControlInput1" class="col-sm-offset-3 col-sm-3 control-label">카 페 이 름</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" name="cafeName" value="${cafe.cafeName}">
    <span id="check"> <strong>카페이름을 입력해주세요</strong>
							</span>
	    </div>
  </div>

  <div class="form-group">
    <label for="exampleFormControlInput1" class="col-sm-offset-3 col-sm-3 control-label"><h3>카페 URL</h3></label>
    <div class="col-sm-4">
    <h3>${cafe.cafeURL }</h3>
    </div>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1" class="col-sm-offset-3 col-sm-3 control-label">카페 설명</label>
    <div class="col-sm-4">
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name="cafeDetail" value="${cafe.cafeDetail}"></textarea>
    </div>
  </div>  
</form>

	  <form>
	 
	   <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">배너이미지</label>
		    <div class="col-sm-4">
		      <input type="file"  id="uploadFile" name="uploadFile" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">메인이미지</label>
		    <div class="col-sm-4">
		      <input type="file"  id="uploadFile2" name="uploadFile2" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">카페아이콘</label>
		    <div class="col-sm-4">
		      <input type="file"  id="uploadFile3" name="uploadFile3" >
		    </div>
		  </div>
  					<div class="form-group">
						<label for="exampleFormControlSelect1"
							class="col-sm-offset-1 col-sm-3 control-label">카페 카 테 고 리</label>
						<div class="col-sm-4">
							<select class="form-control" id="exampleFormControlSelect1"
								name="cafeType">								
								<option value="cc100">친목/모임</option>
								<option value="cc101">스포츠/레저</option>
								<option value="cc102">영화</option>
								<option value="cc103">게임</option>
								<option value="cc104">음악</option>
								<option value="cc105">여행</option>
							</select>
						</div>
					</div>
<div class="form-group">
						<label for="exampleFormControlSelect1"
							class="col-sm-offset-1 col-sm-3 control-label">자동가입승인여부</label>
						<div class="col-sm-4">
							<select class="form-control" id="exampleFormControlSelect1"
								name="autoApplicationAcceptFlag">								
								<option value="0">미사용</option>
								<option value="1">사용</option>
							</select>
						</div>
					</div>
					
					</form>
					
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >수정</button>
		     
		    </div>
		  </div>
		  </div>
		  </div>
		  </div>
		  </div>
		  </div>
		  </div>
		  </div>
		</div>
		  
		  
	
		<!-- form Start /////////////////////////////////////-->
		
 	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>
	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
 	
	<!--  화면구성 div end /////////////////////////////////////-->
	<script src="/js/custom/cafeCommon.js"></script>
</body>

</html>
					