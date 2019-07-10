<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	
	<header>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
			$(function(){
				var cafeURL = "${cafeURL}";

				$("[type=submit]").on("click", function(){
					$("form").attr("method","POST").attr("action","/cafe/" + cafeURL + "/search").submit();	
				});
			});
		</script>
		<title>index</title>
	</header>
	
	<body>
		<h1>Menubar</h1>
		
		<form>
			<input type="text" name="keyword">
			<input type="submit">
		</form>
		
	</body>

</html>