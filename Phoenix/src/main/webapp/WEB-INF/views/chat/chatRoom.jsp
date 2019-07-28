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

::-webkit-scrollbar {
  width: 5px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey; 
  border-radius: 2px;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #f5a142; 
  border-radius: 2px;
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
		<div class='container-fluid'>
		<div class="row">
       
        <div class="col-lg-8">
        <div class='card'>
        <div class='card-body'>
        방제목이랑 번호같은 거 넣자
        </div>
        </div>
	    </div>
	    
	    <div class="col-lg-4">
        <div class='card'>
        <div class='card-body'>
        접속한 당사자 정보를 넣자
        </div>
        </div>
	    </div>
	    
	    
        </div>
       
	<div class="row" style='height:600px'>
        <div class="col-lg-8">
        <div class='card' style='height:100%'>
        <div class='card-body'>
        
	<input type='hidden' id = 'chatRoomId' value = '${chatRoomId}'>
	<input type='hidden' id = 'userNo' value = '${sessionScope.user.userNo}'>
	<input type='hidden' id = 'userNickname' value = '${sessionScope.user.userNickname}'>
	<input type='hidden' id = 'profileImg' value = '${sessionScope.user.profileImg}'>

	<!--  화면구성 div Start /////////////////////////////////////-->

 <div id='userId'>${user.userId}<br/></div>
				<div class="panel-body" id='chat_box2' style=" overflow-x:hidden; overflow-y:auto; width:100%;">
					<!-- <p class="text-left" id="chat_box" > -->
					<div id='chat_box' wrap="hard" style='height:600px;'>
					<c:forEach items='${chatList}' var='chat'>
					<div class='row d-flex justify-content-start'>
						<div class='col-lg-1'>
							<img src="/images/uploadfiles/profileimg/${chat.profileImg}"
								 class='rounded' style='width: 32px; height: 32px'>
						</div>
						<div class='col-lg-6' style='padding-left: 5px;'>
							${chat.userNickname}
							<div class="alert" name='${chat.id}' 
							style='padding:5px; width: 100%;
							margin-top:5px; 
							border: 2px solid #f5a142; color: black;' >
							${chat.chatMsg}
							</div>
						</div>
						<div class='col-lg-2' style='padding-left: 0px; margin-top:5px;'>
							<br/>${chat.regDate}
						</div>
					</div>
					
					<div class='row d-flex justify-content-end'>
						
						<div class='col-lg-2 text-right' style='padding-right: 0px;'>
							${chat.regDate}
						</div>
						<div class='col-lg-6' style='padding-right: 20px;'>
							<div class="alert" 
							name='${chat.id}' style='padding:5px; width: 100%; 
							border: 2px solid #f5a142; color: black;
							background-color:#f5a142; ' >
							${chat.chatMsg}
							</div>
						</div>
							
					</div>

					</c:forEach>
					
					
					</div>
					<!--  </p>-->
				</div>
<br/>
<i class="mdi mdi-file-image" style='font-size:25pt;'></i>
<i class="mdi mdi-emoticon" style='font-size:25pt;'></i>
<div class="input-group d-flex">
  <input type="text" class="form-control" placeholder="채팅을 입력해주세요" id="msg">
  <div class="input-group-append">
    <button type="button" class="btn btn-primary" id='msg_process'><i class="mdi mdi-message-text-outline"  style='font-size: 15pt'>
	  	 </i></button>
  </div>
</div>


	<!--  화면구성 div Start /////////////////////////////////////-->
</div>

</div>

        </div>
        
        <div class="col-lg-4">
         	<div class='card' style="width:auto; height: 50%;">
        	<div class='card-body'>
        참가자 목록 띄워놓을 창이야
        <c:forEach items='${userList}' var='chatRoomInfo'>
					${chatRoomInfo.userNickname}<br/>
					${chatRoomInfo.profileImg}<br/>
					${chatRoomInfo.userNo}
					
					</c:forEach>
					<br/>
					<i class="mdi mdi-playlist-plus" style='font-size: 40pt'></i>
        	</div>
        	</div>
    	
        	<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	채팅에 초대하기
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body" style="overflow-x:hidden; overflow-y:auto; height: 200px;">
      <c:forEach items='${inviteList}' var='chatFriend'>
      <div class='row d-flex justify-content-start' name='${chatFriend.userNo}' style='border: 1px solid #f5a142; margin-bottom: 1%;'>
	      <div class='col-lg-2'>
	      <img src="/images/uploadfiles/profileimg/${chatFriend.userImg}"
								 class='rounded' style='width: 32px; height: 32px'>
	      </div>
	      <div class='col-lg-8'>
	      ${chatFriend.userNickname}
	      </div>
      </div>
      
      
      </c:forEach>
      
     
      </div>
    </div>
  </div>
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
	//alert($("#userNickname").val());
	//var socket = io("http://192.168.0.78:82");
	var socket = io("http://localhost:82");
	socket.emit("identify", $("#userNo").text());
	socket.emit("joiner", $("#chatRoomId").val());
	
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
				chatRoomId : $("#chatRoomId").val(), 
				userNo : $("#userNo").val(), 
				userNickname : $("#userNickname").val(),
				profileImg : $("#profileImg").val(),
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
        
     });
     
     socket.on('send_msg', function(msg) {
         //로그아웃 체크 : 레스트 컨트롤러로 서버한번 태워서 세션에 유저Number 체크해서 날려야 될듯
    	//var scrollT = $("#chat_box2").scrollTop(); //스크롤바의 상단위치
        //var contentH = $('#chat_box').height();
		//alert(scrollT);
		//alert(contentH);
		
     $('<div></div>').text(msg.userNickname+" : "+msg.chatMsg+" 입력한 시간 : "+msg.regDate).appendTo("#chat_box");
     });

});
</script>

	<!-- 공통 툴바용 스크립트 -->
	<script src="/js/custom/toolbarScript.js"></script>
	
	<!-- 채팅 사이드 툴바 스크립트 -->
	<script src="/js/custom/chatSideBar.js"></script>


</body>
</html>