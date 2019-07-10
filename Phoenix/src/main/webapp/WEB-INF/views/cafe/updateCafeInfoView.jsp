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
		<title>카페정보수정화면</title>
	</header>
	
		<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-success" ).on("click" , function() {
				alert("수정");
				$("form").attr("method" , "POST").attr("action" , "/cafe/updateCafeInfo").submit();
			});
		});	

			
		</script>
<body>
	
<form class="form-horizontal">


		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>카페수정화면</strong></div>
		</div>
		
		<input type="hidden" name="cafeNo" value="${cafe.cafeNo }"/>
		
					<div>
						카페이름<input type="text" name="cafeName" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20" value="${cafe.cafeName} "  >
					</div>					
		
					<div>
						카페설명<input type="text" name="cafeDetail" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20" value="${cafe.cafeDetail} ">
					</div>
		
					<div>
						배너이미지<input type="text" name="bannerImg" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20" value="${cafe.bannerImg} ">
					</div>
					
					<div>
						메인이미지<input type="text" name="mainImg" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20" value="${cafe.mainImg} ">
					</div>
			
					<div>
						카페카테고리<input type="text" name="cafeType" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20" value="${cafe.cafeType} ">
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
					