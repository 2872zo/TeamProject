<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>가입양식관리</title>


<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">




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
							<h2 class="text-center">가입양식관리</h2>
							<hr style="border: solid 1px gray;">		
								<div class="basic-form">			
								<br>
									<form>

								<input type="hidden" name="cafeNo" value="${cafe.cafeNo }"/>


                                        
										<div class="form-group row">
                                            <label class="col-lg-4 col-form-label"><h5>자동가입승인여부 <span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-8">
                                                <label class="css-control css-control-primary css-checkbox" for="val-terms">
                                                    <input type="radio" class="css-control-input" id="val-terms" name="autoApplicationAcceptFlag" value="true"> <span class="css-control-indicator"></span>사용</label>
                                                    <input type="radio" class="css-control-input" id="val-terms" name="autoApplicationAcceptFlag" value="false"> <span class="css-control-indicator"></span>미사용</label>
                                            </div>
                                         </div><hr>                                        
										<div class="form-group row">
                                            <label class="col-lg-4 col-form-label"><h5>별명사용여부  <span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-8">
                                                <label class="css-control css-control-primary css-checkbox" for="val-terms">
                                                    <input type="radio" class="css-control-input" id="val-terms" name="memberNicknameFlag" value="true"> <span class="css-control-indicator"></span>카페별명</label>
                                                    <input type="radio" class="css-control-input" id="val-terms" name="memberNicknameFlag" value="false"> <span class="css-control-indicator"></span>포털닉네임</label>
                                            </div>
                                         </div><hr>
                                        
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-username"><h5>질문1</h5>
                                            </label>
                                            <div class="col-lg-4">                                            	
                                                <input type="text" class="form-control" id="val-username" name="applicationQuestion1">
                                            </div>
                                        </div><hr>
                                        
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-username"><h5>질문2</h5>
                                            </label>
                                            <div class="col-lg-4">                                            	
                                                <input type="text" class="form-control" id="val-username" name="applicationQuestion2">
                                            </div>
                                        </div><hr>

                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-username"><h5>질문3</h5>
                                            </label>
                                            <div class="col-lg-4">                                            	
                                                <input type="text" class="form-control" id="val-username" name="applicationQuestion3">
                                            </div>
                                        </div><hr>


				  				<div class="form-group row">
                                	<div class="col-lg-8 ml-auto">
                                  		<button type="submit" class="btn btn-primary">저장</button>
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

		$("button.btn.btn-primary")
				.on(
						"click",
						function() {
							alert("저장");
							$("form")
									.attr("method", "POST")
									.attr("action",
											"/cafe/${cafe.cafeURL}/manage/updateCafeApplicationForm")
									.submit();
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
	<script src="/js/custom/cafeCommon.js"></script>
</body>

</html>
