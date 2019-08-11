<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">
<link rel="stylesheet" href="/css/custom/advenced-search.css">
<script src="https://kit.fontawesome.com/e589319d43.js"></script>

<!-- 이페이지에서만 사용 -->
<link href="/css/custom/form-validation.css" rel="stylesheet">

<style>
#div_menu {
	width: 20%;
	height: 500px;
	float: left;
	background-color: #82FA58;
}

#div_con {
	width: 80%;
}

.cursor {
	cursor: pointer;
}

.cursor:hover {
	text-decoration: underline;
}
</style>

<style>

.postTitle:hover, .boardName:hover {
	cursor : pointer;
	text-decoration: underline;
}

#layerPopup {
	padding: 20px;
	border: 4px solid #ddd;
	position: absolute;
	left: 100px;
	top: 100px;
	background: #fff;
}

#layerPopup button {
	cursor: pointer;
}

</style>

<title>${search.cafeURL}</title>
</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"	stroke-width="3" stroke-miterlimit="10" />
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

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<c:import url="/WEB-INF/views/common/brand-logo.jsp"/>
		</div>
		
		
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<c:import url="/WEB-INF/views/common/cafeToolbar.jsp"></c:import>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/cafe/menubarCafe.jsp"></c:import>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="row page-titles mx-0" style="margin:0px;">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">${cafe.cafeName }</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">게시글 작성</a></li>
                    </ol>
                </div>
            </div>
			
			
			
			
			
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">게시글 작성</h4>
							<div>

								<form class="needs-validation" novalidate>
									<input type="hidden" name="fileList" id="fileList">
									<input type="hidden" name="cafeURL"> 
									<input type="hidden" name="memberNo"> 
									<input type="hidden" name="memberNickname">
									<input type="hidden" name="boardName">
						
									<div class="row">
										<div class="col-md-8 mb-3">
											<select class="form-control hideOption" name="boardNo">
												<c:forEach var="board" items="${boardOption }">
													<option value="${board.boardNo }" class="boardOption">${board.boardName }</option>
												</c:forEach>
											</select>
										</div>
						
										<c:if test="${cafeMember.memberGrade eq 'cg100' or cafeMember.memberGrade eq 'cg101'}">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input"	id="postNoticeFlag" name="postNoticeFlag"> 
												<label	class="custom-control-label" for="postNoticeFlag">공지로 등록</label>
											</div>
										</c:if>
									</div>
						
									<label for="postTitle">제목</label> 
									<input type="text" class="form-control" id="postTitle" name="postTitle" required="">
									<div class="invalid-feedback">제목은 생략할 수 없습니다.</div>
									
									<br/>
									
									<label for="editor">내용</label>
									<textarea class="form-control" name="postContent" id="editor" required=""></textarea>
									<div class="invalid-feedback">내용은 생략할 수 없습니다.</div>
						
									<br/>
									
									<input type="submit" class="btn btn-primary btn-lg btn-block" id="submitButton" value="등록">
								</form>

							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- row -->

		</div>
		</div>
		
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>
					Copyright &copy; Designed & Developed by <a
						href="https://themeforest.net/user/quixlab">Phoenix</a> 
				</p>
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
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>

	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.init.js"></script>
	
	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script>
    	var memberNo = '${cafeMember.memberNo}'
    	var userNo ='${user.userNo}'
    	var cafeNo= '${cafeMember.cafeNo}'
		var cafeURL = "${cafeURL}";
    </script>
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/js/custom/menubarCafe.js"></script>
	<script src="/js/custom/cafeCommon.js"></script>

	<!-- 이 페이지 전용 script -->
	<script src="/ckeditor/ckeditor.js"></script>
	<script src="/js/custom/form-validation.js"></script>
	
	<script>
	<!-- ckeditor 설정 -->
		$(function() {
			var uploadFileList = new Array();
			
			var editor = CKEDITOR.replace('editor');
			editor.on('fileUploadRequest', function( evt ){
				$("#preloader").attr("style", "background:rgba(255,245,217,0.5);");
			});
			
			editor.on( 'fileUploadResponse', function( evt ) {
				$("#preloader").attr("style", "display:none;");
				
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
			} );

		});

		$(function() {
			$("[name=cafeURL]").val('${search.cafeURL}');
			$("[name=memberNo]").val("${cafeMember.memberNo}");
			$("[name=memberNickname]").val('${cafeMember.memberNickname}');
			$("form").attr("method", "POST").attr("action",	"addPost");

			$("#submitButton").on("click",function(e){
				$("[name=boardName]").val( $("[name=boardNo] option:selected").text());
			});

			$(".boardOption").each(function(){
			    if($(this).val()==${empty search.boardNo? 0 : search.boardNo}){
			      $(this).attr("selected","selected");
			    }
			});
		});
		
	</script>
</body>

</html>

