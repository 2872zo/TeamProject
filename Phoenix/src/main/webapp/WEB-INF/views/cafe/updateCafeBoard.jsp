<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<script type="text/javascript">


		$(function() {

			$("#plusBoard").on("click", function(){ //게시판추가
				
				alert($("select[name=addableBoard]").val());
				var appendBoard = "<option value='"+$("select[name=addableBoard]").val()+"'>"+$("select[name=addableBoard]").val()+"</option>"
				$("select[name=board]").append(appendBoard);
				
			});

			$("#delete").on("click", function(){
				//1.선택된 게시판을 가져옴  2.ajax로 게시판있는지 체크
				if( typeof $("select[name=board] option:selected").val() != "undefined")//삭제할 게시판이 선택되었으면
				{
					alert($("select[name=board] option:selected").attr("id")); //board_no
					var boardNo = $("select[name=board] option:selected").attr("id");
					//ajax로 게시판에 물려있는 게시물이 있는지 체크
					//board_no,cafe_URL을 보내서 board_no를 가지고있는 post가 있는지 post table에서 검사 
					$.ajax({

						url : "/cafe/json/cafe01/checkCafePost",
						method : "POST",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json ; charset=UTF-8"
						},
						data : JSON.stringify({ //보내는 data jsonString 화

							boardNo : boardNo
						}),
						dataType : "text",
						success : function(serverData){

							alert("serverData : "+serverData);
						}

					});//ajax끝
				}
				
				var deleteBoard = $("select[name=board] option:selected").remove();
				//alert(this.html());

				
			});

		});
	
	</script>

</head>


<body>
	
	메뉴관리
	<button type="button" id ="cancel"> 취소 </button>
	<button type="button" id ="save"> 저장하기</button>
	<br/>
	<br/>
	<br/>
	
	추가메뉴

	<select name="addableBoard" size="2">
		<option value="자유게시판">자유게시판</option>
		<option value="구분선">구분선</option>
	</select>
	
	<button type="button" id ="plusBoard"> +게시판추가 </button>
	<br/>
	<br/>
	<button type="button" id ="goDown"> 아래로</button>
	<button type="button" id ="goUp"> 위로</button>
	<button type="button" id ="goStart"> 맨위로 </button>
	<button type="button" id ="goEnd"> 맨아래로 </button>
	<button type="button" id ="delete"> 삭제 </button>
	
	
	<!--  게시판 리스트 불러오기 -->
		
		
		<br/>
		<br/>
		
		<select name="board" size="${fn:length(boardList)} ">
    		
    		<c:set var="i" value="0" />  
			<c:forEach var="board" items="${boardList}">
				<c:set var="i" value="${ i+1 }" />
			
			<option value="${board.boardName}" id="${board.boardNo}">${board.boardName}</option>
			
			</c:forEach>
    		
    		
   			
		</select>
		
		
		<br/>
		<br/>
		메뉴명  <input type="text" id="boardName" name="boardName" value="${boardList[0].boardName}"/>
		<br/>
		메뉴설명 <input type="text" id="boardDetail" name="boardDetail" width ="50" value="${boardList[0].boardDetail}">
		<br/>
		<br/>
		
		게시판 공개여부를 설정합니다. 멤버공개를 선택시, 게시판은 멤버에게만 보여집니다.
		<br/>
		<br/>
		등급설정
		<select name="accessGrade">
    		<option value="">직업선택</option>
   			 <option value="학생">학생</option>
    		<option value="회사원">회사원</option>
    		<option value="기타">기타</option>
		</select>
			
	

</body>
</html>