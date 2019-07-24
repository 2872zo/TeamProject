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


		<div class="content-body" style="min-height: 600px;">
			<div class="row">
				<div class="col-lg-8">
					<div class='container-fluid'>



<form id='rooming'>
<input type='hidden' name = 'chatRoomNo' id='roomNo' >
</form>
<br/>
	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<div class='card'>
	<div class='card-body'>

	
	<br/>
	<br/>

	<input type='hidden' id='roomNos' value ='${roomNos}'>

	<c:forEach items="${chatRoomList}" var ='chatRoom'>
	
	<div class="card mb-3  xxxxx "  style="max-width: 540px;" name='${chatRoom.chatRoomNo}'>
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="..." class="card-img" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title chatRoom">${chatRoom.chatRoomName}</h5>
        <p class="card-text">${chatRoom.chatRoomNo} </p>
        <p class="card-text"><small class="text-muted" id='${chatRoom.chatRoomNo}'>Last updated 3 mins ago</small></p>
      </div>
    </div>
  </div>
</div>
	</c:forEach>
	
	<div class="panel panel-default" >
				<div class="panel-body">
					<p class="text-left" id="chat_box"></p>
				</div>
			</div>
	
	
		</div><!-- 카드바디 -->
	</div><!-- 카드 -->
	</div><!-- 컨테이너 -->
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


	<!--**********************************
        Scripts
    ***********************************-->

<script src="http://localhost:82/socket.io/socket.io.js"></script>
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
	$(".xxxxx").on("click" , function() {
		//alert("실행됨!");
		var roomNumber =  parseInt($(this).attr('name'));
		//alert(parseInt($(this).attr('name')));
		$("#roomNo").val(parseInt($(this).attr('name')));
		//alert(isNan(roomNumber));
		//alert($("#rooming").serialize());
		$("#rooming").attr("method" , "POST").attr("action" , "/chat/chatRoom").submit();
		
	});
		//alert(${roomNos});
	//var roomNumbers = ${roomNos};
	//socket.emit("joiner", "1515156");
	$("#addChatRoom").on("click" , function() {
		socket.emit("joiner", "1515156");
	});

});
</script>

	<!-- 공통 툴바용 스크립트 -->
	<script src="/js/custom/toolbarScript.js"></script>

	<!-- 채팅 사이드 툴바 스크립트 -->
	<script src="/js/custom/chatSideBar.js"></script>
</body>
</html>