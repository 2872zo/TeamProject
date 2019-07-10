<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
 $(function(){

	 $( "button.btn.btn-success" ).on("click" , function() {
		 alert("확인")
		 self.location = "/cafe/1234/updateCafeMember?memberStatusCode=cs003" 
	 });
	
	 $("a[href='#' ]").on("click" , function() {
		 alert("취소")
		// self.location = "/cafe/1234/main" 
	});
 	
});  
 
 </script>	
<html>


<title>카페탈퇴</title>

</head>
<body>
<br>
<br>
<hr>
<h2>카페명 : $cafe.cafeName</h2>
<h2>카페에서 탈퇴하시겠습니까?</h2>
<h3>카페 탈퇴시 작성된 게시글은 자동으로 삭제되지 않습니다.</h3>

		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-success">확 &nbsp;인</button>
				<a class="btn btn-success btn" href="#" role="button">취 &nbsp;소</a>
			</div>
		</div>



</body>
</html>