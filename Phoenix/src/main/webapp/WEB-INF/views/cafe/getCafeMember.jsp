<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

		<div class="content-body" style="min-height: 743px;">
		
		<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">카페관리</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">멤버상세조회</a></li>
					</ol>
				</div>
			</div>
			
<div class='container-fluid'>

<div class="card d-flex justify-content-center" style='width:50%;'>
<div class="card-body">
<div class='row'>
	<div class='col-lg-2'>
		<img src="/images/common/700by700.png"
		     class="rounded"
		     style="background: url('/images/uploadfiles/profileimg/${member.profileImg}'); 
		     background-size: cover; 
		     background-repeat: no-repeat; 
		     background-position: center;
		     width:100%; 
		     margin: 1%;
		     padding:0%;">
	</div>
	
	<div class='col-lg-6'>
	
		<h5 class="card-title">
		${member.memberNickname}
		</h5>	
		<p class="card-text">
		가입일 : ${member.regDate}
		</p>
		<p class="card-text">
		
		<c:if test='${member.memberStatusCode=="cs100"}'>
		<button type="button" class='btn btn-success' 
		style='color:white;' disabled >활동</button>
		</c:if>
		
	    <c:if test='${member.memberStatusCode=="cs101"}'>
	    <button type="button" class='btn btn-danger' 
	    style='color:white;' disabled >정지</button>
	    </c:if>
	    
	    <c:if test='${member.memberStatusCode=="cs102"}'>
	    <button type="button" class='btn btn-secondary' 
	    style='color:white;' disabled >탈퇴</button>
	    </c:if>
		
		<c:if test="${member.memberGrade =='cg100'}">
		<button type="button" class='btn btn-success' 
		style='color:white;' disabled>${member.gradeName}
		</button>
		</c:if>
		
		<c:if test="${member.memberGrade =='cg101'}">
		<button type="button" class='btn btn-info' 
		style='color:white;' disabled>${member.gradeName}
		</button>
		</c:if>
		
		<c:if test="${member.memberGrade !='cg100' && member.memberGrade !='cg101'}">
		<button type="button" class='btn btn-primary' 
		style='color:white;' disabled>${member.gradeName}
		</button>
		</c:if>
    
	    </p>
		
	</div>

	

	<div class='col-lg-4 '>
	방문수 : ${member.visitCount} 회
	<br/>
	작성글 : ${member.postCount} 개
	<br/>
	댓글수 : ${member.replyCount} 개
	</div>
			
		</div>
	</div>
</div>

<c:if test='${member.memberGrade != "cg100" && member.memberStatusCode=="cs100"}'>
<div class='card'>
<div class='card-body'>
<div class="alert alert-primary" role="alert">
  <h4 class="alert-heading">멤버등급변경</h4>
  <p>해당 카페 멤버가 클릭한 등급으로 변경됩니다.</p>
  <div class='d-flex justify-content-center'>
<c:forEach var='cafeGrade' items='${cafeGrades}'>
<c:if test="${cafeGrade.memberGradeCode !='cg100'}">
<button type="button" class='changeMemberGrade btn btn-${ cafeGrade.memberGradeCode==member.memberGrade ? "" : "outline-" }${ cafeGrade.memberGradeCode=="cg101" ? "info" : "primary" }' value='${cafeGrade.cafeGradeNo}'>
${cafeGrade.gradeName}
</button>&nbsp;
</c:if>
</c:forEach>
</div>
 </div>




<form id='memberGradeForm'>
<input type='hidden' name='cafeNo' value='${member.cafeNo}'>
<input type='hidden' name='memberNo' value='${member.memberNo}'>
<input type='hidden' name='cafeMemberGradeNo' id='cafeMemberGradeNo' value='0'>
</form>
</div>
</div>
</c:if>

<br/>


<div class='card'>
<div class='card-body'>
<c:if test="${empty blocks}" >
<br/>
<div class='d-flex justify-content-center'>
<i class="mdi mdi-broom" style='font-style: normal;font-size: 25pt;'>
정지 내역이 없습니다.</i>
</div>
<br/>
</c:if>
<c:if test="${!empty blocks}">
<table class="table table-borderless">
	<thead>
    <tr>
  	  <th scope="col">정지시작일</th>
      <th scope="col">정지종료일</th>
      <th scope="col">정지기간</th>
      <th scope="col">상세내역</th>
    </tr>
	</thead>
	<tbody>
	<c:set var="i" value="0" />
  <c:forEach var="block" items="${blocks}">
  <c:set var="i" value="${ i+1 }" />
  <input type ='hidden' class='blockNo' value='${block.blockNo}'>
  <tr>
  	<td>${block.blockStartDate}</td>
	<td>${block.blockEndDate}</td>
	<td>${block.period} 일</td>
	<td id='blockReason${i}'>${block.blockReason}</td>
  </tr>
  <tr id='${block.blockNo}'>
  </tr>
  </c:forEach>
	</tbody>
