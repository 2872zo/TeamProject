<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<header>
		<title>카페만들기화완료면</title>
	</header>
	
		<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			var cafeURL = "22";
			$( "button.btn.btn-success" ).on("click" , function() {
				alert("수정");
				$("form").attr("method" , "POST").attr("action" , "/cafe/"+cafeURL+"/manage/getCafeInfo?cafeNo=${cafe.cafeNo}").submit();
			});
		});	

			
		</script>
<body>
	
<form class="form-horizontal">



		
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">카페생성완료</th>
		<th scope="col">정보</th>		  
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">카페번호</th>
      <td>${cafe.cafeNo}</td>
    </tr>
    <tr>
      <th scope="row">카페이름</th>
      <td>${cafe.cafeName}</td>
    </tr>
    <tr>
      <th scope="row">카페URL</th>
      <td>${cafe.url}</td>
    </tr>
    <tr>
      <th scope="row">카페설명</th>
      <td>${cafe.cafeDetail}</td>
    </tr>
    <tr>
      <th scope="row">카페카테고리</th>
      <td>${cafe.cafeType}</td>
    </tr>
    <tr>
      <th scope="row">가입안내</th>
      <td>${cafe.applicationDetail}</td>
    </tr>
    <tr>
      <th scope="row">질문설정</th>
      <td>${cafe.applicationQuestion1}</td>
    </tr>
    
  </tbody>
</table>

		
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

					