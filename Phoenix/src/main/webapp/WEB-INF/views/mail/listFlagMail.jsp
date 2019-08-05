<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">
<script src="https://kit.fontawesome.com/e589319d43.js"></script>


<style>
	tr:hover{
		cursor:pointer;
	}
	
	tr:last-child:hover{
		background-color:white !important;
		cursor:default;
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
			<c:import url="/WEB-INF/views/mail/common/mailListToolbar.jsp"></c:import>
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
							<h4 class="card-title">${search.boardName }</h4>
							<div class="table-responsive">
								<form id="boardPage">
									<input type="hidden" name="currentPage">
								</form>
								<p>총 ${totalCount }개 중 ${search.startRowNum} - 
									<c:if test="${search.endRowNum > totalCount}">${totalCount }</c:if> 
									<c:if test="${search.endRowNum <= totalCount}">${search.endRowNum }</c:if>
								</p>
								<table class="table table-hover">
									<tbody>
										<c:forEach items="${mailList }" var="mail">
											<tr>
												<input type="hidden" class="mailNo" value="${mail.mailNo }">
												<input type="hidden" class="accountNo" value="${mail.accountNo }">
												<td><input type="checkbox" onclick="event.cancelBubble = true;"></td>
												<td>
													<c:if test="${mail.seen}">
														<a class="seenFlag" onclick="event.cancelBubble = true;">
															<i class="mdi mdi-email-open"></i>
														</a>
													</c:if>
													<c:if test="${!mail.seen}">
														<a class="seenFlag" onclick="event.cancelBubble = true;">
															<i class="mdi mdi-email"></i>
														</a>
													</c:if>
												</td>
												<td>${mail.folder.fullName }</td>
												<td>${mail.sender }&nbsp;<xmp>${mail.senderAddr }</xmp></td>
												<td>${mail.subject }</td>
												<td>
													<fmt:formatDate value="${mail.sentDate }" pattern="yyyy.MM.dd HH:mm:ss"/>
												</td>
											</tr>
										</c:forEach>
										
										<tr>
											<td colspan="6">
												<c:import url="/WEB-INF/views/common/pageNavigator.jsp">
													<c:param name="subject" value="FlagMail"/>		
												</c:import>
											</td>
										</tr>
										
									</tbody>
								</table>
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
		$(function(){
			$("tr").not("tr:last").on("click", function(){
				location.href = "/mail/getMail?mailNo=" + $(this).find(".mailNo").val() + "&accountNo=" + $(this).find(".accountNo").val();
			});
		});
	</script>

</body>

</html>