<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
		 alert("Ȯ��")
		 self.location = "/cafe/1234/updateCafeMember?memberStatusCode=cs003" 
	 });
	
	 $("a[href='#' ]").on("click" , function() {
		 alert("���")
		// self.location = "/cafe/1234/main" 
	});
 	
});  
 
 </script>	
<html>


<title>ī��Ż��</title>

</head>
<body>
<br>
<br>
<hr>
<h2>ī��� : $cafe.cafeName</h2>
<h2>ī�信�� Ż���Ͻðڽ��ϱ�?</h2>
<h3>ī�� Ż��� �ۼ��� �Խñ��� �ڵ����� �������� �ʽ��ϴ�.</h3>

		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-success">Ȯ &nbsp;��</button>
				<a class="btn btn-success btn" href="#" role="button">�� &nbsp;��</a>
			</div>
		</div>



</body>
</html>