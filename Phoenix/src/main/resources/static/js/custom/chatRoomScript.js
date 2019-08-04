//사진용 태그
var imgHead = "<img src='/images/uploadfiles/chatFiles/";
var imgTail = "' class='rounded' style='width: 100%; height: auto;'>";

//자기가 입력한 메시지/사진용 태그
var startOfMine =  "<div class='row d-flex justify-content-end'>";
var regDateMyHead = "<div class='col-lg-2 text-right' style='padding-right: 0px;'>";
var regDateMyTail = "</div>";
var textHead = "<div class='col-lg-6' style='padding-right: 20px;'>";
var idHeadSecond ="<div class='alert' name='";
var idTailFirst = "' style='padding:5px; width: 100%;border: 2px solid #f5a142;";
var idTailSecond = "color: #162CA8;background-color:#ffc68a; ' >";
var textTail = "</div></div>";
var endOfTag = "</div>";

//이모티콘용 태그
var startOfMyEmo = "<div class='col-lg-4' style='padding-right: 20px;'>"
var idFront = "<div class='alert' name='";
var idTail = "' style='padding:5px;' >";
var emoFront = 	"<img src='/images/common/700by700.png' class='rounded' style=\"background: url('/images/chatEmoticon/";
var emoBack = "'); background-size: cover; background-repeat: no-repeat; background-position: center; width:100%; margin: 1%; padding:0%;\">";
var endOfMyEmo = "</div></div>";

//남이 입력한 메시지/사진용 태그
var startOfYour = "<div class='row d-flex justify-content-start'>";
var ProfileHead = "<div class='col-lg-1'>";
var ProfileImgHead = "<img src='/images/uploadfiles/profileimg/";
var ProfileImgTail = "'  class='rounded' style='width: 48px; height: 48px'></div>";
var textHeadYour = "<div class='col-lg-6' style='margin-left: 1%;'>";
var idFrontYour = "<div class='alert' name='";
var idBackYour = "' style='padding:5px; width: 100%;margin-top:5px; border: 2px solid #f5a142; color: black;' >";
var regDateHeadYour = "<div class='col-lg-2' style='padding-left: 0px; margin-top:5px;'><br/>";
var regDateTailYour = "</div></div>";
//남이 입력한 이모티콘용 태그
//var startOfYourEmo = "<div class='col-lg-4' style='padding-right: 20px;'>"
var idBackYourEmo = "' style='padding:5px; ' >";


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
	
	var inviteFlag=0;
	
	$(".inviteList").each(function(index) {
		if($(this).css( "background-color" )=="rgb(245, 161, 66)"){
			inviteFlag += 1;
		}
	});
	
	if(inviteFlag>0){
	swal({
		  title: "채팅방에 초대.",
		  text: "선택하신 "+inviteFlag+" 명의 친구가 채팅방에 초대됩니다.",
		  type: "info",
		  showCancelButton: true,
		  confirmButtonClass: "btn-info",
		  confirmButtonText: "확인",
		  cancelButtonText: "취소",
		  closeOnConfirm: false
		},
		function(){
		 
			var jsonList = new Array();

			var i = 0;
			$(".inviteList").each(function(index) {
				if($(this).css( "background-color" )=="rgb(245, 161, 66)"){
					var userNoJson = $(this).attr("id");
					var nickNameJson = $(this).attr("name");
					var profileImgJson = $(this).attr("value");
					var roomIdJson = $("#chatRoomId").val();
					var beJson = { chatRoomId : roomIdJson,
									userNo : userNoJson,
									userNickname : nickNameJson, 
									profileImg : profileImgJson
									};
					
					jsonList[i]=beJson;
					
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
			
			$.ajax(
					{
					type : "POST",
					url : "/chat/json/inviteFriend",
					data : jsonList,
					contentType: "application/json", //보내는 컨텐츠의 타입
					//dataType : "json",      //받아올 데이터의 타입 필요없음
					success : function(serverData, status) {
						swal("초대성공", i+" 명이 초대됐어요", "success")
									},
					error : function(request,status,error){
										alert(status);
								        alert("에러남 : "+error);
								       }
					}
				);
			
		});
	}
	
});

//방 나가기
$("#leaveChatRoom").on("click" , function() {
	
	swal({
		  title: "나가실건가요?",
		  text: "나가시면 되돌릴 수 없어요",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "나갈거야!",
		  cancelButtonText: "취소",
		  closeOnConfirm: false
		},
		function(){
		  swal("퇴장", "다음에 만나요", "success");
		  setTimeout(function() {
			  $("#thisChatRoomInfo").attr("method" , "POST").attr("action" , "/chat/leaveChatRoom").submit();
			}, 1500);
		});
	
});
//이모티콘 입력
$(".emoticons").on("click" , function() {
	//alert($(this).attr("name"));
	    
		var jsoned = {
				chatRoomId : $("#chatRoomId").val(), 
				userNo : $("#userNo").val(), 
				userNickname : $("#userNickname").val(),
				profileImg : $("#profileImg").val(),
				chatType : 2,
				chatMsg : $(this).attr("name")
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
									},
					error : function(request,status,error){
								        alert("에러남 : "+error);
								       }
					}
				);
	   
});