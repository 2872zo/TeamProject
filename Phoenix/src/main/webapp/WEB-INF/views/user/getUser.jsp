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
<title>회원상세정보</title>


<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">
<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">


</head>

<style type="text/css">
	#accountText{
		color: orange;
		font-family
	}
	
	#profile {
	    margin-bottom: 5%;
	    }
	
	
	i{
		-webkit-transition:color 0.3s;
	    transition:color 0.3s;
	}
	
	i:hover {
		cursor: pointer;
		color: #f5a142;
	}
	
	#div_menu {
		width: 20%;
		height: 500px;
		float: left;
		background-color: #82FA58;
	}
	
	#div_con {
		width: 80%;
	}
	
	.cursor {
		cursor: pointer;
	}
	
	.cursor:hover {
		text-decoration: underline;
	}
	
	.member {
		font-size: 50px;
		text-shadow: 0 0 10px #666;
		color: #fff;
		margin: 0 auto;
		text-align: left;
		text-transform: capitalize;
		font-family: "맑은 고딕";
		font-style: italic;
	}
	
	body {
		font-family: "맑은 고딕";
		font-size: 12px;
	}
	
	.form {
		max-width: 100%;
		width: auto;
		display: table;
		border-radius: 25px;
		border: 5px double #999;
		margin: center;
	}
	
	.form2 {
		width: 380px;
		min-width: 320px;
		height: 200px;
		margin: 60px auto;
		margin-left: 20px;
	}
	
	.form3 {
		float: left;
		/*   background:#f00;  */
	}
	
	.form3 label {
		width: 100px;
		height: 20px;
		/*  display: block; */
		float: left;
	}
	
	.form4 {
		padding: 0px 0px 0px 70px;
	}
	
	#wrap {
		width: 600px;
		height: 500px;
		margin: 0 auto;
	}
	
	.clear {
		clear: both;
	}
	
	input[type="submit"] {
		float: left;
		/*  display:block; */
		height: 50px;
		background: #FFBB00;
		border-radius: 5px;
		border: none;
		font-family: "맑은 고딕";
	}
	
	input[type="button"] {
		height: 30px;
		background: gray;
		border-radius: 5px;
		/*  width: 140px; */
		font-family: "맑은 고딕";
		margin-top: 10px;
		margin-right: 20px;
	}
	
	input[type="checkbox"] {
		margin-top: 20px;
	}
	
	.shoppingmall_button{
		
		width:100px;
		height:40px;
		border: 1px solid black;
	}
	
	.shoppingmall_button:hover{
		
		background-color: black;
	}
	
	#ggg{
		padding: 0px 0px 0px 15px;
 		float : left;
}
#ggg{
		padding: 5px 5px 5px 15px;
 		float : left;
}
    
    
</style>

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
		
