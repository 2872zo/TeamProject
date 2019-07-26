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

<script type="text/javascript">
	$(function() {
		$(".btn-outline-warning").on("click",function() {
					var cafeURL = '${search.cafeURL}';
					//alert(cafeURL)
					$("form").attr("method", "POST").attr("action","/cafe/" + cafeURL + "/updateCafeMemberProfile").submit();
					window.close();
					opener.parent.location.reload();
					
				});
	});

	$(function() {
		var cafeNo = '${cafeMember.cafeNo }'
		var cafeURL = '${search.cafeURL}';
		$("#memberNickname").on(
				"keyup",
				function() {
					//alert($("#memberNickname").val())
					//alert(cafeNo)

					$.ajax({
						url : "/cafe/json/" + cafeURL + "/checkNickName",
						type : "POST",
						data : JSON.stringify({
							memberNickname : $("#memberNickname").val(),
							cafeNo : cafeNo
						}),
						dataType : "json",
						contentType : "application/json",
						success : function(JSONData, status) {

							//alert("status : " + status);
							//alert("JSONData.result : \n" + JSONData.result);

							if (JSONData.result == true
									&& JSONData.memberNickname != "") {
								$("#here").html("<h7 style='color:green;'>사용가능</h7>")
							} else if (JSONData.result == false) {
								$("#here").html("<h7>사용불가능</h7>")
							} else if ((JSONData.memberNickname == "")
									&& JSONData.result == true) {
								$("#here").html("<h7 style='color:blue;'>중복확인하세요</h7>")
							}

						},
						error : function(request, status, error) {
							//alert("에러남 : " + error);
						}

					});//ajax끝

				});

	});
</script>

<title>멤버프로필상세조회</title>


</head>
<body>
	<div class='container'>
		<br />
		<h4>멤버프로필</h4>
		<br />


		<form class="form-horizontal" name="updateProfile">
			<input type="hidden" name="memberNo" value="${cafeMember.memberNo }">


			<div class="form-group">
				<label for="memberNickname"
					class="col-sm-offset-1 col-sm-3 control-label">별명</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="memberNickname"
						name="memberNickname" value="${cafeMember.memberNickname }">
					<strong class="text-danger" id="here" name="here">사용중인별명</strong>
				</div>
			</div>

			<hr />
			<div class="form-group">
				<label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">가입일
				</label>
				<div class="col-sm-4">${cafeMember.regDate }</div>
			</div>

			<hr />
			<div class="form-group">
				<label for="gradeName"
					class="col-sm-offset-1 col-sm-3 control-label">등급 </label>
				<div class="col-sm-4">${cafeMember.gradeName }</div>
			</div>

			<hr />
			<div class="form-group">
				<label for="favoriteFlag"
					class="col-sm-offset-1 col-sm-3 control-label">즐겨찾기</label>
				<div class="col-sm-4 favorite">
					<input type="radio" name="favoriteFlag" value="0"
						<c:if test="${cafeMember.favoriteFlag eq false }">checked</c:if> />거부
					<input type="radio" name="favoriteFlag" value="1"
						<c:if test="${cafeMember.favoriteFlag eq true }">checked</c:if> />수신
				</div>
			</div>

			<hr />
			<div class="form-group">
				<label for="noticeFlag"
					class="col-sm-offset-1 col-sm-3 control-label">공지수신 </label>
				<div class="col-sm-4 notice">
					<input type="radio" name="noticeFlag" value="0"
						<c:if test="${cafeMember.noticeFlag eq false }">checked</c:if> />거부
					<input type="radio" name="noticeFlag" value="1"
						<c:if test="${cafeMember.noticeFlag eq true}">checked</c:if> />수신
				</div>
			</div>



			<div align="center">
				<button type="button" class="btn btn-outline-warning">확&nbsp;인</button>
			</div>
		</form>
	</div>

</body>
</html>