</table>
</c:if>
		
<br/>

<c:if test='${member.memberStatusCode=="cs100" && member.memberGrade != "cg100"}'>
<div class="alert alert-danger">
  <h4 class="alert-heading">멤버정지메뉴</h4>
  <p>
  정지시킬 기간을 선택한 뒤 정지사유(500자 이하)를 입력, 정지버튼을 클릭할 경우 멤버가 기간만큼 정지됩니다.
 </p>
  <hr>
  <p class="mb-0">필요한 경우 기간이 되기 전에 정지상태를 해제할 수 있습니다.</p>
 <p>
<form id='memberBlockForm'>

	<input type='hidden' name='cafeNo' value='${member.cafeNo}' >
	<input type='hidden' value='${member.memberNo}' name='memberNo'>

	<div class="input-group mb-3 d-flex justify-content-center">
		<div class="input-group-prepend">
		   <select class="form-control valid" name='blockPeriod'>
		    <option value="1" selected>01일</option>
		    <option value="3" >03일</option>
		    <option value="5" >05일</option>
		    <option value="7" >07일</option>
		    <option value="15" >15일</option>
		    <option value="30" >30일</option>
		    <option value="365250" >약 천년</option>	    
		   </select>
		</div>
		<div class="input-group-append" style='width:80%;'>
			<input type="text" class="form-control" 
			placeholder="정지사유를 (500자 이하)입력해주세요" 
			name='blockReason' id="blockReason">
		</div>
		<div class="input-group-append">
			<button class="btn btn-outline-danger" type="button" id="blocking">정지</button>
		</div>
	</div>
</form>
</p> 
</div>


</c:if>


<c:if test='${member.memberStatusCode=="cs101"}'>
<div class="alert alert-success">
  <h4 class="alert-heading">멤버정지해제</h4>
  <p>
  멤버가 현재 정지상태인 경우에만 나타나는 메뉴입니다.
 가장 최근에 적용되었던 정지기록의 정지사유에 입력하신 해제사유가 적용됩니다.
 </p>
  <p class="mb-0">정지해제버튼을 누르는 즉시 멤버의 정지상태가 해제됩니다.</p>
  <hr>
  <form id='memberBlockupdateForm'>
<input type='hidden' name='cafeNo' value='${member.cafeNo}' >
<input type='hidden' name='memberNo' value='${member.memberNo}' >
<input type='hidden' name='blockNo' value='0' id='blockNo'>
<div class="input-group mb-3">
  <input type="text" class="form-control" name='blockReason' id='unBlockReason' aria-label="Recipient's username">
  <div class="input-group-append">
    <button class="btn btn-outline-success" type="button" id="updateBlock">정지해제</button>
  </div>
</div>
</form>
</div>

</c:if>
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
    
    <!-- 스위트얼럿 -->
    <script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.init.js"></script>
    <!-- 스위트얼럿 -->
    
    <!-- 메뉴바 이용을 위한 스크립트 -->
    
	<script src="/js/custom/scroll-top.js"></script>
    <script src="/js/custom/menubarCafe.js"></script>
  	<script src="/js/custom/cafeCommon.js"></script>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {

	$("#unBlockReason").keydown(function (key) {
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	event.preventDefault();
            $("#updateBlock").click();
        }
    });

	$("#blockReason").keydown(function (key) {
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	event.preventDefault();
            $("#blocking").click();
        }
    });
	
	
	$("#unBlockReason").attr("placeholder", "기존 정지사유 : "+$("#blockReason1").text());

	$("#updateBlock").on("click" , function() {
		if($("#unBlockReason").val()==""){
			swal("잠깐 !", "빈칸은 입력할 수 없어요", "warning");
			return false
			}
		$("#blockNo").val($($(".blockNo")[0]).val());
		$("#memberBlockupdateForm").attr("method" , "POST").attr("action" , "/cafe/"+"${cafeURL}"+"/manage/updateCafeMemberBlock").submit();
	});
	
	$("#blocking").on("click" , function() {
		if($("#blockReason").val()==""){
			//alert("");
			swal("잠깐 !", "빈칸은 입력할 수 없어요", "warning");
						return false
						}
		$("#memberBlockForm").attr("method" , "POST").attr("action" , "/cafe/"+"${cafeURL}"+"/manage/addMemberBlock").submit();
	});
	
	$(".changeMemberGrade").on("click" , function() {

		$("#cafeMemberGradeNo").val($(this).val());
		
		swal({
		  title: "등급 변경할까요?",
		  text: "확인하시면 등급이 변경됩니다.",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "확인",
		  cancelButtonText: "취소",
		  closeOnConfirm: false
		},
		function(){
			$("#memberGradeForm").attr("method" , "POST").attr("action" , "/cafe/"+"${cafeURL}"+"/manage/updateCafeMemberGrade").submit();	
		});
				
	});
	
});
</script>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->



</body>
</html>