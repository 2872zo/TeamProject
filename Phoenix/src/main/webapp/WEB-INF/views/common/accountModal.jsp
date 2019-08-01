<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>


<html lang="ko">

<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">
<script src="https://kit.fontawesome.com/e589319d43.js"></script>

<style type="text/css">

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

	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"	stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>


						
		<button type="button" class="btn btn-primary login" data-toggle="modal" data-target="#accountLink">
			<i class="icon-key"></i>계정연동
		</button>
	


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
    
    
    
<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">  
<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
<script src="/plugins/common/common.min.js"></script>

<script src="/js/custom.min.js"></script>
<script src="/js/settings.js"></script>
<script src="/js/gleek.js"></script>
<script src="/js/styleSwitcher.js"></script>


<script>
	//ajax중 데이터 유지를 위한 객체 선언
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
					if(data == 100){
						$("#mailAccountList").append('<div class="alert alert-dark d-flex justify-content-between" role="alert"' 
														+ 'style="margin-bottom:5px; background-color:rgba(128, 128, 128, 0.15); ">'
														+ '<span style="margin-top:5px;">' + formObject.accountId + formObject.accountType  + '</span>'
														+ '<button type="button" class="btn btn-danger btn-sm deleteMailAccount">연동해제</button>'
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
</script>


</html>
