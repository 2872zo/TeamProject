<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/toolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>로그인</title>


<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">
<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">
	
	<style>
	input[type="submit"] {
	float: left;
	/*  display:block; */
	height: 50px;
	background: #FFBB00;
	border-radius: 5px;
	border: none;
	font-family: "맑은 고딕";
}
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
							<h2 class="text-center">로그인</h2>
							<hr style="border: solid 1px gray;">		
								<div class="basic-form">			
								<br>
			     
  
  <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href="index.html"> <h4>Phoenix</h4></a>
        
                                <form class="mt-5 mb-5 login-input">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="ID" id="userId" name="userId">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" placeholder="Password" id="password" name="password">
                                    </div>
                                    <button class="btn login-form__btn submit w-100" id = "logon">로그인</button>
                                    
                                </form>
                                <a href="/user/addUserView" class="text-primary" id="addUser1">회원가입</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
  <input type="hidden" name="targetURL" value="${targetURL }">


	 			 	 </div>
		  			</div>
		  		   </div>
		 		  </div>
		 		 </div>
		 	    </div>
		 	   </div>
			  </div>
		  

 	<!--  화면구성 div end /////////////////////////////////////-->
 	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>
	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	
	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script type="text/javascript">
	
		//============= "로그인"  Event 연결 =============
	$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#logon").on("click" , function() {
				
				var id=$("input[id='userId']").val();
				var pw=$("input[id='password']").val();
				
				if(id == null || id.length <1) {
					
					sweetAlert("아이디를 입력하세요","","error");
					$("input[id='userId']").focus();
					
					return false;
				}else if(pw == null || pw.length <1) {
					sweetAlert("비밀번호를 입력하세요","","error");
					$("input[id='password']").focus();
					return false;
				}else{
					//alert("입력  : "+id);
					//alert("입력  : "+pw);
					//alert("입력  : "password);
					$.ajax({
						url : "/user/json/login",
						method : "POST",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},										
						data : JSON.stringify({											
						userId : id,
						password : pw,
						}),
						
						success : function(JSONData) {
							//alert(JSONData); 
							//alert(typeof(JSONData));
							
							if(JSONData == false){
								
								sweetAlert("아이디 또는 비밀번호가 일치하지 않습니다.","","error");
								return false;
							}else{								
							self.location = "/";							
							}							
						}
					});//ajax
					return false;
				}//else
			}); 
		});	



	</script>		
</body>

</html>