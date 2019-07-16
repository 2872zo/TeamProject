<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>

<!-- ////////////////////////////// jQuery CDN ////////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
 integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
 crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
 integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
 crossorigin="anonymous"></script>
<!-- ////////////////////////////// bootstrap CDN ////////////////////////////// -->
<link rel="stylesheet"
 href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
 crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
 integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
 crossorigin="anonymous"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

    </style>
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {
	$("#login").on("click" , function() {
		$(self.location).attr("href","/loginView");
	});

	$("#phoenix").on("click" , function() {
		$(self.location).attr("href","/");
	});

	$("#goChat").on("click" , function() {
		$(self.location).attr("href","/chat/main");
	});

	$("#viewFriendsList").on("click" , function() {
		$(self.location).attr("href","/chat/chatFriendsList");
	});

	$("#viewChatRoomList").on("click" , function() {
		$(self.location).attr("href","/chat/chatRoomList");
	});
	
	$("#viewConfig").on("click" , function() {
		$(self.location).attr("href","/chat/config");
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
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Link</a>
      </li>   
      <c:set var="uriCheck" value="${pageContext.request.requestURI}" />
      <c:if test='${uriCheck.startsWith("/WEB-INF/views/chat/")}'>
     <li class="nav-item">

    <button class="btn btn-outline-light" type="button" id='viewFriendsList'>친구목록보기</button>
    <button class="btn btn-outline-light" type="button" id='viewChatRoomList'>채팅방목록보기</button>
    <button class="btn btn-outline-light" type="button" id='viewConfig'>환경설정</button>
 </li> 
     </c:if>
  
    </ul>
    
 		 <a class="nav-link" href="#" id='goChat'>채팅으로 떠날게</a>
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Chat</a>
     
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit" id = "login">Login</button>
   
  </div>
</nav>

</body>
</html>