<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

	

<html lang="ko">

<head>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"	crossorigin="anonymous"></script>
	<script src="/js/cafeCommon.js"></script>
	
	<style>
		#div_menu{
			width:20%;
			height:500px;
			float:left;
			background-color:#82FA58;
		}
		
		#div_con{
			width:80%;
		}
	
	</style>

	<script>
		var state = new Object();

		$(function(){
// 			state.cafeURL = "${cafeURL}"; 
// 			state.mainContent = $("#mainContent").html().trim();
// 			state.mainContent = "<script>fncGetCafeMain()</script" + ">";
// 			history.replaceState(state, state.cafeURL, "/cafe/" + state.cafeURL);
		});

		
// 		function fncGetBoardPostList(boardNo, cafeURL){
// 			location.href = "/cafe/" + cafeURL + "/getBoard/" + boardNo;
			
// 			$("#mainContent").remove();
// 			$("div.col-10").load("/cafe/" + cafeURL + "/getBoard/" + boardNo + " #mainContent", function(response, stauts, xhr){
// 				$.getScript("/js/listCafePostByBoard.js");
// 				history.replaceState(state, state.cafeURL, "/cafe/" + state.cafeURL);
				
// 				state.boardNo = boardNo;
// 				state.mainContent = response;

// 				history.pushState(state, cafeURL, "/cafe/" + state.cafeURL + "/getBoard/" + boardNo);
// 			});
// 		}

// 		$(window).on('popstate', function(event) {
// // 			console.log("popState : " + event.originalEvent.state);
// 			alert("popstate 실행")
// 			state = event.originalEvent.state;
// 			$(".cke_screen_reader_only").remove();
// 			$("#mainContent").remove();
// 			console.log(event.originalEvent.state.mainContent);
// 			$(".col-10").html( event.originalEvent.state.mainContent );
// 		});
	</script>

</head>


<body>
	<div class="container">
		<div class="row">
			<div class="col-2">
				<c:import url="/WEB-INF/views/cafe/menubarCafe.jsp"></c:import>
			</div>
			
			<div class="col-10">
				<div id="mainContent">
					공지게시글
					<table class="table table-striped table-bordered">
						<tr>
							<th>게시글 제목  </th>
							<th>작성자      </th>
							<th>등록일      </th>
							<th>조회수      </th>
						</tr>
						<c:forEach var="post" items="${noticePostList}" > <!-- 링크이어야함 -->
							<tr>
								<td>${post.postTitle}  </td>
								<td>${post.memberNickname}  </td>
								<td>${post.regDate}  </td>
								<td>${post.viewCount}  </td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div><!-- col-10, #mainContent End -->
		</div><!-- row End -->
	</div><!-- container End -->
</body>
</html>