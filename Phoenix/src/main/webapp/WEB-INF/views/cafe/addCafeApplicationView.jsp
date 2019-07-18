<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
	
<head>

<title>카페가입신청화면</title>

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



	
<!--  ///////////////////////// JavaScript ////////////////////////// -->	
		<script type="text/javascript">

		 $(function() {
			 var cafeURL ='${cafe.URL}'
			
			$( " button.btn.btn-outline-success" ).on("click" , function() {
				alert("가입");
				$("form").attr("method" , "POST").attr("action" , "/cafe/"+cafeURL+"/addCafeApplication").submit();
			});
		});	

		$(function(){
			var cafeNo = '${cafe.cafeNo }'
			var cafeURL ='${cafe.URL}'
			$("#memberNickname").on("keyup", function() {
				//alert("durl")
				//alert($("#memberNickname").val())
				//alert(cafeNo)

				$.ajax(
						{
					url : "/cafe/json/"+cafeURL+"/checkNickName",
					type : "POST",
					data : JSON.stringify({
						memberNickname : $("#memberNickname").val(),
						cafeNo : cafeNo
					}),
					dataType : "json",
					contentType: "application/json",
					success : function(JSONData, status) {
						
						//alert("status : " + status);
						//alert("JSONData.result : \n" + JSONData.result);

						if	(JSONData.result == true&& JSONData.memberNickname !="") {
							$("#here").html("<h7>사용가능</h7>")
						} else if (JSONData.result == false) {
							$("#here").html("<h7>사용불가능</h7>")
						}else if( (JSONData.memberNickname=="") && JSONData.result == true ){
							$("#here").html("<h7>중복확인하세요</h7>")
						}
						
					},
					error : function(request,status,error){
				        alert("에러남 : "+error);
				       }
					

					}
						);//ajax끝
				
	
				
			});//keyup끝

		});

			
		</script>
<body>


<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">	
		<h1 align="center">카페가입</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" >
<input type="hidden" name="autoApplicationAcceptFlag" value="${cafe.autoApplicationAcceptFlag }"/>
<input type="hidden" name="memberNicknameFlag" value="${cafe.memberNicknameFlag }"/>
<input type="hidden" name="cafeNo" value="${cafe.cafeNo }"/>
		
		
		  <div class="form-group">
		    <label for="cafeName" class="col-sm-offset-1 col-sm-3 control-label">${cafe.cafeName} 카페입니다. </label>
		    <div class="col-sm-4">
		    </div>
		  </div>
	
		 <c:if test="${!empty cafe.cafeDetail}"> 
		  <div class="form-group">
		    <label for="cafeDetail" class="col-sm-offset-1 col-sm-3 control-label">카페설명</label>
		    <div class="col-sm-4">
		      ${ cafe.cafeDetail}
		    </div>
		  </div>
		 </c:if>
		
		  
		 
 		<c:if test="${cafe.memberNicknameFlag eq true }">
		  <div class="form-group">
		    <label for="memberNickname" class="col-sm-offset-1 col-sm-3 control-label">별명 </label>
		    <div class="col-sm-4">
		    <input type="text" class="form-control" id="memberNickname" name="memberNickname" placeholder="사용할 닉네임">
		    <span  id ="helpBlock" class="help-block">
		    <strong class="text-danger" id="here" name = "here">중복확인하세요</strong>
		    </span>
		    </div>
		  </div>
		 </c:if>
		  
	
		<c:if test="${!empty cafe.applicationQuestion1}">
		  <div class="form-group">
		    <label for="question1" class="col-sm-offset-1 col-sm-3 control-label">질문 1 </label>
		    <div class="col-sm-4">
		    	${ cafe.applicationQuestion1}
		      <input type="hidden" name ="question1" value="${  cafe.applicationQuestion1}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="answer1" class="col-sm-offset-1 col-sm-3 control-label"></label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="answer1" name="answer1" placeholder="질문1에 대한 답변">
		    </div>
		  </div>
		 </c:if>
		 
		 <c:if test="${!empty cafe.applicationQuestion2}">
		  <div class="form-group">
		    <label for="question2" class="col-sm-offset-1 col-sm-3 control-label">질문 2 </label>
		    <div class="col-sm-4">
		    	${ cafe.applicationQuestion2}
		      <input type="hidden" name ="question2" value="${  cafe.applicationQuestion2}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="answer2" class="col-sm-offset-1 col-sm-3 control-label"></label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="answer2" name="answer2" placeholder="질문2에 대한 답변">
		    </div>
		  </div>
		 </c:if>
		 
		 
		 <c:if test="${!empty cafe.applicationQuestion3}">
		  <div class="form-group">
		    <label for="question3" class="col-sm-offset-1 col-sm-3 control-label">질문 3 </label>
		    <div class="col-sm-4">
		    	${ cafe.applicationQuestion3}
		      <input type="hidden" name ="question3" value="${  cafe.applicationQuestion3}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="answer3" class="col-sm-offset-1 col-sm-3 control-label"></label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="answer3" name="answer3" placeholder="질문3에 대한 답변">
		    </div>
		  </div>
		 </c:if>
		
		
		
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		     질문 답변 시 회원님의 소중한 개인정보가 유출되지 않도록 주의해주시기 바랍니다.
		      <button type="button" class="btn btn-outline-success"  >동의후가입</button>
		    </div>
		  </div>
		</form>
		  
		<!-- form /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->


</body>

</html>
