<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html lang="ko">

<head>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<script type="text/javascript">

		var totalBoardSize ="";
		var appendBoardDetail="";
		var count =0;
		
		function AllSelect(){

			var obj = document.form.board;
			alert(obj.length);

			for(var i=0; i<obj.length; i++)
			{
				//alert("a");
				obj.options[i].selected = "selected";	
			}	

		}

		//----------------------------------------------------------------메서드
		
		$(function() {

			/*
			for(var i=0; i<$("input[id=totalBoardsize]").val(); i++) 
			{

				if(i!=0)
				{
					$(".boardDetail"+i).hide();
				}
				else
				{
					$(".boardDetail"+i).show();
				}
				
			}*/


			$("select[name=board]").change(function(){ // listbox선택하면
					alert($(this).val()); //ok
					alert($("input[id=totalBoardsize]").val());
				 //여기서 display none등 설정

					 
			});

			

			$("#plusBoard").on("click", function(){ //게시판추가
				
				alert($("select[name=addableBoard]").val());
				//기존 게시판리스트에 추가
				var appendBoard = "<option value='newBoard"+count+"' id=''>"+$("select[name=addableBoard]").val()+"</option>"
				$("select[name=board]").append(appendBoard);
				//보드사이즈증가
				$("input[id=totalBoardsize]").val($("input[id=totalBoardsize]").val()-0+1);
				totalBoardSize	= $("input[id=totalBoardsize]").val();
				alert(totalBoardSize);

				
				
				if($("select[name=addableBoard]").val()=="자유게시판"){
					//게시판 추가하면  밑에 input type text추가하고 
					 	appendBoardDetail = "<div class ='boardDetail"+totalBoardSize+"'> <br/><br/>"
						+"메뉴명  <input type='text' name='newBoardName"+count+"' /><br />"
						+"메뉴설명 <input type='text'  name='newBoardDetail"+count+"' width='50'>"
						+"<br/><br/>게시판 공개여부를 설정합니다. 멤버공개를 선택시, 게시판은 멤버에게만 보여집니다."
						+"<br/><br/></div>"
						//$(".boardDetail").hide();
				}
				else{
					 appendBoardDetail = "메뉴들을 구분선을 통해 쉽게 구분할 수 있습니다."
				}

				//alert("dkd")			
				$(".boardDetail").append(appendBoardDetail);
				//appendBoardDetail="";
				
				count++;
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



			$("#save").on("click",function(){


				AllSelect();
				$("form").attr("method","POST").attr("action","/cafe/no1cafe/manage/updateCafeBoard").submit();
				
			});

			$("#cancel").on("click",function(){
				
					alert("지금까지 편집한 내용을 취소합니다.");
					self.location = "/cafe/no1cafe/manage/updateCafeBoardView";
			});

		});

		
		
	
	</script>

</head>


<body>
	<form name="form">
	메뉴관리
	<button type="button" id ="cancel"> 취소 </button>
	<button type="button" id ="save"> 저장하기</button>
	<br/>
	<br/>
	<br/>
	
	추가메뉴

	<select name="addableBoard" size="2">
		<option value="자유게시판" selected="selected">자유게시판</option>
		<option value="------------" >------------</option>
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
		
		<select name="board" size=10 multiple>
    		
    		<c:set var="i" value="0" />  
			
			<c:forEach var="board" items="${boardList}">
				<c:set var="i" value="${ i+1 }" />
			
			
			<c:if test="${i eq 1}">
				<option  value="${board.boardName}/${board.boardNo}" id="${board.boardNo}" selected="selected">${board.boardName}</option>
			</c:if>
			
			<c:if test="${i ne 1}">
				<option value="${board.boardName}/${board.boardNo}" id="${board.boardNo}">${board.boardName}</option>
			</c:if>
			
			</c:forEach>
			
   			
		</select>
		<input type="hidden" id="totalBoardsize" value="${i}">
		
		
		<div class="boardDetail">
		<c:set var="j" value="0" />  
		<c:forEach var="board" items="${boardList}">
				<c:set var="j" value="${ j+1 }" />
		
			<div class ="boardDetail${j}">
				
				<c:if test="${fn:contains(board.boardName,'게시판')}">
					<br/><br/>
					메뉴명  <input type="text" name="boardName/${board.boardNo}" value="${board.boardName}" />
					<br />
					메뉴설명 <input type="text"  name="boardDetail/${board.boardNo}" width="50" value="${board.boardDetail}">
					<br/><br/>
			
					게시판 공개여부를 설정합니다. 멤버공개를 선택시, 게시판은 멤버에게만 보여집니다.
					<br/><br/>
				</c:if>
				
				<c:if test="${fn:contains(board.boardName,'------')}">
					메뉴들을 구분선을 통해 쉽게 구분할 수 있습니다.
				</c:if>
				
		
			</div>
		</c:forEach>
		
		</div>
		
	</form>
</body>
</html>