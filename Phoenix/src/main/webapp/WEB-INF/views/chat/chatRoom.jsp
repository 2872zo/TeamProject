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
#fileMultiple{
display : none;
}
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
                <circle class="path" cx="50" cy="50" r="20" 
                fill="none" stroke-width="3" stroke-miterlimit="10" />
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
    

<c:forEach items='${nickNameList}' var='chatFriend'>
<input type='hidden' class='friendNickname' value='${chatFriend.friendNickname}'>
<input type='hidden' class='friendUserNo' value='${chatFriend.userNo}'>
</c:forEach>
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
		<form id='fileMultiple' action='/chat/fileUpload' enctype="multipart/form-data" method="post">
		<input multiple='multiple' type="file" id="uploadFile" name="file[]" >
		</form>
		<div class="row">
       
        <div class="col-lg-8" id='${chatRoomInfo.id}'>
        <div class='card'>
        <div class='card-body'>
	        <div class='row d-flex justify-content-between'>
		        <div class='col-lg-9 d-flex align-items-center'>
		       	<h4><strong id='recentChatRoomName'>${chatRoomInfo.chatRoomName}</strong></h4>
		        </div>
		     
		        <div class='col-lg-3 d-flex align-items-center justify-content-around'>
		        <i class="mdi mdi-pencil" style='font-size: 20pt' id='updateChatRoomName'>
		        </i>
		        <fmt:formatDate value="${chatRoomInfo.regDate}" 
		        type="both" pattern="yyyy-MM-dd E a hh:mm:ss"/>
		        </div>
	        </div>
        </div>
        </div>
	    </div>
	    
	    <div class="col-lg-4">
        <div class='card'>
        <div class='card-body'>
        
        <div class='row d-flex justify-content-start' name='${sessionScope.user.userNo}' style='padding-bottom: 1%;'>
	      <div class='col-lg-2'>
	      <img src="/images/uploadfiles/profileimg/${sessionScope.user.profileImg}"
								 class='rounded' style='width: 48px; height: 48px'>
	      </div>
	      <div class='col-lg-8 d-flex align-items-center'>
	      <h4><strong>${sessionScope.user.userNickname}</strong></h4>
	      </div>
      </div>

        </div>
        </div>
	    </div>
	    
        </div>
       
	<div class="row">
        <div class="col-lg-8">
        <div class='card' style='height:100%'>
        <div class='card-body'>
        <form id='getChatForm'>
        <input type='hidden' id='chatIndex' name='chatIndex' value='${chatIndex}'>
        </form>
<form id='thisChatRoomInfo'>
    <input type='hidden' id='chatRoomInfoId' name='id' 			 value='${chatRoomInfo.id}'>
	<input type='hidden' id='chatRoomId' 	 name='chatRoomId' 	 value='${chatRoomInfo.chatRoomId}'>
	<input type='hidden' id='userNo' 	 	 name='userNo' 		 value='${sessionScope.user.userNo}'>
	<input type='hidden' id='userNickname'	 name='userNickname' value='${sessionScope.user.userNickname}'>
	<input type='hidden' id='profileImg'	 name='profileImg' 	 value='${sessionScope.user.profileImg}'>
