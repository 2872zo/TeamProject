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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <style>
    
    	#plusBoard{
    		
    		margin-left:10px;
    	}
    	
    	select[name=board]{
    	
    		width:200px;
    		
    	}
    	
    	select[name=addableBoard]{
    		
    		height:219px !important;
    	}
    	
    	p{
    		margin:0;
    		font-size:11px;
    	}
    	
    	.borderLine{
    		
    		margin-top:10%;
    		margin-left:5%;
    		font-size:15px;
    		color:black;
    	}
    	
    
    </style>
    
    
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
			//alert(selectBoxValue);
			for(var i=1; i<=$("input[id=totalBoardsize]").val(); i++) 
			{
				$(".boardDetail"+i).hide();
			}
			
			if(selectBoxValue.indexOf("newBoard")!= -1) //새로생긴애
			{
				//alert("악!");
				var splitNumber = selectBoxValue.split('d')[1];
				//alert("splitNumber : "+splitNumber);
				$("input[name='newBoardName"+splitNumber+"']").parent().show();
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
				var appendBoard = "<option class='eachBoard' value='newBoard"+count+"' id='' selected='selected' >"+$("select[name=addableBoard]").val()+"</option>"

				
				$("select[name=board] option:selected").removeAttr('selected');
				
				$("select[name=board]").append(appendBoard);
				//보드사이즈증가
				$("input[id=totalBoardsize]").val($("input[id=totalBoardsize]").val()-0+1);
				totalBoardSize	= $("input[id=totalBoardsize]").val();
				//alert(totalBoardSize);

				
				
				if($("select[name=addableBoard]").val()=="새로운게시판"){
					//게시판 추가하면  밑에 input type text추가하고 
						//alert("새로운게시판")
					 	appendBoardDetail = "<div class ='boardDetail"+totalBoardSize+"'> <br/><br/>"
						+"<label>게시판명</label>   <input type='text' class='form-control input-default' name='newBoardName"+count+"'  value='새로운게시판' maxlength='11' required /><hr/> "
						+"<label>게시판설명</label> <input type='text'  class='form-control input-default' name='newBoardDetail"+count+"' width='50' value='새로운게시판 입니다.' required >"
						+"<br/><hr/><label>공개설정</label>"
						+"<div class='radio'><label class='radio-inline'>"
  						+"<input type='radio' value='0' name='newBoardPrivate"+count+"' checked> 전체공개 </label>"
    					+"<label class='radio-inline'>"
   						+"<input type='radio' value='1' name='newBoardPrivate"+count+"'> 멤버공개 </label></div>"
						+"<div class='exclusiveExplain'><p>게시판 공개여부를 설정합니다.  멤버공개를 선택시 게시판은 멤버에게만 보여집니다.</p></div>"
						+"<hr/>"
						+"<label>접근권한설정</label><div class='form-inline'><select class='form-control' name='grade'>"
						+"<c:forEach var='grade' items='${useGradeList}'>"
						+"<option value='${grade.cafeGradeNo}/new"+count+"'>${grade.gradeName}</option>"
						+"</c:forEach></select> 이상</div><hr/>"
						+"<label>추천게시글설정</label><div class='form-inline'>"
						+"<select class='form-control' name='bestPostCount'><c:forEach var='i' begin='3' end='10' step='1'>"
						+"<option value='${i}/new"+count+"'>${i}</option></c:forEach>"
						+"</select> 개의 추천게시글을 게시글 상단에 고정</div><br/><div class='form-inline'>"
						+"추천 개수<select class='form-control' name='bestLikeCount'>"
						+"<c:forEach var='i' begin='5' end='100' step='1'>"
						+"<option value='${i}/new"+count+"'>${i}</option></c:forEach></select>개 이상, "
						+"<select class='form-control' name='bestTerm'>"
						+"<option value='1/new"+count+"'}>당일</option>"
						+"<option value='3/new"+count+"'}>3일</option>"
						+"<option value='7/new"+count+"'}>7일</option>"
						+"<option value='30/new"+count+"'}>한달</option>"
						+"<option value='180/new"+count+"'}>6개월</option>"
						+"<option value='365/new"+count+"'}>1년</option>"
						+"</select> 게시물 기준</div>";
						//$(".boardDetail").hide();
				}
				else{
					 appendBoardDetail = "<div class ='boardDetail"+totalBoardSize+"'> <br/><br/>"
					 					+"<input type='hidden' name='newBoardName"+count+"' value='----------------'/>"
					 					+"<div class='borderLine'>메뉴들을 구분선을 통해 쉽게 구분할 수 있습니다.</div>"
					 					+"<br/><br/></div>";
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


				swal({
					  title: "저장하기",
					  text: "변경사항을 저장하시겠습니까?",
					  icon: "info",
					  buttons: ['취소','확인'],
					})
					.then((willDelete) => {
					  if (willDelete) { //확인누르면 유효성 체크

						  var elements = $('[type=text][name*="newBoardName"],[type=text][name*="boardName"]' );
						  var returnNow = false;
							
						  elements.each(function(){ //유효성체크 -> 유효성체크
							//debugger;
							if($(this).val()==null || $(this).val()==""){ //value값이 null이거나 nullString일때

									swal({title:"게시판명은 빈칸일 수 없습니다.",icon:"warning",button:'확인',});
									returnNow = true;
									return false;

								}
							});

							if(returnNow){ //each 끝나고 return 시켜버림
								return;
							} //일단 확인눌렀을때 유효성 체크하는것 -> 메뉴칸 빈칸있으면 swal창

						  
					    swal({
						    title : "저장되었습니다!",
						    icon: "success"
						}).then(function(){

							AllSelect();
							$("form").attr("method","POST").attr("action","/cafe/${cafeURL}/manage/updateCafeBoard").submit();

						});
					  } else {
					    //swal("Your imaginary file is safe!");
						 return;
					  }
					});

				
				//유효성체크
				
				


				
				
				
				
			});

			$("#cancel").on("click",function(){
				
					//alert("지금까지 편집한 내용을 취소합니다.");
					swal({
						  title: "작성취소",
						  text: "지금까지 편집한 내용을 취소하시겠습니까?",
						  icon: "warning",
						  buttons: ['취소','확인'],
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
						    swal({
							    title : "작성이 취소 되었습니다.",
							    icon: "success"
							}).then(function(){

								   self.location = "/cafe/${cafeURL}/manage/updateCafeBoardView";

							});
						  } else {
						    //swal("Your imaginary file is safe!");
							 return;
						  }
						});
					
			}); //end of cancel click function

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
                                <h4 class="card-title">게시판관리</h4>
                                <!--   <p class="text-muted m-b-15 f-s-12"> 카페의 게시판을 <code>추가, 삭제, 수정 </code> 할 수 있습니다.</p> -->
                                
                                <div class="basic-form">
                           			 <div class="col-lg-12 text-right ">
       			 						<button type="button" class="btn btn-outline-primary" id="cancel">취소</button>
				 						<button type="button" class="btn btn-primary" id="save" >저장하기</button>
       		 	 					 </div>
       		 	 				 <hr/>
       		 	 				 
									<div class ="form-row">
									
									<div class="form-group col-md-2">
										<label>추가게시판</label>
										<br /> <br /> 
										<select name="addableBoard" size="10" class="form-control">
											<option value="새로운게시판" selected="selected">새로운게시판</option>
											<option value="----------------">구분선</option>
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
													<option class="eachBoard"
														value="${board.boardName}/${board.boardNo}" id="${board.boardNo}" selected="selected">${board.boardName}</option>
												</c:if>

												<c:if test="${i ne 1}">
													<option class="eachBoard"
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
													   	 <br/><br/>
														<label>게시판명</label>
														<input type="text" class="form-control input-default" name="boardName/${board.boardNo}" value="${board.boardName}" maxlength="11" required />
														<hr />
														
														<label>게시판설명</label>
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
														<div class="exclusiveExplain">
															<p>게시판 공개여부를 설정합니다.  멤버공개를 선택시 게시판은 멤버에게만 보여집니다.</p>
														</div>
														
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
															</select>개 이상, &nbsp;
															
															
															<select class="form-control" name="bestTerm">
																<option value="1/${board.boardNo}" ${board.bestTerm==1 ? "selected" : ""}>당일</option>
																<option value="3/${board.boardNo}" ${board.bestTerm==3 ? "selected" : ""}>3일</option>
																<option value="7/${board.boardNo}" ${board.bestTerm==7 ? "selected" : ""}>7일</option>
																<option value="30/${board.boardNo}" ${board.bestTerm==30 ? "selected" : ""}>한달</option>
																<option value="180/${board.boardNo}" ${board.bestTerm==180 ? "selected" : ""}>6개월</option>
																<option value="365/${board.boardNo}" ${board.bestTerm==365 ? "selected" : ""}>1년</option>
															</select> 게시물 기준
															
														</div>
							
													</c:if>
													
													
													
													
													</c:if>

													<c:if test="${board.boardType=='cb102'}">
														<input type="hidden" name="boardName/${board.boardNo}" value="----------------" />
														<div class="borderLine">메뉴들을 구분선을 통해 쉽게 구분할 수 있습니다.</div>
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
                <p>Copyright © Designed &amp; Developed by <a href="https://themeforest.net/user/quixlab">Phoenix</a></p>
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