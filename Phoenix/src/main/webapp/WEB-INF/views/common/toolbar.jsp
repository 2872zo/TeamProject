<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!--jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<!--bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

    </style>
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {
	$("#login").on("click" , function() {
		$(self.location).attr("href","/login");
	});

	$("#phoenix").on("click" , function() {
		$(self.location).attr("href","/");
	});
});
</script>
</head>

<body>



	<!--  화면구성 div Start /////////////////////////////////////-->
	<!-- ffb347 FFAA28 FFA01E FFAA28 FFAF00-->
		<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #FFAF00;">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="#" id="phoenix">Phoenix</a>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>   
    </ul>
    
  
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Chat</a>
     
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit" id = "login">Login</button>
   
  </div>
</nav>

</body>
</html>