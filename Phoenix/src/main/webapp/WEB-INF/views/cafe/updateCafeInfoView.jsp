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


<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">


		</head>
		
<body>


<style>
code {
    font-size: 87.5%;
    color: orange;
    word-break: break-word;
}
</style>
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

		<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body" style="min-height: 743px;">



		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">			
							<h2 class="text-center">카페정보수정</h2>
							<hr style="border: solid 1px gray;">		
								<div class="basic-form">			
								<br>
									<form>

								<input type="hidden" name="cafeNo" value="${cafe.cafeNo }"/>

                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-cafeURL"><h5>카페 URL</h5>
                                            </label>
                                            <div class="col-lg-6">
                                                <h3>http://localhost:8080/<code>${cafe.cafeURL}</code></h3>
                                            </div>
                                        </div> <hr>


                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-username"><h5>카페이름 <span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="val-username" name="cafeName" placeholder="" value="${cafe.cafeName }">
                                                <span id="check"> <strong>중복확인</strong>
													</span>
                                            </div>
                                        </div>
                                        
                                         <hr>
                                        
                                        
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-cafeDetail"><h5>카페설명</h5>
                                            </label>
                                            <div class="col-lg-6">
                                                <textarea class="form-control" id="val-username" name="cafeDetail" rows="6" value="">${cafe.cafeDetail}</textarea>
                                            </div>
                                        </div> <hr>
                                        
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-bannerImg"><h5>배너 이미지 </h5>
                                            </label>                                           
                                            <div class="col-lg-6">
                                               <div><img src="/images/uploadFiles/bannerImg/${cafe.bannerImg}" width="300"; height="200px";/>
                                               </div>
                                                <input type="file" class="form-control-file" id="uploadFile" name="uploadFile">
                                               </div>
                                        </div> <hr>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-bannerImg"><h5>메인 이미지 </h5>
                                            </label>                                           
                                            <div class="col-lg-6">
                                               <div><img src="/images/uploadFiles/mainImg/${cafe.mainImg}" width="300"; height="200px";/>
                                               </div>
                                                <input type="file" class=""form-control-file"" id="uploadFile2" name="uploadFile2" >
                                               </div>
                                        </div> <hr>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-bannerImg"><h5>카페 아이콘 </h5>
                                            </label>                                           
                                            <div class="col-lg-6">
                                               <div><img src="/images/uploadFiles/cafeIcon/${cafe.cafeIcon}" width="300"; height="200px";/>
                                               </div>
                                                <input type="file" class=""form-control-file"" id="uploadFile3" name="uploadFile3">
                                               </div>
                                        </div> <hr>
			  
			 							 <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="exampleFormControlSelect1"> <h5>카페 카테고리<span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-6">
                                                <select class="form-control aaa" id="exampleFormControlSelect1"	name="cafeType">								
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
                                  		<button type="submit" class="btn btn-primary">수정</button>
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
		
 	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>
	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
	
	<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				alert("수정");

				$("#exampleFormControlSelect1 option:selected").text();
	            $("option:selected").text();
	            $(":selected").text();

	
		
				$("form").attr("method" , "POST").attr("action" , "/cafe/${cafe.cafeURL}/manage/updateCafeInfo")
				.attr("enctype","multipart/form-data").submit();
			});
		});	

		 $(function() {

				$("input[name='cafeName']").on('keyup',function() {
				
									var inputed = $("input[name='cafeName']").val();
									 //alert("입력  : "+inputed);
											$.ajax({
												url : "/cafe/${cafeURL}/json/checkCafeNameDuplication",
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
					
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("a[href='#' ]").on("click", function() {
					//$("form")[0].reset();
					self.location = "/cafe/${cafe.cafeURL}/manage/dropCafeView"
				});
			});
			
		</script>
 	
	<!--  화면구성 div end /////////////////////////////////////-->
	<script src="/js/custom/cafeCommon.js"></script>
</body>

</html>
					