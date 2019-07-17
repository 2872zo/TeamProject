<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		
	<header>
		<title>카페정보수정화면</title>
	</header>
	
		<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-success" ).on("click" , function() {
				alert("수정");
				
				$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
			});
		});	

		 
				
			
		</script>
<body>
	
<form class="form-horizontal">


		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>카페수정화면</strong></div>
		</div>
		
		<input type="hidden" name="userNo" value="${user.userNo }"/>
		
		<div class="form-group">
    <label for="exampleFormControlInput1" class="col-sm-offset-3 col-sm-3 control-label">아이디</label>
    <div class="col-sm-4">
    ${user.userId }
    </div>
  </div>
		
  <div class="form-group">
    <label for="exampleFormControlInput1" class="col-sm-offset-3 col-sm-3 control-label">이 름</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" name="userName" value="${user.userName}">
    
    </div>
  </div>

  <div class="form-group">
    <label for="exampleFormControlInput1" class="col-sm-offset-3 col-sm-3 control-label">닉네임</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" name="userNickname" value="${user.userNickname}">
    </div>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1" class="col-sm-offset-3 col-sm-3 control-label">비밀번호</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" name="password" value="${user.password}">
    </div>
  </div>  

	 <div class="form-group">
    <label for="exampleFormControlInput1" class="col-sm-offset-3 col-sm-3 control-label">이메일</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" name="email" value="${user.email}">
    
    </div>
  </div>
   	
	<div class="form-group">
    <label for="exampleFormControlInput1" class="col-sm-offset-3 col-sm-3 control-label">프로필이미지</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" name="profileImg" value="${user.profileImg}">
    
    </div>
  </div>

		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >수정</button>
		    </div>
		  </div>
		  
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	
 	
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>
					