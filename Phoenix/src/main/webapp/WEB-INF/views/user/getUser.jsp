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
<title>회원상세정보</title>


<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">
<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">


</head>

<style type="text/css">
#profile {
    margin-bottom: 6.5%;
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

    
    
</style>

<body>
		<c:if test="${user.userRoleCode=='ur100'}">
		<div class="nk-sidebar">
					
			<c:import url="/WEB-INF/views/common/userAdminMenubar.jsp"></c:import>
			
		</div>
		</c:if>
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
						<input type="hidden" name="userNo" value="${user.userNo }"/>
                           
                           
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
                                        </p><a href="/user/updateUserView?userNo=${user.userNo}" class="card-link float-right"><small>수정</small></a>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <!-- End Col -->
                            <div class="col-md-7 col-lg-6">
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
                                        </p><a href="/user/updateUserView?userNo=${user.userNo}" class="card-link float-right"><small>수정</small></a>
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
                        
                        
                            <div class="col-md-7 col-lg-6">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <h5 class="card-title">연동로그인</h5>
                                        <h6 class="card-subtitle mb-2 text-muted"></h6>
                                    </div>
                                    <img class="img-fluid" src="images/big/img1.jpg" alt="">
                                    <div class="card-body">                                
                                         
                                    <a id="kakaos"><img src="/images/uploadFiles/kakao/kakaoIcon.jpg" width=50; height=45;/></a>   
                                        <h5><p class="card-text">카카오 &nbsp;&nbsp;: &nbsp;&nbsp;연동</p></h5><br>
                                    <a id="navers"><img src="/images/uploadFiles/naver/naverIcon.jpg" width=50; height=45;/></a>
                                        <h5><p class="card-text">네이버 &nbsp;&nbsp;: &nbsp;&nbsp;미연동</p></h5>
                                        
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
								
								<div id="mailAccountList"></div>
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
								
								<div id="shoppingAccountList">
									<div class="alert alert-dark d-flex justify-content-between" role="alert" 
										style="margin-bottom:5px; background-color:rgba(128, 128, 128, 0.15); ">
										<span style="margin-top:5px;">아이콘이나 연동계정 아이디 넣을것</span>
										<button type="button" class="btn btn-danger btn-sm deleteMailAccount">연동해제</button>
									</div> 	
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
									<div class="alert alert-dark d-flex justify-content-between" role="alert" 
										style="margin-bottom:5px; background-color:rgba(128, 128, 128, 0.15); ">
										<span style="margin-top:5px;">아이콘이나 연동계정 아이디 넣을것</span>
										<button type="button" class="btn btn-danger btn-sm deleteMailAccount">연동해제</button>
									</div> 	
								</div>			
							</div>
							
						</div><!-- card body end -->
					</div><!-- modal body end -->
				</div><!-- modal content end -->
			</div><!-- modal dialog end -->
		</div><!-- modal end -->

										
				  				<div class="form-group row">
                                	<div class="col-lg-6 ml-auto">
                                  		<!--  <button type="button" class="btn btn-primary" id="add">가입</button>-->
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
								<h4>불사조</h4>
							</a>

							<form class="mt-5 mb-5 login-input">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="ID"
										name="userId">
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="PASSWORD" name="password">
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
						<div class="card-body pt-5">
							<a class="text-center">
								<h4>불사조</h4>
							</a>

							<form class="mt-5 mb-5 login-input">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="ID"
										name="userId">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" placeholder="PASSWORD" name="password">
								</div>
								<button class="btn login-form__btn submit w-100" id="addSnsAccount">로그인</button>
							</form>
							
						</div><!-- card body end -->
					</div><!-- modal body end -->
				</div><!-- modal content end -->
			</div><!-- modal dialog end -->
		</div><!-- modal end -->
		<!-- SnsLogin 끝 -->
			  
	
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
					if(data == true){
						$("#mailAccountList").append('<div class="alert alert-dark d-flex justify-content-between" role="alert"' 
														+ 'style="margin-bottom:5px; background-color:rgba(128, 128, 128, 0.15); ">'
														+ '<span style="margin-top:5px;">' + formObject.accountId + formObject.accountType  + '</span>'
														+ '<button type="button" class="btn btn-danger btn-sm deleteMailAccount">연동해제</button>'
														+ '</div>');
						$("#mailLogin").modal("hide");	
						$(".mail-login-input")[0].reset();
						sweetAlert("계정연동 성공", formObject.accountId + formObject.accountType + " 계정이 연동되었습니다.","success");
					}else{
						sweetAlert("계정연동 실패","아이디와 비밀번호를 확인해 주십시오.","error");
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
		$(document).on("click", ".deleteMailAccount", function(){
// 			alert("deleteMailAccount!");

			target = $(this).parent();
			var targetAddr = $(this).prev().text();
			var formObject = {accountId : targetAddr.substring(0, targetAddr.indexOf("@")), accountType : targetAddr.substring(targetAddr.indexOf("@"))}

			$.ajax({
				type : "POST",
				contentType: "application/json",
				url : "/mail/json/deleteMailAccount",
				dataType : "JSON",
				data: JSON.stringify(formObject),
				success : function(data) {
// 					alert("success");
					console.log("data : " + data);
					if(data == true){
						target.remove();
						sweetAlert("계정연동 해제 성공",targetAddr + " 계정의 연동이 해제되었습니다.","success");
					}else{
						sweetAlert("계정연동 해제 실패","잠시후 다시 시도해 주십시오.","error");
					}
				},
				error : function(data) {
					sweetAlert("계정연동 해제 실패","잠시후 다시 시도해 주십시오.","error");
				}
			});
		});

		//쇼핑몰계정 추가
		$("#addShoppingAccount").on("click", function(){
			alert("쇼핑몰계정 로그인!")
		});	

		//sns계정 추가
		$("#addSnsAccount").on("click", function(){
			alert("sns계정 로그인!")
		});		
	});



	
////////////////////////////////////////////////////////////////////////////////////	
	var checkSessionUser = ${empty sessionScope.user};
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-success").on("click", function() {
			self.location = "/user/updateUserView?userNo=${user.userNo}"	
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
<script src="/js/custom/userCommon.js"></script>
<script src="/js/custom/toolbarScript.js"></script>
</body>

</html>
