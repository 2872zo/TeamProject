$(function() {

	// checkSessionUser 세션에 유저 없을 때 트루임.

	var whereYouAt = String(window.location.pathname);

	// 카페/메인도 아니고 접속도 안했을때 지워버려
	if (!whereYouAt.startsWith("/cafe/main") || checkSessionUser) {
		$("#cafeMainTools").remove();
	}

	// /카페로 시작안하면 버튼 없애자
	if (!whereYouAt.startsWith("/cafe")) {
		$("#cafeHomeButton").remove();
	}

	if (!whereYouAt.startsWith("/cafe/") || whereYouAt.startsWith("/cafe/main")) {
		$("#thisCafeHome").remove();
	}

	// 로그인 안해서 세션에 유저가 없을 때
	if (checkSessionUser) {
		$("#goChat").remove();
		$(".logout").remove();
	}

	// 로그인해서 세션에 유저가 있을 때
	if (!checkSessionUser) {
		$(".login").remove();
	}

	$("#cafeHomeButton").on("click", function() {
		$(self.location).attr("href", "/cafe/main");
	});

	$("#thisCafeHome").on("click", function() {
		$(self.location).attr("href", "/cafe/" + whereYouAt.substring(6));
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

	// 로그인시작
	$(function() {

		$("#userId").focus();

		// ==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) :
		// 3.$(.className)
		$("#login1").on(
				"click",
				function() {
					var id = $("input:text").val();
					var pw = $("input:password").val();

					if (id == null || id.length < 1) {
						alert('ID 를 입력하지 않으셨습니다.');
						$("#userId").focus();
						return;
					}

					if (pw == null || pw.length < 1) {
						alert('패스워드를 입력하지 않으셨습니다.');
						$("#password").focus();
						return;
					}
					$("form").attr("method", "POST").attr("action",	"/user/login").submit();
					// $("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
				});
	});

	// 로그인끝
	
	$(function() {

		$("#logon").on('click',function() {
					debugger;
							var id = $("input:text").val();
							var pw = $("input:password").val();
							//alert("입력  : "id);
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
											
											if(JSONData == 1){
												alert("아이디 또는 비밀번호가 일치하지 않습니다.");
												}else{
													//$("form").attr("method","POST").attr("action","/user/login").submit();
													}
				
										}

									});
		  						  });
								});

});