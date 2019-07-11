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
		<title>카페정보보기화면</title>
	</header>
	
		<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-success" ).on("click" , function() {
				alert("수정");
				self.location = "/cafe/updateCafeInfoView?cafeNo=${cafe.cafeNo}"
				//$("form").attr("method" , "GET").attr("action" , "/cafe/updateCafeInfoView?cafeNo=${cafe.cafeNo}").submit();
			});
		});	

			
		</script>
<body>
	
<form class="form-horizontal">


		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>카페정보상세조회</strong></div>
		</div>
		
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">카페이름</label>
    <div class="col-sm-10">
      ${cafe.cafeName}
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">카페번호</label>
    <div class="col-sm-10">
      ${cafe.cafeNo }
    </div>
  </div>	
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">매니저번호</label>
    <div class="col-sm-10">
      ${cafe.manageUserNo }
    </div>
  </div>	
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">카페url</label>
    <div class="col-sm-10">
      ${cafe.url }
    </div>
  </div>	
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">카페설명</label>
    <div class="col-sm-10">
      ${cafe.cafeDetail }
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">배너이미지</label>
    <div class="col-sm-10">
      ${cafe.bannerImg }
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">메인이미지</label>
    <div class="col-sm-10">
      ${cafe.mainImg }
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">카페카테고리</label>
    <div class="col-sm-10">
      ${cafe.cafeType }
    </div>
  </div>   
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">가입안내</label>
    <div class="col-sm-10">
      ${cafe.applicationDetail }
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">등록일</label>
    <div class="col-sm-10">
      ${cafe.regDate }
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

					