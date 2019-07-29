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


		<div class="content-body">
			
				
					<div class='container-fluid'>
					<div class="row">
<div class="col-lg-8">


<form id='rooming'>
<input type='hidden' name = 'chatRoomId' id='chatRoomId' >
</form>

	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<div class='card'>
	<div class='card-body'>

	

	<input type='hidden' id='roomNos' value ='${roomNos}'>

	<c:forEach items="${chatRoomList}" var ='chatRoomInfo'>
	
	<div class="card mb-3  enterTheRoom" name='${chatRoomInfo.chatRoomId}' id='${chatRoomInfo.id}'>
  <div class="row">
    <div class="col-lg-4">
      <img src="..." class="card-img" alt="...">
    </div>
    <div class="col-lg-8">
      <div class="card-body">
        <h5 class="card-title chatRoom">${chatRoomInfo.chatRoomId}</h5>
        <p class="card-text">${chatRoomInfo.chatRoomName}</p>
        <p class="card-text">${chatRoomInfo.userNo}</p>
        <p class="card-text">${chatRoomInfo.id} </p>
        <p class="card-text">${chatRoomInfo.userNickname} </p>
                <p class="card-text">${chatRoomInfo.profileImg} </p>
                <p class="card-text">${chatRoomInfo.regDate} </p>
        
        <p class="card-text">${chatRoomInfo.profileImg} </p>
        <p class="card-text"><small class="text-muted" id='${chatRoomInfo.chatRoomId}'>Last updated 3 mins ago</small></p>
      </div>
    </div>
  </div>
</div>
	</c:forEach>
	
	
	
		</div><!-- 카드바디 -->
	</div><!-- 카드 -->
	</div><!-- 컨테이너 -->

	<div class='col-lg-4'>
	<div class='card'>
	<div class='card-body'>
		<i class="mdi mdi-comment-plus-outline" style='font-size: 30pt' id='addingChatRoom'></i>
	</div>
	</div>

	</div>
		</div>
	</div>
	</div>
	</div>
	
	<!--  화면구성 div Start /////////////////////////////////////-->
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


<!-- 소켓용 스크립트 -->
<!-- <script src="http://localhost:82/socket.io/socket.io.js"></script> -->
 <script src="http://192.168.0.78:82/socket.io/socket.io.js"></script> 


	<!--**********************************
        Scripts
    ***********************************-->

<!--  ///////////////////////// CSS ////////////////////////// -->

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function() {
	
	var checkSessionUser = ${empty sessionScope.user};
	var socket = io("http://192.168.0.78:82");
	//var socket = io("http://localhost:82");
	
	//socket.emit("joiner", ${sessionScope.user.userNo});
	//alert("1");
	//var roomNumbers = ${sessionScope.roomNos};
	//alert(${sessionScope.roomNos});
	//노드쪽에 유저번호 전송
	socket.emit("identify", ${sessionScope.user.userNo});
	socket.emit("joiner", $("#roomNos").val());

	socket.on('send_msg', function(msg) {
		//var splitter = msg.split(":");
		//alert("11");
		var msgTo= msg.chatRoomNo;
		$("#"+msgTo+"").text(msg.chatMsg);
	});
	 //    $('<div></div>').text(msg).appendTo("#"+msgTo+"");
	   //  });
    
	//
	//if(${!empty sessionScope.user}){
	//	
	//	};
	//
	//	
	$("#addingChatRoom").on("click" , function() {
		//alert("채팅방 만들기 버튼입니다.");
		$(self.location).attr("href", "/chat/addChatRoom");
	});
	$(".enterTheRoom").on("click" , function() {
		//alert("실행됨!");
		//var roomNumber =  parseInt($(this).attr('name'));
		//alert(parseInt($(this).attr('name')));
		$("#chatRoomId").val($(this).attr('name'));
		//alert(isNan(roomNumber));
		//alert($("#rooming").serialize());
		$("#rooming").attr("method" , "POST").attr("action" , "/chat/enterChatRoom").submit();
		
	});
		//alert(${roomNos});
	//var roomNumbers = ${roomNos};
	//socket.emit("joiner", "1515156");
	//$("#addChatRoom").on("click" , function() {
	//	socket.emit("joiner", "1515156");
	//});

});
</script>

	<!-- 공통 툴바용 스크립트 -->
	<script src="/js/custom/toolbarScript.js"></script>

	<!-- 채팅 사이드 툴바 스크립트 -->
	<script src="/js/custom/chatSideBar.js"></script>
</body>
</html>