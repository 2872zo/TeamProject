<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	
	<header>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="/js/cafeCommon.js"></script>
		
		<style>
			.postTitle{
				text-decoration: underline;
			}
			.postTitle:hover{
				color: blue;
			}
		</style>
		
		<script>
			var cafeURL = '${search.cafeURL}';
			var boardNo = ${search.boardNo};
			
			function fncGetPostList(idx){
				$("[name=currentPage]").val(idx);
				$("#boardPage").attr("method","POST").attr("action", "/cafe/" + cafeURL + "/getBoard/" + boardNo).submit();
			};

			$(function(){
				$("[name=currentPage]").val(${search.currentPage });	
			});

			//게시글 조회
			$(function(){
				$(".postTitle").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getPost/" + 	$(this).parent().find(".postNo").val();				
				});			
			});

			//게시글 작성
			$(function(){
				$("[name=addPostButton]").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/addPost?boardNo=" + "${search.boardNo}";
				});
			});

			//체크박스 이벤트
			$(function(){
				$("[name=deletePostButton]").on("click", function(){
					countCheck = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked");
					
					var postNoList = "";
					if(countCheck.length < 1){
						alert("삭제할 게시글을 선택하십시오.");
						return;
					}else{
						for(var i = 0; i < countCheck.length; i++){
							if(postNoList == ""){
								postNoList = countCheck.eq(i).parent().parent().find(".postNo").val();
							}else{
								postNoList = postNoList + "," + countCheck.eq(i).parent().parent().find(".postNo").val();
							}
						}

						var tmpForm = document.createElement("form");
						tmpForm.setAttribute("charset", "UTF-8");
						tmpForm.setAttribute("method", "Post");
						tmpForm.setAttribute("action", "/cafe/" + cafeURL + "/deletePostList");

						var tmpInputBoardNo = document.createElement("input");
						tmpInputBoardNo.setAttribute("type", "hidden");
						tmpInputBoardNo.setAttribute("name", "boardNo");
						tmpInputBoardNo.setAttribute("value", boardNo);
						tmpForm.appendChild(tmpInputBoardNo);

						tmpInputPostNoList = document.createElement("input");
						tmpInputPostNoList.setAttribute("type", "hidden");
						tmpInputPostNoList.setAttribute("name", "postNoList");
						tmpInputPostNoList.setAttribute("value", postNoList);
						tmpForm.appendChild(tmpInputPostNoList);

						document.body.appendChild(tmpForm);
						
						tmpForm.submit();
					}
				});	
			});
			

			function countCheckBox(){
				countCheck = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked").length;
				
				if(countCheck == $(":checkbox").not(":checkbox:first").length){
					$(":checkbox:first").prop("checked",true);
				}else{
					$(":checkbox:first").prop("checked",false);
				}
			}
			
			function checkAll(obj){
				$(":checkbox").prop("checked",true);
			}
			
			function unCheckAll(obj){
				$(":checkbox").prop("checked",false);
			}

			$(function(){
				var countCheck;
				
				$(":checkbox:first").on("click",function(){
					if($(":checkbox:first").is(":checked")){
						checkAll($(this));
					}else{
						unCheckAll($(this));
					}
				})
				
				$(":checkbox").on("click",function(){
					countCheckBox();
				});
			});
			
		</script>
		<title>${search.cafeURL}</title>
	</header>
	
	<body>
		<div class="container">
			<form id="boardPage">
				<input type="hidden" name="currentPage">
			</form>
			<h1>listCafePostByBoard</h1>
			
			<div class="row">
				<div class="col-2">
					<c:import url="/WEB-INF/views/cafe/menubarCafe.jsp"></c:import>
				</div>
				
				<div class="col-10">
					<div id="mainContent">
					
					<style>
						.postTitle{
							text-decoration: underline;
						}
						.postTitle:hover{
							color: blue;
						}
					</style>
					
					<p>총 ${postTotalCount }개</p>
						<table class="table table-striped table-bordered">
							<tr>
								<td><input type="checkbox"></td>
				<!-- 				<td>게시글 번호</td> -->
				<!-- 				<td>게시판 번호</td> -->
				<!-- 				<td>memberNo</td> -->
								<td>게시판</td>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>조회수</td>
								<td>추천수</td>
				<!-- 				<td>postStatusFlag</td> -->
				<!-- 				<td>postNoticeFlag;</td> -->
				<!-- 				<td>noticeIndex</td> -->
							</tr>
							
							<c:forEach items="${postList }" var="post">
								<tr>
									<input type="hidden" class="postNo" value="${post.postNo }"/>
									<input type="hidden" class="boardNo" value="${post.boardNo }"/>
									<input type="hidden" class="memberNo" value="${post.memberNo }"/>
									<td><input type="checkbox"></td>
									<td class="boardName">${post.boardName }</td>
									<td class="postTitle">${post.postTitle }</td>
									<td>${post.memberNickname }</td>
									<td>${post.regDate }</td>
									<td>${post.viewCount }</td>
									<td>${post.likeCount }</td>
				<%-- 					<td>${post.postStatusFlag }</td> --%>
				<%-- 					<td>${post.postNoticeFlag }</td> --%>
				<%-- 					<td>${post.noticeIndex }</td> --%>
								</tr>
							</c:forEach>
						</table>
						
						<table>
							<tr>
								<td align="center">
									<c:import url="/WEB-INF/views/common/pageNavigator.jsp">
										<c:param name="subject" value="Post"/>
									</c:import>
								</td>
								<td>
									<input type="button" name="addPostButton" value="글쓰기">
								</td>
								<td>
									<input type="button" name="movePostButton" value="이동">
								</td>
								<td>
									<input type="button" name="deletePostButton" value="삭제">
								</td>
							</tr>
						</table>
						
					</div><!-- Main Content End -->
				</div><!-- col-10 End -->
				
			</div><!-- row End -->
			
		</div>
	</body>

</html>