<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	
	<link rel="stylesheet" href="/css/scroll-top.css">
	<script src="/js/scroll-top.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$(".myDetail").hide();
			$(".showMyDetail").on("click",function(){
				if(${cafeMember.userNo}=='400')//1. 로그인이 안되어있으면
				{
					alert("로그인하세요! (로그인창 띄우기)");
				}
				else if(${cafeMember.userNo}=='500')//카페멤버가 아니면
				{
					alert("카페에 가입하세요!(카페에가입하시겠습니까?띄우기)");
				}
				else //카페멤버라면
				{
					$(".myDetail").show(); 
				}
			});

			$("[name=InnerSearch]").attr("method", "GET").attr("action", "/cafe/${cafeURL}/search");
			
			$("[name=menubarSubmit]").on("click", function(){
				location.href = "/cafe/" + "${cafeURL}" + "/search?searchKeyword=" + $("#menubarSearch").val(); 
			});
			
		});

		
	</script>

	<div id="cafeMenubar">
		<div class="showMyDetail">
			내정보 보기
		</div>
		
		<div class ="myDetail">
		
			<br/>가입 : ${cafeMember.regDate}
			<br/><strong>닉네임 : ${cafeMember.memberNickname}</strong>
			<br/>등급 : ${cafeMember.gradeName}
			<br/>출석 : ${cafeMember.visitCount}
			<br/>
			<h5><a href='#'>내가 쓴 글 보기</a></h5>
			<h5><a href='#'>내가 쓴 댓글 보기</a></h5>
			
		</div>

		<div>
			<form name="InnerSearch">
				<div class="input-group">
					<input type="text" class="form-control" id="menubarSearch" name="searchKeyword">
					<div class="input-group-append">
						<input type="button" class="btn btn-secondary" name="menubarSubmit"	style="z-index: 0" value="검색">
					</div>
				</div>
			</form>
		</div>




	<c:forEach var="board" items="${boardList}">
			<br/>
			
			<c:if test="${board.boardType eq 'cb102'}"> <!-- 구분선이면 -->
				${board.boardName}
			</c:if>
			
			<c:if test="${board.boardType ne 'cb102'}"> <!-- 구분선이면 -->
				<a href="javascript:fncGetBoardPostList('${board.boardNo}','no1cafe');">${board.boardName}</a>
			</c:if>
			
			<br/>
		</c:forEach>
	</div>

	<div class="scroll-top-wrapper ">
			  <span class="scroll-top-inner">
			    <i class="fa fa-2x fa-arrow-circle-up"></i>
			  </span>
	</div>