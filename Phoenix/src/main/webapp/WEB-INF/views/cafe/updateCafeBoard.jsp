<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html lang="ko">

<head>

	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// 	-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"	crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
	<script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.min.js"></script>

	<!-- 
	<link rel="stylesheet" href="/css/zeed/bootstrap.min.css">
	<link rel="stylesheet" href="/css/zeed/jquery-ui.css">
	<link rel="stylesheet" href="/css/zeed/font-awesome.min.css">
	<link rel="stylesheet" href="/css/zeed/owl.carousel.min.css">
	<link rel="stylesheet" href="/css/zeed/slicknav.min.css">
	<link rel="stylesheet" href="/css/zeed/magnificpopup.css">
	<link rel="stylesheet" href="/css/zeed/jquery.mb.YTPlayer.min.css">
	<link rel="stylesheet" href="/css/zeed/typography.css">
	<link rel="stylesheet" href="/css/zeed/style.css">
	<link rel="stylesheet" href="/css/zeed/responsive.css">
	
	<script src="/js/zeed/jquery-3.2.0.min.js"></script>
	<script src="/js/zeed/jquery-ui.js"></script>
	<script src="/js/zeed/bootstrap.min.js"></script>
	<script src="/js/zeed/jquery.slicknav.min.js"></script>
	<script src="/js/zeed/owl.carousel.min.js"></script>
	<script src="/js/zeed/magnific-popup.min.js"></script>
	<script src="/js/zeed/counterup.js"></script>
	<script src="/js/zeed/jquery.waypoints.min.js"></script>
	<script src="/js/zeed/jquery.mb.YTPlayer.min.js"></script>
	<script src="/js/zeed/theme.js"></script>-->
	
	
	<script type="text/javascript">

		var totalBoardSize ="";
		var appendBoardDetail="";
		var count =0;
		
		function AllSelect(){


			var obj = document.form.board;
			//alert(obj.length);	
			obj.setAttribute("multiple","multiple");
			
			for(var i=0; i<obj.length; i++)
			{
				//alert("a");
				obj.options[i].selected = "selected";	
			}	

		}

		//----------------------------------------------------------------메서드
		
		function hideAndShow(){

			var selectBoxValue = $("select[name=board] option:selected").val();

			for(var i=1; i<=$("input[id=totalBoardsize]").val(); i++) 
			{
				$(".boardDetail"+i).hide();
			}
			
			if(selectBoxValue.indexOf("newBoard")!= -1) //새로생긴애
			{
				$("input[name='"+selectBoxValue+"']").parent().show();
			}
			else //원래있던애
			{
				var findValue = selectBoxValue.split('/')[1];

				$("input[name='boardName/"+findValue+"']").parent().show();
			}
			
		}
		
		$(function() {

			hideAndShow();

			$("[name='form']").validate();
			
			//alert($("input[maxlength='6']"));
			
			$("select[name=board]").change(function(){ // listbox선택하면 focus두게
					//alert($(this).val()); //ok
					//alert($("input[id=totalBoardsize]").val());
					
					//alert("악");
					hideAndShow(); //여기서 display none등 설정
					
			});

			

			$("#plusBoard").on("click", function(){ //게시판추가
				
				//alert($("select[name=addableBoard]").val());
				//기존 게시판리스트에 추가
				//alert($("select[name=board] option:selected").parent().html().trim());  //attr("selected",false); //추가
				var appendBoard = "<option class='apple' value='newBoard"+count+"' id='' selected='selected' >"+$("select[name=addableBoard]").val()+"</option>"

				
				$("select[name=board] option:selected").removeAttr('selected');
				
				$("select[name=board]").append(appendBoard);
				//보드사이즈증가
				$("input[id=totalBoardsize]").val($("input[id=totalBoardsize]").val()-0+1);
				totalBoardSize	= $("input[id=totalBoardsize]").val();
				//alert(totalBoardSize);

				
				
				if($("select[name=addableBoard]").val()=="자유게시판"){
					//게시판 추가하면  밑에 input type text추가하고 
					 	appendBoardDetail = "<div class ='boardDetail"+totalBoardSize+"'> <br/><br/>"
						+"<h4>메뉴명</h4>   <input type='text' class='form-control' name='newBoard"+count+"'  placeholder='게시판이름' maxlength='6' required /><hr/> "
						+"<h4>메뉴설명</h4> <input type='text'  class='form-control' name='newBoardDetail"+count+"' width='50' placeholder='게시판설명' required >"
						+"<br/><hr/><h4>공개설정</h4>"
						+"<div class='radio'><label class='radio-inline'>"
  						+"<input type='radio' value='0' name='newBoardPrivate"+count+"' checked> 전체공개 </label>"
    					+"<label class='radio-inline'>"
   						+"<input type='radio' value='1' name='newBoardPrivate"+count+"'> 멤버공개 </label></div>"
						+"게시판 공개여부를 설정합니다.<br/>멤버공개를 선택시, 게시판은 멤버에게만 보여집니다."
						+"<br/><hr/>"
						+"<h4>접근권한설정</h4><div class='form-inline'><select class='form-control' name='grade'>"
						+"<c:forEach var='grade' items='${useGradeList}'>"
						+"<option value='${grade.cafeGradeNo}/new"+count+"'>${grade.gradeName}</option>"
						+"</c:forEach></select> 이상</div><br/><br/><br/>	"
						//$(".boardDetail").hide();
				}
				else{
					 appendBoardDetail = "<div class ='boardDetail"+totalBoardSize+"'> <br/><br/>"
					 					+"<input type='hidden' name='newBoard"+count+"' value='----------------'/>"
					 					+"<br/><h4>메뉴들을 구분선을 통해 쉽게 구분할 수 있습니다.</h4>"
					 					+"<br/><br/></div>"
				}

				//alert("dkd")			
				$(".boardDetail").append(appendBoardDetail);
				//appendBoardDetail="";
				
				
				
				count++;
				
				hideAndShow();
			});

			//밑에 게시글 수정하면 list box 값 바뀌어야하는데 

			$("#goDown").on("click", function(){

				$("select[name=board] option:selected").next().after($("select[name=board] option:selected"));

			});

			$("#goUp").on("click", function(){

				$("select[name=board] option:selected").prev().before($("select[name=board] option:selected"));

			});
			
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
								
								// 밑에 수정박스 삭제
								var deleteId = $("select[name=board] option:selected").attr("id");
								var deleteBoard = $("select[name=board] option:selected").remove();
								$("input[name='boardName/"+deleteId+"']").parent().remove();
								$("input[id=totalBoardsize]").val($("input[id=totalBoardsize]").val()-0-1);
								totalBoardSize	= $("input[id=totalBoardsize]").val();
			
								
							}
							
						}//success


					});//ajax끝

					}//방금추가된 애가 아닐때.

					else //방금추가된애
					{
					   alert("삭제");	
					   

						var deleteValue = $("select[name=board] option:selected").attr("value");
						$("select[name=board] option:selected").remove();
						$("input[name='"+deleteValue+"']").parent().remove();
						$("input[id=totalBoardsize]").val($("input[id=totalBoardsize]").val()-0-1);
						totalBoardSize	= $("input[id=totalBoardsize]").val();
					   //밑에 수정박스도 삭제
					}
							   

				}

				
			});//삭제버튼 onClick



			$("#save").on("click",function(){

				//alert("ㄴㅁㅍ");
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
	
	<div class="container">
	
	<form name ="form" class="needs-validation" novalidate>
	
			<div class="page-header">
	       		<div class="row">
	       		 <h3>
	       			 메뉴관리
	       		 </h3>
	       			 <div class="col-md-12 text-right ">
	       			 	<button type="button" class="btn-primary" id="cancel">취소</button>
					 	<button type="button" class="btn-primary" id="save" >저장하기</button>
	       		 	 </div>
	   			 </div>
	   		 </div>
	   		 
		
		<div class="row">
			
		<div class="col-md-2">
				<c:import url="/WEB-INF/views/common/cafeManageMenubar.jsp"></c:import>
		</div>
		
		<div class="col-md-10">
		<div class="col-md-2">
			<br/>
			<br/>
			<h4>추가메뉴</h4>
			<br/>
			<br/>
			<select name="addableBoard" size="10" class="form-control">
				<option value="자유게시판" selected="selected">자유게시판</option>
				<option value="--------------------" >구분선</option>
			</select>
			
		</div >
		
		<div class="col-md-1">
			
			<br/><br/><br/><br/>
			<button type="button" id ="plusBoard" class="btn btn-default btn-lg active">    
				<br/><br/><br/>
				      +   
				      
				<br/><br/><br/>
			</button>
			<br/>
			<br/>
		</div>
				
		<div class="col-md-3">
			<br/><br/><br/><br/>
			<button type="button" id ="goDown" class="btn btn-default btn-sm">
				 <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
			</button>
			<button type="button" id ="goUp" class="btn btn-default btn-sm">
				 <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>
			</button>
			
			<!-- <button type="button" id ="goStart"> 맨위로 </button>
			<button type="button" id ="goEnd"> 맨아래로 </button> -->
			
			<button type="button" id ="delete" class="btn btn-default btn-sm"> 삭제 </button>
	
			
			<br/>
			<br/>
		<select name="board" size=11 class="form-control">
    		
    		<c:set var="i" value="0" />  
			
			<c:forEach var="board" items="${boardList}">
				<c:set var="i" value="${ i+1 }" />
			
			
			<c:if test="${i eq 1}">
				<option class="apple" value="${board.boardName}/${board.boardNo}" id="${board.boardNo}" selected="selected">${board.boardName}</option>
			</c:if>
			
			<c:if test="${i ne 1}">
				<option class="apple" value="${board.boardName}/${board.boardNo}" id="${board.boardNo}">${board.boardName}</option>
			</c:if>
			
			</c:forEach>
			
   			
		</select>
		<input type="hidden" id="totalBoardsize" value="${i}">
		</div>	
			
			
		<div class="col-md-6">
		<div class="boardDetail">
		<c:set var="j" value="0" />  
		<c:forEach var="board" items="${boardList}">
				<c:set var="j" value="${ j+1 }" />
		
			<div class ="boardDetail${j}">
				<br/>
				<c:if test="${board.boardType=='cb100' || board.boardType=='cb101' || board.boardType=='cb103'}">
					<br/>
					<h4>메뉴명</h4>  
					<input type="text" class="form-control" name="boardName/${board.boardNo}" value="${board.boardName}" maxlength="6" required/>
					<hr/>
					
					<h4>메뉴설명</h4>
					<input type="text"  class="form-control" name="boardDetail/${board.boardNo}" width="50" value="${board.boardDetail}" required>
					<br/>
					<hr/>
					<h4>공개설정</h4>
					<div class="radio">
  						<label class="radio-inline">
    					<input type="radio" name="boardPrivate/${board.boardNo}" id="optionsRadios1" value="0"  ${board.privateFlag eq '0'.charAt(0) ? "checked" : ""}>
   						 전체공개
  						</label>
  						<label class="radio-inline">
   						 <input type="radio" name="boardPrivate/${board.boardNo}" id="optionsRadios2" value="1" ${board.privateFlag eq '1'.charAt(0) ? "checked" : ""}>
    					멤버공개
  						</label>
					</div>게시판 공개여부를 설정합니다.<br/>멤버공개를 선택시, 게시판은 멤버에게만 보여집니다.
					<br/>
					<hr/>
					
					<h4>접근권한설정</h4>
					<div class="form-inline">
						<select class="form-control" name="grade">
							<c:forEach var="grade" items="${useGradeList}">
								<option value="${grade.cafeGradeNo}/${board.boardNo}" ${grade.cafeGradeNo==board.accessGrade? "selected" : ""}>${grade.gradeName}</option>
							</c:forEach>
						</select> 이상
					</div>	
					<br/><br/><br/>
				
				</c:if>
				
				<c:if test="${board.boardType=='cb102'}">
					<input type="hidden" name="boardName/${board.boardNo}" value="----------------"/>
					<br/>
					<h4>메뉴들을 구분선을 통해 쉽게 구분할 수 있습니다.</h4>
				</c:if>
				
		
			</div>
		</c:forEach>
		
		</div>
				
		</div>		
				
			</div>	
			</div>
		</form>
	</div>

	
	
	<!--  게시판 리스트 불러오기 -->
		
		
		
	
</body>
</html>