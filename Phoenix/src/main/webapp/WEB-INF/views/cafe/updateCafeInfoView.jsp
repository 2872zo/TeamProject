<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
		
	<header>
		<title>카페정보수정화면</title>
	</header>
	
		<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-success" ).on("click" , function() {
				alert("수정");
				
				$("form").attr("method" , "POST").attr("action" , "/cafe/${cafe.cafeURL}/manage/updateCafeInfo")
				.attr("enctype","multipart/form-data").submit();
			});
		});	

		 $(function() {

				$("input[name='cafeName']").on('keyup',function() {
									var inputed = $("input[name='cafeName']").val();
									 //alert("입력  : "+inputed);
											$.ajax({
												url : "/cafe/json/checkCafeNameDuplication",
												method : "POST",
												dataType : "json",
												headers : {
													"Accept" : "application/json",
													"Content-Type" : "application/json"
												},
												data : JSON.stringify({
													cafeName : inputed,
												}),

												success : function(JSONData) {
													//alert(JSONData); 
													//alert(typeof(JSONData));

													if (JSONData && inputed != "") {
														$("#check").children("strong")
																.remove();
														$("#check")
																.append(
																		"<strong class=\"text-success\">사용 가능합니다.</strong>");
													} else {
														$("#check").children("strong")
																.remove();
														$("#check")
																.append(
																		"<strong  class=\"text-danger\">사용 불가능합니다.</strong>");
													}
													if (inputed == "") {
														$("#check").children("strong")
																.remove();
														$("#check")
																.append(
																		"<strong class=\"text-muted\">카페이름을 입력해주세요.</strong>");
													}
												}
											});
										});
									});
					
			
		</script>
		</head>
		<jsp:include page="../common/cafeManageTollbar.jsp" />
<body>


<form class="form-horizontal">
<div class="container">
		
		<div class="row">
			<div class="col-2">
				<c:import url="/WEB-INF/views/common/cafeManageMenubar.jsp"></c:import>
			</div>			
			<div class="col-10">
		
			<br>
				<h2 class="text-center">카페정보수정</h2>		
			
			</br>
			<hr>	
		<input type="hidden" name="cafeNo" value="${cafe.cafeNo }"/>
		<center>
  <div class="form-group">
    <label for="exampleFormControlInput1" class="col-sm-offset-3 col-sm-3 control-label">카 페 이 름</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" name="cafeName" value="${cafe.cafeName}">
    <span id="check"> <strong>카페이름을 입력해주세요</strong>
							</span>
	    </div>
  </div>

  <div class="form-group">
    <label for="exampleFormControlInput1" class="col-sm-offset-3 col-sm-3 control-label">카페 URL</label>
    <div class="col-sm-4">
    ${cafe.cafeURL }
    </div>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1" class="col-sm-offset-3 col-sm-3 control-label">카페 설명</label>
    <div class="col-sm-4">
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="cafeDetail" value="${cafe.cafeDetail}"></textarea>
    </div>
  </div>  

	  
	   <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">배너이미지</label>
		    <div class="col-sm-4">
		      <input type="file"  id="uploadFile" name="uploadFile" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">메인이미지</label>
		    <div class="col-sm-4">
		      <input type="file"  id="uploadFile2" name="uploadFile2" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">카페아이콘</label>
		    <div class="col-sm-4">
		      <input type="file"  id="uploadFile3" name="uploadFile3" >
		    </div>
		  </div>
  					<div class="form-group">
						<label for="exampleFormControlSelect1"
							class="col-sm-offset-1 col-sm-3 control-label">카페 카 테 고 리</label>
						<div class="col-sm-4">
							<select class="form-control" id="exampleFormControlSelect1"
								name="cafeType">								
								<option value="cc100">친목/모임</option>
								<option value="cc101">스포츠/레저</option>
								<option value="cc102">영화</option>
								<option value="cc103">게임</option>
								<option value="cc104">음악</option>
								<option value="cc105">여행</option>
							</select>
						</div>
					</div>
<div class="form-group">
						<label for="exampleFormControlSelect1"
							class="col-sm-offset-1 col-sm-3 control-label">자동가입승인여부</label>
						<div class="col-sm-4">
							<select class="form-control" id="exampleFormControlSelect1"
								name="autoApplicationAcceptFlag">								
								<option value="0">미사용</option>
								<option value="1">사용</option>
							</select>
						</div>
					</div>
					
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >수정</button>
		    </div>
		  </div>
		  </div>
		  </div>
		  </div>
		  
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	
 	
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>
					