<div class="content-body" style="min-height: 743px;">



		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">			
							<h2 class="text-center">회원상세정보</h2>
							<hr style="border: solid 1px gray;">		
								<div class="basic-form">			
								<br>
									<form id="adduser">
						<input type="hidden" id = "userNo" name="userNo" value="${user.userNo }"/>
                           
                           
                           <div class="row">
                    <div class="col-12 m-b-30">
                        <h4 class="d-inline">Phoenix</h4>
                        <p class="text-muted"></p>
                        <div class="row">
                        
                        
                            <div class="col-md-7 col-lg-6">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <h5 class="card-title">프로필</h5>
                                        <h6 class="card-subtitle mb-2 text-muted"></h6>
                                    </div>
                                    <img class="img-fluid" src="images/big/img1.jpg" alt="">
                                    <div class="card-body">
                                        <img src="/images/uploadFiles/profileimg/${user.profileImg}" height="55" width="55" alt="" id="profile">
                                        <h5><p class="card-text">이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;${user.userName }</p></h5>
                                        <h5><p class="card-text">닉네임 &nbsp;&nbsp;: &nbsp;&nbsp;${user.userNickname }</p></h5>
                                        
                                    </div>
                                    <div class="card-footer">
                                        <p class="card-text d-inline"><small class="text-muted"></small>
                                        
                                    </div>
                                </div>
                            </div>
                            
                            
                            <!-- End Col -->
                            <div class="col-md-7 col-lg-6" id="phonemail">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <h5 class="card-title">연락처</h5>
                                        <h6 class="card-subtitle mb-2 text-muted"></h6>
                                    </div>
                                    <img class="img-fluid" src="images/big/img2.jpg" alt="">
                                    <div class="card-body">
                                        <h5><p class="card-text">이메일 &nbsp;&nbsp;: &nbsp;&nbsp; ${ user.email } </p></h5><br>
                                        <h5><p class="card-text">전화번호 &nbsp;&nbsp;: &nbsp;&nbsp; ${ user.phone } </p></h5><br>
                                        <h5><p class="card-text">가입일자 &nbsp;&nbsp;: &nbsp;&nbsp; ${ user.regDate } </p></h5><br>
                                                                                                                                             
                                    </div>
                                    <div class="card-footer">
                                        <p class="card-text d-inline"><small class="text-muted"></small>
                                        
                                    </div>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>           
                                        
                           
                           <div class="row">
                    <div class="col-12 m-b-30">                        
                        <p class="text-muted"></p>
                        <div class="row">
                        
                        
                            <div class="col-md-7 col-lg-6" id="knlogin">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <h5 class="card-title">연동로그인</h5>
                                        <h6 class="card-subtitle mb-2 text-muted"></h6>
                                    </div>
                                    <img class="img-fluid" src="images/big/img1.jpg" alt="">
                                    <div class="card-body">                                
                                     
                                     <c:if test="${user.kakaoId != null }">    
                                    <a id="kakaoIcon"><img src="/images/uploadFiles/kakao/kakaoIcon.jpg" width=50; height=45;/></a>
                                    	
                                    <font size="4" color="#dea004"> 연동</font>
                                    		  
                                        </c:if>
                                       
                                     <c:if test="${user.kakaoId == null }">    
                                    <a id="kakaoIcon"><img src="/images/uploadFiles/kakao/kakaoIcon.jpg" width=50; height=45;/></a> 
                                    <font size="4" color="#dea004"> 미연동</font>
                                        </c:if>
                                        <br>
                                        <br>
                                     <c:if test="${user.naverId != null }">    
                                    <a id="naverIcon"><img src="/images/uploadFiles/naver/naverIcon.jpg" width=50; height=45;/></a> 
										<font size="4" color="#dea004"> 연동</font> 
                                        </c:if>
                                    <a><img src="/images/uploadFiles/kakao/white.jpg" width=50; height=45;/></a>
                                        <font size="4" color="#dea004"></font><br><br>
                                        
                                     <c:if test="${user.naverId == null }">    
                                    <a id="naverIcon"><img src="/images/uploadFiles/naver/naverIcon.jpg" width=50; height=45;/></a>
										<font size="4" color="#dea004"> 미연동</font>
                                        </c:if>
                                        
                                    </div>
                                    <div class="card-footer">
                                        <p class="card-text d-inline"><small class="text-muted"></small>
     <!-- 연동로그인modal -->  <button type="button" class="btn btn-primary login"
								data-toggle="modal" data-target="#accountLogin">
								<i class="icon-key">계정연동</i>
							</button>
                               </div>
                                </div>
                            </div>

                            
                            
                            <!-- End Col -->

                        
                            <div class="col-md-7 col-lg-6" id="shmlogin">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <h5 class="card-title">연동계정</h5>
                                        <h6 class="card-subtitle mb-2 text-muted"></h6>
                                    </div>
                                    <img class="img-fluid" src="images/big/img1.jpg" alt="">
                                    <div class="card-body">                                
                                    <a><img src="/images/uploadFiles/kakao/mail.jpg" width=50; height=45;/></a>                                      
                                        <font size="4" color="#dea004">연동가능</font><br><br>
                                    <a><img src="/images/uploadFiles/kakao/shop.jpg" width=50; height=45;/></a>
                                        <font size="4" color="#dea004">연동가능</font><br><br>
                                    <a><img src="/images/uploadFiles/kakao/sns.jpg" width=50; height=45;/></a>     
                                        <font size="4" color="#dea004">연동가능</font><br>
                                    </div>
                                    <div class="card-footer">
                                        <p class="card-text d-inline"><small class="text-muted"></small>
                      <!-- modal 버튼 --> <button type="button" class="btn btn-primary login" data-toggle="modal" data-target="#accountLink">
											<i class="icon-key"></i>계정연동
					  <!-- modal 버튼 -->	</button> 
                                    </div>
                                </div>
                            </div>
                            
                            
                            <!-- End Col -->
	                            
                                     
                        </div>
                    </div>
                </div>           



		<!-- Modal 내용 시작 -->
		<div class="modal fade" id="accountLink" style="display: none;" aria-hidden="true" style="max-width:100%;" style=" width: auto;">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<div class="card-body">
							<div>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
							
							<hr style="border: 0px;"/>
							
							<div>
								<h5>
									메일 계정 
									<i class="mdi mdi-plus-box"
										style="font-size:20px; position:relative; top:2px;" 
										data-toggle="modal" data-target="#mailLogin">
									</i>
								</h5>	
								
								<div id="mailAccountList">
									<c:forEach items="${mailAccountList }" var="mailAccount">
										<div class="alert alert-dark d-flex justify-content-between" role="alert" style="margin-bottom:5px; background-color:rgba(128, 128, 128, 0.15); ">
											<input type="hidden" name="accountType" value="${mailAccount.accountType }">
											<span style="margin-top:5px;">${mailAccount.accountId }</span>
											<button type="button" class="btn btn-danger btn-sm deleteAccount">연동해제</button>
										</div> 	
									</c:forEach>
								</div>
							</div>

							<hr/>

							<div>
								<h5>
									쇼핑몰 계정 
									<i class="mdi mdi-plus-box" 
										style="font-size:20px; position:relative; top:2px;"
										data-toggle="modal" data-target="#shoppingLogin">
									</i>
								</h5>
								<!-- accountList 불러와야 한다 목록 띄워줘야함 -->
								<div id="shoppingAccountList">
									<c:forEach items="${shoppingmallAccountList }" var="account">
										<div class="alert alert-dark d-flex justify-content-between" role="alert" style="margin-bottom:5px; background-color:rgba(128, 128, 128, 0.15); ">
											<input type="hidden" name="accountType" class="shoppingmallAccountType" value="${account.accountType}">
											<span style="margin-top:5px;">${account.accountDomain }</span>
											<span style="margin-top:5px;">${account.accountId }</span>
											<button type="button" class="btn btn-danger btn-sm deleteAccount">연동해제</button>
										</div> 	
									</c:forEach>
								</div>				
							</div>

							<hr/>

							<div>
								<h5>
									SNS 계정 
									<i class="mdi mdi-plus-box"
										style="font-size:20px; position:relative; top:2px;"
										data-toggle="modal" data-target="#snsLogin">
									</i>
								</h5>	
								<div id="snsAccountList">
									<c:forEach items="${snsAccountList }" var="snsAccount">
										<div class="alert alert-dark d-flex justify-content-between" role="alert" style="margin-bottom:5px; background-color:rgba(128, 128, 128, 0.15); ">
											<input type="hidden" name="accountType" value="${snsAccount.accountType }">
											<span style="margin-top:5px;">${snsAccount.accountId }</span>
											<span style="margin-top:5px;">${account.accountDomain }</span>
											<button type="button" class="btn btn-danger btn-sm deleteAccount">연동해제</button>
										</div> 	
									</c:forEach>
								</div>				
							</div>
							
						</div><!-- card body end -->
					</div><!-- modal body end -->
				</div><!-- modal content end -->
			</div><!-- modal dialog end -->
		</div><!-- modal end -->

										
				  				<div class="form-group row">
                                	<div class="col-lg-7 ml-auto">
                                  		<button type="button" class="btn btn-primary" id="Update">수정</button>
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
			  
    	<!-- MailLogin 시작 -->
		<div class="modal fade" id="mailLogin" style="display: none;" aria-hidden="true" style="max-width:100%;" style=" width: auto;">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span>×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="card-body pt-3">
							<a class="text-center">
								<h4>메일 연동</h4>
							</a>
							
							<form class="mt-5 mb-5 mail-login-input">
								<div class="form-row form-group">
									<div class="col">
										<input type="text" class="form-control" placeholder="ID" name="accountId">
									</div>

									<i class="mdi mdi-at" style="font-size:20px; margin-top:7px;"></i>

									<div class="col">
										<select class="form-control custom-select-lg" id="mailDomain" name="accountType">
											<option value="@naver.com">naver.com</option>
											<option value="@daum.net">daum.net</option>
											<option value="@gmail.com">gmail.com</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" placeholder="PASSWORD" name="accountPw">
								</div>
							</form>
							<button class="btn login-form__btn submit w-100" id="addMailAccount">로그인</button>

						</div><!-- card body end -->
					</div><!-- modal body end -->
				</div><!-- modal content end -->
			</div><!-- modal dialog end -->
		</div><!-- modal end -->
		<!-- MailLogin 끝 -->
		
		
		<!-- ShoppingLogin 시작 -->
		<div class="modal fade" id="shoppingLogin" style="display: none;"
			aria-hidden="true" style="max-width:100%;" style=" width: auto;">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span>×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="card-body pt-5">
							<a class="text-center">
								<h4>쇼핑몰 연동</h4>
							</a>
							
							<form class="mt-5 mb-5 shoppingmall-login-input">
								<div class="form-group" >
	                              <label class="radio-inline mr-3">
	                                  <input type="radio"  name ="shoppingmallAcountType" value="ua105" checked></label>
	                                  <img alt="" src="/images/uploadfiles/shoppingmall/tmon.jpg"style="width: 100px;">
	                         
	                              <label class="radio-inline mr-3">
	                                  <input type="radio"  name ="shoppingmallAcountType" value="ua103"></label>
	                                  <img alt="" src="/images/uploadfiles/shoppingmall/11st.jpg"  style="width: 100px;">
	                   
	                             </div>
					
								<div class="form-group">
									<input type="text" class="form-control" placeholder="ID"  name="shoppingmallAccountId">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" placeholder="PASSWORD"  name="shoppingmallAccountPw">
								</div>
								<button class="btn login-form__btn submit w-100" id="addShoppingAccount">로그인</button>
							</form>
							
						
						</div><!-- card body end -->
					</div><!-- modal body end -->
				</div><!-- modal content end -->
			</div><!-- modal dialog end -->
		</div><!-- modal end -->
		<!-- ShoppingLogin 끝 -->
		
		
		<!-- SnsLogin 시작 -->
		<div class="modal fade" id="snsLogin" style="display: none;"
			aria-hidden="true" style="max-width:100%;" style=" width: auto;">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span>×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="card-body pt-5" align="center">
							<div class="form-group" >
                              <label class="radio-inline mr-3">
                                  <input type="radio"  name ="accountType" value="ua109"></label>
                                  <img alt="" src="https://www.tokyu.co.jp/tokyuplus/_resource/images/instagram/logo_001.png"style="width: 150px;padding-right: 10px;">
                         
                              <label class="radio-inline mr-3">
                                  <input type="radio"  name ="accountType" value="ua110"></label>
                                  <img alt="" src="http://pluspng.com/img-png/facebook-logo-png-1722.png"  style="width: 150px;padding-bottom: 10px;">
                   
                              </div>
				
							<form class="mt-5 mb-5 login-input">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="ID" id="snsId" name ="accountId" >
								</div>
								<div class="form-group">
									<input type="password" class="form-control" placeholder="PASSWORD" id="snsPw" name="accountPw">
								</div>
								<button class="btn login-form__btn submit w-100" id="addSnsAccount">로그인</button>
							</form>
							
						</div><!-- card body end -->
					</div><!-- modal body end -->
				</div><!-- modal content end -->
			</div><!-- modal dialog end -->
		</div><!-- modal end -->
		<!-- SnsLogin 끝 -->

		<!-- Modal 내용 시작 -->
		<div class="modal fade" id="accountLogin" style="display: none;"
			aria-hidden="true" style="max-width:100%;" style=" width: auto;">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">

						<button type="button" class="close" data-dismiss="modal">
							<span>×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="card-body pt-5">
							<a class="text-center">
								<h2>연동하기</h2>
							</a>

							<form class="mt-5 mb-5 login-input">
								
								<div class="form-group">
									
								</div>
								
								<center>								
								<a id="kakaos"><img src="/images/uploadFiles/kakao/kakaos.jpg" width=210; height=45;/></a>
     							<a id="navers"><img src="/images/uploadFiles/naver/navers.jpg" width=210; height=45;/></a>		
						
     							</center>
							</form>
							<p class="mt-5 login-form__footer">
								
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- Modal 내용 끝 -->
		
			  
	
	<!--  화면구성 div end /////////////////////////////////////-->
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



	var formObject;
	var target;

	function objectifyForm(formArray){
		var returnArray = {};
		for (var i = 0; i < formArray.length; i++){
			returnArray[formArray[i]['name']] = formArray[i]['value'];
		}
		return returnArray;
	}

	$(function(){
		//메일계정 추가
		$("#addMailAccount").on("click", function(){
// 			alert("메일계정 로그인!")

			var formArray = $(".mail-login-input").serializeArray();
			formObject = objectifyForm(formArray);

			var accountType = null;
			
			if(formObject.accountType.indexOf("naver") != -1){
				accountType = 'ua100';
			}else if(formObject.accountType.indexOf("daum") != -1){
				accountType = 'ua101';
			}else if(formObject.accountType.indexOf("gmail") != -1){
				accountType = 'ua102';
			}

			$.ajax({
				type : "POST",
				contentType: "application/json",
				url : "/mail/json/addMailAccount",
				dataType : "JSON",
				data: JSON.stringify(formObject),
				beforeSend : function(){
					$("#preloader").attr("style", "background:rgba(255,245,217,0.5);");
				},
				complete : function(){
					$("#preloader").attr("style", "display:none;");
				}, 
				success : function(data) {
// 					alert("success");
					console.log("data : " + data);
					if(data == 100){
						$("#mailAccountList").append('<div class="alert alert-dark d-flex justify-content-between" role="alert"' 
														+ 'style="margin-bottom:5px; background-color:rgba(128, 128, 128, 0.15); ">'
														+'<input type="hidden" name="accountType" value="' + accountType + '">'
														+ '<span style="margin-top:5px;">' + formObject.accountId + formObject.accountType  + '</span>'
														+ '<button type="button" class="btn btn-danger btn-sm deleteAccount">연동해제</button>'
														+ '</div>');
						$("#mailLogin").modal("hide");	
						$(".mail-login-input")[0].reset();
						sweetAlert("계정연동 성공", formObject.accountId + formObject.accountType + " 계정이 연동되었습니다.","success");
					}else if(data == 404 || data == 405){
						sweetAlert("계정연동 실패","아이디와 비밀번호를 확인해 주십시오.","error");
					}else if(data == 400){
						sweetAlert("계정연동 실패","해당 계정의 IMAP설정을 확인해 주십시오.","error");
					}else{
						sweetAlert("계정연동 실패","알수없는 오류가 발생했습니다.\n 잠시후 다시 시도해 주십시오.","error");
					}				
					
				},
				error : function(data) {
// 					alert("error : " + data);
					sweetAlert("계정연동 실패","아이디와 비밀번호를 확인해 주십시오.","error");
// 					debugger;
				}
			});
		});

		//메일 계정 연동 해제
		$(document).on("click", ".deleteAccount", function(){
// 			alert("deleteAccount!");

			target = $(this).parent();
			var targetAddr = $(this).prev();
			var formObject = {accountId : targetAddr.text(), accountType : target.find("[name=accountType]").val()}

			$.ajax({
				type : "POST",
				contentType: "application/json",
				url : "/user/json/deleteAccount",
				dataType : "JSON",
				data: JSON.stringify(formObject),
				success : function(data) {
// 					alert("success");
					console.log("data : " + data);
					if(data == true){
						target.remove();
						sweetAlert("계정연동 해제 성공",targetAddr.text() + " 계정의 연동이 해제되었습니다.","success");
					}else{
						sweetAlert("계정연동 해제 실패","잠시후 다시 시도해 주십시오.","error");
					}
				},
				error : function(data) {
					sweetAlert("계정연동 해제 실패","잠시후 다시 시도해 주십시오.","error");
				}
			});
		});


/////////////////////////////////////////////////////////쇼핑몰계정시작////////////////////////
		//쇼핑몰계정 추가
		$("#addShoppingAccount").on("click", function(e){

			e.preventDefault();
			//debugger;
			//alert("쇼핑몰계정 로그인!");

			var addType =  $("input[name=shoppingmallAcountType]").val();
			var insertId = $("input[name=shoppingmallAccountId]").val();
			var elements = $(".shoppingmallAccountType");
			var domain  ="";
			
			var boolsw = false;
			
			elements.each(function(){

				if($(this).val() == addType){

					boolsw = true;
					return;
				}
			});
			//ajax보내기전에  이 쇼핑몰에  account가 이미 등록되어있는지 확인 ok
			//account가 이미있으면 alert창으로 계정이 이미존재합니다. 재등록을 원한다면 계정 해제를 한후 새로 등록해주세요.ok
			//없으면 ajax통신으로 계정 add 하고 return 값으로 처리
			
			if(boolsw){

				sweetAlert("계정연동 실패","해당 쇼핑몰 계정이 이미 연동되어있습니다.재등록을 원한다면 계정 해제를 한후 새로 등록해주세요.","error");
				return;
			}

			if(addType=='ua105'){

				domain="티몬";
			}else if(addType=='ua103'){
				domain="11번가";
			}
				
			//var 
			$.ajax({


					url : "/shopping/json/addShoppingmallAccount",
					method : "POST",
					contentType: "application/json",
					data : JSON.stringify({ //보내는 data jsonString 화

						accountType : $("input[name=shoppingmallAcountType]").val(),
						accountId : $("input[name=shoppingmallAccountId]").val(),
						accountPw : $("input[name=shoppingmallAccountPw]").val(),
						accountDomain : domain
						
					}),
					beforeSend : function(){
						$("#preloader").attr("style", "background:rgba(255,245,217,0.5);");
					},
					complete : function(){
						$("#preloader").attr("style", "display:none;");
					}, 
					dataType : "text",
					success : function(serverData){

						//alert(serverData);
						var data = JSON.parse(serverData);

						if(data.loginResult =='100'){
							//성공
							
							
							$("#shoppingAccountList").append('<div class="alert alert-dark d-flex justify-content-between" role="alert"' 
																+ 'style="margin-bottom:5px; background-color:rgba(128, 128, 128, 0.15); ">'
																+'<input type="hidden" name="accountType" class="shoppingmallAccountType" value="'+addType+'">'
																+'<span style="margin-top:5px;">'+domain+'</span>'
																+'<span style="margin-top:5px;">' +insertId + '</span>'
																+ '<button type="button" class="btn btn-danger btn-sm deleteAccount">연동해제</button>'
																+ '</div>');
							$("#shoppingLogin").modal("hide");	
							$(".shoppingmall-login-input")[0].reset();
							sweetAlert("계정연동 성공", insertId + " 계정이 연동되었습니다.","success");
						
						}
						else if(data.loginResult =='400'){
							//실패
							sweetAlert("계정연동 해제 실패","아아디, 비밀번호를 확인해 주세요","error");
						}
						//return 값이 success면 모달 끄고 append
						
					}//success


				});//ajax끝
		});
		
		});	


