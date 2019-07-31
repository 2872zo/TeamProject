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
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">
<!-- 스위트얼럿 css -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<!-- 스위트얼럿 css -->
<!-- 토스터 css -->
<link rel="stylesheet" href="/plugins/toastr/css/toastr.min.css">
<!-- 토스터 css -->


<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">
.friends {
	border: 1px solid red;
}

img {
	max-width: 100%; /* 이미지의 최대사이즈 */
	height: auto;
	vertical-align: center;
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
					stroke-width="3" stroke-miterlimit="10" />
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
		<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/chat/chatSideMenu.jsp"></c:import>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->
		<!--**********************************
            Content body start
        ***********************************-->
	<input type='hidden' name='positionIndex' id='positionIndex' value='${search.positionIndex}'>

		<div class="content-body" style="min-height: 400px;">
				<div class='container-fluid'>
			<div class="row">
				<div class="col-lg-8">
				

					<div class='card'>
					<div class='card-body'>
						<!-- 상단 친구 종류 선택 버튼 메뉴 -->
						<div class="d-flex justify-content-around">

							<i class="chatButtons mdi mdi-account-multiple-outline" id='chatFriendsListing'style='font-size: 30pt;'>
							</i>
							<i class="chatButtons mdi mdi-account-check" id='wannaBeFriend' style='font-size: 30pt;'>
							</i>
							<i class="chatButtons mdi mdi-account-search" id='friendSearching' style='font-size: 30pt;'>
							</i>
							<i class="chatButtons mdi mdi-sleep-off" style='font-size: 30pt;'>
							</i>

						</div>

						<!-- 상단 친구 종류 선택 버튼 메뉴 -->
						<br/>
						<!-- 친구검색창임 -->
						<c:if test="${search.positionIndex==2}">
						<form>

							<div class='d-flex justify-content-center'>
								<div class="input-group mb-3 " style='width: 50%;'>
									<input type="text" class="form-control form-control-lg"
										placeholder="검색어를 입력해주세요" name='searchKeyword'
										id='searchKeyword'>
									<div class="input-group-append">
										<button class="btn btn-lg btn-outline-primary" type="button"
											id="explore">
											<i class="mdi mdi-magnify" style='font-size: 18pt;'></i>
										</button>
									</div>
								</div>
							</div>
						</form>
						</c:if>
						<!-- 친구검색창임 -->
								
								
						
						<!-- 기본 친구목록화면 시작 -->
						<c:if test="${!empty friendsList}">
							<c:forEach items='${friendsList}' var='chatFriend'>

								<div class="card friends">
									<div class="card-body">
										<div class='row'>
											<div class='col-lg-2'>
												<img alt="" src="/images/uploadfiles/profileimg/${chatFriend.userImg}"
													class='rounded img-fluid' alt="Responsive image" style='width: inherit;'>
											</div>
											<div class='col-lg-7'>
												<h5 class="card-title" id='${chatFriend.chatFriendNo}nickName'>
												<c:if test="${!empty chatFriend.friendNickname}">${chatFriend.friendNickname}</c:if>
												<c:if test="${empty chatFriend.friendNickname}">${chatFriend.userNickname}</c:if>
												</h5>
												<p class="card-text">${chatFriend.chatFriendNo}</p>
												<p class="card-text">원래 닉네임 : ${chatFriend.userNickname}</p>
											</div>
											<div class='col-lg-2'>
											<i class="mdi mdi-tag-text-outline updateFriendName" style='font-size: 25pt;' name='${chatFriend.chatFriendNo}'></i>
											</div>
											<div class='col-lg-1 d-flex align-items-start' name='${chatFriend.userNo}'>
											<i class="mdi mdi-account-minus friendAlready friending" name='${chatFriend.chatFriendNo}' style='font-size: 25pt;'></i>
											</div>
										</div>
									</div>
								</div>

							</c:forEach>

						</c:if>
						<!-- 기본 친구목록화면 끝-->





<!-- 친구되고싶어하는 사람들 나오는 화면 시작 -->
								<c:if test="${!empty wannaBeFreindList}">

									<c:forEach items='${wannaBeFreindList}' var='chatFriend'>

										<div class="card friends" name='${chatFriend.userNo}'>
											<div class="card-body">
												<div class='row'>
													<div class='col-lg-2'>
														<img alt="" src="/images/uploadfiles/profileimg/${chatFriend.userImg}"
															class='rounded img-fluid' alt="Responsive image">
													</div>
													<div class='col-lg-7'>
														<h5 class="card-title">${chatFriend.userNickname}</h5>
														<p class="card-text">${chatFriend.friendNickname}</p>
															<p class="card-text">${chatFriend.userNo}</p>
													</div>
													<div class='col-lg-2'>
													</div>
													<div class='col-lg-1' name='${chatFriend.userNo}'>
													<i class="mdi mdi-account-plus friendYet friending" name='${chatFriend.userNo}' style='font-size: 25pt;'></i>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<!-- 친구되고싶어하는 사람들 나오는 화면 끝-->




								<!-- 친구검색시 나오는 화면 시작 -->
								<c:if test="${!empty searchList}">

									<c:forEach items='${searchList}' var='chatFriend'>

										<div class="card friends" name='${chatFriend.userNo}'>
											<div class="card-body">
												<div class='row'>
													<div class='col-lg-2'>
														<img alt="" src="/images/uploadfiles/profileimg/${chatFriend.userImg}"
															class='rounded img-fluid' alt="Responsive image">
													</div>
													<div class='col-lg-7'>
														<h5 class="card-title">${chatFriend.userNickname}</h5>
														<p class="card-text">With supporting text below as a
															natural lead-in to additional content.</p>
															<p class="card-text">${chatFriend.userNo}</p>
													</div>
													<div class='col-lg-2'>
													</div>
													<div class='col-lg-1' name='${chatFriend.userNo}'>
													<i class="mdi mdi-account-plus friendYet friending" name='${chatFriend.userNo}' style='font-size: 25pt;'></i>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<!-- 친구검색시 나오는 화면 끝-->
							</div>

							<!-- card body -->
						</div>
						<!-- card -->
					</div>

					<!-- #/ container -->

				
				<!-- 왼쪽 컬럼 엔드 -->

				<!-- 오른컬럼이야 -->

				<div class="col-lg-4">

					

						<div class='card'>
							<div class='card-body'>8888주ㅡㄹㅇ야</div>
						</div>
					

				</div>	<!-- 오른쪽컬럼끝야 -->
			
</div><!-- row 엔드 -->
			
</div><!-- 컨테이너엔드 -->

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
	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>

	<!-- 토스트기 -->
	<script src="/plugins/toastr/js/toastr.min.js"></script>

	<!--**********************************
        Scripts
    ***********************************-->

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

//툴바 스크립트용 세션체커
var checkSessionUser = ${empty sessionScope.user};

	//alert($("#positionIndex").val());
	var tempNumber = $("#positionIndex").val();
	//alert(tempNumber);
	//alert($($(".chatButtons")[tempNumber]).attr("style"));
	var beforeStyle=$($(".chatButtons")[tempNumber]).attr("style");
	$($(".chatButtons")[tempNumber]).attr("style", beforeStyle+" color : #f5a142;")
	
		
	$(function() {
		
		$("#chatFriendsListing").on("click", function() {
			//alert("친구찾아라");
			$(self.location).attr("href", "/chat/chatFriendsList");
			});
		
		$("#wannaBeFriend").on("click", function() {
			//alert("친구가 되줘요");
			$("form").attr("method", "POST").attr("action",
			"/chat/wannaBeFriend").submit();
			});

		$("#friendSearching").on("click", function() {
			//alert("친구찾아라");
			$(self.location).attr("href", "/chat/searchChatFriend");
			});
		
		$("#searchKeyword").focus(function() {
			$(this).attr("style", "border: 2px solid #f5a142");
		});

		$("#searchKeyword").blur(function() {
			$(this).attr("style", "");
		});
		
		$("#explore").on("click", function() {
			var keyword = $("#searchKeyword").val()
			$("form").attr("method", "POST").attr("action",
			"/chat/searchChatFriend").submit();
		});

		$("#searchKeyword").on("keydown", function (){
			if(event.keyCode==13){
				$( "#explore" ).trigger( "click" );
			}
		});
		
		$(".updateFriendName").on("click", function() {
			var thisChatFriendNo = $(this).attr("name");
			 var engkornum = /[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]/gi;
			 var emptyOnly = /^\s*\s*$/;
			   
			swal({
				  title: "친구닉네임 변경",
				  text:  "사용하실 친구닉네임을 설정해주세요",
				  type:  "input",
				  showCancelButton: true,
				  closeOnConfirm: false,
				  inputPlaceholder: "한글영문숫자만써주세요"
					}, function (inputValue) {
						if(inputValue.length>15){
							swal.showInputError("15글자 이하로 써주세요");
							   return false;
						}
						if(emptyOnly.test(inputValue)){
							 swal.showInputError("공백만 넣으시면 안됩니다.");
							   return false;
							 }
						if (engkornum.test(inputValue)) {
							 swal.showInputError("영어숫자한글만사용해주세요");
							   return false;
						   }

						var jsoned = {
								chatFriendNo : thisChatFriendNo, 
								friendNickname : inputValue 
								};
						jsoned = JSON.stringify(jsoned);
					
							$.ajax(
									{
									type : "POST",
									url : "/chat/json/updateChatFriend",
									data : jsoned,
									contentType: "application/json", //보내는 컨텐츠의 타입
									//dataType : "json",      //받아올 데이터의 타입 필요없음
									success : function(serverData, status) {
													if(serverData){
														swal("성공적으로 변경되었습니다", "친구명이 " + inputValue+" 로 변경되었습니다.", "success");
														$("#"+thisChatFriendNo+"nickName").text(inputValue);
														

														}		
													else{
														swal("통신과정에서 에러발생", "잠시 후 다시 시도해주세요", "error");
													}
												},
									error : function(request,status,error){
												        swal("통신과정에서 에러발생", "잠시 후 다시 시도해주세요", "error");
												       }
									}
								);

						},
							
						);
			
			});
		

		$(".friending").on("click", function() {
			var inputTarget=$(this);
			if($(this).hasClass("friendYet")){
				friendYet(inputTarget);
				}
			if($(this).hasClass("friendAlready")){
				friendAlready(inputTarget);
				}
		});
		
		function friendYet(sourceTag){
			var targetTag = sourceTag;
			var targetUser = sourceTag.closest('div').attr('name');
			var jsoned = 	{
							targetUserNo : targetUser,
							friendStatus : 0
							};
			jsoned = JSON.stringify(jsoned);
			
			$.ajax({
				type : "POST",
				url : "/chat/json/addChatFriend",
				data : jsoned,
				contentType : "application/json", //보내는 컨텐츠의 타입
				//dataType : "json",      //받아올 데이터의 타입 필요없음
				success : function(serverData, status) {
					
									if(serverData == -1){
										alert("에러나서 등록안됨")
									}
									
									else{
										targetTag.attr("class", "mdi mdi-account-minus friendAlready friending").attr("name", serverData);
										toastr.success(
													"친구목록에서 확인 가능합니다.",
													"친구목록에 추가 되었습니다.",
													{positionClass:"toast-bottom-right",
													timeOut:3e3,closeButton:!0,debug:!1,
													newestOnTop:!0,
													progressBar:!0,
													preventDuplicates:!1,
													onclick:null,
													showDuration:"300",hideDuration:"1000",
													extendedTimeOut:"1000",
													showEasing:"swing",hideEasing:"linear",
													showMethod:"fadeIn",
													hideMethod:"fadeOut",
													tapToDismiss:!1}
														);
							
										}
									
						},
									
				
				error : function(request, status, error) {
					alert("에러남 : " + error);
					}
			});//ajax 끝
			

		}


		function friendAlready(sourceTag){
			var targetTag = sourceTag;
			var friendNumber = targetTag.attr('name');

			var targetUserNo = targetTag.closest('div').attr('name');

			var jsoned = 	{
							chatFriendNo : friendNumber
							};

			jsoned = JSON.stringify(jsoned);
			
			$.ajax({
				type : "POST",
				url : "/chat/json/deleteChatFriend",
				data : jsoned,
				contentType : "application/json", //보내는 컨텐츠의 타입
				//dataType : "json",      //받아올 데이터의 타입 필요없음
				success : function(serverData, status) {
					
									if(serverData == false){
													alert("에러나서 등록안됨")
									}
									
									else{
											targetTag.attr("class", "mdi mdi-account-plus friendYet friending").attr("name", targetUserNo);
											toastr.error(
														"친구목록에서 확인 가능합니다.",
														"친구목록에서 삭제 되었습니다.",
														{positionClass:"toast-bottom-right",
														timeOut:3e3,closeButton:!0,debug:!1,
														newestOnTop:!0,
														progressBar:!0,
														preventDuplicates:!1,
														onclick:null,
														showDuration:"300",hideDuration:"1000",
														extendedTimeOut:"1000",
														showEasing:"swing",hideEasing:"linear",
														showMethod:"fadeIn",
														hideMethod:"fadeOut",
														tapToDismiss:!1}
														);
							
											}
								
				},
									
				
				error : function(request, status, error) {
					alert("에러남 : " + error);
				}
			});//ajax 끝

			
			}
		
	});
</script>

	<!-- 공통 툴바용 스크립트 -->
	<script src="/js/custom/toolbarScript.js"></script>

	<!-- 채팅 사이드 툴바 스크립트 -->
	<script src="/js/custom/chatSideBar.js"></script>


	<!--  ///////////////////////// JavaScript ////////////////////////// -->
</body>

</html>