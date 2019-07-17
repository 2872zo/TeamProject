<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<header>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="/css/form-validation.css" rel="stylesheet">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"	crossorigin="anonymous"></script>
	<script src="/ckeditor/ckeditor.js"></script>
	<script src="/js/form-validation.js"></script>
	<script src="/js/cafeCommon.js"></script>
		
	<script>
		$(function() {
			var editor = CKEDITOR.replace('editor');
			editor.on( 'fileUploadResponse', function( evt ) {
			    // Prevent the default response handler.
// 			    evt.stop();

// 			    // Get XHR and response.
			    var data = evt.data,
			        xhr = data.fileLoader.xhr,
			        response = JSON.parse(xhr.responseText.split( '|' ));

// 				console.log(response.fileName);
				
// 		        debugger;
		        
		        var fileList;
				if(CKEDITOR.document.$.getElementById("fileList").value == ""){
					fileList = response.fileName;
				}else{
					fileList = CKEDITOR.document.$.getElementById("fileList").value + ","  + response.fileName;
				}
		        
		        CKEDITOR.document.$.getElementById("fileList").value = fileList;
			});

		});

		$(function() {
			$("form").attr("method", "POST").attr("action",	"/cafe/${post.cafeURL}/updatePost/${post.postNo}");

			$(".boardOption").each(function(){
			    if($(this).val()==${post.boardNo}){
			      $(this).attr("selected","selected");
			    }
			});

			if(${post.postNoticeFlag}){
				$("[name=postNoticeFlag]").attr("checked","checked");
			}
			
			$("[name=postTitle]").val('${post.postTitle}');
			$("[name=postContent]").val('${post.postContent}');

			
			$("#submitButton").on("click",function(e){
				$("[name=boardName]").val( $("[name=boardNo] option:selected").text());
				$("form").submit();
			});

			//이미지 삭제를 위한 초기화
			$(function(){
				var el = document.createElement( 'html' );
				el.innerHTML = '${post.postContent}';
				for(var i = 0; i < $(el).find("img").length; i++){
					console.log($($(el).find("img")[i]).attr("src").substring(20));

	 				if($("#fileList").val() == ""){
	 					$("#fileList").val($($(el).find("img")[i]).attr("src").substring(20));
	 				}else{
	 					$("#fileList").val($("#fileList").val() + "," + $($(el).find("img")[i]).attr("src").substring(20));
	 				}
					
				}
			});
		});

		
	</script>


	<title>${search.cafeURL}</title>
</header>

<body>
	<div class="container">
		<div class="row">
			
				<div class="col-2">
					<c:import url="/WEB-INF/views/cafe/menubarCafe.jsp"></c:import>
				</div>
				
				<div class="col-10">
					<div id="mainContent">
					<div class="py-5 text-center">
						<!-- <img class="d-block mx-auto mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
						카페 아이콘 넣을것
						<h1>게시글 수정</h1>
					</div>
					
<%-- 					<input type="hidden" name="postTitle" value="${post.postTitle }"> --%>
<%-- 					<input type="hidden" name="postContent" value='${post.postContent }'> --%>
					<form class="needs-validation" novalidate>
						<input type="hidden" name="fileList" id="fileList">
						<input type="hidden" name="cafeURL" value="${post.cafeURL }"> 
						<input type="hidden" name="memberNo" value="${post.memberNo }"> 
						<input type="hidden" name="memberNickname" value="${post.memberNickname }">
						<input type="hidden" name="boardName" value="${post.boardName }">
						
			
						<div class="row">
							<div class="col-md-8 mb-3">
								<select class="form-control hideOption" name="boardNo">
									<c:forEach var="board" items="${boardOption }">
										<option value="${board.boardNo }" class="boardOption">${board.boardName }</option>
									</c:forEach>
								</select>
							</div>
			
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"	id="postNoticeFlag" name="postNoticeFlag"> 
								<label	class="custom-control-label" for="postNoticeFlag">공지로 등록</label>
							</div>
						</div>
			
							<label for="postTitle">제목</label> 
							<input type="text" class="form-control" id="postTitle" name="postTitle" required="">
							<div class="invalid-feedback">제목은 생략할 수 없습니다.</div>
							
							<br/>
							
							<label for="editor">내용</label>
							<textarea class="form-control" name="postContent" id="editor" required="" ></textarea>
							<div class="invalid-feedback">내용은 생략할 수 없습니다.</div>
				
							<br/>
							
							<input type="button" class="btn btn-primary btn-lg btn-block" id="submitButton" value="저장">
					</form>
					
				</div><!-- mainContent end -->
			</div><!-- col-10 end -->
		</div><!-- row end -->
	</div><!-- container end -->
</body>
</html>
