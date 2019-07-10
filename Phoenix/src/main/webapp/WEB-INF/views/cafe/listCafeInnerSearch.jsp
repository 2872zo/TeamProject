<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<header>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script>
			var cafeURL = '${search.cafeURL}';
						
			function fncGetList(idx){
				$("[name=currentPage]").val(idx);
				$("form").attr("method","GET").attr("action","/cafe/" + cafeURL + "/search").submit();	
			};

			//datePicker 생성
			$(function(){
				$( "#termStart" ).datepicker({dateFormat:'yy-mm-dd'});
			    $( "#termEnd" ).datepicker({dateFormat:'yy-mm-dd'});
			});
			
			//검색조건 유지
			$(function(){
				$("[name=currentPage]").val(${search.currentPage });
				$( "#termStart" ).val('${search.termStart}');
			    $( "#termEnd" ).val('${search.termEnd}');	
				$("[name=searchKeyword]").val('${search.searchKeyword}');
				$(".boardOption").each(function(){
				    if($(this).val()==${search.boardNo}){
				      $(this).attr("selected","selected");
				    }
				});
				$(".searchOption").each(function(){
				    if($(this).val()==${search.searchCondition}){
				      $(this).attr("selected","selected");
				    }
				});
			});

			//검색 시작
			$(function(){
				$("#submitButton").on("click", function(){
					$("[name=currentPage]").val(1);
				});
			});
		</script>
		<title>${search.cafeURL}</title>
	</header>
	
	<body>
		<h1>listCafeInnerSearch</h1>
		
		<form class="form-group">
			<input type="hidden" name="currentPage"> 
			<input type="text" id="termStart" name="termStart" readonly="readonly">
			<input type="text" id="termEnd" name="termEnd" readonly="readonly">
			<select class="form-control hideOption" name="boardNo">
				<option value="0" class="boardOption">전체</option>
				<c:forEach var="board" items="${boardList }">
					<option value="${board.boardNo }" class="boardOption">${board.boardName }</option>
				</c:forEach>
			</select> 
			<select class="form-control hideOption" name="searchCondition">
				<option value="0" class="searchOption">전체</option>
				<option value="1" class="searchOption">호칭</option>
				<option value="2" class="searchOption">제목</option>
				<option value="3" class="searchOption">내용</option>
				<option value="4" class="searchOption">댓글</option>
			</select> 
			
			<input type="text" name="searchKeyword"> 
			<input type="submit" id="submitButton" value="검색">
		</form>
	
		<p>총 ${postTotalCount }개</p>
		<table class="table table-striped table-bordered">
			<tr>
				<td>postNo</td>
				<td>boardNo</td>
				<td>memberNo</td>
				<td>postTitle</td>
				<td>postContent</td>
				<td>regDate</td>
				<td>viewCount</td>
				<td>likeCount</td>
				<td>memberNickname</td>
				<td>postStatusFlag</td>
				<td>postNoticeFlag;</td>
				<td>noticeIndex</td>
			</tr>
			
			<c:forEach items="${postList }" var="post">
				<tr>
					<td>${post.postNo}</td>
					<td>${post.boardNo }</td>
					<td>${post.memberNo }</td>
					<td>${post.postTitle }</td>
					<td>${post.postContent }</td>
					<td>${post.regDate }</td>
					<td>${post.viewCount }</td>
					<td>${post.likeCount }</td>
					<td>${post.memberNickname }</td>
					<td>${post.postStatusFlag }</td>
					<td>${post.postNoticeFlag }</td>
					<td>${post.noticeIndex }</td>				
				</tr>
			</c:forEach>
		</table>
		
		<table>
			<tr>
				<td align="center">
					<c:import url="/WEB-INF/views/common/pageNavigator.jsp"/>
				</td>
			</tr>
		</table>

	</body>
</html>