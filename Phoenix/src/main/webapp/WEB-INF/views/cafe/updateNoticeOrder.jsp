<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>공지관리</title>

<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">
<style>
	#layerPopup{
	  padding:20px; 
	  border:4px solid #ddd; 
	  position:absolute; 
	  left:100px; 
	  top:100px; 
	  background:#fff;
	}
	
	#layerPopup button{
	  cursor:pointer;
	}
	
	.table th, .table td{
		text-align: center;
		vertical-align: middle;
	}
	
	.postTitle:hover{
		cursor:pointer;
		text-decoration: underline;
	}
	
	.btn[disabled]:hover{
		background-color: #F3F3F9;
		color: black;
	}
	
</style>

</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10"></circle>
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->

	<!--**********************************
        Main wrapper start
    ***********************************-->

	<div id="main-wrapper">

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/cafeManageTollbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->



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
						<li class="breadcrumb-item"><a href="javascript:void(0)">manage</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">application</a></li>
					</ol>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">>&nbsp;공지 목록</h4>

								

								<!--  table Start /////////////////////////////////////-->
								<table class="table table-hover .hidden-table">
									<thead class="thead-light">
										<tr>
											<th scope="col">게시판</th>
											<th scope="col">제목</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${postList }" var="post" varStatus="status">
											<c:if test="${!status.first and postList[status.index - 1].boardName ne post.boardName}">
												<tr class="contour"><td colspan="3"><hr/></td></tr>
											</c:if>
											
											<tr class="postItem">
												<input type="hidden" class="postNo" value="${post.postNo }"/>
												<td class="boardName">${post.boardName }</td>
												<td class="postTitle">${post.postTitle }</td>
												<td>
													<button name="up"   class="btn btn-outline-dark" style="padding-left:8px; padding-right:8px; padding-top: 5px;"><i class="mdi mdi-chevron-up"></i></button> 
													<button name="down" class="btn btn-outline-dark" style="padding-left:8px; padding-right:8px; padding-top: 5px;"><i class="mdi mdi-chevron-down"></i></button>
													<button name="delete" class="btn btn-outline-dark" style="padding:3px; padding-left:5px; padding-right:5px; font-size:20px;"><i class="mdi mdi-delete"></i></button>
												</td>
											</tr>
										</c:forEach>
										<tr class="hidden-table">
											<td colspan="3">
												<button class="btn btn-outline-dark" id="saveNoticeOrder">저장</button>
												<button class="btn btn-outline-dark" id="cancelNoticeOrder">취소</button>
											</td>
										</tr>
									</tbody>
								</table>
								<!--  table END /////////////////////////////////////-->
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>
		<!--  table End /////////////////////////////////////-->
	</div>
	
	<!--**********************************
        Scripts
    ***********************************-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>

	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/js/custom/cafeCommon.js"></script>


	<!-- 이 페이지에서 사용하는 스크립트 -->
	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script>
			var cafeURL = '${cafeURL}';
			var deleteNoticeList = "";

			//페이지 초기화
			$(function(){
				disabled();
			});
			
			//게시글 조회
			$(function(){
				$(".postTitle").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getPost/" + 	$(this).parent().find(".postNo").val();				
				});			
			});

			//saveNoticeOrder
			$(function(){
				$("#saveNoticeOrder").on("click", function(){
					var postList = new Array();
					
					$(".postItem").each(function(index){
						postList.push({postNo : $(this).find(".postNo").val(), noticeIndex : index});
					});

					var jsonData = {postList : postList, deleteNoticeList : deleteNoticeList};
					
					console.log(postList);

					$.ajax({
						type : "POST",
						contentType: "application/json",
						url : "/cafe/" + cafeURL + "/json/updateNoticeOrder",
						dataType : "JSON",
						data: JSON.stringify(jsonData),
						xhr: function() {
					        var xhr = $.ajaxSettings.xhr();
					        xhr.upload.onprogress = function(e) {
					            console.log(Math.floor(e.loaded / e.total *100) + '%');
					        };
					        return xhr;
					    },
						success : function(data) {
							swal("공지 순서 저장 성공","","success");
							console.log(data);
						},
						error : function(data) {
							alert("error : " + data)
// 							debugger;
						}
					}); //ajax end
					
				});
			});


			//취소
			$(function(){
				$("#cancelNoticeOrder").on("click", function(){
					location.reload(); 
				});	
			});

			//위로 올림
			$(function(){
				$("[name=up]").on("click", function(){
					if($(this).parent().parent().prev().find(".boardName").text() == $(this).parent().parent().find(".boardName").text()){
						$(this).parent().parent().prev().before($(this).parent().parent());
					}

					disabled();
				});	
			});

			//아래로 내림
			$(function(){
				$("[name=down]").on("click", function(){
					if($(this).parent().parent().next().find(".boardName").text() == $(this).parent().parent().find(".boardName").text()){
						$(this).parent().parent().next().after($(this).parent().parent());
					}

					disabled();
				});	
			});

			//공지 삭제
			$(function(){
				$("[name=delete]").on("click", function(){
					if(deleteNoticeList == ""){
						deleteNoticeList = $(this).parent().parent().find(".postNo").val();
					}else{
						deleteNoticeList = deleteNoticeList + "," + $(this).parent().parent().find(".postNo").val();
					}
			
					$(this).parent().parent().remove();
					disabled();
				});	
			});

			//disabled 변경
			function disabled(){
				$("[name=up]").each(function(){
					if($(this).parent().parent().prev().find(".boardName").text() != $(this).parent().parent().find(".boardName").text()){
						$(this).attr("disabled","true");
					}else{
						$(this).removeAttr("disabled");
					}

					
				});

				$("[name=down]").each(function(){
					if($(this).parent().parent().next().find(".boardName").text() != $(this).parent().parent().find(".boardName").text()){
						$(this).attr("disabled","true");
					}else{
						$(this).removeAttr("disabled");
					}
				});	
			}

		</script>
</body>

</html>
