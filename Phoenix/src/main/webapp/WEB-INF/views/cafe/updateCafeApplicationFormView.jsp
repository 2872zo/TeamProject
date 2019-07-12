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
				alert("수정");
				$("form").attr("method" , "POST").attr("action" , "/cafe/"+cafeURL+"/manage/updateCafeApplicationForm").submit();
			});
		});	

			
		</script>
<body>
	
<form class="form-horizontal">


		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>가입양식관리수정</strong></div>
		</div>
		
		<input type="hidden" name="cafeNo" value="${cafe.cafeNo }"/>
				
					<div>
						자동가입승인<input type="text" name="autoApplicationAcceptFlag" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20" value="${cafe.autoApplicationAcceptFlag}"  >
					</div>					
		
					<div>
						카페전용 별명사용여부<input type="text" name="memberNicknameFlag" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20" value="${cafe.memberNicknameFlag}">
					</div>
		
					<div>
						질문1<input type="text" name="applicationQuestion1" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20" value="${cafe.applicationQuestion1}">
					</div>
					
					<div>
						질문2<input type="text" name="applicationQuestion2" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20" value="${cafe.applicationQuestion2}">
					</div>
			
					<div>
						질문3<input type="text" name="applicationQuestion3" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20" value="${cafe.applicationQuestion3}">
					</div>
		
		  
				  
		
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >수정</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>
					