<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
                                            <label class="col-lg-4 col-form-label" for="val-username"><h5>카페이름 </h5>
                                            </label>
                                            <div class="col-lg-6">
                                                <h3>${cafe.cafeName}</h3>
                                            </div>
                                        </div>
                                        
                                         <hr>

                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-username"><h5>배너이미지</h5>
                                            </label>
                                            <div class="col-lg-6">
                                               <div><img src="/images/uploadFiles/bannerImg/${cafe.bannerImg}" width="300"; height="200px";/>	
												</div>
                                            </div>
                                        </div>
                                        
                                         <hr>

                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-username"><h5>메인 <span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-6">
                                               <div><img src="/images/uploadFiles/mainImg/${cafe.mainImg}" width="300"; height="200px";/>	
												</div>
                                            </div>
                                        </div>
                                        
                                         <hr>

                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-username"><h5>카페아이콘 <span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-6">
                                               <div><img src="/images/uploadFiles/cafeIcon/${cafe.cafeIcon}" width="300"; height="200px";/>	
												</div>
                                            </div>
                                        </div>
                                        
                                         <hr>
					
				  				<div class="form-group row">
                                	<div class="col-lg-8 ml-auto">
                                  		<button type="button" class="btn btn-primary">확인</button>
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

				//트루 펄스 값 한글로 나오게 하기
			 $(".autoAcceptOption").each(function(){
				    if($(this).val()=="${cafe.autoApplicationAcceptFlag}"){
				      $(this).attr("selected","selected");
				    }
			 });
			
			 $(".check").each(function(){
				    if($(this).val()=="${cafe.memberNicknameFlag}"){
				      $(this).attr("selected","selected");
				    }
			 });
				    
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
			$( "button.btn.btn-primary" ).on("click" , function() {
				alert("확인");
				//$("form").attr("method" , "POST").attr("action" , "/cafe/${cafe.cafeURL}/manage/updateCafeApplicationForm").submit();
				self.location = "/cafe/${cafe.cafeURL}/manage/dropCafeView"
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
					