</form>
	<!--  화면구성 div Start /////////////////////////////////////-->


	<div class="panel-body" id='chat_box2' 
	style="width:100%; ">
		<!-- <p class="text-left" id="chat_box" > -->
		<div id='chat_box' wrap="hard" style='height:500px ;overflow-x:hidden; overflow-y:auto;;'>
		<c:forEach items='${chatList}' var='chat'>
		
			<!-- 다른사람이 입력한 채팅인 경우 -->
			<c:if test="${sessionScope.user.userNo!=chat.userNo}">
			
			<div class='row d-flex justify-content-start'>
				<div class='col-lg-1'>
					<img src="/images/uploadfiles/profileimg/${chat.profileImg}"
						 class='rounded' style='width: 48px; height: 48px'>
				</div>
				<div class='col-lg-6' style='padding-left: 5px;'>
					${chat.userNickname}
					<div class="alert" name='${chat.id}' 
					style='padding:5px; width: 100%;
					margin-top:5px; 
					border: 2px solid #f5a142; color: black;' >
					<c:if test="${chat.chatType==0}">
					${chat.chatMsg}
					</c:if>
					<c:if test="${chat.chatType==1}">
					
					<img src='/images/uploadfiles/chatFiles/${chat.chatMsg}' class='rounded' 
					style='width: 100%; height: auto;'>
					
					</c:if>
					<c:if test="${chat.chatType==2}">
					
					<img src='/images/common/700by700.png' class='rounded' 
					style="background: url('/images/chatEmoticon/${chat.chatMsg}'); 
					background-size: cover; background-repeat: no-repeat; 
					background-position: center; width:50%; margin: 1%; padding:0%;">
					
					</c:if>
					</div>
				</div>
				<div class='col-lg-2' style='padding-left: 0px; margin-top:5px;'>
					<br/><fmt:formatDate value="${chat.regDate}" type="both" pattern="yy-MM-dd HH:mm"/>
				</div>
			</div>
			</c:if>
			<!-- 다른사람이 입력한 채팅인 경우 -->
			
			<!-- 자기가 입력한 채팅인 경우 -->
			<c:if test="${sessionScope.user.userNo==chat.userNo}">
			<div class='row d-flex justify-content-end'>
				
				<div class='col-lg-2 text-right' style='padding-right: 0px;'>
					<fmt:formatDate value="${chat.regDate}" type="both" pattern="yy-MM-dd HH:mm"/>
				</div>
				<div class='col-lg-6' style='padding-right: 20px;'>
					<div class="alert" 
					name='${chat.id}' style='padding:5px;
					border: 2px solid #f5a142; color: #162ca8;
					background-color:#ffc68a; ' >
					<c:if test="${chat.chatType==0}">
					${chat.chatMsg}
					</c:if>
					<c:if test="${chat.chatType==1}">
					
					<img src='/images/uploadfiles/chatFiles/${chat.chatMsg}' 
					class='rounded' style='width: 100%; height: auto;'>
					
					</c:if>
					
					<c:if test="${chat.chatType==2}">
					
					<img src='/images/common/700by700.png' class='rounded' 
					style="background: url('/images/chatEmoticon/${chat.chatMsg}'); 
					background-size: cover; background-repeat: no-repeat; 
					background-position: center; width:50%; margin: 1%; padding:0%;">
					
					</c:if>
					
					</div>
				</div>
					
			</div>
			</c:if>
			<!-- 자기가 입력한 채팅인 경우 -->

		</c:forEach>
		
		
		</div>
		<!--  </p>-->
	</div>
<br/>
<i class="mdi mdi-file-image" style='font-size:25pt;' id='fileUploadButton'></i>
<i class="mdi mdi-emoticon" style='font-size:25pt;' id='emoticon' data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false"></i>


<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Toggle first</a>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Toggle second</button>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2">Toggle </button>
</p>

  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample1">
      <div class="card card-body">
      <div class="row">
     <c:forEach items='${kakaoImgs}' var='kakao'>
      <img src="/images/common/700by700.png"
	     class="rounded col-lg-2 emoticons"
	     name="kakao/${kakao}"
	     style="background: url('/images/chatEmoticon/kakao/${kakao}'); 
	     background-size: cover; 
	     background-repeat: no-repeat; 
	     background-position: center;
	     width:100%; 
	     margin: 1%;
	     padding:0%;">
	 </c:forEach>

				 </div>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample2">
      <div class="card card-body">
      <div class="row">
        <c:forEach items='${lineImgs}' var='line'>
      <img src="/images/common/700by700.png"
	     class="rounded col-lg-2 emoticons"
	     name="line/${line}"
	     style="background: url('/images/chatEmoticon/line/${line}'); 
	     background-size: cover; 
	     background-repeat: no-repeat; 
	     background-position: center;
	     width:100%; 
	     margin: 1%;
	     padding:0%;">
	 </c:forEach>
      </div>
      </div>
    </div>
  </div>

<div class="input-group d-flex">
  <input type="text" class="form-control" placeholder="채팅을 입력해주세요" id="msg">
  <div class="input-group-append">
    <button type="button" class="btn btn-primary" id='msg_process'>
    	<i class="mdi mdi-message-text-outline" style='font-size: 15pt;'>
	  	</i>
  	</button>
  </div>
