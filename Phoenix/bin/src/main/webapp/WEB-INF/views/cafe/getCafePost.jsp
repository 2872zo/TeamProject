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
	<script src="https://kit.fontawesome.com/e589319d43.js"></script>
	<script src="/js/cafeCommon.js"></script>
	
		
	<script>
		$(function() {
			$("[name=cafeURL]").val('${search.cafeURL}');
			$("[name=memberNo]").val('10000');
			$("[name=memberNickname]").val('매니저1');
			$("form").attr("method", "POST").attr("action",	"addPost");

			$("#submitButton").on("click",function(e){
				$("[name=boardName]").val( $("[name=boardNo] option:selected").text());
			});

			fncGetReplyList(1);
			
			$("[name=update]").on("click",function(){
				location.href = "/cafe/${cafeURL}/updatePost/${search.postNo}";
			});

			$("[name=delete]").on("click",function(){
				location.href = "/cafe/${post.cafeURL}/deletePost?postNo=${post.postNo}&boardNo=${post.boardNo}";
			});

			
		});

		function fncGetReplyList(currentPage){
			$("div .replyItems").unbind();
			$("div .replyItems").load("/cafe/${post.cafeURL}/getReplyList/${post.postNo}", {currentPage:currentPage});
		}

		
		$(function(){
			$("#postLikeButton").on("click",function(){
				var JSONPostNo =  JSON.stringify({cafeURL : "${cafeURL}", postNo:${post.postNo}, userNo:10000, searchCondition : "0"});
				console.log(JSONPostNo); 

				$.ajax({
						type : "POST",
						contentType: "application/json",
						url : "/cafe/${cafeURL}/json/addLike",
						dataType : "JSON",
						data: JSONPostNo,
						success : function(data) {
// 							alert("success");
							
// 							debugger;
							if(data.result == false){
								alert("이미 추천한 게시글입니다.")
							}else{
								$("#postLikeButton").find(".count").text(data.likeCount);
							}
							
						},
						error : function(data) {
							alert("error : " + data)
// 							debugger;
						}
					});

				
				});

			$(document).on("click", ".replyLikeButton", function(){
				var JSONPostNo =  JSON.stringify({cafeURL : "${cafeURL}", replyNo:$(this).next().find("[name=replyNo]").val(), userNo:10000, searchCondition : "1"});
				console.log(JSONPostNo); 

				var count = $(this).find(".count");
// 				debugger;
				
				$.ajax({
						type : "POST",
						contentType: "application/json",
						url : "/cafe/${cafeURL}/json/addLike",
						dataType : "JSON",
						data: JSONPostNo,
						success : function(data) {
// 							alert("success");
							
// 							debugger;
							if(data.result == false){
								alert("이미 추천한 댓글입니다.")
							}else{
								count.text(data.likeCount);
							}
							
						},
						error : function(data) {
							alert("error : " + data);
// 							debugger;
						}
					});

				
				});
			});

		<%--
				function updatePost(){
					var getPost = $("#mainContent").html();

					$("#mainContent").load("/cafe/${post.cafeURL}/updatePost/${post.postNo} #mainContent", function(response, status, xhr){
		 				alert("response : " + response);
`
						var obj = response.trim();
						history.replaceState(getPost, "getPost", "/cafe/${post.cafeURL}/getPost/${post.postNo}");
						history.pushState(obj,"updatePost","/cafe/${post.cafeURL}/updatePost/${post.postNo}");
					});

					window.CKEDITOR_BASEPATH = "/ckeditor/";
					$.getScript("/ckeditor/ckeditor.js", function(data, status, xhr){
						$.getScript("/js/form-validation.js");
						$.getScript("/js/updatePost.js");
					});
				}

				$(window).on('popstate', function(event) {
					console.log(event.originalEvent.state);
					$("#mainContent").html( event.originalEvent.state);
				});
			--%>
		
	</script>


	<title>${post.cafeURL}</title>
</header>

<body>
	<div class="container content">
<!-- 		<div> -->
<%-- 			<c:import url="../common/cafeToolbar.jsp"/> --%>
<!-- 		</div> -->
		<div class="row">
			<div class="col-2">
				<c:import url="/WEB-INF/views/cafe/menubarCafe.jsp"></c:import>
			</div>
			
			<div class="col-10">
				<div id="mainContent">
				
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
			
					<h4 class="text-center">${post.postTitle } </h4><hr /> 
					<p class="text-center">${post.postContent } <br /><br/>
					<button id="postLikeButton"><span class="far fa-thumbs-up"></span>&nbsp;<span class="count">${post.likeCount }</span></button>
					<hr/>
					
					
					<button name="update" class="btn btn-primary btn-lg btn-block">수정</button>
					<button name="delete" class="btn btn-primary btn-lg btn-block">삭제</button>
					<hr/>				
					<div class="replyItems"></div>
					
				</div>
			</div>
		</div><!-- row End -->
	</div><!-- container End -->
	
</body>
</html>