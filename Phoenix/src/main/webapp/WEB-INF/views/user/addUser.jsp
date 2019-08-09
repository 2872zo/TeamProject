<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	
	<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/custom/scroll-top.css">
	<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">
	
	<style>
		:disabled:hover{
			background-color:#FFAF00;
			boader-color:#FFAF00;
		}
	</style>
	
	<title>회원가입</title>
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
	<div class="nav-header">
       <c:import url="/WEB-INF/views/common/brand-logo.jsp"/>
   </div>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->


		<!--**********************************
            Sidebar start
        ***********************************-->
		
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
	<div class="container-fluid" style="min-height: 743px; margin:10px;">
		<div class="row d-flex justify-content-center">
			<div class="col-lg-10 ">
				<div class="card">
					<div class="card-body">			
						<h2 class="text-center">회원가입</h2>
						<hr style="border: solid 1px gray;"/>		
						
						<!-- basic-form start -->
						<div class="basic-form">			
							<br/>
							
							<!-- addUsers form start -->
							<form id="addusers">
								<%-- hidden data --%>
								<input type="hidden" name="userNo" value="${user.userNo }"/>
								
								<!-- User ID 부분 -->
                                <div class="form-group row">
                                	<label class="col-lg-4 col-form-label" for="userId1">
	    	                            <h5>아이디 <span class="text-danger">*</span></h5>
    	                            </label>
                                    <div class="col-lg-6">
                                  		<input type="text" class="form-control" id="userid" name="userId">
                                     	<span id="check"> 
                                     		<strong>아이디를 입력해주세요</strong>
										</span>
                                    </div>
                                 </div>
                                 <!-- User ID 부분 끝 -->
                                 
                                 <hr/>
                                      
                                 <!-- User Name 부분 -->
                                 <div class="form-group row">
                                     <label class="col-lg-4 col-form-label" for="userName1">
                                     	<h5>이름 <span class="text-danger">*</span></h5>
                                     </label>
                                     <div class="col-lg-6">
                                      	<input type="text" class="form-control" id="userName1" name="userName">
                                     </div>
								</div>
								<!-- User Name 부분 끝 -->
								 
								<hr/>
								
                                       
                                <!-- User Password 부분 -->    
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="password1">
										<h5>비밀번호 <span class="text-danger">*</span></h5>
									</label>
									<div class="col-lg-6">
										<input type="password" class="form-control" id="passWord" name="password">
									</div>
								</div>
								<!-- User Password 부분 끝 -->
								
								<hr/>
								
								<!-- User Password Confirm 부분 -->                  
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="password21">
										<h5>비밀번호확인<span class="text-danger">*</span></h5>
									</label>
									<div class="col-lg-6">
										<input type="password" class="form-control" id="passwordCheck" name="passwordCheck">
										<span id = "alert-success">
											<Strong class="text-success">비밀번호가 일치합니다.</Strong>
										</span>
										<span id = "alert-danger">
											<Strong class= "text-danger">비밀번호가 일치하지 않습니다.</Strong>
										</span>
									</div>
									
								</div>
                                <!-- User Password Confirm 부분 끝 -->	   
                                
                                <!-- User Password 일치 확인 부분 시작 -->
								<!-- User Password 일치 확인 부분 끝 -->
                                   
                                <hr/>
                                       
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="usernickname">
										<h5>닉네임<span class="text-danger">*</span></h5>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="usernickname" name="userNickname">
										<span id="nick"> 
											<strong>닉네임을 입력해주세요</strong>
										</span>
									</div>
								</div>
								
								<hr/>
								
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="phone1">
										<h5>전화번호 <span class="text-danger">*</span></h5>
									</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" id="phone1" name="phone" placeholder="-없이 숫자만 입력하세요">                                        
									</div>
									<div class="col-lg-1">
										<button type="button" class="btn btn-primary" id="click">전송</button>       
									</div>
								</div>
								
								<div class="form-group row" id="inj" style="display:none">
									<label class="col-lg-4 col-form-label" ></label>
									<div class="col-lg-5">
										<input type="text" class="form-control" id="sms" name="sms" placeholder="인증번호를 입력해주세요.">                                        
									</div>
									<div class="col-lg-1">
										<button type="button" class="btn btn-primary">인증</button>  
									</div>									    
								</div>
								
								<hr/>
								                             		   
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="email1">
										<h5>이메일<span class="text-danger">*</span></h5>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="email1" name="email">
									</div>
								 </div>
								 
								 <hr/>
									   
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="val-bannerImg">
										<h5>회원 프로필 </h5>
									</label>           
									<div class="col-lg-6">
										<div>
											<img src="/images/uploadFiles/profileimg/default_profile.jpg" width="100"; height="100px"; id="img"/>
										</div>
										<br/>
										<input type="file" class=""form-control-file"" id="uploadFile" name="uploadFile">
									</div>
								</div> 
								
								<hr/>		   
								                             		   
								<div class="form-group row">
									<div class="col-lg-8 ml-auto">
										<button class="btn btn-primary" id="add">가&nbsp;입</button>
										<button class="btn btn-success" id="cancle" style="color:white;">취&nbsp;소</a>
									</div>
								</div>
					  
 							</form><!-- form end -->
						</div><!-- .basic-form end -->
					</div><!-- card body end -->
				</div><!-- card end -->
			</div><!-- col-10 end -->
		</div><!-- row end -->
	</div><!-- main container end -->
