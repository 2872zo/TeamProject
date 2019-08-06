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
			<div class="row page-titles mx-0">
<!-- 				<div class="col p-md-0"> -->
<!-- 					<ol class="breadcrumb"> -->
<!-- 					</ol> -->
<!-- 				</div> -->
			</div>
			
			
			
			
			<div id="container-fluid">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
                                    <div class="toolbar" role="toolbar">
                                        <div class="btn-group m-b-20">
                                        	<!-- 읽음 표시 -->
                                        	<c:if test="${!mail.seen }">
	                                            <button type="button" class="btn btn-light" name="setSeen"><i class="mdi mdi-email"></i>
	                                            </button>
                                        	</c:if>
                                        	<c:if test="${mail.seen }">
	                                            <button type="button" class="btn btn-light" name="setUnSeen"><i class="mdi mdi-email-open"></i>
	                                            </button>
                                        	</c:if>
                                        	
                                        	<!-- 중요메일 표시 -->
                                        	<c:if test="${!mail.flag }">
	                                            <button type="button" class="btn btn-light" name="setFlag"><i class="far fa-star"></i>
	                                            </button>
                                        	</c:if>
                                        	<c:if test="${mail.flag }">
	                                            <button type="button" class="btn btn-light" name="setUnFlag"><i class="fas fa-star"></i>
	                                            </button>
                                        	</c:if>
                                        	
                                        	<!-- 휴지통에 있는 메일 표시 -->
                                        	<c:if test="${!mail.trash }">
	                                            <button type="button" class="btn btn-light" name="trash"><i class="fa fa-trash"></i>
                                            	</button>
                                        	</c:if>
                                        	<c:if test="${mail.trash }">
                                        		<button type="button" class="btn btn-light" name="inbox"><i class="fa fa-inbox"></i>
                                            	</button>
	                                            <button type="button" class="btn btn-light" name="delete"><i class="mdi mdi-close-box" style="font-size:20px;"></i>
                                            	</button>
                                        	</c:if>
                                        	
                                            
                                        </div>
                                    </div>
                                    
                                    <!-- 메일 본문 시작 -->
                                    <div class="read-content">
                                        <div class="media pt-5">
                                            <div class="media-body">
                                                <h5 class="m-b-3">${mail.sender }</h5>
                                                <p class="m-b-2"><fmt:formatDate value="${mail.sentDate }" pattern="yyyy.MM.dd"/></p>
                                            </div>
                                            
                                        </div>
                                        <hr>
                                        <div class="media mb-4 mt-1">
                                            <div class="media-body"><span class="float-right"><fmt:formatDate value="${mail.sentDate }" pattern="HH:mm"/></span>
                                                <h4 class="m-0 text-primary">${mail.subject }</h4>
                                                <small class="text-muted">To:
                                                
                                                	<c:forEach items="${mail.recipients }" var="recipient">
						                                <span class="bootstrap-popover">
						                                    <span data-toggle="tooltip" data-placement="bottom" title data-original-title="${recipient.recipientAddr }">
						                                    	${recipient.recipient }
						                                    </span>
						                                </span>
                                                		
                                                	</c:forEach>
                                                	
                                                </small>
                                            </div>
                                        </div>
                                        <div class="mail-content">
	                                        ${mail.content }
                                        </div>
                                        <hr>
                                        <!-- 메일 본문 끝 -->
                                        
                                        <!-- 메일 첨부파일 시작 -->
                                       <c:if test="${!empty fileList }">
	                                        <h6 class="p-t-15"><i class="fa fa-download mb-2"></i> Attachments <span>(${fn:length(fileList) })</span></h6>
	                                        <div class="row m-b-30">
	                                        	<c:forEach items="${fileList }" var="file">
	                                        		<div class="col-auto">
	                                        			<a href="${file.filePath }" class="text-muted" download>${file.fileName }</a>
	                                            	</div>
	                                        	</c:forEach>
	                                        </div>
                                        	<hr>
                                        </c:if>
                                        <!-- 메일 첨부파일 끝 -->
                                        
                                        
                                        <!-- 빠른 답장 기능을 위한 textarea -->
                                        <div class="form-group p-t-15">
                                            <textarea class="w-100 p-20 l-border-1" name="" id="" cols="30" rows="5" placeholder="빠른 답장"></textarea>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <button class="btn btn-primaryw-md m-b-30" type="button">Send</button>
                                    </div>
                                    <!-- 빠른 답장 기능 끝 -->
							
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
						href="https://themeforest.net/user/quixlab">Quixlab</a> 2018
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
	<script>
		//휴지통으로 이동
		$(function(){
			$(document).on("click", "[name=trash]", function(){
				var thisButton = $(this);
				
				swal({
					title:"삭제 확인",
					text:"메일을 휴지통으로 이동하시겠습니까?",
					type:"warning",
					showCancelButton:!0,
					confirmButtonColor:"#DD6B55",
					confirmButtonText:"네",
					cancelButtonText:"아니오",
					closeOnConfirm:!1},
					function(){
						var mailInfoList = new Array();
						
						mailInfoList.push({"mailNo" : "${mail.mailNo}", "accountNo" : "${mail.accountNo}"});

						console.log(mailInfoList);

						$.ajax({
							type : "POST",
							contentType: "application/json",
							url : "/mail/json/trashMail",
							dataType : "JSON",
							data: JSON.stringify(mailInfoList),
							beforeSend : function(){
								$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
								$("#preloader").fadeIn(300);
							},
							complete : function(){
								$("#preloader").fadeOut(300);
								$("#preloader").attr("style", "disply:none; background:white;");
							},
							success : function(data) {
								swal("변경 완료", "정상적으로 변경되었습니다.", "success");
								
								thisButton.replaceWith(
										'<button type="button" class="btn btn-light" name="inbox"><i class="fa fa-inbox"></i>'
                                    	+  '</button>'
                                        +  '<button type="button" class="btn btn-light" name="delete"><i class="mdi mdi-close-box" style="font-size:20px;"></i>'
                                    	+  '</button>');		
								
							},
							error : function(data) {
								alert("error : " + data)
							}
						});//ajax end
					}//function end
				);//swal end
			});	//.on end

			//완전 삭제
			$(document).on("click", "[name=delete]", function(){
				swal({
					title:"삭제 확인",
					text:"선택한 메일을 완전 삭제하시겠습니까?",
					type:"warning",
					showCancelButton:!0,
					confirmButtonColor:"#DD6B55",
					confirmButtonText:"네",
					cancelButtonText:"아니오",
					closeOnConfirm:!1},
					function(){
							var mailInfoList = new Array();
							
							mailInfoList.push({"mailNo" : "${mail.mailNo}", "accountNo" : "${mail.accountNo}"});

							console.log(mailInfoList);

							$.ajax({
								type : "POST",
								contentType: "application/json",
								url : "/mail/json/deleteMail",
								dataType : "JSON",
								data: JSON.stringify(mailInfoList),
								beforeSend : function(){
									$("#preloader").fadeIn(300);
								},
								success : function(data) {
									location.href = "/mail/getMailList";
								},
								error : function(data) {
									$("#preloader").fadeOut(300);
									swal("삭제 실패", "", "error");
								}
							});//ajax end
							
					}//function end
				);//swal end
			});//.on end
		});//jquery end

			//inbox로 이동
			$(function(){
				$(document).on("click", "[name=inbox]", function(){
					var thisButton = $(this);
					
					swal({
						title:"복구 확인",
						text:"메일을 복구하시겠습니까?",
						type:"warning",
						showCancelButton:!0,
						confirmButtonColor:"#DD6B55",
						confirmButtonText:"네",
						cancelButtonText:"아니오",
						closeOnConfirm:!1},
						function(){
							var mailInfoList = new Array();
							
							mailInfoList.push({"mailNo" : "${mail.mailNo}", "accountNo" : "${mail.accountNo}"});

							console.log(mailInfoList);

							$.ajax({
								type : "POST",
								contentType: "application/json",
								url : "/mail/json/inboxMail",
								dataType : "JSON",
								data: JSON.stringify(mailInfoList),
								beforeSend : function(){
									$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
									$("#preloader").fadeIn(300);
								},
								complete : function(){
									$("#preloader").fadeOut(300);
									$("#preloader").attr("style", "disply:none; background:white;");
								},
								success : function(data) {
									swal("변경 완료", "정상적으로 변경되었습니다.", "success");

									thisButton.next().remove();
									
									thisButton.replaceWith(
											'<button type="button" class="btn btn-light" name="trash"><i class="fa fa-trash"></i>'
                                            + '</button>');		
									
								},
								error : function(data) {
									alert("error : " + data)
								}
							});//ajax end
						}//function end
					);//swal end
				});	//.on end

		});//jquery end



		
		//메읽 읽음 표시 변경
		$(function(){
			$(document).on("click", "[name=setSeen]", function(){
				var mailInfoList = [{"mailNo" : "${mail.mailNo}", "accountNo" : "${mail.accountNo}"}];
				var thisButton = $(this);
				
				$.ajax({
					type : "POST",
					contentType: "application/json",
					url : "/mail/json/setSeenMail",
					dataType : "JSON",
					data: JSON.stringify(mailInfoList),
					beforeSend : function(){
						$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
						$("#preloader").fadeIn(300);
					},
					complete : function(){
						$("#preloader").fadeOut(300);
						$("#preloader").attr("style", "display:none; background:white");
					},
					success : function(data) {
						swal("변경 완료", "정상적으로 변경되었습니다.", "success");
						thisButton.replaceWith(
								'<button type="button" class="btn btn-light" name="setUnSeen"><i class="mdi mdi-email-open"></i>'
                                +'</button>');
					},
					error : function(data) {
						alert("error : " + data)
					}
				});//ajax end
			});
		});

	
		//메읽 읽음 표시 변경
		$(function(){
			$(document).on("click", "[name=setUnSeen]", function(){
				var mailInfoList = [{"mailNo" : "${mail.mailNo}", "accountNo" : "${mail.accountNo}"}];
				var thisButton = $(this);
				
				$.ajax({
					type : "POST",
					contentType: "application/json",
					url : "/mail/json/setUnSeenMail",
					dataType : "JSON",
					data: JSON.stringify(mailInfoList),
					beforeSend : function(){
						$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
						$("#preloader").fadeIn(300);
					},
					complete : function(){
						$("#preloader").fadeOut(300);
						$("#preloader").attr("style", "display:none; background:white");
					},
					success : function(data) {
						swal("변경 완료", "정상적으로 변경되었습니다.", "success");
						thisButton.replaceWith(
								'<button type="button" class="btn btn-light" name="setSeen"><i class="mdi mdi-email"></i>'
                                +'</button>');
					},
					error : function(data) {
						alert("error : " + data);
					}
				});//ajax end
			});
		});


		//체크된 메일 중요 표시 변경
		$(function(){
			$(document).on("click", "[name=setFlag]", function(){
				var mailInfoList = [{"mailNo" : "${mail.mailNo}", "accountNo" : "${mail.accountNo}"}];
				var thisButton = $(this);
				
				$.ajax({
					type : "POST",
					contentType: "application/json",
					url : "/mail/json/setFlagMail",
					dataType : "JSON",
					data: JSON.stringify(mailInfoList),
					beforeSend : function(){
						$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
						$("#preloader").fadeIn(300);
					},
					complete : function(){
						$("#preloader").fadeOut(300);
						$("#preloader").attr("style", "display:none; background:white");
					},
					success : function(data) {
						swal("변경 완료", "정상적으로 변경되었습니다.", "success");
						thisButton.replaceWith(
								'<button type="button" class="btn btn-light" name="setUnFlag"><i class="fas fa-star"></i>'
                                +'</button>');
					},
					error : function(data) {
						alert("error : " + data)
					}
				});//ajax end
							
			});	//.on end
		});//jquery end

		//체크된 메일 중요 표시 해제
		$(function(){
			$(document).on("click", "[name=setUnFlag]", function(){
				var mailInfoList = [{"mailNo" : "${mail.mailNo}", "accountNo" : "${mail.accountNo}"}];
				var thisButton = $(this);

				$.ajax({
					type : "POST",
					contentType: "application/json",
					url : "/mail/json/setUnFlagMail",
					dataType : "JSON",
					data: JSON.stringify(mailInfoList),
					beforeSend : function(){
						$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
						$("#preloader").fadeIn(300);
					},
					complete : function(){
						$("#preloader").fadeOut(300);
						$("#preloader").attr("style", "display:none; background:white");
					},
					success : function(data) {
						swal("변경 완료", "정상적으로 변경되었습니다.", "success");
						thisButton.replaceWith(
								'<button type="button" class="btn btn-light" name="setFlag"><i class="far fa-star"></i>'
                                +'</button>');
					},
					error : function(data) {
						alert("error : " + data)
					}
				});//ajax end
							
			});	//.on end
		});//jquery end

	</script>

</body>

</html>