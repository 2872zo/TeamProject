<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!--jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
 integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
 crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>

<!--bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
</style>
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	$(function() {
	
				
			$("#login").on("click" , function() {
				$(self.location).attr("href","/user/loginView");
			});

			$("#logout").on("click" , function() {
				$(self.location).attr("href","/user/logout");
			});

			$("#phoenix").on("click", function() {
				$(self.location).attr("href", "/");
			});
			
			$("#goChat").on("click" , function() {
				$(self.location).attr("href","/chat/main");
			});
					
			
			$("#cafemanage").on("click", function() {
				
				location.href = "/cafe/"+"${cafeURL}"+"/manage/getCafeStatistics";
			});
			
			$("#cafeName").on("click", function() {
				
				$(self.location).attr("href", "/cafe/" + "${cafeURL}" +"/");
			});
	});
</script>
</head>

<body>



	<!--  화면구성 div Start /////////////////////////////////////-->

	<nav class="navbar navbar-expand-lg navbar-light"
		style="background-color: #ff6a00;">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo03"
			aria-controls="navbarTogglerDemo03" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="#" id="phoenix">Phoenix</a>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			
			 <%-- <c:if test="${cafe.manageUserNo == user.userNo }"></c:if>  --%>
				<li class="nav-item active"><a class="nav-link" href="#" id='cafemanage'>카페관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#" id ='cafeName'>{cafe.cafeName}</a></li>
			
			</ul>
			
	     	<c:if test='${empty sessionScope.user}'>
			<button type="submit" class='btn btn-outline-light' id='login'>Login</button>
			</c:if>
			
			<c:if test='${!empty sessionScope.user}'>
			<button class="btn btn-outline-dark" type="submit" id = "logout">Logout</button>
			</c:if>
			
			

		</div>
	</nav>

</body>
</html>