/////////////////////////////////////////////////////////쇼핑몰계정끝////////////////////////
	//////////////////////////////////////SNS시작.//////////////////////////////////////////////
	
	
	$(function(){
	
		//sns계정 추가
		$("#addSnsAccount").on("click", function(e){
			e.preventDefault();
			var domain  ="";
			var accountType= $("input[name=accountType]:checked").val();
			var accountId= $("#snsId").val();
			var accountPw= $("#snsPw").val();
			//alert(accountType= $("input[name=accountType]:checked").val())

			if(accountType == 'ua109'){
				domain ="instagram";
			}else if(accountType == 'ua110'){
				domain ="faceBook";
			}
			$.ajax({
					url: "/sns/json/addSns",
					type : "POST",
					data: JSON.stringify({
						userNo : $("#userNo").val(),
						accountType : $("input[name=accountType]:checked").val(),
						accountId : $("#snsId").val(),
						accountPw : $("#snsPw").val(),
						accountDomain : domain

					}),
					dataType : "json",
					contentType : "application/json",
					beforeSend : function(){
						$("#preloader").attr("style", "background:rgba(255,245,217,0.5);");
					},
					complete : function(){
						$("#preloader").attr("style", "display:none;");
						$("form").each(function(){
							this.reset();
						});
					}, 
					success :  function(data) {
						//alert("success "+data)
	
						if(data ==true){
					
							$("#snsAccountList").append('<div class="alert alert-dark d-flex justify-content-between" role="alert"' 
									+ 'style="margin-bottom:5px; background-color:rgba(128, 128, 128, 0.15); ">'
									+'<input type="hidden" name="accountType" value="'+accountType+'">'
									+'<span style="margin-top:5px;">'+domain+'</span>'
									+'<span style="margin-top:5px;">' +accountId + '</span>'
									+ '<button type="button" class="btn btn-danger btn-sm deleteAccount">연동해제</button>'
									+ '</div>');
							$("#snsLogin").modal("hide");
							sweetAlert("계정연동 성공",accountId+" 계정이 연동되었습니다.","success");
						}else if (data == false){
							sweetAlert("계정연동 실패","아이디와 비밀번호를 확인해 주십시오.","error");
						}

					},//success
					error : function(data){
						//alert("error "+data)
						sweetAlert("계정연동 실패","아이디와 비밀번호를 확인해 주십시오.","error");

					}//error

				});//ajax 끝
		});//click끝		
	});//sns끝
	//////////////////////////////////////SNS끝.//////////////////////////////////////////////


	
////////////////////////////////////////////////////////////////////////////////////	
	var checkSessionUser = ${empty sessionScope.user};

	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[id='kakaos' ]").on("click" , function() {
				
				var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
				window.open("https://kauth.kakao.com/oauth/authorize?client_id=44d5aabe2b56604fedd6b0bfe3098f1a&redirect_uri=http://localhost:8080/user/oauth1&response_type=code","Kakao login",popOption);
				
		});
	});

	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#Update").on("click", function() {
			self.location = "/user/updateUserView?userNo=${user.userNo}";
		});
	});

	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click", function() {
			//$("form")[0].reset();
			self.location = "/";
		});
	});
	
</script>

<script src="/js/custom/userCommon.js"></script>
<script src="/js/custom/toolbarScript.js"></script>
</body>

</html>
