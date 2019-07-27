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


<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">
</style>

</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
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
        
          
		<div class="content-body" style="min-height: 600px;">
	<div class="row">
        <div class="col-lg-8">
        <div class='container-fluid'>
        <div class='card'>
        <div class='card-body'>
        
	<input type='hidden' id = 'chatRoomNo' value = '${chatRoom.chatRoomNo}'>
	<input type='hidden' id = 'userNo' value = '${user.userNo}'>
	
	${chatRoom.chatRoomNo}
	<!--  화면구성 div Start /////////////////////////////////////-->
	


 <div id='userId'>${user.userId}<br/></div>
 			<div class="panel panel-default" >
				<div class="panel-body">
					<p class="text-left" id="chat_box"></p>
				</div>
			</div>




<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="채팅을 입력해주세요" id="msg">
  <div class="input-group-append">
    <button type="button" class="btn btn-primary" id='msg_process'><i class="mdi mdi-message-text-outline"  style='font-size: 15pt'>
	  	 </i></button>
  </div>
</div>


	
     <div id='multibox'></div>


	<!--  화면구성 div Start /////////////////////////////////////-->
</div>

</div>

</div>
        </div>


</div>


</div>




<!--  ///////////////////////// CSS ////////////////////////// -->


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
	
	<!-- 소켓용 스크립트 -->
<script src="http://localhost:82/socket.io/socket.io.js"></script>
<!-- <script src="http://192.168.0.78:82/socket.io/socket.io.js"></script> -->

	<!--**********************************
        Scripts
    ***********************************-->

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

//툴바 스크립트용 세션체커
var checkSessionUser = ${empty sessionScope.user};
$(function() {
	//var socket = io("http://192.168.0.78:82");
	var socket = io("http://localhost:82");
	socket.emit("identify", $("#userId").text());
	socket.emit("joiner", $("#chatRoomNo").val());
	
	$("#addCafe").on("click" , function() {
		$(self.location).attr("href","/cafe/addCafeView");
	});

	 $("#msg").keydown(function(key) {
         //해당하는 키가 엔터키(13) 일떄
         if (key.keyCode == 13) {
             //msg_process를 클릭해준다.
             msg_process.click();
         }
     });

     //msg_process를 클릭할 때
     $("#msg_process").click(function() {
         //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
         	
		var jsoned = {
				chatRoomNo : $("#chatRoomNo").val(), 
				userNo : $("#userNo").val(), 
				chatType : 0,
				chatMsg : $("#msg").val()
				};
		jsoned = JSON.stringify(jsoned);
	
			$.ajax(
					{
					type : "POST",
					url : "/chat/json/addChat",
					data : jsoned,
					contentType: "application/json", //보내는 컨텐츠의 타입
					//dataType : "json",      //받아올 데이터의 타입 필요없음
					success : function(serverData, status) {
										//alert(status);
										//alert("server에서 온 Data : \n" + serverData);
										//alert(serverData.regDate);
										//targetTag.text(checker);	
										//socket.emit("send_msg", $("#chatRoomNo").val()+":"+$("#msg").val()+serverData.regDate);
										//socket.emit("send_msg", $("#chatRoomNo").val()+"-"+JSON.stringify(serverData));
										socket.emit("send_msg", serverData); 
										 $("#msg").val("");
									},
					error : function(request,status,error){
										alert(request);
										alert(status);
								        alert("에러남 : "+error);

								        socket.emit("send_who", $("#userId").text()+"콘솔에찍히는메시지임");
						
								       }
					}
				);
         
         
         
         
         
         
        
         //#msg에 벨류값을 비워준다.
        
     });
     
     socket.on('send_msg', function(msg) {
     $('<div></div>').text(msg.userNo+" : "+msg.chatMsg+" 입력한 시간 : "+msg.regDate).appendTo("#chat_box");
     });

});
</script>

	<!-- 공통 툴바용 스크립트 -->
	<script src="/js/custom/toolbarScript.js"></script>
	
	<!-- 채팅 사이드 툴바 스크립트 -->
	<script src="/js/custom/chatSideBar.js"></script>


</body>
</html>