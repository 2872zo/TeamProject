function fncGetBoardPostList(boardNo, cafeURL){
	location.href = "/cafe/" + cafeURL + "/getBoard/" + boardNo;
}

function fncGetCafeMain(cafeURL){
	location.href = "/cafe/" + cafeURL;
}

function fncGetCafeHome(){
	location.href = "/cafe/main/";
}

function fncGetStatistics(cafeURL){
	location.href = "/cafe/" + cafeURL + "/manage/getCafeStatistics";
}

function fncGetInfo(cafeURL){
	location.href = "/cafe/" + cafeURL + "/manage/updateCafeInfoView";
}

function fncGetBoard(cafeURL){
	location.href = "/cafe/" + cafeURL + "/manage/updateCafeBoardView";
}

function fncGetForm(cafeURL){
	location.href = "/cafe/" + cafeURL + "/manage/updateCafeApplicationForm";
}

function fncGetApplication(cafeURL){
	location.href = "/cafe/" + cafeURL + "/manage/getCafeApplicationList";
}

function fncGetGrade(cafeURL){
	location.href = "/cafe/" + cafeURL + "/manage/updateCafeGradeView";
}

function fncGetMember(cafeURL){
	location.href = "/cafe/" + cafeURL + "/manage/getCafeMemberList";
}

function fncGetClosed(cafeURL){
	location.href = "/cafe/" + cafeURL + "/manage/dropCafeView";
}


function fncGetNotice(cafeURL){
	location.href = "/cafe/" + cafeURL + "/manage/updateNoticeOrder";
}

function fncGetPhoenix(){
	location.href = "/";
}

function fncLogin(){
	location.href = "/user/loginView";
}

function fncLogout(){
	location.href = "/user/logout";
}

function fncGoChat(){
	location.href = "/chat/main";
}

function fncAddCafeApplication(cafeURL){
	location.href= "/cafe/"+ cafeURL +"/addCafeApplicationView";
}

function fncGetMyPostList(idx){
	location.href = "/cafe/" + cafeURL + "/getMyPostList?currentPage=" + idx + "&status=0";
}

function fncGetMyReplyList(idx){
	location.href = "/cafe/" + cafeURL + "/getMyPostList?currentPage=" + idx + "&status=1";
}

$(function() {

	var whereYouAt = String(window.location.pathname);

	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[id='kakaos' ]").on("click" , function() {
				
				var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
				window.open("https://kauth.kakao.com/oauth/authorize?client_id=44d5aabe2b56604fedd6b0bfe3098f1a&redirect_uri=http://localhost:8080/user/oauth&response_type=code","Kakao login",popOption);
				
		});
	});

	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[id='navers' ]").on("click" , function() {
				
				var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
				window.open("https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=erD_7BcDM8OWYHtTr5kn&state=STATE_STRING&redirect_uri=http://localhost:8080/user/callback","Naver login",popOption);
				
				
		});
	});

	$(".logout").on("click", function() {
		$(self.location).attr("href", "/user/logout");
	});

	$("#goChat").on("click", function() {
		$(self.location).attr("href", "/chat/chatRoomList");
	});	
	//로그인시작
	$( function() {
		
		$("#userId").focus();
		
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#login1").on("click" , function() {
			var id = $("input[name='userId']").val();
			var pw = $("input[name='password']").val();
			
			if(id == null || id.length <1) {
				sweetAlert("아이디를 입력하세요","","error");
			//	alert('ID 와 비밀번호를 입력하지 않으셨습니다.');
				
				$("#userId").focus();
				
				return false;
			}else if(pw == null || pw.length <1) {
				sweetAlert("비밀번호를 입력하세요","","error");
			//	alert('패스워드를 입력하지 않으셨습니다.');
				
				$("#password").focus();
				return false;
			}else{
				//alert("입력  : "+id);
				//alert("입력  : "+pw);
				//alert("입력  : "password);
				$.ajax({
					url : "/user/json/login",
					method : "POST",
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},										
					data : JSON.stringify({											
					userId : id,
					password : pw,
					}),
					
					success : function(JSONData) {
						//alert(JSONData); 
						//alert(typeof(JSONData));
						
						if(JSONData == false){
						//	alert("아디비번일치x");
							sweetAlert("아이디 또는 비밀번호가 일치하지 않습니다.","","error");
							return false;
						}else{
							window.location.reload();
						}						
					}
				});//ajax
				return false;
			}//else
		}); 
	});	
	//로그인끝
});
	
	