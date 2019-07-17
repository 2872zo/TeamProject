<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;	
}

</style>


<script type="text/javascript">
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-primary").on("click", function() {
			fncAddCafe();
		});
	});

	//유효성 검사
	function fncAddCafe() {

		var cafeURL = "22";

		var cafeName = $("input[name='cafeName']").val();
		var URL = $("input[name='URL']").val();

		if (cafeName == null || cafeName.length < 1) {
			alert("카페이름은 반드시 입력하셔야 합니다.");
			return;
		}
		if (URL == null || URL.length < 1) {
			alert("카페URL은  반드시 입력하셔야 합니다.");
			return;
		}


		$("form").attr("method", "POST").attr("action",
				"/cafe/" + cafeURL + "/addCafe").submit();
	}
	//카페이름 중복확인 
	$(function() {

		$("input[name='cafeName']").on('keyup',function() {

							var inputed = $("input[name='cafeName']").val();
							// alert("입력  : "+inputed);

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

	//==>"URL중복확인" 
	$(function() {

		$("input[name='URL']")
				.on(
						'keyup',
						function() {

							var inputed = $("input[name='URL']").val();
							// alert("입력  : "+inputed);

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
												$("#check1").children("strong")
														.remove();
												$("#check1")
														.append(
																"<strong class=\"text-success\">사용 가능합니다.</strong>");
											} else {
												$("#check1").children("strong")
														.remove();
												$("#check1")
														.append(
																"<strong  class=\"text-danger\">사용 불가능합니다.</strong>");
											}
											if (inputed == "") {
												$("#check1").children("strong")
														.remove();
												$("#check1")
														.append(
																"<strong class=\"text-muted\">URL을 입력해주세요.</strong>");
											}
										}

									});
						});

	});

	//============= "만들기"  Event 연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn btn-success").on("click", function() {
			fncAddCafe();
		});
	});

	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click", function() {
			//$("form")[0].reset();
			self.location = "/cafe/main"
		});
	});
</script>

</head>
<body>

	<div class="container">

		<h4 class="bg-primary text-center">카페 만들기</h4>
		
			<form class="form-horizontal">

				<div class="form-group">
					<center>
					<label for="exampleFormControlInput1" class="col-sm-offset-1 col-sm-3 control-label">카 페 이 름</label>
						<div class="col-sm-4">				
							<input type="text" class="form-control"
								id="exampleFormControlInput1" placeholder="" name="cafeName">
							<span id="check"> <strong>카페이름을 입력해주세요</strong>
							</span>
						</div>
					</center>
				</div>
				<center>
					<div class="form-group">
						<label for="exampleFormControlInput1"
							class="col-sm-offset-1 col-sm-3 control-label">카페 URL</label>
						<div class="col-sm-4">
							<input type="text" class="form-control"
								id="exampleFormControlInput1" placeholder="" name="URL">
							<span id="check1"> <strong>카페URL을 입력해주세요</strong>
							</span>		
						</div>
					</div>
				</center>
				<center>
					<div class="form-group">
						<label for="exampleFormControlTextarea1"
							class="col-sm-offset-1 col-sm-3 control-label">카페 설명</label>
						<div class="col-sm-4">
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3" name="cafeDetail"></textarea>
						</div>
					</div>
				</center>
				<center>
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
				</center>
				<center>
					<div class="form-group">
						<label for="exampleFormControlTextarea1"
							class="col-sm-offset-3 col-sm-3 control-label">가입 안내</label>
						<div class="col-sm-4">
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3" name="applicationDetail"></textarea>
						</div>
					</div>
			<center>
			<div class="form-group">
						<label for="exampleFormControlSelect1"
							class="col-sm-offset-1 col-sm-3 control-label">별명사용여부</label>
						<div class="col-sm-4">
							<select class="form-control" id="exampleFormControlSelect1"
								name="memberNicknameFlag">								
								<option value="0">미사용</option>
								<option value="1">사용</option>
							</select>
						</div>
					</div>
				</center>
				<center>
					<div class="form-group">
						<div class="col-sm-offset-4  col-sm-4 text-center">
							<button type="button" class="btn btn-primary">만들기</button>
							<a class="btn btn-success btn" href="#" role="button">취&nbsp;소</a>
						</div>
					</div>
				</center>

		</form>
		<!-- form Start /////////////////////////////////////-->
	</div>


	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>
