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
		<title>카페가입양식관리화면</title>
	</header>
	
		<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			var cafeURL = "22";
			$( "button.btn.btn-success" ).on("click" , function() {
				alert("저장");
				$("form").attr("method" , "POST").attr("action" , "/cafe/"+cafeURL+"/manage/updateCafeApplicationForm").submit();
			});
		});	

			
		</script>
<body>
		<div class="container">
		
			<h4 class="bg-primary text-center">가입양식관리수정</h4>
<form class="form-horizontal">


		
		
		<input type="hidden" name="cafeNo" value="${cafe.cafeNo }"/>
				
					<div class="form-group">
						<label for="exampleFormControlSelect1"
							class="col-sm-offset-1 col-sm-3 control-label">자동가입승인</label>
						<div class="col-sm-4">
							<select class="form-control" id="exampleFormControlSelect1"
								name="autoApplicationAcceptFlag">								
								<option value="true">사용</option>
								<option value="false">미사용</option>
							</select>
						</div>
					</div>		
		<div class="form-group">
						<label for="exampleFormControlSelect1"
							class="col-sm-offset-1 col-sm-3 control-label">별명사용여부</label>
						<div class="col-sm-4">
							<select class="form-control" id="exampleFormControlSelect1"
								name="memberNicknameFlag">								
								<option value="true">사용</option>
								<option value="false">미사용</option>
							</select>
						</div>
					</div>
		
					<div class="form-group">
	
					<label for="exampleFormControlInput1" class="col-sm-offset-1 col-sm-3 control-label">질문 1</label>
						<div class="col-sm-4">				
							<input type="text" class="form-control"
								id="exampleFormControlInput1" placeholder="" name="applicationQuestion1">							
						</div>
				
				</div>
			
					<div class="form-group">
	
					<label for="exampleFormControlInput1" class="col-sm-offset-1 col-sm-3 control-label">질문 2</label>
						<div class="col-sm-4">				
							<input type="text" class="form-control"
								id="exampleFormControlInput1" placeholder="" name="applicationQuestion2">							
						</div>
				
				</div>

					
				<div class="form-group">
	
					<label for="exampleFormControlInput1" class="col-sm-offset-1 col-sm-3 control-label">질문 3</label>
						<div class="col-sm-4">				
							<input type="text" class="form-control"
								id="exampleFormControlInput1" placeholder="" name="applicationQuestion3">							
						</div>
				
				</div>
					
			
		  
				  
		
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >저장</button>
		    </div>
		  </div>
		</form>
		
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>
					