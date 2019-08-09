<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<!-- 스위트얼럿 css -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">




<style>
#div_menu {
	width: 20%;
	height: 500px;
	float: left;
	background-color: #82FA58;
}

#div_con {
	width: 80%;
}

.cursor {
	cursor: pointer;
}

.cursor:hover {
	text-decoration: underline;
}
</style>
</head>

<body>


	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		 <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <c:import url="/WEB-INF/views/common/brand-logo.jsp"/>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">
			<c:import url="/WEB-INF/views/common/cafeToolbar.jsp"></c:import>
		</div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/cafe/menubarCafe.jsp"></c:import>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->


		<div class="content-body">
			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">카페</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">카페가입</a></li>
					</ol>
				</div>
			</div>
			<div id="container-fluid">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">${cafe.cafeName } 카페가입하기</h4>
							<p class="text-muted m-b-15 f-s-12">
								카페가입을 위한 정보를 입력해주세요. 카페내규에 따라
								<code>가입승인, 가입거절</code>
								될 수 있습니다.
							</p>
							<div class="basic-form">
								<!-- form Start /////////////////////////////////////-->
								<form>
									<input type="hidden" name="autoApplicationAcceptFlag"
										value="${cafe.autoApplicationAcceptFlag }" /> <input
										type="hidden" name="memberNicknameFlag"
										value="${cafe.memberNicknameFlag }" /> <input type="hidden"
										name="cafeNo" value="${cafe.cafeNo }" />

									<c:if test="${!empty cafe.cafeDetail}">
										<div class="form-group">
											>카페설명 <input type="text" readonly="readonly"
												class="form-control-plaintext" value="${cafe.cafeDetail }">
										</div>
									</c:if>

									<c:if test="${cafe.memberNicknameFlag eq true }">
                                    >별명
                                        <div class="form-row">
											<div class="col">
												<input type="text" class="form-control input-default"
													id="memberNickname" name="memberNickname"
													placeholder="사용할별명"> <span id="helpBlock"
													class="help-block"> <strong class="text-danger"
													id="here" name="here">중복확인하세요</strong>
												</span>
											</div>
											<div class="col-7"></div>
											<div class="col"></div>
										</div>
									</c:if>
									<br>
									<c:if test="${!empty cafe.applicationQuestion1}">
										<div class="form-group">
											>질문1 <input type="text" readonly="readonly"
												class="form-control-plaintext"
												value="${  cafe.applicationQuestion1}"> <input
												type="hidden" name="question1"
												value="${  cafe.applicationQuestion1}" />
										</div>
										<div class="form-group">
											<input type="text" class="form-control input-default"
												id="answer1" name="answer1" placeholder="질문1에 대한 답변을 입력해주세요">
										</div>
									</c:if>

									<c:if test="${!empty cafe.applicationQuestion2}">
										<div class="form-group">
											>질문2 <input type="text" readonly="readonly"
												class="form-control-plaintext"
												value="${  cafe.applicationQuestion2}"> <input
												type="hidden" name="question2"
												value="${  cafe.applicationQuestion2}" />
										</div>
										<div class="form-group">
											<input type="text" class="form-control input-default"
												id="answer2" name="answer2" placeholder="질문2에 대한 답변을 입력해주세요">
										</div>
									</c:if>

									<c:if test="${!empty cafe.applicationQuestion3}">
										<div class="form-group">
											>질문3 <input type="text" readonly="readonly"
												class="form-control-plaintext"
												value="${  cafe.applicationQuestion3}"> <input
												type="hidden" name="question3"
												value="${  cafe.applicationQuestion3}" />
										</div>
										<div class="form-group">
											<input type="text" class="form-control input-default"
												id="answer3" name="answer3" placeholder="질문3에 대한 답변을 입력해주세요">
										</div>
									</c:if>

									<div align="center">
										질문 답변 시 회원님의 소중한 개인정보가 유출되지 않도록 주의해주시기 바랍니다.
										<br>
										<br>
										<button type="button" name="button"
											class="btn mb-1 btn-outline-warning">가입</button>
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- row -->

			<div class="container-fluid"></div>
			<!-- #/ container -->
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

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
		$(function() {
			var cafeURL = '${cafe.cafeURL}'
				//alert(cafeURL);
			
			$("button[name=button]").on("click",function() {
						//alert("가입");
					var nickname = $("#memberNickname").val();
					var answer1 = $("#answer1").val();
					var answer2 = $("#answer2").val();
					var answer3 = $("#answer3").val();
						//alert(answer1);
						//alert(answer2);
						//alert(answer3);
						
						if(nickname!="" && answer1 !="" && answer2 !="" && answer3 !=""){
							$("form").attr("method", "POST").attr("action","/cafe/" + cafeURL + "/addCafeApplication").submit();
						}else if(nickname ==""||nickname==null){
							swal("별명을 입력해주세요.", "", "warning")
						}else if(answer1 == "" || answer2 == "" || answer3 == ""||answer1 == null || answer2 == null || answer3 == null){
							swal("답변을 입력해주세요.", "", "warning")
						}
					
						
						
						
			});
		});

		$(function() {
			var cafeNo = '${cafe.cafeNo }'
			var cafeURL = '${cafe.cafeURL}'
			$("#memberNickname").on(
					"keyup",
					function() {
						//alert("durl")
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
								alert("에러남 : " + error);
							}

						});//ajax끝

					});//keyup끝

		});
	</script>
	
	<script src="/js/custom/cafeCommon.js"></script>

</body>

</html>
