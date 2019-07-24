<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>


	<meta charset="EUC-KR">
	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
	
	
			<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/toolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
   .member {
 font-size: 50px;
 text-shadow: 0 0 10px #666;
 color: #fff;
 margin: 0 auto;
 text-align: center;
 text-transform: capitalize;
 font-family: "맑은 고딕";
 font-style: italic;
}

body {
 font-family: "맑은 고딕";
 font-size: 12px;
}

.form {
 width: 498px;
 height: 300px;
 border-radius: 25px;
 border: 5px double #999;
 margin: 30px auto;
}

.form2 {
 width: 380px;
 min-width: 320px;
 height: 200px;
 margin: 60px auto;
 margin-left:20px;
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
 font-family:"맑은 고딕";
 margin-top:10px;
 margin-right:20px;
}
input[type="checkbox"] {
 margin-top:20px;
}



    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	/*$(function() {

		$("input[id='userId']").on('keyup',function() {
					debugger;
							inputed = $("input[id='userId']").val();
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
																"<strong class=\"text-danger\">아이디 불일치</strong>");
											} else {
												$("#check").children("strong")
														.remove();
												$("#check")
														.append(
																"<strong  class=\"text-success\">아이디 일치</strong>");
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

		$("input[id='password']").on('keyup',function() {
					debugger;
							inputed = $("input[id='password']").val();
							//alert("입력  : "+inputed);

									$.ajax({
										url : "/user/json/checkUserPwDuplication",
										method : "POST",
										dataType : "json",
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										data : JSON.stringify({
										password : inputed,
										}),

										success : function(JSONData) {
											//alert(JSONData); 
											//alert(typeof(JSONData));

											if (JSONData && inputed != "") {
												$("#check1").children("strong")
														.remove();
												$("#check1")
														.append(
																"<strong class=\"text-danger\">비밀번호 불일치</strong>");
											} else {
												$("#check1").children("strong")
														.remove();
												$("#check1")
														.append(
																"<strong  class=\"text-success\">비밀번호 일치</strong>");
											}
											if (inputed == "") {
												$("#check1").children("strong")
														.remove();
												$("#check1")
														.append(
																"<strong class=\"text-muted\">비밀번호를 입력해주세요.</strong>");
											}
										}

									});
		  						  });
								});*/
	


	$(function() {

		$("#logon").on('click',function() {
					debugger;
							var id = $("input[id='userId']").val();
							var pw = $("input[id='password']").val();
							//alert("입력  : "id);
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
											
											if(JSONData == 1){
												alert("아이디 또는 비밀번호가 일치하지 않습니다.");
												return;
												}else{
													$("form").attr("method","POST").attr("action","/user/login").submit();
													}
				
										}

									});
		  						  });
								});
				
	
		//============= "로그인"  Event 연결 =============
	$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#logon").on("click" , function() {
				var id=$("input[id='userId']").val();
				var pw=$("input[id='password']").val();
				
				if(id == null || id.length <1) {
					alert('아이디를 입력하세요');
					$("input[id='userId']").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('비밀번호를 입력하세요');
					$("input[id='password']").focus();
					return;
				}

				if(pw != sessionscope.user.password){
					alert("${user.password}");
					alert('아이디 또는 비밀번호가 일치하지 않습니다.');
					return;
					}
				
					
				//$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			}); 
		});	


		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#add").on("click" , function() {
				$(self.location).attr("href","/user/addUserView");
			});
		});

		
	</script>		
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/><br/>
				

			        <form>
			        
  <div id="wrap">
   <h1 class="member">Phoenix</h1>
   <div class="form">
    <div class="form2">
     <div class="form3">
      <label for="user">아이디</label><input type="text" id="userId" name="userId">      
      <div class="clear"></div>
      
  
      <label for="user">비밀번호</label><input type="password" id="password" name="password">
      <div class="clear"></div>
     </div>
     
     <input type="submit" value="로그인하기" id="logon">
     <div class="clear"></div>
     <div class="form4">
      <label><input type="checkbox">자동로그인</label> 
      <div class="clear"></div>
      <label><input type="button" value="회원가입" id="add">
      
      </label> <label><input
       type="button" value="아이디/비밀번호 찾기"></label>
     </div>
    </div>
   </div>
  </div>
  <input type="hidden" name="targetURL" value="${targetURL }">
 </form>

			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>