<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<header>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"	crossorigin="anonymous"></script>
	
		
	<script>
		$(function() {
			$("[name=cafeURL]").val('${search.cafeURL}');
			$("[name=memberNo]").val('10000');
			$("[name=memberNickname]").val('매니저1');
			$("form").attr("method", "POST").attr("action",	"addPost");

			$("#submitButton").on("click",function(e){
				$("[name=boardName]").val( $("[name=boardNo] option:selected").text());
			});

			fncGetList(1);
			
			$("[name=update]").on("click",function(){
// 				location.href = "/cafe/${post.cafeURL}/updatePost/${post.postNo}";
				updatePost();
			});

			$("[name=delete]").on("click",function(){
				location.href = "/cafe/${post.cafeURL}/deletePost?postNo=${post.postNo}&boardNo=${post.boardNo}";
			});

			
		});

		function fncGetList(currentPage){
			$("div .replyItems").load("/cafe/${post.cafeURL}/getReplyList/${post.postNo}", {currentPage:currentPage});
		}


		

		function updatePost(){
			var getPost = $("#test").html();
			

			
			$("#test").load("/cafe/${post.cafeURL}/updatePost/${post.postNo} #mainContent", function(response, status, xhr){
				alert("response : " + response);

				var obj = response.trim();
				history.replaceState(getPost, "getPost", "/cafe/${post.cafeURL}/getPost/${post.postNo}");
				history.pushState(obj,"updatePost","/cafe/${post.cafeURL}/updatePost/${post.postNo}");
			});

			window.CKEDITOR_BASEPATH = "/static/ckeditor/";
			$.getScript("/static/ckeditor/ckeditor.js", function(data, status, xhr){
				$.getScript("/static/js/form-validation.js");
				$.getScript("/static/js/updatePost.js");
			});
			
		}

		$(window).on('popstate', function(event) {
			console.log(event.originalEvent.state);
			$("#test").html( event.originalEvent.state);
		});
	</script>


	<title>${post.cafeURL}</title>
</header>

<body>
	<div class="container content">
		<div class="row">
			<div class="col-2">
				<c:import url="/WEB-INF/views/cafe/menubarCafe.jsp"></c:import>
			</div>
			
			<div class="col-10" id="test">
				<div class="py-5 text-center">
					<!-- <img class="d-block mx-auto mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
					카페 아이콘 넣을것
					<h1>게시글 조회</h1>
				</div>
				
				<input type="hidden" name="cafeURL"> <input type="hidden"name="memberNo"> 
				<input type="hidden" name="memberNickname">
				<input type="hidden" name="boardName">
						
				<div class="row">
					<div class="col-md-8 mb-3">
						게시판 번호 : ${post.boardNo }<br />
						게시판 : ${post.boardName }<br /> 
						작성자 멤버 번호 : ${post.memberNo }<br /> 
						작성자 : ${post.memberNickname }<br />
						추천수 : ${post.likeCount }<br /> 
						조회수 : ${post.viewCount }<br /> 
						작성일 : ${post.regDate }<br />
					</div>
				</div>
		
				제목 : ${post.postTitle } <br /> 
				내용 : ${post.postContent } <br />
				
				<button name="update" class="btn btn-primary btn-lg btn-block">수정</button>
				<button name="delete" class="btn btn-primary btn-lg btn-block">삭제</button>
				<hr/>				
				<div class="replyItems"></div>
			</div>
		</div><!-- row End -->
	</div><!-- container End -->
</body>
</html>