</div>
<div><i class="mdi mdi-exit-to-app" style='font-size:25pt;' id='leaveChatRoom'></i>
</div>

	<!--  화면구성 div Start /////////////////////////////////////-->
</div>

</div>

        </div>
        
        <div class="col-lg-4">
         	<div class='card' 
         	style="overflow-x:hidden; overflow-y:auto; width:auto; height: 50%;">
        	<div class='card-body' id ='joinerList'>
        	
			<c:forEach items='${userList}' var='chatRoomInfo'>
	        
		        <div class='row d-flex justify-content-start' 
		        name='${chatRoomInfo.userNo}' style='border: 1px solid #f5a142; 
		        margin-bottom: 1%;'>
			      <div class='col-lg-2'>
			      <img src="/images/uploadfiles/profileimg/${chatRoomInfo.profileImg}"
						class='rounded' style='width: 48px; height: 48px'>
			      </div>
			      <div class='col-lg-8'>
			      ${chatRoomInfo.userNickname}
			      </div>
		      	</div>
	      	
			</c:forEach>
					
        	</div>
        	</div>
    	
        	<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <div class='row'>
        <div class='col-lg-9'>
	        <button class="btn btn-primary btn-block d-flex align-items-center" 
	        type="button" data-toggle="collapse" data-target="#invitationList" 
	        aria-expanded="true" aria-controls="collapseOne">
	          	초대가능한 친구목록
	        </button>
        </div>
        <div class='col-lg-2'>
			<i class="mdi mdi-playlist-plus d-flex align-items-center" 
			style='height: 100%;width: auto;' id = 'doInviting'></i>
      	</div>
      </div>
      </h2>
    </div>

    <div id="invitationList" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body" style="overflow-x:hidden; overflow-y:auto; height: 200px;">
      
      <c:forEach items='${inviteList}' var='chatFriend'>
     
   <div class='row inviteList' id='${chatFriend.userNo}' name='${chatFriend.userNickname}' 
   value='${chatFriend.userImg}' 
   style='border:1px solid #f5a142; margin-bottom: 1%; background-color: white;'>
		      <div class='col-lg-2'>
		      <img src="/images/uploadfiles/profileimg/${chatFriend.userImg}"
									 class='rounded' style='width: 48px; height: 48px'>
		      </div>
		      <div class='col-lg-8 d-flex align-items-center'>
		      <c:if test="${empty chatFriend.friendNickname}">
		      ${chatFriend.userNickname}
		      </c:if>
		      <c:if test="${!empty chatFriend.friendNickname}">
		      ${chatFriend.friendNickname}
		      </c:if>
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
<!-- <script src="http://localhost:82/socket.io/socket.io.js"></script> -->
 <script src="http://192.168.0.78:82/socket.io/socket.io.js"></script>

	<!--**********************************
        Scripts
    ***********************************-->

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

//툴바 스크립트용 세션체커
var checkSessionUser = ${empty sessionScope.user};

var socket = io("http://192.168.0.78:82");
//var socket = io("http://localhost:82");

//소켓에 유저넘버랑 방번호 보내줌
socket.emit("identify", ${sessionScope.user.userNo});
socket.emit("joiner", $("#chatRoomId").val());

//페이지 열자마자 채팅 맨 밑으로...
$("#chat_box").scrollTop($("#chat_box").prop('scrollHeight'));

var nickNames = new Array();
var userNos = new Array();

for(var i =0;i<$(".friendNickname").length;i++){
	nickNames[i]=$($(".friendNickname")[i]).val();
	userNos[i]=Number($($(".friendUserNo")[i]).val());
}

