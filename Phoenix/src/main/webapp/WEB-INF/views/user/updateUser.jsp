<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
           <div class="nav-header">
            <c:import url="/WEB-INF/views/common/brand-logo.jsp"/>
        </div>

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/toolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>회원정보수정</title>


<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">
<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">


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
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/common/userAdminMenubar.jsp"></c:import>
		</div>


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
<div class="content-body " style="min-height: 743px;">



		<div class="container-fluid ">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">			
							<h2 class="text-center">회원정보수정</h2>
							<hr style="border: solid 1px gray;">		
								<div class="basic-form " >			
								<br>
									<form id="updateUser">

								<input type="hidden" name="userNo" value="${user.userNo }"/>

                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-cafeURL"><h5>아이디</h5>
                                            </label>
                                            <div class="col-lg-6">
                                                <h3><span>${user.userId}</span></h3>
                                            </div>
                                        </div> <hr>
                                     
                                        
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userName1"><h5>이름 <span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-6">
                                             <input type="text" class="form-control" id="userName1" name="userName" value="${user.userName }">
                                            </div>
                                       	   </div><hr>
                                        
                                        
										<div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="password1"><h5>비밀번호 <span class="text-danger">*</span></h5>
                                             </label>
                                            <div class="col-lg-6">
                                             <input type="password" class="form-control" id="passWord" name="password" value="${user.password }">
                                            </div>
                                       	   </div><hr>

                                     
										<div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="password21"><h5>비밀번호확인<span class="text-danger">*</span></h5>
                                             </label>
                                            <div class="col-lg-6">
                                             <input type="password" class="form-control" id="passwordCheck" name="passwordCheck" value="${user.password }">
                                            </div>
                                       	   </div>
                                   	   <hr>
									<div class="form-group">
							  <label class="col-lg-4 col-form-label" for="password3"></label>
							<!--   <div class="col-sm-4" id="alert-success">비밀번호가 일치합니다.</div> -->
							  <span id = "alert-success"><Strong class="text-success">비밀번호가 일치합니다.</Strong>
							      </span>
								<!-- <div class="col-sm-4" id="alert-danger">비밀번호가 일치하지 않습니다.</div> -->
								<span id = "alert-danger"><Strong class= "text-danger">비밀번호가 일치하지 않습니다.</Strong>
							      </span>
							</div>
                                    
                                        <hr>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="usernickname"><h5>닉네임<span class="text-danger">*</span></h5>
                                             </label>
                                            <div class="col-lg-6">
                                             <input type="text" class="form-control" id="usernickname" name="userNickname" value="${user.userNickname }">
                                                <span id="nick"> <strong>닉네임을 입력해주세요</strong>
													</span>
                                             
                                            </div>
                                       	   </div><hr>
      	
      								<div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="phone1"><h5>전화번호 <span class="text-danger">*</span></h5>
                                            </label>
                                            <div class="col-lg-6">
                                            	<input type="text" class="form-control" id="phone1" name="phone" placeholder="-없이 숫자만 입력하세요" value="${user.phone }"><button type="button" class="btn btn-primary" id="click">전송</button>                                               
                                            	</div>
                                       		   </div>
                                       		   <div class="form-group">
												    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"></label>
												    <center>
												    <div class="col-lg-4" id="inj" style="display:none">												    
												      <input type="text" class="form-control" id="sms" name="sms" placeholder="인증번호를 입력해주세요.">
												      <button type="button" class="btn btn-primary">인증</button>
												    </div>
												    </center>
											    </div>
										                                       		   <hr>
                                       		   
                                       <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="email1"><h5>이메일<span class="text-danger">*</span></h5>
                                             </label>
                                            <div class="col-lg-6">
                                             <input type="text" class="form-control" id="email1" name="email" value="${user.email }">
                                            </div>
                                       	   </div><hr>
                                       	   
                                       	   <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-bannerImg"><h5>회원 프로필 </h5>
                                            </label>                                           
                                            <div class="col-lg-6">
                                               <div><img src="/images/uploadFiles/profileimg/${user.profileImg}" width="100"; height="100px"; id="img"/>
                                               </div>
                                                <input type="file" class=""form-control-file"" id="uploadFile" name="uploadFile">
                                               </div>
                                        </div> <hr>		   
                                       		   
				  				<div class="form-group row">
                                	<div class="col-lg-7 ml-auto">
                                  		<button type="button" class="btn btn-primary" id="update">수정</button>
                                  		 <a class="btn btn-success btn" href="#" role="button" id="cancle">취&nbsp;소</a>
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
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>
	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script type="text/javascript">

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
		$("#update").on("click", function() {
			fncUpdateUser();
		});
	});


	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#cancle").on("click", function() {
			//$("form")[0].reset();
			
			
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
	
	//유효성 검사
	function fncUpdateUser() {
		
		
		var userName = $("input[name='userName']").val();
		
		var password = $("input[id='passWord']").val();
		var pw_confirm = $("input[id='passwordCheck']").val();
		var name = $("input[name='userName']").val();
		var email = $("input[name='email']").val();
		var phone = $("input[name='phone']").val();
		var userNickname = $("input[name='userNickname']").val();

		
		

		if (password == null || password.length < 1) {
			sweetAlert("비밀번호를 입력하세요","","error");
			return;
		}
		if (password.length < 1 || password.length > 12) {
			sweetAlert("비밀번호를 12자리 까지만 입력하세요","","error");
            return false;
        }
        
		if( password != pw_confirm ) {			
			sweetAlert("비밀번호 확인이 일치하지 않습니다.","","error");
			$("input:text[id='passwordCheck']").focus();
			return;
		}
       
		if(userNickname == null || userNickname.length <1){			
			sweetAlert("닉네임은 입력하셔야 합니다.","","error");
			return;
		}		
		if (email == null || email.length < 1) {
			sweetAlert("이메일을 입력하세요.","","error");
			return;
		}
		else{
			//alert("입력  : "+userId);
			//alert("입력  : "+pw);
			//alert("입력  : "password);
			$.ajax({
				url : "/user/json/checkUserNicknameDuplication",
				method : "POST",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},										
				data : JSON.stringify({											
				userNickname : userNickname,		
				}),
				
				success : function(JSONData) {
					//alert(JSONData); 
					//alert(typeof(JSONData));
					
					if(JSONData != false || userNickname == "${user.userNickname}"){
						
						$("#updateUser").attr("method", "POST").attr("action","/user/updateUser").attr("enctype","multipart/form-data").submit();
					}else if(JSONData == false){								
						
						sweetAlert("닉네임이 중복되었습니다.","","error");
						return false;						
					}							
				}
			});//ajax
			//return false;
		}//else
	}

	

	$(function() {
		  
	  	
 		var rand = "";
		
		
		$("button:contains('전송')").on("click" , function() {
			var phone = $("input[name='phone']").val();
			//alert("dsada@@@ :"+phone);
			
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
				$("#pij").hide();
			   	cch = 1;
			   	$("#click").hide();
			   	//alert(cch);
				
		   } else { 
			   sweetAlert("인증 실패","","error"); 
		  	 	} 
		 	   
		   });
		
	   });

	//한글 입력못하게
	$(function() {
		$("input[name='phone']").on('keyup',function() {

			
	 $(this).val($(this).val().replace(/[^0-9]/g,""));
	 //alert("숫자만 입력하셔야 합니다.");
	 
		});
	   });


	   
	//카페이름 중복확인 
	$(function() {

		$("input[id='usernickname']").on('keyup',function() {
					
							inputed = $("input[id='usernickname']").val();
							//alert("입력  : "+inputed);

									$.ajax({
										url : "/user/json/checkUserNicknameDuplication",
										method : "POST",
										dataType : "json",
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										data : JSON.stringify({
											userNickname : inputed,
										}),

										success : function(JSONData) {
											//alert(JSONData); 
											//alert(typeof(JSONData));

											if (JSONData && inputed != "") {
												$("#nick").children("strong")
														.remove();
												$("#nick")
														.append(
																"<strong class=\"text-success\">사용 가능합니다.</strong>");	
																							
											}else {
												$("#nick").children("strong")
														.remove();
												$("#nick")
														.append(
																"<strong  class=\"text-danger\">사용 불가능합니다.</strong>");
											}
											if ((inputed < "0" || inputed > "9") && (inputed < "A" || inputed > "Z") && (inputed < "a" || inputed > "z")) {
												$("#nick").children("strong")
														.remove();
												$("#nick")
														.append(
																"<strong class=\"text-danger\">사용 불가능합니다.</strong>");
											}
											if (inputed == "") {
												$("#nick").children("strong")
														.remove();
												$("#nick")
														.append(
																"<strong class=\"text-muted\">닉네임을 입력해주세요.</strong>");
	
											}			
											if (inputed == "${user.userNickname}") {
												$("#check").children("strong")
														.remove();
												$("#check")
														.append(
																"<strong class=\"text-success\">현재사용중인닉네임</strong>");
											
											}
																			
										}
									});
		  						  });
								});


	
	   
	   
		
	
	
</script>
	<script src="/js/custom/userCommon.js"></script>
	<script src="/js/custom/toolbarScript.js"></script>
</body>

</html>
