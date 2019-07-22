<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>카페뉴스피드</title>

<!-- ////////////////////////////// jQuery CDN ////////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<!-- ////////////////////////////// bootstrap CDN ////////////////////////////// -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

	$(function() {	

		/*	
		var el = document.createElement( 'html' );
		el.innerHTML = '${post.postContent}';
		$(el).find("img").remove().html

		

		$("#addCafe").on("click", function() {
			$(self.location).attr("href", "/cafe/addCafeView");
		});
		*/	
		
		
	});
</script>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../common/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
</head>

<body>

	<div class='container'>

		<c:forEach var = 'post' items='${newsFeed}'>
		<div class="card border-primary w-85">
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
				${post.regDate}
			</div>
		</div>
		</c:forEach>
	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
</body>
</html>