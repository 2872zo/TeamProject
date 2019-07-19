<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	
	<header>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/e589319d43.js"></script>
		<script src="/js/cafeCommon.js"></script>
		
		<style>
			.postTitle:hover{
				text-decoration: underline;
			}
			
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
			
			.table-hover > tbody > tr.hidden-table:hover > td {
			     background-color: white;
			 }
		</style>
		
		<script>
			var cafeURL = '${search.cafeURL}';

			//페이지 초기화
			$(function(){
				$("[name=currentPage]").val(${search.currentPage });	

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

					console.log(postList);

					$.ajax({
						type : "POST",
						contentType: "application/json",
						url : "/cafe/" + cafeURL + "/json/updateNoticeOrder",
						dataType : "JSON",
						data: JSON.stringify(postList),
						success : function(data) {
							alert("success!");
							console.log(data);
						},
						error : function(data) {
							alert("error : " + data)
// 							debugger;
						}
					}); //ajax end
					
				});
			});

// 			$(function(){
// 				var mergeItem;
// 				var mergeCount;
// 				$("tr").each(function(row){
// 					if(row > 0){
// 						if(mergeItem != null && mergeItem.text() == $(this).find(".boardName").text()){
// 							console.log("합쳐짐!");
// 							mergeItem.attr("rowspan", mergeCount += 1);
// 							$(this).find(".boardName").remove();
// 						}else{
// 							mergeItem = $(this).find(".boardName");
// 							mergeCount = 1;
// 						}
// 					}
// 				});	
// 			});			

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
		<title>${search.cafeURL}</title>
	</header>
	
	<body>
		<div class="container">
			<form id="boardPage">
				<input type="hidden" name="currentPage">
			</form>
			<h1>updateNoticeOrder</h1>
			
			<div class="row">
				<div class="col-2">
					<c:import url="/WEB-INF/views/common/cafeManageMenubar.jsp"></c:import>
				</div>
				
				<div class="col-10">
					<div id="mainContent">
					
						<table class="table table-hover .hidden-table">
							<thead class="thead-light">
								<tr>
									<th scope="col">게시판</th>
									<th scope="col" colspan="2">제목</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${postList }" var="post" varStatus="status">
									<c:if test="${!status.first and postList[status.index - 1].boardName ne post.boardName}">
										<tr class="contour bg-dark" style="height:3px;"><td colspan="3" style="height:1px;"></td></tr>
									</c:if>
									
									<tr class="postItem">
										<input type="hidden" class="postNo" value="${post.postNo }"/>
										<td class="boardName" style="">${post.boardName }</td>
										<td>
											<button name="up"   class="btn btn-outline-dark" style="padding-left:8px; padding-right:8px; padding-top: 5px;"><i class="fas fa-long-arrow-alt-up"></i></button> 
											<button name="down" class="btn btn-outline-dark" style="padding-left:8px; padding-right:8px; padding-top: 5px;"><i class="fas fa-long-arrow-alt-down"></i></button></td>
										<td class="postTitle">${post.postTitle }</td>
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
						
					</div><!-- Main Content End -->
				</div><!-- col-10 End -->
				
			</div><!-- row End -->
			
		</div>
	</body>
</html>