</div>
		  
		  
	
		<!-- form Start /////////////////////////////////////-->



	<!--  화면구성 div end /////////////////////////////////////-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>
	
	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	
	<!-- 현재 페이지 스크립트 -->
	<script src="/js/custom/util.js"></script>
	<script type="text/javascript">

	//유효성 검사
	function fncAddUser() {
		var userName = $("input[name='userName']").val();
		var userId = $("input[id='userid']").val();
		var password = $("input[id='passWord']").val();
		var pw_confirm = $("input[id='passwordCheck']").val();
		var name = $("input[name='userName']").val();
		var email = $("input[name='email']").val();
		var phone = $("input[name='phone']").val();
		var userNickname = $("input[name='userNickname']").val();

		if (userId == null || userId.length < 1) {
			sweetAlert("아이디를 입력하세요","","error");
			return;
		}
		if((userId < "0" || userId > "9") && (userId < "A" || userId > "Z") && (userId < "a" || userId > "z")){ 
             sweetAlert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.","","error");
             return false;
         }
		if(name == null || name.length <1){
			sweetAlert("이름을 입력하세요.","","error");
			return;
		}		
		if (password == null || password.length < 1) {
			sweetAlert("비밀번호를 입력하세요","","error");
			return;
		}
		if (password.length < 1 || password.length > 12) {
			sweetAlert("비밀번호를 12자리 까지만 입력하세요","","error");
            return false;
        }
		if(pw_confirm == null || pw_confirm.length <1){			
			sweetAlert("비밀번호 확인은 입력하셔야 합니다.","","error");
			return;
		}
		if( password != pw_confirm ) {			
			sweetAlert("비밀번호 확인이 일치하지 않습니다.","","error");
			$("input:text[name='password2']").focus();
			return;
		}
		if(userNickname == null || userNickname.length <1){			
			sweetAlert("닉네임은 입력하셔야 합니다.","","error");
			return;
		}
		if (phone == null || phone.length < 1) {
			sweetAlert("전화번호를 입력하세요.","","error");
			return;
		}
		if (email == null || email.length < 1) {
			sweetAlert("이메일을 입력하세요.","","error");
			return;
		}
		if(cch !=1 ){
// 			alert(cch);
			sweetAlert("반드시 휴대전화 인증을 하셔야합니다..","","error");
			return;			
		}else{
			console.log("입력  : " + userId);
			console.log("입력  : " + password);
			$.ajax({
				url : "/user/json/checkUserIdDuplication",
				method : "POST",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},										
				data : JSON.stringify({	userId : userId	}),
				success : function(JSONData) {
					//alert(JSONData); 
					//alert(typeof(JSONData));
					if(JSONData == false){
						sweetAlert("아이디가 중복되었습니다.","","error");
						return false;
					}else{								
						$("#addusers").attr("method", "POST").attr("action","/user/addUser").attr("enctype","multipart/form-data").submit();						
					}							
				},
				error : function(){
					swal("error발생","","error");
				}
			});//ajax
			//return false;
		}//else
	}
	
	var cch = 0;
	var checkSessionUser = ${empty sessionScope.user};

	function readURL(input) {
		 if (input.files && input.files[0]) {
		  var reader = new FileReader();
		  
		  reader.onload = function (e) {
		   $('#img').attr('src', e.target.result);  
		  }
		  
		  reader.readAsDataURL(input.files[0]);
		  }
		}
		  
		$("#uploadFile").change(function(){
		   readURL(this);
		});
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#add").on("click", function(e) {
			e.preventDefault();
			fncAddUser();
		});
	});


	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#cancle").on("click", function(e) {
			e.preventDefault();
			self.location = "/";
		});
	});

	   $(function(){
	         $("#alert-success").hide();
	         $("#alert-danger").hide();
	         $("input").keyup(function(){
	             var pwd1=$("#passWord").val();
	             var pwd2=$("#passwordCheck").val();
	             if(pwd1 != "" || pwd2 != ""){
	                 if(pwd1 == pwd2){
	                	 
	                 	$("#check1").show();
	                     $("#alert-success").show();
	                     $("#alert-danger").hide();
	                     $("#submit").removeAttr("disabled");
	                 }else{
	                	 
	                	 $("#check1").hide();	
	                     $("#alert-success").hide();
	                     $("#alert-danger").show();
	                     $("#submit").attr("disabled", "disabled");
	                 }    
	             }
	         });
	     });
	
	

// 	$(function() {

// 		$("#add").on("click", function() {

// 				var inputed = $("input[id='usernickname']").val();
// 				// alert("입력  : "+inputed);

