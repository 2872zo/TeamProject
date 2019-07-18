<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



	
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

		$(function(){//카페탈퇴

			$(".deleteMember").on("click",function(){
				$( "#dialog" ).dialog("open");
				});
			var memberNo = '${cafeMember.memberNo}'
			$( "#dialog" ).dialog({ 
				 autoOpen: false, 
				  width: 400, 
				  modal: true, 
				  buttons: [ { 
					   text: "확인", 
					   click: function() { 
						   location.href = "/cafe/" + "${cafeURL}" + "/updateCafeMember?memberNo="+memberNo;
						  } 
				  }, 
				  { 
					   text: "취소", 
					    click: function() { 
						   $( this ).dialog( "close" ); 
						   } 
				   } 
				   ] 
			   });
		});
		
		$(function(){//프로필수정
			var memberNo = '${cafeMember.memberNo}'
			$(".updateProfile").on("click",function(){
				alert("여기")
				window.open("/cafe/" + "${cafeURL}"+ "/updateCafeMemberProfileView?memberNo="+memberNo,"_blank","width=600,height=700")
			
				});
			
			});

		$(function(){//카페가입
			$(".addMember").on("click", function(){
				 location.href = "/cafe/" + "${cafeURL}" + "addCafeApplicationView";
			});
			
		});
		
	</script>

	<div id="cafeMenubar">
		<div class="showMyDetail">
			내정보 보기
		</div>
		
		<c:if test="${empty cafeMember}">
		<br/>
		<div class="addMember">
			카페가입
		</div>
		</c:if>
		<br/>
		<c:if test="${!empty cafeMember.memberNo}">
		<div class="updateProfile">
			프로필수정
		</div>
		</c:if>
		
		
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
				<input type="text" id="menubarSearch" name="searchKeyword"><input type="button" name="menubarSubmit" value="검색">
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
		<br/>
		<c:if test="${!empty cafeMember.memberNo}">
		<div class="deleteMember">
			카페탈퇴
		</div>
		</c:if>
		
		<div id="dialog" title="카페탈퇴">
  			<p>카페에서 탈퇴하시겠습니까?
  			카페 탈퇴시 작성된 게시글은 자동으로 삭제되지 않습니다.</p>
		</div>
		
	</div>
