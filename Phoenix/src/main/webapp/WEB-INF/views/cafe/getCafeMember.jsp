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
	
	$("#addCafe").on("click" , function() {
		$(self.location).attr("href","/cafe/addCafeView");
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
      <th scope="col">정지여부</th>
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


</div>
</body>
</html>