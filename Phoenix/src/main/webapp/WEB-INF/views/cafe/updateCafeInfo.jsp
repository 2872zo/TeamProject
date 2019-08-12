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
<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">


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
									<form id="cafeUpdate">


								<input type="hidden" name="cafeNo" value="${cafe.cafeNo }"/>

                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-cafeURL"><h5>카페 URL</h5>
                                            </label>
                                            <div class="col-lg-6">
                                                <h3><span style="color:orange">${cafe.cafeURL}</span></h3>
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
                                            <label class="col-lg-4 col-form-label" for="val-bannerImg"><h5>메인 이미지 </h5>
                                            </label>                                           
                                            <div class="col-lg-6">
                                               <div><img src="/images/uploadFiles/mainImg/${cafe.mainImg}" id="main" width="150"; height="150px"; id="main" onerror="this.src='/images/no_image.gif'"/>
                                               </div>
                                                <input type="file" class="form-control-file" id="uploadFile2" name="uploadFile2" >
                                               </div>
                                        </div> <hr>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-bannerImg"><h5>카페 아이콘 </h5>
                                            </label>                                           
                                            <div class="col-lg-6">
                                               <div><img src="/images/uploadFiles/cafeIcon/${cafe.cafeIcon}" id="icon" width="150"; height="150px"; id="icon" onerror="this.src='/images/no_image.gif'"/>
                                               </div>
                                                <input type="file" class="form-control-file" id="uploadFile3" name="uploadFile3">
                                               </div>
                                        </div> <hr>
			  
			 							 <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="exampleFormControlSelect1"> <h5>카페 카테고리<span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-2">
                                                <select class="form-control aaa" id="exampleFormControlSelect1"	name="cafeType">								
													<option class="cafetype" value="cc100">친목/모임</option>
													<option class="cafetype" value="cc101">스포츠/레저</option>
													<option class="cafetype" value="cc102">영화</option>
													<option class="cafetype" value="cc103">게임</option>
													<option class="cafetype" value="cc104">음악</option>
													<option class="cafetype" value="cc105">여행</option>
												</select>
                                            </div>
                                        </div><hr>

				  				<div class="form-group row">
                                	<div class="col-lg-8 ml-auto">
                                  		<button type="button" class="btn btn-primary" id="update">수정</button>
                                  		<!--  <button type="button" class="btn btn-primary" id="update">수정</button>-->
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
	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	
	<script type="text/javascript">


	//유효성 검사

			function readURL(input) {
				 if (input.files && input.files[0]) {
				  var reader = new FileReader();
				  
				  reader.onload = function (e) {
				   $('#main').attr('src', e.target.result);  
				  }
				  
				  reader.readAsDataURL(input.files[0]);
				  }
				}
				  
				$("#uploadFile2").change(function(){
				   readURL(this);
				});
							
				function readURL1(input) {
					 if (input.files && input.files[0]) {
					  var reader = new FileReader();
					  
					  reader.onload = function (e) {
					   $('#icon').attr('src', e.target.result);  
					  }
					  
					  reader.readAsDataURL(input.files[0]);
					  }
					}
					  
					$("#uploadFile3").change(function(){
					   readURL1(this);
					});
	
	
	function fncUpdateCafe() {
		
		
		var cafeName = $("input[name='cafeName']").val();

		if (cafeName == null || cafeName.length < 1) {
			sweetAlert("카페이름을 입력하세요","","error");
			return false;
		}
		else{
			//alert("입력  : "+userId);
			//alert("입력  : "+pw);
			//alert("입력  : "password);
			$.ajax({
				url : "/cafe/json/checkCafeNameDuplication",
				method : "POST",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},										
				data : JSON.stringify({											
				cafeName : cafeName,		
				}),
				
				success : function(JSONData) {
					//alert(JSONData); 
					//alert(typeof(JSONData));
					
					if(JSONData != false || cafeName == "${cafe.cafeName}"){
						//alert("카페이름중복");	
	/*					swal({title:"수정하시겠습니까?",
						text:"",
						type:"warning",showCancelButton:!0,
						confirmButtonColor:"#DD6B55",
						confirmButtonText:"수정",
						cancelButtonText:"취소",
						closeOnConfirm:!1,closeOnCancel:!1},
						function(e){e?swal("수정완료","","success"):swal
						("취소","","error")})
		*/							
						$("#cafeUpdate").attr("method", "POST").attr("action","/cafe/${cafeURL}/manage/updateCafeInfo").attr("enctype","multipart/form-data").submit();
					}else if(JSONData == false){
						sweetAlert("카페이름이 중복되었습니다.","","error");
						return false;
						
					}						
				
				}
			});//ajax
			//return false;
		}//else
	}
	
	
		
	
			$(".cafetype").each(function(){
			    if($(this).val()=="${cafe.cafeType}"){
			      $(this).attr("selected","seleceted");
			    }
		 });
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#update" ).on("click" , function() {
				//alert("수정");
				
				//sweetAlert("수정.","","success");
				fncUpdateCafe();					
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
					