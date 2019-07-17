<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
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

<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;	
}

</style>


<script type="text/javascript">
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

</head>
<body>

	<div class="container">

		<h4 class="bg-primary text-center">회원가입</h4>
		
			<form class="form-horizontal">

				<div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">아이디</label>
    <div class="col-sm-10">
      ${user.userId}
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">회원번호</label>
    <div class="col-sm-10">
      ${user.userNo}
    </div>
  </div>	
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">이름</label>
    <div class="col-sm-10">
      ${user.userName}
    </div>
  </div>	
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">닉네임</label>
    <div class="col-sm-10">
      ${user.userNickname}
    </div>
  </div>	
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
    <div class="col-sm-10">
     ${user.password}
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">이메일</label>
    <div class="col-sm-10">
      ${user.email}
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">전화번호</label>
    <div class="col-sm-10">
       ${user.phone}
    </div>
  </div>
   <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">프로필이미지</label>
    <div class="col-sm-10">
       ${user.profileImg}
    </div>
  </div>
  
  		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >수정</button>
		      <a class="btn btn-success btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div> 

		</form>
		<!-- form Start /////////////////////////////////////-->
	</div>


	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>
