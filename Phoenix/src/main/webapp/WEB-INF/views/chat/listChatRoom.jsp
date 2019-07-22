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
	//var socket = io("http://192.168.0.78:82");
	var socket = io("http://localhost:82");
	
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
	$(".card").on("click" , function() {
		$("#roomNo").val($(this).attr('name'));
		$("#rooming").attr("method" , "POST").attr("action" , "/chat/chatRoom").submit();
		//alert($(this).attr('id'));
	});
		//alert(${roomNos});
	//var roomNumbers = ${roomNos};
	//socket.emit("joiner", "1515156");
	$("#addChatRoom").on("click" , function() {
		socket.emit("joiner", "1515156");
	});

});
</script>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../common/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
</head>

<body>
<form id='rooming'>
<input type='hidden' name = 'chatRoomNo' id='roomNo' value='' >
</form>
<br/>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<br/>
	<br/>

	<input type='hidden' id='roomNos' value ='${roomNos}'>

	<c:forEach items="${chatRoomList}" var ='chatRoom'>
	
	<div class="card mb-3 "  style="max-width: 540px;" name='${chatRoom.chatRoomNo}'>
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
	
	
	
	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>