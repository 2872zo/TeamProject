<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
	
<head>


	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


		<title>카페가입신청화면</title>
	
<!--  ///////////////////////// JavaScript ////////////////////////// -->	
		<script type="text/javascript">

		 $(function() {
			 var cafeURL =1234;
			$( "button.btn.btn-success" ).on("click" , function() {
				alert("가입");
				$("form").attr("method" , "POST").attr("action" , "/cafe/"+cafeURL+"/addCafeApplication?cafeNo="+${cafe.cafeNo}).submit();
			});
		});	

			
		</script>
<body>
	
<form class="form-horizontal">


		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>카페이름 : ${cafe.cafeName} 카페입니다.</strong></div>
		</div>
		
		<c:if test="${!empty cafe.cafeDetail}">
		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>카페설명 : ${ cafe.cafeDetail} </strong></div>
		</div>
		</c:if>
		  
		  <div class="form-group">
		    <label for="memberNickname" class="col-sm-offset-1 col-sm-3 control-label">별명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="memberNickname" name="memberNickname" placeholder="사용할 닉네임">
		    </div>
		  </div>
		  
		  <c:if test="${!empty cafe.applicationQuestion1}">
		 <div class="row" align="center">
	  		<div class="col-sm-4"><strong>가입질문1: ${ cafe.applicationQuestion1}</strong></div>
		</div>
		
			<div class="form-group">
		    <label for="answer1" class="col-sm-offset-1 col-sm-3 control-label">가입질문1에 대한 답변</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="answer1" name="answer1" placeholder="질문1에 대한 답변">
		    </div>
		  </div>
		 </c:if>
		  
		  <c:if test="${!empty cafe.applicationQuestion2}">
		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>가입질문2: ${ cafe.applicationQuestion2}</strong></div>
		</div>
		
		<div class="form-group">
		    <label for="answer1" class="col-sm-offset-1 col-sm-3 control-label">가입질문2에 대한 답변</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="answer2" name="answer2" placeholder="질문1에 대한 답변">
		    </div>
		  </div>
		  </c:if>
		  
		 <c:if test="${!empty cafe.applicationQuestion3} ">
		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>가입질문3: ${ cafe.applicationQuestion3}</strong></div>
		</div>
		
		
		<div class="form-group">
		    <label for="answer1" class="col-sm-offset-1 col-sm-3 control-label">가입질문3에 대한 답변</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="answer2" name="answer3" placeholder="질문1에 대한 답변">
		    </div>
		  </div>
		  </c:if>
		
		  

		  
		
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >가 &nbsp;입</button>
		    </div>
		  </div>
		</form>
	
	
</body>

</html>
