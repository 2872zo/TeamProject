<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<!-- 스위트얼럿 css -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<!-- 스위트얼럿 css -->

<title>멤버프로필상세조회</title>

<style type="text/css">
body {
background-color: white;}
</style>

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
				<button type="button" class="btn btn-outline-warning">저&nbsp;장</button>
			</div>
		</form>
	</div>


<!--**********************************
        Scripts
    ***********************************-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>

<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>

	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
<!-- 스크립트 -->
<script type="text/javascript">

	$(function() {
		$(".btn-outline-warning").on("click",function() {
	
			var cafeURL = '${search.cafeURL}';
			//$("form").attr("method", "POST").attr("action","/cafe/json/" + cafeURL + "/updateCafeMemberProfile").submit();
			//window.close();
			//opener.parent.location.reload();
			var jsoned = {
						memberNo : $("input[name=memberNo]").val() ,
						memberNickname : $("#memberNickname").val(),
						noticeFlag : !$("input[name=noticeFlag]").prop("checked"),
						favoriteFlag : !$("input[name=favoriteFlag]").prop("checked")
						};
			
			var jsoned= JSON.stringify(jsoned);
	
			$.ajax(
					{
						type : "POST",
						url : "/cafe/json/" + cafeURL + "/updateCafeMemberProfile",
						data : jsoned,
						contentType: "application/json", //보내는 컨텐츠의 타입
						//dataType : "json",      //받아올 데이터의 타입 필요없음
						success : function(serverData, status) {
									swal({
									  title: "수정완료",
									  text: "멤버정보가 수정되었습니다",
									  type: "success",
									  confirmButtonClass: "btn-info",
									  confirmButtonText: "확인",
									  closeOnConfirm: false
									},
										function(){
											window.close();
											opener.parent.location.reload();
										});
							},
						error : function(request,status,error){
							        alert("에러남 : "+error);
							}
					}
				);
			
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

							if (JSONData.result == true&& JSONData.memberNickname != "") {
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

</body>
</html>