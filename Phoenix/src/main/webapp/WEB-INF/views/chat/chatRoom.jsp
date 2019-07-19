<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>CafeTabMain</title>

<!-- ////////////////////////////// jQuery CDN ////////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
 integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
 crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
 integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
 crossorigin="anonymous"></script>
<!-- ////////////////////////////// bootstrap CDN ////////////////////////////// -->
<link rel="stylesheet"
 href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
 crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
 integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
 crossorigin="anonymous"></script>

<script src="http://localhost:82/socket.io/socket.io.js"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {
	var socket = io("http://192.168.0.78:82");
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
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../common/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
</head>

<body>
	<input type='hidden' id = 'chatRoomNo' value = '${chatRoom.chatRoomNo}'>
	<input type='hidden' id = 'userNo' value = '${user.userNo}'>
	
	${chatRoom.chatRoomNo}
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">


 <div id='userId'>${user.userId}<br/></div>
 			<div class="panel panel-default" >
				<div class="panel-body">
					<p class="text-left" id="chat_box"></p>
				</div>
			</div>

    <div class="input-group">
  	<input type="text" class="form-control" placeholder="채팅을 입력해주세요" aria-describedby="basic-addon2" id="msg">
  		<span class="input-group-btn">
        <button class="btn btn-success" type="button" id="msg_process">전송!</button>
      </span>
	</div>
	
     <div id='multibox'></div>

</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>