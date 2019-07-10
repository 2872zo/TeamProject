<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html lang="ko">

<head>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<script type="text/javascript">


		$(function() {

			$("select[name=board]").change(function(){ // listbox선택하면
					alert($(this).val()); //ok

				 //여기서 display none등 설정
			});

			$("#plusBoard").on("click", function(){ //게시판추가
				
				alert($("select[name=addableBoard]").val());
				var appendBoard = "<option value='"+$("select[name=addableBoard]").val()+"' id=''>"+$("select[name=addableBoard]").val()+"</option>"
				$("select[name=board]").append(appendBoard);

				//게시판 추가하면  밑에 input type text추가하고 
				
			});

			//밑에 게시글 수정하면 list box 값 바뀌어야하는데 

			$("#delete").on("click", function(){
				
				//1.선택된 게시판을 가져옴  2.ajax로 게시판있는지 체크
				if( typeof $("select[name=board] option:selected").val() != "undefined")//삭제할 게시판이 선택되었으면
				{
					//alert("_"+$("select[name=board] option:selected").attr("id")+"_");

					if($("select[name=board] option:selected").attr("id")!='')
					{
					
					alert($("select[name=board] option:selected").attr("id")); //board_no
					var boardNo = $("select[name=board] option:selected").attr("id");
					//ajax로 게시판에 물려있는 게시물이 있는지 체크
					//board_no,cafe_URL을 보내서 board_no를 가지고있는 post가 있는지 post table에서 검사 
					$.ajax({

						url : "/cafe/json/no1cafe/checkCafePost",
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

							//alert("serverData : "+serverData);

							var data = JSON.parse(serverData);
							if(data.isPost=="true"){

								alert("해당 게시판에 게시물이 존재합니다!");
							}
							else{
								
								var deleteBoard = $("select[name=board] option:selected").remove();
							}
							
						}//success


					});//ajax끝

					}//방금추가된 애가 아닐때.

					else //방금추가된애
					{
					   alert("삭제");	
					   $("select[name=board] option:selected").remove();
					}
							   

				}

				
			});//삭제버튼 onClick

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
		<option value="자유게시판" selected="selected">자유게시판</option>
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
		
		<select name="board" size=10>
    		
    		<c:set var="i" value="0" />  
			
			<c:forEach var="board" items="${boardList}">
				<c:set var="i" value="${ i+1 }" />
			
			
			<c:if test="${i eq 1}">
				<option  value="${board.boardName}" id="${board.boardNo}" selected="selected">${board.boardName}</option>
			</c:if>
			
			<c:if test="${i ne 1}">
				<option value="${board.boardName}" id="${board.boardNo}">${board.boardName}</option>
			</c:if>
			
			</c:forEach>
   			
		</select>
		
		
		<c:forEach var="board" items="${boardList}">
				<c:set var="i" value="${ i+1 }" />
		
			<br/>
			<br/>
			메뉴명  <input type="text" name="boardName" value="${board.boardName}" />
			<br />
			메뉴설명 <input type="text"  name="boardDetail" width="50" value="${board.boardDetail}">
			<br/>
			<br/>
		
			게시판 공개여부를 설정합니다. 멤버공개를 선택시, 게시판은 멤버에게만 보여집니다.
			<br/>
			<br/>
		
		
		</c:forEach>
	

</body>
</html>