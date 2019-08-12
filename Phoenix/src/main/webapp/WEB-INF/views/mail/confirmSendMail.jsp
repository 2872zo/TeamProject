<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">
<script src="https://kit.fontawesome.com/e589319d43.js"></script>


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

.noticeIcon {
	height: 28px;
	margin: 0px;
	padding-top: 0px;
	padding-bottom: 0px;
}

.thisNotice {
	background: #F1795E;
	border-color: #F1795E;
}

.svrMsg {
    background-image: url(https://ssl.pstatic.net/static/pwe/nm/sp_works_8f76e9f2.png);
    background-size: 539px 528px;
    background-position: -174px -70px;
    background-repeat: no-repeat;
    width: 81px;
    height: 81px;
    display: inline-block;
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
			<c:import url="/WEB-INF/views/common/brand-logo.jsp"></c:import>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<c:import url="/WEB-INF/views/mail/common/mailToolbar.jsp"></c:import>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/mail/common/mailSidebar.jsp"></c:import>
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
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Mail</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">메일전송확인</a></li>
                    </ol>
                </div>
            </div>
			
			<div class="row d-flex justify-content-center">
				<div class="col-lg-10">
					<div class="card">
						<div class="card-body justify-content-center" style="text-align: center;">
							<i class="svrMsg"></i>
							<div>
								<h4>
									<strong>${account.accountId }</strong> 계정으로<br/>
									<strong style="color: #FFAF00">${mail.to }</strong>에<br/>
									메일을 전송했습니다.
								</h4>
							</div>
	                        
						</div>
					</div>
				</div>
			</div>

			</div>
			<!-- row -->

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
						href="https://themeforest.net/user/Phoenix">Phoenix</a>
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
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/js/custom/mailCommon.js"></script>
	<script>
		$(function(){
			//선택 계정 유지
			$(".accountSelectorOption").each(function(){
				if($(this).val() == ${accountNo}){
					$(this).attr("selected", "selected");
				}
			});
		});
	</script>

	<!-- 이 페이지 전용 script -->
	<script src="/ckeditor/ckeditor.js"></script>
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
	//			    evt.stop();
	
	//			    // Get XHR and response.
			    var data = evt.data,
			        xhr = data.fileLoader.xhr,
			        response = JSON.parse(xhr.responseText.split( '|' ));
	
	//				console.log(response.fileName);
				
	//		        debugger;
		        
		        var inlineList;
				if(CKEDITOR.document.$.getElementById("inlineList").value == ""){
					inlineList = response.fileName;
				}else{
					inlineList = CKEDITOR.document.$.getElementById("inlineList").value + ","  + response.fileName;
				}
		        
		        CKEDITOR.document.$.getElementById("inlineList").value = inlineList;
			} );
	
		});


		$(function(){
			$("#send").on("click", function(){
				$("#mailForm").attr("method","POST").attr("action", "/mail/sendMail").submit();
			});
			
		});
	</script>

</body>

</html>