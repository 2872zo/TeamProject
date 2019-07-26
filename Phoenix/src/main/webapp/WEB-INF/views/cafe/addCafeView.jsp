<%@ page contentType="text/html; charset=utf-8"%>

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
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<!--  ///////////////////////// CSS ////////////////////////// -->

<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">

<style type="text/css">

</style>

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



<!--**********************************
            Sidebar start
        ***********************************-->
		
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
							<h2 class="text-center">카페만들기</h2>
							<hr style="border: solid 1px gray;">		
								<div class="basic-form">			
								<br>
									<form>

								<input type="hidden" name="cafeNo" value="${cafe.cafeNo }"/>

                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-username"><h5>카페이름 <span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-6">
                                            	
                                                <input type="text" class="form-control" id="val-username" name="cafeName">
                                                <span id="check"> <strong>카페이름을 입력해주세요</strong>
													</span>
                                            </div>
                                        </div><hr>
                                        
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="val-username"><h5>카페주소 <span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-2">
                                            <h4>http://localhost:8080/</h4>
                                            </div>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="val-username" name="cafeURL">
                                                <span id="check1"> <strong>카페주소를 입력해주세요</strong>
													</span>
                                                
                                            </div>
                                        </div>
                                        <hr>
                                        
                                        
										<div class="form-group row">
                                            <label class="col-lg-4 col-form-label"><h5>자동가입승인여부</a>  <span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-8">
                                                <label class="css-control css-control-primary css-checkbox" for="val-terms">
                                                    <input type="radio" class="css-control-input" id="val-terms" name="autoApplicationAcceptFlag" value="1"> <span class="css-control-indicator"></span>사용</label>
                                                    <input type="radio" class="css-control-input" id="val-terms" name="autoApplicationAcceptFlag" value="0"> <span class="css-control-indicator"></span>미사용</label>
                                            </div>
                                         </div><hr>

                                     
										<div class="form-group row">
                                            <label class="col-lg-4 col-form-label"><h5>별명사용여부</a>  <span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-8">
                                                <label class="css-control css-control-primary css-checkbox" for="val-terms">
                                                    <input type="radio" class="css-control-input" id="val-terms" name="memberNicknameFlag" value="1"> <span class="css-control-indicator"></span>카페별명</label>
                                                    <input type="radio" class="css-control-input" id="val-terms" name="memberNicknameFlag" value="0"> <span class="css-control-indicator"></span>포털닉네임</label>
                                            </div>
                                         </div><hr>

                                        
                                        
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-cafeDetail"><h5>카페설명</h5>
                                            </label>
                                            <div class="col-lg-6">
                                                <textarea class="form-control" id="val-username" name="cafeDetail" rows="6"></textarea>
                                            </div>
                                        </div> <hr>
      	
      								 <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="exampleFormControlSelect1"> <h5>카페 카테고리<span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-6">
                                                <select class="form-control" id="exampleFormControlSelect1"	name="cafeType">								
													<option value="cc100">친목/모임</option>
													<option value="cc101">스포츠/레저</option>
													<option value="cc102">영화</option>
													<option value="cc103">게임</option>
													<option value="cc104">음악</option>
													<option value="cc105">여행</option>
												</select>
                                            </div>
                                            </div><hr>
				  				<div class="form-group row">
                                	<div class="col-lg-8 ml-auto">
                                  		<button type="button" class="btn btn-primary">만들기</button>
                                  		 <a class="btn btn-success btn" href="#" role="button">취&nbsp;소</a>
                                    </div>
                                   </div>
						  
	 					</form>
	 						
		 			 </div>
		  			</div>
		  		   </div>
		 		  </div>
		 		 </div>
		 	    </div>
		 	   </div>
			  </div>
		  
		  
	
		<!-- form Start /////////////////////////////////////-->
		
	

	<!--  화면구성 div end /////////////////////////////////////-->

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
	
	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	

	<script type="text/javascript">

	var checkSessionUser = ${empty sessionScope.user};
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-primary").on("click", function() {
			fncAddCafe();
		});
	});

	//유효성 검사
	function fncAddCafe() {

		
		
		var cafeName = $("input[name='cafeName']").val();
		var cafeURL = $("input[name='cafeURL']").val();

		if (cafeName == null || cafeName.length < 1) {
			sweetAlert("카페이름은 반드시 입력하셔야 합니다.","","error");
		//	alert("카페이름은 반드시 입력하셔야 합니다.");
			return;
		}
		if (cafeURL == null || cafeURL.length < 1) {
			sweetAlert("카페URL은 반드시 입력하셔야 합니다.","","error");
			//alert("카페URL은  반드시 입력하셔야 합니다.");
			return;
		}
		if((cafeURL < "0" || cafeURL > "9") && (cafeURL < "A" || cafeURL > "Z") && (cafeURL < "a" || cafeURL > "z")){
			sweetAlert("한글 및 특수문자는 카페URL로 사용하실 수 없습니다.","","error");
           // alert("한글 및 특수문자는 카페이름으로 사용하실 수 없습니다.");
            return false;
        }else if($("input[name='cafeURL']").on('keyup')){

		$.ajax({
			url : "/cafe/json/checkCafeURLDuplication",
			method : "POST",
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},										
			data : JSON.stringify({											
			cafeURL : cafeURL,		
			}),
			
			success : function(JSONData) {
				//alert(JSONData); 
				//alert(typeof(JSONData));
				
				if(JSONData == false){
					
					sweetAlert("카페URL이 중복되었습니다.","","error");
					
					return false;
				}else{			
										
					$("#adduser").attr("method", "POST").attr("action","/user/addUser").submit();						
				}							
			}
		});//ajax		
		}
	//	alert("만들기");
	//	$("form").attr("method", "POST").attr("action","/cafe/addCafe").submit();
	}
	//카페이름 중복확인 
	
	
	//============= "만들기"  Event 연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn btn-primary").on("click", function() {
			fncAddCafe();
		});
	});

	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click", function() {
			//$("form")[0].reset();
			self.location = "/cafe/main"
		});
	});

	$(function() {

		$("input[name='cafeName']").on('keyup',function() {

				var inputed = $("input[name='cafeName']").val();
				// alert("입력  : "+inputed);

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
								  
									if (inputed == "") {
											$("#check").children("strong")
													.remove();
											$("#check")
													.append(
													"<strong class=\"text-muted\">카페이름을 입력해주세요.</strong>");
										}
									}
								});
							});
						});

	$(function() {

		$("input[name='cafeURL']").on('keyup',function() {

				var inputed = $("input[name='cafeURL']").val();
				// alert("입력  : "+inputed);

					$.ajax({
							url : "/cafe/json/checkCafeURLDuplication",
							method : "POST",
							dataType : "json",
							headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
								},
							data : JSON.stringify({
							cafeURL : inputed,
							}),

							success : function(JSONData) {
							//alert(JSONData); 
							//alert(typeof(JSONData));								
								   if (JSONData && inputed != "") {
									$("#check1").children("strong")
												.remove();
									$("#check1")
												.append(
													"<strong class=\"text-success\">사용 가능합니다.</strong>");
										} else {
											$("#check1").children("strong")
													.remove();
											$("#check1")
													.append(
													"<strong  class=\"text-danger\">사용 불가능합니다.</strong>");
										}
								   if ((inputed < "0" || inputed > "9") && (inputed < "A" || inputed > "Z") && (inputed < "a" || inputed > "z")) {
										$("#check1").children("strong")
												.remove();
										$("#check1")
												.append(
														"<strong class=\"text-danger\">사용 불가능합니다.</strong>");
									}
									if (inputed == "") {
											$("#check1").children("strong")
													.remove();
											$("#check1")
													.append(
													"<strong class=\"text-muted\">카페이름을 입력해주세요.</strong>");
										}
									}
								});
							});
						});

	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click", function() {
			//$("form")[0].reset();
			self.location = "/cafe/main"
		});
	});
	
</script>
	<script src="/js/custom/toolbarScript.js"></script>

	<script src="/js/custom/cafeCommon.js"></script>

</body>

</html>
