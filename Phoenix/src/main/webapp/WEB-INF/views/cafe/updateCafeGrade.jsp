<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>


<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>카페폐쇄</title>



<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">


<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../common/cafeManageTollbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->



</head>

<body>


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

	<div class="content-body" style="min-height: 743px;">

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">manage</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">closed</a></li>
				</ol>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">>카페등급관리</h4>

							멤버 등급 <danger>사용안함</danger> 선택시 해당 등급에 해당하는 모든 멤버는 한단계 아래등급으로 내려갑니다 <br /> <br />
							<br />




							<c:set var="i" value="0" />
							<c:set var="j" value="0" />

							<div class="basic-form">
								<form id="submit">
									<c:forEach var="cafeGrade" items="${cafeGradeList}">

										<c:set var="i" value="${ i+1 }" />
										<input type="hidden" class="cafeNo"
											value="${cafeGrade.cafeNo}" />
										<c:if test="${i eq 1}">
					${i} 번째 등급명
					<input type="text" class="gradeName"
												name="gradeList[${j}].gradeName"
												value="${cafeGrade.gradeName}" />
											<input type="hidden" class="cafeGradeNo"
												name="gradeList[${j}].cafeGradeNo"
												value="${cafeGrade.cafeGradeNo }" />
											<br />
											<hr/>
											<br />

										</c:if>

										<c:if test="${i ne 1}">
					${i} 번째 등급명
					<input type="text" class="gradeName"
												name="gradeList[${j}].gradeName"
												value="${cafeGrade.gradeName}" />
											<br />
											<br />
					출석 <input type="text" class="visit"
												name="gradeList[${j}].requiredVisitCount"
												value="${cafeGrade.requiredVisitCount }" />이상,
					게시글 <input type="text" class="post"
												name="gradeList[${j}].requiredPostCount"
												value="${cafeGrade.requiredPostCount }" />이상,
					댓글 <input type="text" class="reply"
												name="gradeList[${j}].requiredReplyCount"
												value="${cafeGrade.requiredReplyCount }" />이상,&nbsp;&nbsp;&nbsp;
					<input type="hidden" class="cafeGradeNo"
												name="gradeList[${j}].cafeGradeNo"
												value="${cafeGrade.cafeGradeNo }" />
											<input type="hidden" class="memberGradeCode"
												name="gradeList[${j}].memberGradeCode"
												value="${cafeGrade.memberGradeCode }" />



											<select class="auto" name="gradeList[${j}].autoUpgradeFlag">
												<option value="1"
													${cafeGrade.autoUpgradeFlag== "1" ? "selected" : "" }>자동등업승인</option>
												<option value="0"
													${cafeGrade.autoUpgradeFlag== "0" ? "selected" : "" }>자동등업거부</option>
											</select>
					&nbsp;&nbsp;
					&nbsp;&nbsp;
					
					 <input type="radio" name="gradeList[${j}].gradeFlag" value="1"
												<c:if test="${cafeGrade.gradeFlag eq true}">checked</c:if> />사용
													&nbsp;&nbsp;
		     		 <input type="radio" name="gradeList[${j}].gradeFlag" value="0"
												<c:if test="${cafeGrade.gradeFlag eq false}">checked</c:if> />사용안함
		     		 


					<br />
											<br />
											<hr/>
											<br />
										</c:if>
										<c:set var="j" value="${ j+1 }" />
									</c:forEach>
								</form>
							</div>

							<br /> <br /> <br />
							<div align="center">
								<button type="button" name="button" id="save"
									class="btn mb-1 btn-outline-warning">저장</button>
							</div>
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

	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>

	<script type="text/javascript">
		$(function() {

			//alert($(".cafeNo").val())
			$("#save").on(
					"click",
					function() {//update
						//alert($(".gradeFlag1").text())
						$("form").attr("method", "POST").attr(
								"action",
								"/cafe/" + '${cafeURL}'
										+ "/manage/updateCafeGrade?CafeNo="
										+ $(".cafeNo").val()).submit();
					});

		});
	</script>
	<script src="/js/custom/cafeCommon.js"></script>

</body>
</html>
</body>
</html>