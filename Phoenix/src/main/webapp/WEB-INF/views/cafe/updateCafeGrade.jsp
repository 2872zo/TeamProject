<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>카페등급관리</title>

<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">
<!-- 스위트얼럿 css -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<style>
.form-inline .form-control {
	width: 45px;
	text-align: center
}

.form-control.input-default.tbox {
	width: 110px;
	text-align: center
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
					stroke-width="3" stroke-miterlimit="10"></circle>
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

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/cafeManageTollbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->


		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/common/cafeManageMenubar.jsp"></c:import>
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
						<li class="breadcrumb-item"><a href="javascript:void(0)">manage</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">grade</a></li>
					</ol>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">>카페등급관리</h4>
								멤버 등급
								<code>사용안함</code>
								선택시 해당 등급에 해당하는 모든 멤버는 한단계 아래등급으로 내려갑니다 <br /> <br /> <br />

								<c:set var="i" value="0" />
								<c:set var="j" value="0" />

								<div class="form-row">
									<div class="col">
										<form id="submit">
											<c:forEach var="cafeGrade" items="${cafeGradeList}">
												<c:set var="i" value="${ i+1 }" />
												<input type="hidden" class="cafeNo"
													value="${cafeGrade.cafeNo}" />
												<br>

												<div class="form-inline">
													<c:if test="${i eq 1}">
														<h6>${i}번째등급명</h6>&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="text" class="form-control input-default tbox"
															name="gradeList[${j}].gradeName"
															value="${cafeGrade.gradeName}" />
														<br>
														<input type="hidden" class="cafeGradeNo"
															name="gradeList[${j}].cafeGradeNo"
															value="${cafeGrade.cafeGradeNo }" />
													</c:if>
												</div>

												<div class="form-inline">
													<c:if test="${i ne 1}">
														<h6>${i}번째등급명</h6>&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="text" class="form-control input-default tbox"
															name="gradeList[${j}].gradeName"
															value="${cafeGrade.gradeName}" />
												&nbsp;&nbsp;&nbsp;&nbsp;
												출석&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
															class="form-control input-default abox"
															name="gradeList[${j}].requiredVisitCount"
															value="${cafeGrade.requiredVisitCount }" />&nbsp;&nbsp;&nbsp;&nbsp;이상,&nbsp;&nbsp;&nbsp;&nbsp;
												게시글 &nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
															class="form-control input-default bbox"
															name="gradeList[${j}].requiredPostCount"
															value="${cafeGrade.requiredPostCount }" />&nbsp;&nbsp;&nbsp;&nbsp;이상,&nbsp;&nbsp;&nbsp;&nbsp;
												댓글&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
															class="form-control input-default cbox"
															name="gradeList[${j}].requiredReplyCount"
															value="${cafeGrade.requiredReplyCount }" />&nbsp;&nbsp;&nbsp;&nbsp;이상&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="hidden" class="cafeGradeNo"
															name="gradeList[${j}].cafeGradeNo"
															value="${cafeGrade.cafeGradeNo }" />
														<input type="hidden" class="memberGradeCode"
															name="gradeList[${j}].memberGradeCode"
															value="${cafeGrade.memberGradeCode }" />


														<label class="radio-inline mr-3"> <input
															type="radio" class="dbox"
															name="gradeList[${j}].gradeFlag" value="1"
															<c:if test="${cafeGrade.gradeFlag eq true}">checked</c:if> />사용
														</label>
														<label class="radio-inline mr-3"> <input
															type="radio" name="gradeList[${j}].gradeFlag" value="0"
															<c:if test="${cafeGrade.gradeFlag eq false}">checked</c:if> />사용안함
														</label>


														<select class="form-control" style="width: 12%;"
															name="gradeList[${j}].autoUpgradeFlag">
															<option value="1"
																${cafeGrade.autoUpgradeFlag== "1" ? "selected" : "" }>자동등업승인</option>
															<option value="0"
																${cafeGrade.autoUpgradeFlag== "0" ? "selected" : "" }>자동등업거부</option>
														</select>


													</c:if>
												</div>
												<br>
												<hr>
												<c:set var="j" value="${ j+1 }" />
											</c:forEach>
										</form>
									</div>
								</div>
							</div>

							<br /> <br />
							<div align="center">
								<button type="button" name="button" id="save"
									class="btn mb-1 btn-outline-warning">저장</button>
							</div>
							<br />
						</div>
					</div>
				</div>
			</div>
		</div>
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

	<script type="text/javascript">
		$(function() {

			$("#save").on("click", function() {//update

				var count;
				var num = $('.dbox:checked').length;

				//alert("check된 길이"+num)
				var array = new Array(num);
				//alert("길이만큼 배열만듬"+array)
				var index = 0;

				$(".dbox:checked").each(function() {

					count = $(".dbox").index(this);
					//alert("체크된인덱스"+count)
					array[index] = count;
					index += 1
					//alert("어레이에 값 담음"+array)

					
				});
				for(var i =0; i<array.length-1; i++){
					//alert("어레이의 길이만큼 돌릴거에요~i "+i);

					var front = array[i]
					var afer = array[i+1]

					//alert("front"+front)
					//alert("afer"+afer)

					var visit = $($(".abox")[front]).val();
					var nextV = $($(".abox")[afer]).val();
					//alert("visit "+visit)
					//alert("nextV "+nextV)
					var post = $($(".bbox")[front]).val();
					var nextP = $($(".bbox")[afer]).val();
					//alert("post "+post)
					//alert("nextP "+nextP)
					var reply = $($(".cbox")[front]).val();
					var nextR = $($(".cbox")[afer]).val();
					//alert("reply "+reply)
					//alert("nextR "+nextR)

						if(visit>nextV || post>nextP || reply>nextR){
							swal("다음 등급 기준은 낮은 등급보다 높아야 합니다.", "", "warning")
							break;
							
						}else if(visit==nextV || post==nextP || reply==nextR){
							swal("등급 기준이 같을 수는 없습니다.", "", "warning")
							break;
						}else if(visit<nextV && post<nextP && reply<nextR){
							//alert("ok")
							$("form").attr("method", "POST").attr("action","/cafe/" + '${cafeURL}'+ "/manage/updateCafeGrade?CafeNo="+ $(".cafeNo").val()).submit();
						}
		
				}
			

			});

		});
	</script>

	<script src="/js/custom/cafeCommon.js"></script>

</body>
</html>