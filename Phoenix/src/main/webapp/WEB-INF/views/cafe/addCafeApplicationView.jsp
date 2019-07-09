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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	
	<header>
		<title>카페가입신청화면</title>
	</header>
	
		<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-success" ).on("click" , function() {
				alert("가입");
				$("form").attr("method" , "POST").attr("action" , "/cafe/1234/addCafeApplication").submit();
			});
		});	

			
		</script>
<body>
	
<form class="form-horizontal">


		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>카페이름 : $cafe.cafeName 카페입니다.</strong></div>
		</div>
		
		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>카페설명 : $cafe.cafeDetail </strong></div>
		</div>
		
		  
		  <div class="form-group">
		    <label for="memberNickname" class="col-sm-offset-1 col-sm-3 control-label">별명</label>
		    <div class="col-sm-4">
		      <input type="memberNickname" class="form-control" id="memberNickname" name="memberNickname" placeholder="사용할 닉네임">
		    </div>
		  </div>
		  
		  
		 <div class="row" align="center">
	  		<div class="col-sm-4"><strong>가입질문1: $cafe.applicationQuestion </strong></div>
		</div>
		
		  
		  <div class="form-group">
		    <label for="answer1" class="col-sm-offset-1 col-sm-3 control-label">가입질문1에 대한 답변</label>
		    <div class="col-sm-4">
		      <input type="answer1" class="form-control" id="answer1" name="answer1" placeholder="질문1에 대한 답변">
		    </div>
		  </div>
		  
		
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >가 &nbsp;입</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>
