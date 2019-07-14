<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>CafeTabMain</title>

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
 
<script type="text/javascript">
$(function() {
	$("#blocking").on("click" , function() {
		//alert("11");
		$("#memberBlockForm").attr("method" , "POST").attr("action" , "/cafe/randomCafe/manage/addMemberBlock").submit();
	});
	$(".blockNo").on("click" , function() {
		alert($(this).text());
		$("#"+$(this).text()).html(3333);
		//$("#memberBlockForm").attr("method" , "POST").attr("action" , "/cafe/randomCafe/manage/addMemberBlock").submit();
	});
	$(".changeMemberGrade").on("click" , function() {
		//alert($(this).val());
		$("#cafeMemberGradeNo").val($(this).val());
		$("#memberGradeForm").attr("method" , "POST").attr("action" , "/cafe/randomCafe/manage/updateCafeMemberGrade").submit();	
	});
	
});
</script>

<title>카페 멤버 상세조회</title>

</head>
<body>
<div class='container'>
<br/>
카페멤버정보상세조회창임
<br/>

<table class="table table-borderless">
	<thead>
    <tr>
  	  <th scope="col">멤버번호</th>
      <th scope="col">카페번호</th>
      <th scope="col">닉네임</th>
      <th scope="col">등급코드</th>
      <th scope="col">등급명</th>
      <th scope="col">방문횟수</th>
      <th scope="col">멤버상태</th>
    </tr>
	</thead>
	<tbody>
  <tr>
  	<th scope="row">${member.memberNo}</th>
	<td>${member.cafeNo}</td>
	<td>${member.memberNickname}</td>
	<td>${member.memberGrade}</td>
	<td>${member.gradeName}</td>
	<td>${member.visitCount}</td>
	<td>${member.memberStatusCode}</td>
  </tr>
	</tbody>
</table>
<c:if test='${member.memberGrade != "cg100"}'>
<div class='d-flex justify-content-center'>
등급 변경하기&nbsp;:&nbsp; 
<c:forEach var='cafeGrade' items='${cafeGrades}'>
<c:if test='${cafeGrade.memberGradeCode != "cg100"}'>
<button type="button" class='changeMemberGrade btn btn-${ cafeGrade.memberGradeCode==member.memberGrade ? "" : "outline-" }${ cafeGrade.memberGradeCode=="cg101" ? "info" : "primary" }' value='${cafeGrade.cafeGradeNo}'>
${cafeGrade.memberGradeCode}/${cafeGrade.gradeName}
</button>&nbsp;
</c:if>
</c:forEach>
</div>

<form id='memberGradeForm'>
<input type='hidden' name='cafeNo' value='${member.cafeNo}'>
<input type='hidden' name='memberNo' value='${member.memberNo}'>
<input type='hidden' name='cafeMemberGradeNo' id='cafeMemberGradeNo' value='0'>
</form>

</c:if>

<br/>
<c:if test="${empty blocks}" >
<br/>
정지당한 내역이 없습니다.
<br/>
</c:if>
<c:if test="${!empty blocks}">
<table class="table table-borderless">
	<thead>
    <tr>
  	  <th scope="col">정지번호</th>
  	  <th scope="col">정지시작일</th>
      <th scope="col">정지종료일</th>
      <th scope="col">정지사유</th>
    </tr>
	</thead>
	<tbody>
  <c:forEach var="block" items="${blocks}">
  <tr>
  	<th scope="row" class='blockNo'>${block.blockNo}</th>
  	<td>${block.blockStartDate}</td>
	<td>${block.blockEndDate}</td>
	<td>${block.blockReason}</td>
  </tr>
  <tr id='${block.blockNo}'>
  </tr>
  </c:forEach>
	</tbody>
</table>
</c:if>
		
<br/>

<form id='memberBlockForm'>
<input type='hidden' value='${member.memberNo}' name='memberNo'>
<div class="input-group mb-3">
	  <div class="input-group-prepend">   
	  <button type="button" class="btn btn-outline-danger" id='memberBlock'>멤버정지</button>
	  </div>
	  <div class="input-group-append">
	   <select class="custom-select custom-select-lg" aria-label="Example select with button addon" name='blockPeriod'>
	    <option value="1" selected>01일</option>
	    <option value="3" >03일</option>
	    <option value="5" >05일</option>
	    <option value="7" >07일</option>
	    <option value="15" >15일</option>
	    <option value="30" >30일</option>
	    <option value="365000" >천년</option>	    
	   </select>
	    </div>
	    	    
	  <input type="text" class="form-control form-control-lg" placeholder="정지사유를 (500자 이하)입력해주세요" aria-label="Text input with dropdown button" aria-describedby="button-addon2" name='blockReason' id="blockReason">
	 <div class="input-group-append">
	    <button class="btn btn-outline-secondary" type="button" id="blocking">정지</button>
	 </div>
	</div>
</form>


<form id='memberBlockupdateForm'>
<input type='hidden' value='${member.memberNo}' name='memberNo'>
<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="해제 사유를 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
  <div class="input-group-append">
    <button class="btn btn-outline-success" type="button" id="button-addon2">정지해제</button>
  </div>
</div>
</form>


</div>
</body>
</html>