$("#fileUploadButton").on("click", function(){
		$("#uploadFile").click();
});
$("#uploadFile").change(function(){
	
	var formData = new FormData($("#fileMultiple").get(0));

	formData.set("chatRoomId" , $("#chatRoomId").val());
	formData.set("userNickname" , $("#userNickname").val());
	formData.set("userNo" , $("#userNo").val());
	formData.set("profileImg" , $("#profileImg").val());
	formData.set("chatType" , "1");
	
	$.ajax(
			{
			type : "POST",
			enctype:"multipart/form-data",
			url : "/chat/fileUpload",
			data : formData,
			processData: false,
			contentType:false,
			//contentType: "application/json", //보내는 컨텐츠의 타입
			dataType : "json",      //받아올 데이터의 타입 필요없음
			beforeSend : function(){
				$("#preloader").attr("style", "background:rgba(255,245,217,0.5);");
			},
			complete : function(){
				$("#preloader").attr("style", "display:none;");
			}, 
			success : function(serverData, status) {
						$.each(serverData, function (index, chat) {
							alert(chat.chatMsg);
							socket.emit("send_msg", chat);
						});
					},
			error : function(request,status,error){
						 alert("에러남 : "+request+" : "+status+" : "+error);
				  }
			}
		);
	 
});

$(function() {

	//이전 채팅 읽기 리버스 무한 스크롤
	$("#chat_box").on('scroll', function(){
		//스크롤바 맨 위 위치
		var top = $("#chat_box").scrollTop();
		//채팅 남은갯수
		var pagingChecker = $("#chatIndex").val();
		//20당 한줄 정도 잡으면 될듯 긁어오고 아래로 스크롤링할 양
		var scrolldownsize= 100;
		
		if(top===0 && pagingChecker>0 ){

			var jsoned = {
				chatRoomId : $("#chatRoomId").val(), 
				chatIndexNow : $("#chatIndex").val(), 
				};
			
			jsoned = JSON.stringify(jsoned);
	
			$.ajax(
					{
					type : "POST",
					url : "/chat/json/getMoreChat",
					data : jsoned,
					contentType: "application/json", //보내는 컨텐츠의 타입
					//dataType : "json",      //받아올 데이터의 타입 필요없음
					success : function(serverData, status) {
										$("#chatIndex").val(serverData.indexNow);
										$.each(serverData.chatList, function (index, chat) {
											var msgTagging="";
									      	var date = new Date(chat.regDate);
									        chat.regDate = getFormatDate(date);

									        if(chat.chatType==1){
									        	chat.chatMsg = "<img src='/images/uploadfiles/chatFiles/"
																+msg.chatMsg
																+"' class='rounded' style='width: 100%; height: auto;'>";
											}
											
											if (chat.userNo==$("#userNo").val()){
												msgTagging = "<div class='row d-flex justify-content-end'>"
													+"<div class='col-lg-2 text-right' style='padding-right: 0px;'>"
													+chat.regDate
													+"</div><div class='col-lg-6' style='padding-right: 20px;'>"
													+"<div class='alert' name='"+chat.id+
													"' style='padding:5px; width: 100%;border: 2px solid #f5a142;" 
													+"color: #162CA8;background-color:#ffc68a; ' >"
													+chat.chatMsg
													+"</div></div></div>"				
												}
											
											else if (chat.userNo!=$("#userNo").val()){

												if(userNos.indexOf(chat.userNo)!=-1){
													chat.userNickname = nickNames[userNos.indexOf(chat.userNo)]
													} 
												
												msgTagging = "<div class='row d-flex justify-content-start'>"
													+"<div class='col-lg-1'>"
													+"<img src='/images/uploadfiles/profileimg/"
													+chat.profileImg
													+"'  class='rounded' style='width: 48px; height: 48px'></div>"
													+"<div class='col-lg-6' style='padding-left: 5px;'>"
													+chat.userNickname
													+"<div class='alert' name='"
													+chat.id
													+"' style='padding:5px; width: 100%;"
													+"margin-top:5px; border: 2px solid #f5a142; color: black;' >"
													+chat.chatMsg
													+"</div></div>"
													+"<div class='col-lg-2' style='padding-left: 0px; margin-top:5px;'>"
													+"<br/>"
													+chat.regDate
													+"</div></div>"
												}

											$(msgTagging).prependTo("#chat_box");

											$("#chat_box").scrollTop(scrolldownsize);
											
											});

									},
					error : function(request,status,error){
								        alert("에러남 : "+error);
								        //socket.emit("send_who", $("#userId").text()+"콘솔에찍히는메시지임");
								       }
					}
				);
			}
		
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
	    var msgVar = $("#msg").val();
	    //태그 삭제
	    msgVar = msgVar.replace(/(<([^>]+)>)/ig,"");
	    var emptyOnly = /^\s*\s*$/;
	    if(emptyOnly.test(msgVar)){
			msgVar = "<br/>";
	        } 
	    
		var jsoned = {
				chatRoomId : $("#chatRoomId").val(), 
				userNo : $("#userNo").val(), 
				userNickname : $("#userNickname").val(),
				profileImg : $("#profileImg").val(),
				chatType : 0,
				chatMsg : msgVar
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
										socket.emit("send_msg", serverData); 
										 $("#msg").val("");
									},
					error : function(request,status,error){
								        alert("에러남 : "+error);
								        //socket.emit("send_who", $("#userId").text()+"콘솔에찍히는메시지임");
								       }
					}
				);
	   
	});

	socket.on('send_msg', function(msg) {
	    //로그아웃 체크 : 레스트 컨트롤러로 서버한번 태워서 세션에 유저Number 체크해서 날려야 될듯
		
	    var msgTagging="";
	    var date = new Date(msg.regDate);
	    msg.regDate = getFormatDate(date);

	     if(msg.chatType==1){
				msg.chatMsg = "<img src='/images/uploadfiles/chatFiles/"
								+msg.chatMsg
								+"' class='rounded' style='width: 100%; height: auto;'>";
			}

		if(msg.chatType==2){

			msg.chatMsg = "<img src='/images/common/700by700.png' class='rounded' "
							+"style='background: url(\"/images/chatEmoticon/"
							+msg.chatMsg
							+"\"); background-size: cover; background-repeat: no-repeat; background-position: center;"
							+"width:50%; margin: 1%; padding:0%;'>"
			}
		
		if (msg.userNo==$("#userNo").val()){
			
			msgTagging = "<div class='row d-flex justify-content-end'>"
				+"<div class='col-lg-2 text-right' style='padding-right: 0px;'>"
				+msg.regDate
				+"</div><div class='col-lg-6' style='padding-right: 20px;'>"
				+"<div class='alert' name='"+msg.id+
				"' style='padding:5px; width: 100%;border: 2px solid #f5a142;" 
				+"color: #162CA8;background-color:#ffc68a; ' >"
				+msg.chatMsg
				+"</div></div></div>"	
			
			}
		
		else if (msg.userNo!=$("#userNo").val()){

			if(userNos.indexOf(msg.userNo)!=-1){
				msg.userNickname = nickNames[userNos.indexOf(msg.userNo)]
				} 

			msgTagging = "<div class='row d-flex justify-content-start'>"
					+"<div class='col-lg-1'>"
					+"<img src='/images/uploadfiles/profileimg/"
					+msg.profileImg
					+"'  class='rounded' style='width: 48px; height: 48px'></div>"
					+"<div class='col-lg-6' style='padding-left: 5px;'>"
					+msg.userNickname
					+"<div class='alert' name='"
					+msg.id
					+"' style='padding:5px; width: 100%;"
					+"margin-top:5px; border: 2px solid #f5a142; color: black;' >"
					+msg.chatMsg
					+"</div></div>"
					+"<div class='col-lg-2' style='padding-left: 0px; margin-top:5px;'>"
					+"<br/>"
					+msg.regDate
					+"</div></div>"
			
			}

		$(msgTagging).appendTo("#chat_box");

		//스크롤바 맨 위 위치
		var top = $("#chat_box").scrollTop();
		//스크롤바 전체 길이
		var totalHeight= $("#chat_box").prop('scrollHeight');
		//아래쪽 보고 있을 때 메시지 뜨면 당기게끔
		if(top>(totalHeight*0.50)){
			 $("#chat_box").scrollTop(totalHeight);
			}
		
	});

});
</script>

	<!-- 채팅방 전용 스크립트 -->
	<script src="/js/custom/chatRoomScript.js"></script>
	
	<!-- 공통 툴바용 스크립트 -->
	<script src="/js/custom/toolbarScript.js"></script>
	
	<!-- 채팅 사이드 툴바 스크립트 -->
	<script src="/js/custom/chatSideBar.js"></script>


</body>
</html>