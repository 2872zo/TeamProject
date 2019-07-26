<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
   
    
    <!-- Favicon icon -->
   
    <!-- Custom Stylesheet -->
    
 
    <link href="/css/style.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    
    
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

			//$("[name='form']").validate();
			
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
						+"<h4>메뉴명</h4>   <input type='text' class='form-control input-default' name='newBoard"+count+"'  placeholder='게시판이름' maxlength='6' required /><hr/> "
						+"<h4>메뉴설명</h4> <input type='text'  class='form-control input-default' name='newBoardDetail"+count+"' width='50' placeholder='게시판설명' required >"
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
						+"</c:forEach></select> 이상</div><hr/>"
						+"<label>추천게시글설정</label><div class='form-inline'>"
						+"<select class='form-control' name='bestPostCount'><c:forEach var='i' begin='3' end='10' step='1'>"
						+"<option value='${i}/new"+count+"'>${i}</option></c:forEach>"
						+"</select> 개의 추천게시글을 게시글 상단에 고정</div><br/><div class='form-inline'>"
						+"추천 개수<select class='form-control' name='bestLikeCount'>"
						+"<c:forEach var='i' begin='5' end='100' step='1'>"
						+"<option value='${i}/new"+count+"'>${i}</option></c:forEach></select>개 이상"
						+"<select class='form-control' name='bestTerm'>"
						+"<option value='0/new"+count+"'>당일</option>"
						+"<option value='1/new"+count+"'>7일</option>"
						+"<option value='2/new"+count+"'>10일</option>"
						+"<option value='3/new"+count+"'>전체</option></select> 게시물 기준</div>"
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
					
					//alert($("select[name=board] option:selected").attr("id")); //board_no
					var boardNo = $("select[name=board] option:selected").attr("id");
					//ajax로 게시판에 물려있는 게시물이 있는지 체크
					//board_no,cafe_URL을 보내서 board_no를 가지고있는 post가 있는지 post table에서 검사 
					$.ajax({

						url : "/cafe/json/${cafeURL}/checkCafePost",
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

				AllSelect();
				$("form").attr("method","POST").attr("action","/cafe/${cafeURL}/manage/updateCafeBoard").submit();
				
			});

			$("#cancel").on("click",function(){
				
					alert("지금까지 편집한 내용을 취소합니다.");
					self.location = "/cafe/${cafeURL}/manage/updateCafeBoardView";
			});

		});

		
		
	
	</script>
    
	
	


</head>

