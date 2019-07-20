<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

    </style>
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function() {
	//툴바 로그아웃 기준으로 작성하고 로그인시 변경되는 부분
	if(${!empty sessionScope.user}){
		
		$("#login").attr('class' , 'logout btn btn-dark')
		$("#login").text('로그아웃');
		$("#goChat").attr('class' , 'btn btn-info');
		$("#goChat").text('로그인해서채팅가능');

		}

	//페이지 별로 변경되는 부분도 여기다가 작성해야할듯

	$(".login").on("click" , function() {
		$(self.location).attr("href","/user/loginView");
	});

	$(".logout").on("click" , function() {
		$(self.location).attr("href","/user/logout");
	});

	$("#phoenix").on("click" , function() {
		$(self.location).attr("href","/");
	});

	$("#cafeHome").on("click" , function() {
		$(self.location).attr("href","/cafe/main");
	});

	$("#applications").on("click" , function() {
		$(self.location).attr("href","/cafe/main/cafeApplicationList");
	});

	$("#newsFeed").on("click" , function() {
		$(self.location).attr("href","/cafe/main/cafeNewsFeed");
	});	

	$("#cafeExplore").on("click" , function() {
		$("#cafeSearch").attr("method" , "POST").attr("action" , "/cafe/search").submit();
	});
	
	$(".searchCondition").on("click" , function() {
		$("#searchCondition").val($(".searchCondition").index(this));
	});

	$("#goChat").on("click" , function() {
		$(self.location).attr("href","/chat/chatRoomList");
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
	<!-- ffb347 FFAA28 FFA01E FFAA28 FFAF00 FFA01E F7750A #F7790A #F5A142-->
		<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #F7790A;">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="#" id="phoenix">Phoenix</a>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
       <c:set var="uriCheck" value="${pageContext.request.requestURI}" />
      <c:if test='${uriCheck.startsWith("/WEB-INF/views/cafe/")}'>
               <li class="nav-item active">
        <a class="nav-link" href='#' id='cafeHome'>CafeHome<span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
      <form class="form-inline" id='cafeSearch'>
		<input type="hidden" id="currentPage" name="currentPage" value="0"/>
		<input type ="hidden" name = 'cafeURL' value='${ !empty search.cafeURL ? search.cafeURL : "" }'>
		<input type ="hidden" name = 'boardName' value='${ !empty search.boardName ? search.boardName : "" }'>
	
	   <select class="custom-select" aria-label="Example select with button addon" name='searchCondition' id='searchCondition'>
	    <option class='searchCondition' selected value="0"   ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>카페+게시글</option>
	    <option class='searchCondition' value="1"   ${ !empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>카페</option>
	    <option class='searchCondition' value="2"   ${ !empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>게시글</option>
	   </select>
	
	  <input type="text" class="form-control" placeholder="검색어 입력해주세요" aria-label="Text input with dropdown button" aria-describedby="button-addon2" value='${ !empty search.searchKeyword ? search.searchKeyword : '' }' name="searchKeyword" id="searchKeyword">
	  <button class="btn btn-outline-light" type="button" id="cafeExplore">검색</button>
	</form>	
  	 </li>
  	 </c:if>
  <c:if test='${uriCheck.startsWith("/WEB-INF/views/cafe/") && !empty sessionScope.user}'>
      <li class="nav-item">
        <a class="nav-link" href="#" id='applications'>카페 가입신청내역</a>
      </li>   
       <li class="nav-item">
        <a class="nav-link" href="#" id='newsFeed'>새글 피드</a>
      </li>  
      </c:if>
     
      
      <c:if test='${uriCheck.startsWith("/WEB-INF/views/chat/") && !empty sessionScope.user}'>
     <li class="nav-item">

    <button class="btn btn-outline-light" type="button" id='viewFriendsList'>친구목록보기</button>
    <button class="btn btn-outline-light" type="button" id='viewChatRoomList'>채팅방목록보기</button>
    <button class="btn btn-outline-light" type="button" id='viewConfig'>환경설정</button>
 	</li> 
     </c:if>
     

    </ul>

      	<button type="button" class='btn btn-dark' id='${empty sessionScope.user ? "noChat":"goChat"}'>채팅</button>
		<button type="submit" class='login btn btn-outline-light' id='login'>로그인</button>
		
  </div>
</nav>

</body>
</html>