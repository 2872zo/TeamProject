$(function() {

	// checkSessionUser 세션에 유저 없을 때 트루임.

	var whereYouAt = String(window.location.pathname);

	// 카페/메인도 아니고 접속도 안했을때 지워버려
	//if (!whereYouAt.startsWith("/cafe/main") || checkSessionUser) {
	//	$("#cafeMainTools").remove();
	//}

	// /카페로 시작안하면 버튼 없애자
	//if (!whereYouAt.startsWith("/cafe")) {
	//	$("#cafeHomeButton").remove();
	//}



	// 로그인 안해서 세션에 유저가 없을 때
	//if (checkSessionUser) {
	//	$("#goChat").remove();
	//	$(".logout").remove();
	//}

	// 로그인해서 세션에 유저가 있을 때
	//if (!checkSessionUser) {
	//	$(".login").remove();
	//}

	$("#cafeHomeButton").on("click", function() {
		$(self.location).attr("href", "/cafe/main");
	});



	$("#newsFeeding").on("click", function() {
		$(self.location).attr("href", "/cafe/main/cafeNewsFeed");
	});

	$("#myApplications").on("click", function() {
		$(self.location).attr("href", "/cafe/main/cafeApplicationList");
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
						self.location = "/";
						}						
					}
				});//ajax
				return false;
			}//else
		}); 
	});	
	//로그인끝
	
	

});
	
	