<body data-theme-version="light" data-layout="vertical" data-nav-headerbg="color_1" data-headerbg="color_1" data-sidebar-style="full" data-sibebarbg="color_1" data-sidebar-position="static" data-header-position="static" data-container="wide" direction="ltr">
	
	
    <!--*******************
        Preloader start
    ********************-->

    <!--*******************
        Preloader end
    ********************-->
    
    <!--**********************************
            Sidebar start
        ***********************************-->
	
	<!--**********************************
            Sidebar end
        ***********************************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <form name ="form" class="needs-validation" novalidate>
    <div id="main-wrapper" class="show">
		
        <!--**********************************
            Nav header start
        ***********************************-->
		    <!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="../common/cafeManageTollbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
      
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
       	<div class="nk-sidebar">
		<c:import url="/WEB-INF/views/common/cafeManageMenubar.jsp"></c:import>
		</div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body" style="min-height: 743px;">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">관리페이지</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">게시판관리</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">메뉴관리</h4>
                                <!--   <p class="text-muted m-b-15 f-s-12"> 카페의 게시판을 <code>추가, 삭제, 수정 </code> 할 수 있습니다.</p> -->
                                
                                <div class="basic-form">
                           			 <div class="col-lg-12 text-right ">
       			 						<button type="button" class="btn btn-outline-primary" id="cancel">취소</button>
				 						<button type="button" class="btn btn-primary" id="save" >저장하기</button>
       		 	 					 </div>
       		 	 					 <hr/>
									<div class ="form-row">
									
									<div class="form-group col-md-2">
										<label>추가메뉴</label>
										<br /> <br /> 
										<select name="addableBoard" size="10" class="form-control">
											<option value="자유게시판" selected="selected">자유게시판</option>
											<option value="--------------------">구분선</option>
										</select>
									</div>

									<div class="form-group col-md-1">
										<br /><br /><br />
										<button type="button" id="plusBoard" class="btn btn-primary">
											<br />
											<br /> + <br />
											<br />
											<br />
										</button>
									</div>

									<div class="form-group col-md-3">
									
										<div class="btn-group-sm">
										<button type="button" id="goDown" class="btn btn-outline-primary">아래</button>
										<button type="button" id="goUp" class="btn btn-outline-primary">위</button>
										<!-- <button type="button" id ="goStart"> 맨위로 </button> 
										<button type="button" id ="goEnd"> 맨아래로 </button> -->
										<button type="button" id="delete" class="btn btn-outline-primary">삭제</button>
										</div>

										<br /> 
										<select name="board" size=11 class="form-control">

											<c:set var="i" value="0" />

											<c:forEach var="board" items="${boardList}">
												<c:set var="i" value="${ i+1 }" />


												<c:if test="${i eq 1}">
													<option class="apple"
														value="${board.boardName}/${board.boardNo}" id="${board.boardNo}" selected="selected">${board.boardName}</option>
												</c:if>

												<c:if test="${i ne 1}">
													<option class="apple"
														value="${board.boardName}/${board.boardNo}" id="${board.boardNo}">${board.boardName}</option>
												</c:if>

											</c:forEach>
											
										</select> 
										<input type="hidden" id="totalBoardsize" value="${i}">
									</div>

									<div class="form-group col-md-6">
										<div class="boardDetail">
											<c:set var="j" value="0" />
											<c:forEach var="board" items="${boardList}">
												<c:set var="j" value="${ j+1 }" />

												<div class="boardDetail${j}">
													<c:if test="${board.boardType=='cb100' || board.boardType=='cb101' || board.boardType=='cb103'}">
													   
														<label>메뉴명</label>
														<input type="text" class="form-control input-default" name="boardName/${board.boardNo}" value="${board.boardName}" maxlength="6" required />
														<hr />
														
														<label>메뉴설명</label>
														<input type="text" class="form-control input-default"
															name="boardDetail/${board.boardNo}" width="50"
															value="${board.boardDetail}" required>
														<br />
														<hr />
														
														<label>공개설정</label>
														<div class="radio">
															<label class="radio-inline mr-3"> 
															<input type="radio" name="boardPrivate/${board.boardNo}" id="optionsRadios1" value="0" ${board.privateFlag eq '0'.charAt(0) ? "checked" : ""}>
																전체공개
															</label> 
															<label class="radio-inline mr-3"> 
															<input type="radio" name="boardPrivate/${board.boardNo}" id="optionsRadios2" value="1" ${board.privateFlag eq '1'.charAt(0) ? "checked" : ""}>
																멤버공개
															</label>
														</div>
														게시판 공개여부를 설정합니다.<br />멤버공개를 선택시, 게시판은 멤버에게만 보여집니다.
														<br />
														<hr />

														<label>접근권한설정</label>
														<div class="form-inline">
															<select class="form-control" name="grade">
																<c:forEach var="grade" items="${useGradeList}">
																	<option value="${grade.cafeGradeNo}/${board.boardNo}" ${grade.cafeGradeNo==board.accessGrade? "selected" : ""}>${grade.gradeName}</option>
																</c:forEach>
															</select> 이상
														</div>
													
													
													<c:if test="${board.boardType=='cb103'}"><!--자유게시판일때만  -->
														
														<hr/>
														<label>추천게시글설정</label>
														<div class="form-inline">
															<select class="form-control" name="bestPostCount">
																<c:forEach var="i" begin="3" end="10" step="1">
																	<option value="${i}/${board.boardNo}" ${board.bestPostCount==i? "selected" : ""}>${i}</option>
																</c:forEach>
															</select> 개의 추천게시글을 게시글 상단에 고정
														</div>
														<br/>
								
														<div class="form-inline">
															추천 개수
															<select class="form-control" name="bestLikeCount">
																<c:forEach var="i" begin="5" end="100" step="1">
																	<option value="${i}/${board.boardNo}" ${board.bestLikeCount==i? "selected" : ""}>${i}</option>
																</c:forEach>
															</select>개 이상
															
															
															<select class="form-control" name="bestTerm">
																<option value="0/${board.boardNo}" ${board.bestTerm eq '0'.charAt(0) ? "selected" : ""}>당일</option>
																<option value="1/${board.boardNo}" ${board.bestTerm eq '1'.charAt(0)? "selected" : ""}>7일</option>
																<option value="2/${board.boardNo}" ${board.bestTerm eq '2'.charAt(0) ? "selected" : ""}>10일</option>
																<option value="3/${board.boardNo}" ${board.bestTerm eq '3'.charAt(0) ? "selected" : ""}>전체</option>
															</select> 게시물 기준
															
														</div>
							
													</c:if>
													
													
													
													
													</c:if>

													<c:if test="${board.boardType=='cb102'}">
														<input type="hidden" name="boardName/${board.boardNo}" value="----------------" />
														<br />
														<label>메뉴들을 구분선을 통해 쉽게 구분할 수 있습니다.</label>
													</c:if>


												</div>
											</c:forEach>

										</div>

									</div>
									</div>
                                    
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    
                   
              
                </div>
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    
	<script src="/js/custom/cafeCommon.js"></script>

	</form>
</body></html>