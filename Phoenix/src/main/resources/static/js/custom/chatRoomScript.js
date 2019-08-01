function getFormatDate(date){ 
	//var year = date.getYear();//yy 
	var year = date.getFullYear();//yyyy 
	year = String(year).substring(2,4);
	var month = (1 + date.getMonth()); //M 
	month = month >= 10 ? month : '0' + month; //month두자리로 저장 
	var day = date.getDate(); //d 
	day = day >= 10 ? day : '0' + day; //day 두자리로 저장
	var hour = date.getHours();
	var minute = date.getMinutes();
	minute = minute >= 10 ? minute : '0' + minute; //분도 두자리로 지정
	return year + '-' + month + '-' + day+' '+hour+':'+minute; 
	}

function tagRemover(inputText){
	inputText = inputText.replace(/(<([^>]+)>)/ig,"");
}

$("#updateChatRoomName").click(function() {

	swal({
		  title: "방 제목 변경하기",
		  text: "사용하실 방 제목을 입력해주세요",
		  type: "input",
		  showCancelButton: true,
		  closeOnConfirm: false,
		  inputPlaceholder: $("#recentChatRoomName").text()
			}, function (inputValue) {
		  if (inputValue === false) return false;
		  if (inputValue === "") {
		    swal.showInputError("공백은 입력할 수 없습니다.");
		    return false
		  }
		  inputValue = inputValue.replace(/(<([^>]+)>)/ig,"");
		  var infoId = $("#chatRoomInfoId").val();

			var jsoned = { id : infoId,
					chatRoomName : inputValue,		
					};
			jsoned = JSON.stringify(jsoned);

			$.ajax(
					{
					type : "POST",
					url : "/chat/json/updateChatRoomInfo",
					data : jsoned,
					contentType: "application/json", //보내는 컨텐츠의 타입
					//dataType : "json",      //받아올 데이터의 타입 필요없음
					success : function(serverData, status) {
						$("#recentChatRoomName").text(inputValue);
						swal("성공적으로 변경되었습니다", 
								"방 제목이 " + inputValue+" 로 변경되었습니다.", "success");
									},
					error : function(request,status,error){
										alert(request);
										alert(status);
								        alert("에러남 : "+error);
								       }
					}
				);
		  
	});

});



//초대하기 전에 색상 바꾸는 부분
$(".inviteList").on("click" , function() {

	if($(this).css( "background-color" )=="rgb(255, 255, 255)"){
		$(this).css("background-color","#f5a142");
		}
	
	else if($(this).css( "background-color" )=="rgb(245, 161, 66)"){
		$(this).css( "background-color","white");
		}
	
});
//초대하기 눌렀을 때
$("#doInviting").on("click" , function() {

	var jsonList = new Array();

	var i = 0;
	$(".inviteList").each(function(index) {
		if($(this).css( "background-color" )=="rgb(245, 161, 66)"){
			alert($("#chatRoomId").val());
			var userNoJson = $(this).attr("id");
			var nickNameJson = $(this).attr("name");
			var profileImgJson = $(this).attr("value");
			var roomIdJson = $("#chatRoomId").val();
			var beJson = { chatRoomId : roomIdJson,
							userNo : userNoJson,
							userNickname : nickNameJson, 
							profileImg : profileImgJson
							};
			
			//beJson = JSON.stringify(beJson);
			jsonList[i]=beJson;
			//nickNameList[i]=$(this).attr("name");
			//userNoList[i]=$(this).attr("id");
			//imgFileList[i]=$(this).attr("value");
			
			i+=1;
			$(this).attr("class","row d-flex justify-content-start");
			$(this).css( "background-color","white");
			$(this).attr("name","");
			$(this).attr("value","");
			$(this).attr("id","");
			$("#joinerList").append($(this));
		}
	});
	jsonList = JSON.stringify(jsonList);
	//alert(jsonList);
	//alert(nickNameList);
	//alert(userNoList);
	//alert(imgFileList);
	
	$.ajax(
			{
			type : "POST",
			url : "/chat/json/inviteFriend",
			data : jsonList,
			contentType: "application/json", //보내는 컨텐츠의 타입
			//dataType : "json",      //받아올 데이터의 타입 필요없음
			success : function(serverData, status) {
								//alert(status);
								//alert("server에서 온 Data : \n" + serverData);
								//alert(serverData.regDate);
								//targetTag.text(checker);	
								//socket.emit("send_msg", $("#chatRoomNo").val()+":"+$("#msg").val()+serverData.regDate);
								//socket.emit("send_msg", $("#chatRoomNo").val()+"-"+JSON.stringify(serverData));
								//socket.emit("send_msg", serverData); 
								// $("#msg").val("");
							},
			error : function(request,status,error){
								alert(status);
						        alert("에러남 : "+error);
						       }
			}
		);

});

//방 나가기
$("#leaveChatRoom").on("click" , function() {
	//$(self.location).attr("href","/chat/leaveChatRoom");
	$("#thisChatRoomInfo").attr("method" , "POST").attr("action" , "/chat/leaveChatRoom").submit();
});

$('[data-toggle="popover"]').popover({
    container: 'body'
});
$(".emoticons").on("click" , function() {
	alert($(this).attr("name"));
	//alert("이모티콘입니다.");
	//$(this).attr("data-content","<img src='/images/uploadfiles/profileimg/6.jpg'class='rounded' style='width: 32px; height: 32px'>");
});