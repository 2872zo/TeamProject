<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>카페폐쇄</title>

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

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {
	
	$("button[name=button]" ).on("click" , function() {
		alert($(".cafeNo").val())
		alert('${cafe.cafeURL}')
		$("form").attr("method" , "POST").attr("action" , "/cafe/"+'${cafe.cafeURL}'+"/manage/dropCafe").submit();
	});
});
</script>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../common/cafeManageTollbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
</head>

<body>



	
	<div class="container">
		<div class="row">
			<div class="col-2">
				<c:import url="/WEB-INF/views/common/cafeManageMenubar.jsp"></c:import>
			</div>
			
			<div class="col-10">
			<br>
			<br>
				<h1 class="text-center">카페폐쇄</h1>		
			</br>
			</br>
			<hr>
			
			<form class="form-horizontal" name ="reason">
					 <div class="form-group">
					    <label for="closeReason" class="col-sm-offset-1 col-sm-3 control-label">폐쇄 이유를 입력해주세요</label>
					    
					    <div class="closeReason">
					    	<textarea rows=10 cols=10 id="closeReason" name="closeReason" class="form-control" ></textarea>
					    </div>
					 </div>
					  <input type="hidden" name="cafeNo" class="cafeNo" value="${cafe.cafeNo }"/>
					  <div align="center">
					  <button type="button" class="btn btn-outline-success" name="button" >카페폐쇄하기</button>
					  </div>
			</form>
			
			</div><!-- col-10, #mainContent End -->
		</div><!-- row End -->
	</div><!-- container End -->
</body>
</html>