<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	
	<header>
		<title>카페정보수정완료창</title>
	</header>
	
		<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-success" ).on("click" , function() {
				alert("가입양식관리");
				self.location = "/cafe/updateCafeApplicationFormView?cafeNo=${cafe.cafeNo}"
				//$("form").attr("method" , "POST").attr("action" , "/cafe/1234/addCafe").submit();
			});
		});	

			
		</script>
<body>
	
<form class="form-horizontal">


		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>수정완료</strong></div>
		</div>
		
	
		  카페이름:&nbsp;&nbsp;[${cafe.cafeName }]</br>		  
		  카페설명:&nbsp;&nbsp;[${cafe.cafeDetail }]</br>
		  배너이미지:&nbsp;&nbsp;[${cafe.bannerImg }]</br>
		  메인이미지:&nbsp;&nbsp;[${cafe.mainImg}]</br>
		  카페카테고리:&nbsp;&nbsp;[${cafe.cafeType }]</br>
		  자동가입승인여부:&nbsp;&nbsp;[${cafe.autoApplicationAcceptFlag}]</br>
		  카페아이콘:&nbsp;&nbsp;[${cafe.cafeIcon }]</br>
		  		 
		  
		  
		  
		
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >가입양식관리</button>
		    </div>
		  </div>
		  
		</form>
		<!-- form Start /////////////////////////////////////-->
	
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>

					