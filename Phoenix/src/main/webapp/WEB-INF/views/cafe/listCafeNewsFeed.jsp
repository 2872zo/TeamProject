<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">

<title>카페뉴스피드</title>



<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../common/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
</head>

<body>
<br/>
	<div class='container'>

<div class='card'>
<div class='card-body'>
		<c:forEach var = 'post' items='${newsFeed}'>
		<input type='hidden' class='cafeURL' value='${post.cafeURL}'>
		<input type='hidden' class='postNo'  value='${post.postNo}'>
		<div class="card w-85 goToPost" style=" border: 1px solid #F7790A; ">
			<div class='row'>
			<div class='col-lg-2'>
			<div class="card-body">
			<img src="/images/common/16by9.png" class="card-img" alt="..."
			style="background: url('/images/uploadFiles/cafeicon/${post.cafeIcon}');
      no-repeat center center; background-size:cover; height:100px; width:auto;">
			${post.cafeName} 
			</div>
			</div>
			<div class='col-lg-8'>
			<div class="card-body">
				<h5 class="card-title">${post.postTitle}</h5>
				<p class="card-text">
				<c:set var="modifiedContent" value='${fn:replace(post.postContent,"<img alt=","")}'/>
				
				<c:if test="${fn:length(modifiedContent)>53}">
				${fn:substring(modifiedContent,0,50)}...
				</c:if>
				<c:if test="${fn:length(modifiedContent)<54}">
				${modifiedContent}
				</c:if>
				</p>
				
				</div>
			</div>
			<div class='col-lg-2'>
			 작성자 : ${post.memberNickname}
			 <br/>
			 ${post.regDate}
			</div>
			</div>
		</div>
		</c:forEach>
		
		
		</div>
		</div>
	
	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	
	
	<!--**********************************
        Scripts
    ***********************************-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>

	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.init.js"></script>

	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
var checkSessionUser = ${empty sessionScope.user};


$(".goToPost").on(
		"click",
		function() {
			var countNo=$(".goToPost").index(this);
			var cafeURL = $($(".cafeURL")[countNo]).val();
			var postNo = $($(".postNo")[countNo]).val();
			//alert(cafeURL);
			//alert(postNo);
			$(self.location).attr("href", "/cafe/"+cafeURL+"/getPost/"+postNo);

			// /cafe/cafeURL/getPost/postNo
			//var count = $(".cafeCategory").index(this);
			//$("#cafeType").val(count);
			//$("#cafeHomeForm").attr("method", "POST").attr("action",
				//	"/cafe/main").submit();
		});


</script>

<!-- 공통 툴바용 스크립트 -->	
	<script src="/js/custom/toolbarScript.js"></script>
</body>
</html>