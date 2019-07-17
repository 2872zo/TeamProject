<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>가입신청상세조회</title>



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
	var cafeURL = '${cafeApplication.cafeIcon}'
	$("a[href='#' ]").on("click", function(){
		self.location = "/cafe/"+cafeURL+"/manage/getCafeApplicationList"
		})
});

$(function() {
	var cafeURL = '${cafeApplication.cafeIcon}'
	$(".accept").on("click", function(){
		alert($("#applicationNo").text())
		var whether= "true"+$("#applicationNo").text();
		$("#boardName").val(whether);
		$("#whether").attr("method" , "POST").attr("action" , "/cafe/"+cafeURL+"/manage/updateCafeApplication").submit();	
	})

	$(".reject").on("click", function(){
		alert($("#applicationNo").text())
		var whether= "false"+$("#applicationNo").text();
		$("#boardName").val(whether);
		$("#whether").attr("method" , "POST").attr("action" , "/cafe/"+cafeURL+"/manage/updateCafeApplication").submit();	
	})
});
</script>

<title>카페가입신청상세조회</title>


</head>
<body>
<div class='container'>
<br/>
<h2>가입신청상세조회</h2>
<br/>
<button type="button" class="accept">가입승인</button>
<button type="button" class="reject">가입거절</button>

<form id = "whether"><input type="hidden" name ="boardName" id ="boardName" value="" /></form>

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>가입신청번호</strong>
			</div>
			<div class="col-xs-8 col-md-4" id = "applicationNo">${cafeApplication.applicationNo}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>회원번호</strong>
			</div>
			<div class="col-xs-8 col-md-4">${cafeApplication.userNo}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>카페번호</strong>
			</div>
			<div class="col-xs-8 col-md-4">${cafeApplication.cafeNo}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>가입신청일</strong>
			</div>
			<div class="col-xs-8 col-md-4">${cafeApplication.regDate}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>멤버닉네임</strong>
			</div>
			<div class="col-xs-8 col-md-4">${cafeApplication.memberNickname}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>질문</strong>
			</div>
			<div class="col-xs-8 col-md-4">${cafeApplication.question1}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>질문</strong>
			</div>
			<div class="col-xs-8 col-md-4">${cafeApplication.question2}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>질문</strong>
			</div>
			<div class="col-xs-8 col-md-4">${cafeApplication.question3}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>답변</strong>
			</div>
			<div class="col-xs-8 col-md-4">${cafeApplication.answer1}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>답변</strong>
			</div>
			<div class="col-xs-8 col-md-4">${cafeApplication.answer2}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>답변</strong>
			</div>
			<div class="col-xs-8 col-md-4">${cafeApplication.answer3}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>가입승인상태</strong>
			</div>
			<div class="col-xs-8 col-md-4">${cafeApplication.acceptStatusCode}</div>
		</div>

		<hr />
		
		<a class="btn btn-success btn" href="#" role="button">확 &nbsp;인</a>


</div>
</body>
</html>