// 					$.ajax({
// 							url : "/cafe/json/checkUserNicknameDuplication",
// 							method : "POST",
// 							dataType : "json",
// 							headers : {
// 										"Accept" : "application/json",
// 										"Content-Type" : "application/json"
// 								},
// 							data : JSON.stringify({
// 							userNickname : inputed,
// 							}),

// 							success : function(JSONData) {
// 							//alert(JSONData); 
// 							//alert(typeof(JSONData));								
// 								if(JSONData == false){
									
// 									sweetAlert("닉네임이 중복되었습니다.","","error");
									
// 									return false;
// 								}else{
// 									$("#addusers").attr("method", "POST").attr("action","/user/addUser").attr("enctype","multipart/form-data").submit();
// 								}				
// 						}
// 					});
// 				});
// 			});
	

	$(function() {
 		var rand = "";
		
		$("button:contains('전송')").on("click" , function() {
			var phone = $("input[name='phone']").val();
			
			if (phone == null || phone.length < 1) {
				sweetAlert("전화번호를 입력하세요.","","error");
				return;
			}

			$("#inj").show();
			
			$.ajax({ 
				   url: "/user/json/sendSms",
				   data: { 
					   receiver: $("#phone1").val()
					   }, 
					   type: "post",
					   dataType:"json", 
			
					   success : function(JSONData){
							console.log(JSONData);   
			
							rand = JSONData.rand;
				   
				   }  
				 }); 
			});
		
			$("button:contains('인증')").on("click" ,function(){ 
				var join = document.getElementById('join');
				var phone = document.getElementById("phone1");
				var code = $("#sms").val();
				
				if (rand == code) { 
					sweetAlert("인증 성공","","success");
				    $("#inj").hide();
				    
					phone.style.border = "3px solid gold";
					phone.readOnly = true;
					
				   	cch = 1;
				   	
					$("#pij").hide();
					$("#click").attr("disabled","disabled");
						
				 } else { 
				 	sweetAlert("인증 실패","인증번호를 확인해 주십시오.","error"); 
				 } 
		   });
	   });

	//한글 입력못하게
	$(function() {
		$("input[name='phone']").on('keyup',function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
	 });

	//카페이름 중복확인 
	$(function() {

		$("input[id='userid']").on('keyup',function() {
					
			inputed = $("input[id='userid']").val();
			//alert("입력  : "+inputed);
	
					$.ajax({
						url : "/user/json/checkUserIdDuplication",
						method : "POST",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							userId : inputed,
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
																			
							}else {
								$("#check").children("strong")
										.remove();
								$("#check")
										.append(
												"<strong  class=\"text-danger\">사용 불가능합니다.</strong>");
							}
							if ((inputed < "0" || inputed > "9") && (inputed < "A" || inputed > "Z") && (inputed < "a" || inputed > "z")) {
								$("#check").children("strong")
										.remove();
								$("#check")
										.append(
												"<strong class=\"text-danger\">사용 불가능합니다.</strong>");
							}
							if (inputed == "") {
								$("#check").children("strong")
										.remove();
								$("#check")
										.append(
												"<strong class=\"text-muted\">아이디를 입력해주세요.</strong>");
	
							}											
						}
					});
			  });
		});
	
	$(function() {
		$("input[id='usernickname']").on('keyup',function() {
					
			var tableName = "users";		//사용할 테이블
			var colum = "user_nickname";			//데이터를 확인할 컬럼
			var valueColum = "user_nickname";		//조건식을 비교할 컬럼
			var value = $("input[id='usernickname']").val();		//조건식에 넣을 데이터

			if (value == "") {
				$("#nick").children("strong").remove();
				$("#nick").append("<strong class=\"text-muted\">아이디를 입력해주세요.</strong>");

			}	
// 			else if ((value < "0" || value > "9") && (value < "A" || value > "Z") && (value < "a" || value > "z")) {
// 				$("#nick").children("strong").remove();
// 				$("#nick").append("<strong class=\"text-danger\">사용 불가능합니다.</strong>");
// 			}
			else{
				ValidationCheck(tableName,colum,valueColum,value,function(output){
					if(output == "true"){				
						$("#nick").children("strong").remove();
						$("#nick").append("<strong class=\"text-success\">사용 가능합니다.</strong>");
					}else{
						$("#nick").children("strong").remove();
						$("#nick").append("<strong  class=\"text-danger\">사용 불가능합니다.</strong>");
					}
				});
			}
	
// 					success : function(JSONData) {
// 						//alert(JSONData); 
// 						//alert(typeof(JSONData));

// 						if (JSONData && inputed != "") {
// 							$("#nick").children("strong")
// 									.remove();
// 							$("#nick")
// 									.append(
// 											"<strong class=\"text-success\">사용 가능합니다.</strong>");	
																		
// 						}else {
// 							$("#nick").children("strong")
// 									.remove();
// 							$("#nick")
// 									.append(
// 											"<strong  class=\"text-danger\">사용 불가능합니다.</strong>");
// 						}
// 																
// 					}
			});
		});
</script>

<script src="/js/custom/userCommon.js"></script>
<script src="/js/custom/toolbarScript.js"></script>
</body>

</html>
