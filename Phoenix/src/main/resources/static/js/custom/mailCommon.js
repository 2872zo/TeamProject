function fncGetMailList(currentPage){
	if(currentPage == undefined){
		currentPage = 1;
	}
	location.href = "/mail/getMailList?accountNo=" + $("#accountSelector").val() + "&currentPage=" + currentPage; 
}

function fncGetMailMain(){
	location.href = "/mail/getMailList";
}

function fncSendMail(){
	location.href = "/mail/sendMail"
}

function fncOnChangeAccount(accountNo){
	location.href = window.location.pathname + "?accountNo=" + accountNo;
}

function fncGetSentMailList(currentPage){
	if(currentPage == undefined){
		currentPage = 1;
	}
	location.href = "/mail/getSentMailList?accountNo=" + $("#accountSelector").val() + "&currentPage=" + currentPage;
}

function fncGetImportantMailList(currentPage){
	if(currentPage == undefined){
		currentPage = 1;
	}
	location.href = "/mail/getFlagMailList?accountNo=" + $("#accountSelector").val() + "&currentPage=" + currentPage;
}

function fncGetTrashMailList(currentPage){
	if(currentPage == undefined){
		currentPage = 1;
	}
	location.href = "/mail/getTrashMailList?accountNo=" + $("#accountSelector").val() + "&currentPage=" + currentPage;
}

$(function(){
	//선택 계정 변경
	$("#accountSelector").on("change", function(){
		fncOnChangeAccount($(this).val());
	});
});


//메읽 읽음 표시 변경
$(function(){
	$(".seenFlag").on("click", function(){
		var mailInfoList = [{"mailNo" : $(this).parent().parent().find(".mailNo").val(), "accountNo" : $(this).parent().parent().find(".accountNo").val() }]
		var targetIcon = $(this).find("i");
		
		if(targetIcon.hasClass("mdi-email")){
			$.ajax({
				type : "POST",
				contentType: "application/json",
				url : "/mail/json/setSeenMail",
				dataType : "JSON",
				data: JSON.stringify(mailInfoList),
				beforeSend : function(){
					$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
					$("#preloader").fadeIn(300);
				},
				complete : function(){
					$("#preloader").fadeOut(300);
					$("#preloader").attr("style", "display:none; background:white");
				},
				success : function(data) {
//							alert("success");

					targetIcon.removeClass("mdi-email").addClass("mdi-email-open");

//						debugger;
					
				},
				error : function(data) {
					alert("error : " + data)
//						debugger;
				}
			});//ajax end
		}else{
			$.ajax({
				type : "POST",
				contentType: "application/json",
				url : "/mail/json/setUnSeenMail",
				dataType : "JSON",
				data: JSON.stringify(mailInfoList),
				beforeSend : function(){
					$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
					$("#preloader").fadeIn(300);
				},
				complete : function(){
					$("#preloader").fadeOut(300);
					$("#preloader").attr("style", "display:none; background:white");
				},
				success : function(data) {
					targetIcon.removeClass("mdi-email-open").addClass("mdi-email");
					
//						debugger;
					
				},
				error : function(data) {
					alert("error : " + data)
//						debugger;
				}
			});//ajax end
		}	
	});
	
});


//메읽 중요 표시 변경
$(function(){
	$(".importantFlag").on("click", function(){
		var mailInfoList = [{"mailNo" : $(this).parent().parent().find(".mailNo").val(), "accountNo" : $(this).parent().parent().find(".accountNo").val() }]
		var targetIcon = $(this).find("i");
		
		if(targetIcon.hasClass("mdi-star-outline")){
			$.ajax({
				type : "POST",
				contentType: "application/json",
				url : "/mail/json/setFlagMail",
				dataType : "JSON",
				data: JSON.stringify(mailInfoList),
				beforeSend : function(){
					$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
					$("#preloader").fadeIn(300);
				},
				complete : function(){
					$("#preloader").fadeOut(300);
					$("#preloader").attr("style", "display:none; background:white");
				},
				success : function(data) {
					targetIcon.removeClass("mdi-star-outline").addClass("mdi-star");
				},
				error : function(data) {
					alert("error : " + data)
				}
			});//ajax end
		}else{
			$.ajax({
				type : "POST",
				contentType: "application/json",
				url : "/mail/json/setUnFlagMail",
				dataType : "JSON",
				data: JSON.stringify(mailInfoList),
				beforeSend : function(){
					$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
					$("#preloader").fadeIn(300);
				},
				complete : function(){
					$("#preloader").fadeOut(300);
					$("#preloader").attr("style", "display:none; background:white");
				},
				success : function(data) {
					targetIcon.removeClass("mdi-star").addClass("mdi-star-outline");
				},
				error : function(data) {
					alert("error : " + data)
				}
			});//ajax end
		}	
	});
	
});


//체크된 메일 삭제
$(function(){
	$("[name=deleteMailButton]").on("click", function(){
		debugger;
		if(window.location.href.indexOf("TrashMailList") == -1){
			swal({
				title:"삭제 확인",
				text:"선택한 메일을 휴지통으로 이동하시겠습니까?",
				type:"warning",
				showCancelButton:!0,
				confirmButtonColor:"#DD6B55",
				confirmButtonText:"네",
				cancelButtonText:"아니오",
				closeOnConfirm:!1},
				function(){
					checked = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked");
					
					if(checked.length < 1){
						sweetAlert("메일 삭제 실패","삭제할 메일을 선택하십시오.","error");
						return;
					}else{
						var mailInfoList = new Array();
						
						for(var i = 0; i < checked.length; i++){
							mailInfoList.push({"mailNo" : checked.eq(i).parent().parent().find(".mailNo").val(), "accountNo" : checked.eq(i).parent().parent().find(".accountNo").val()});
						}

						console.log(mailInfoList);

						$.ajax({
							type : "POST",
							contentType: "application/json",
							url : "/mail/json/trashMail",
							dataType : "JSON",
							data: JSON.stringify(mailInfoList),
							beforeSend : function(){
								$("#preloader").attr("style", "background:rgba(255,245,217,0.5);");
							},
							success : function(data) {
								window.location.reload();
							},
							error : function(data) {
								$("#preloader").attr("style", "display:none;");
								swal("삭제 실패", "삭제 시도중 오류가 발생했습니다.\n잠시후 다시 시도해 주십시오.", "error");
							}
						});//ajax end
						
					}//else end
				}//function end
			);//swal end
		} else {
			swal({
				title:"삭제 확인",
				text:"선택한 메일을 완전 삭제하시겠습니까?",
				type:"warning",
				showCancelButton:!0,
				confirmButtonColor:"#DD6B55",
				confirmButtonText:"네",
				cancelButtonText:"아니오",
				closeOnConfirm:!1},
				function(){
					checked = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked");
					
					if(checked.length < 1){
						sweetAlert("메일 삭제 실패","삭제할 메일을 선택하십시오.","error");
						return;
					}else{
						var mailInfoList = new Array();
						
						for(var i = 0; i < checked.length; i++){
							mailInfoList.push({"mailNo" : checked.eq(i).parent().parent().find(".mailNo").val(), "accountNo" : checked.eq(i).parent().parent().find(".accountNo").val()});
						}

						console.log(mailInfoList);

						$.ajax({
							type : "POST",
							contentType: "application/json",
							url : "/mail/json/deleteMail",
							dataType : "JSON",
							data: JSON.stringify(mailInfoList),
							beforeSend : function(){
								$("#preloader").attr("style", "background:rgba(255,245,217,0.5);");
							},
							success : function(data) {
								window.location.reload();
								
							},
							error : function(data) {
								swal("삭제 실패", "삭제 시도중 오류가 발생했습니다.\n잠시후 다시 시도해 주십시오.", "error");
							}
						});//ajax end
						
					}//else end
				}//function end
			);//swal end
			
		}//조건문 끝
			
	});	//.on end
});//jquery end


//체크된 메일 읽음 표시 변경
$(function(){
	$("[name=setSeenButton]").on("click", function(){

		swal({
			title:"읽음 표시 변경 확인",
			text:"선택한 메일을 읽음 표시로 변경하시겠습니까?",
			type:"info",
			showCancelButton:!0,
			confirmButtonColor:"#DD6B55",
			confirmButtonText:"네",
			cancelButtonText:"아니오",
			closeOnConfirm:!1},
			function(){
				checked = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked");
				
				if(checked.length < 1){
					sweetAlert("읽음 표시 변경 실패","변경할 메일을 선택하십시오.","error");
					return;
				}else{
					var mailInfoList = new Array();
					
					for(var i = 0; i < checked.length; i++){
						mailInfoList.push({"mailNo" : checked.eq(i).parent().parent().find(".mailNo").val(), "accountNo" : checked.eq(i).parent().parent().find(".accountNo").val()});
					}

					console.log(mailInfoList);

					$.ajax({
						type : "POST",
						contentType: "application/json",
						url : "/mail/json/setSeenMail",
						dataType : "JSON",
						data: JSON.stringify(mailInfoList),
						beforeSend : function(){
							$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
							$("#preloader").fadeIn(300);
						},
						complete : function(){
							$("#preloader").fadeOut(300);
							$("#preloader").attr("style", "display:none; background:white");
						},
						success : function(data) {
							swal("변경 완료", "정상적으로 변경되었습니다.", "success");
							for(var i = 0; i < checked.length; i++){
								checked.eq(i).parent().parent().find("a.seenFlag").find("i").removeClass("mdi-email").addClass("mdi-email-open");
							}
						},
						error : function(data) {
							alert("error : " + data)
						}
					});//ajax end
					
				}//else end
			}//function end
		);//swal end
	});	//.on end
});//jquery end

//체크된 메일 안 읽음 표시 변경
$(function(){
	$("[name=setUnSeenButton]").on("click", function(){

		swal({
			title:"읽음 표시 변경 확인",
			text:"선택한 메일을 안 읽음 표시로 변경하시겠습니까?",
			type:"info",
			showCancelButton:!0,
			confirmButtonColor:"#DD6B55",
			confirmButtonText:"네",
			cancelButtonText:"아니오",
			closeOnConfirm:!1},
			function(){
				checked = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked");
				
				if(checked.length < 1){
					sweetAlert("읽음 표시 변경 실패","변경할 메일을 선택하십시오.","error");
					return;
				}else{
					var mailInfoList = new Array();
					
					for(var i = 0; i < checked.length; i++){
						mailInfoList.push({"mailNo" : checked.eq(i).parent().parent().find(".mailNo").val(), "accountNo" : checked.eq(i).parent().parent().find(".accountNo").val()});
					}

					console.log(mailInfoList);

					$.ajax({
						type : "POST",
						contentType: "application/json",
						url : "/mail/json/setUnSeenMail",
						dataType : "JSON",
						data: JSON.stringify(mailInfoList),
						beforeSend : function(){
							$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
							$("#preloader").fadeIn(300);
						},
						complete : function(){
							$("#preloader").fadeOut(300);
							$("#preloader").attr("style", "display:none; background:white");
						},
						success : function(data) {
//	 							alert("success");
							swal("변경 완료", "정상적으로 변경되었습니다.", "success");

							for(var i = 0; i < checked.length; i++){
								checked.eq(i).parent().parent().find("a.seenFlag").find("i").removeClass("mdi-email-open").addClass("mdi-email");
							}
							
// 							debugger;
							
						},
						error : function(data) {
							alert("error : " + data)
// 							debugger;
						}
					});//ajax end
					
				}//else end
			}//function end
		);//swal end
	});	//.on end
});//jquery end

//체크된 메일 중요 표시 변경
$(function(){
	$("[name=setFlagButton]").on("click", function(){

		swal({
			title:"중요 표시 변경 확인",
			text:"선택한 메일을 중요 표시로 변경하시겠습니까?",
			type:"info",
			showCancelButton:!0,
			confirmButtonColor:"#DD6B55",
			confirmButtonText:"네",
			cancelButtonText:"아니오",
			closeOnConfirm:!1},
			function(){
				checked = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked");
				
				if(checked.length < 1){
					sweetAlert("중요 표시 변경 실패","변경할 메일을 선택하십시오.","error");
					return;
				}else{
					var mailInfoList = new Array();
					
					for(var i = 0; i < checked.length; i++){
						mailInfoList.push({"mailNo" : checked.eq(i).parent().parent().find(".mailNo").val(), "accountNo" : checked.eq(i).parent().parent().find(".accountNo").val()});
					}

					console.log(mailInfoList);

					$.ajax({
						type : "POST",
						contentType: "application/json",
						url : "/mail/json/setFlagMail",
						dataType : "JSON",
						data: JSON.stringify(mailInfoList),
						beforeSend : function(){
							$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
							$("#preloader").fadeIn(300);
						},
						complete : function(){
							$("#preloader").fadeOut(300);
							$("#preloader").attr("style", "display:none; background:white");
						},
						success : function(data) {
//	 							alert("success");
							swal("변경 완료", "정상적으로 변경되었습니다.", "success");

							for(var i = 0; i < checked.length; i++){
								checked.eq(i).parent().parent().find("a.importantFlag").find("i").removeClass("mdi-star-outline").addClass("mdi-star");
							}
							
// 							debugger;
							
						},
						error : function(data) {
							alert("error : " + data)
// 							debugger;
						}
					});//ajax end
					
				}//else end
			}//function end
		);//swal end
	});	//.on end
});//jquery end

//체크된 메일 중요 표시 해제
$(function(){
	$("[name=setUnFlagButton]").on("click", function(){

		swal({
			title:"중요 표시 변경 확인",
			text:"선택한 메일을 중요 표시 해제하시겠습니까?",
			type:"info",
			showCancelButton:!0,
			confirmButtonColor:"#DD6B55",
			confirmButtonText:"네",
			cancelButtonText:"아니오",
			closeOnConfirm:!1},
			function(){
				checked = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked");
				
				if(checked.length < 1){
					sweetAlert("중요 표시 변경 실패","변경할 메일을 선택하십시오.","error");
					return;
				}else{
					var mailInfoList = new Array();
					
					for(var i = 0; i < checked.length; i++){
						mailInfoList.push({"mailNo" : checked.eq(i).parent().parent().find(".mailNo").val(), "accountNo" : checked.eq(i).parent().parent().find(".accountNo").val()});
					}

					console.log(mailInfoList);

					$.ajax({
						type : "POST",
						contentType: "application/json",
						url : "/mail/json/setUnFlagMail",
						dataType : "JSON",
						data: JSON.stringify(mailInfoList),
						beforeSend : function(){
							$("#preloader").attr("style", "display:none; background:rgba(255,245,217,0.5);");
							$("#preloader").fadeIn(300);
						},
						complete : function(){
							$("#preloader").fadeOut(300);
							$("#preloader").attr("style", "display:none; background:white");
						},
						success : function(data) {
//	 							alert("success");
							swal("변경 완료", "정상적으로 변경되었습니다.", "success");

							for(var i = 0; i < checked.length; i++){
								checked.eq(i).parent().parent().find("a.importantFlag").find("i").removeClass("mdi-star").addClass("mdi-star-outline");
							}
							
// 							debugger;
							
						},
						error : function(data) {
							alert("error : " + data)
// 							debugger;
						}
					});//ajax end
					
				}//else end
			}//function end
		);//swal end
	});	//.on end
});//jquery end

function countCheckBox(){
	countCheck = $(":checkbox").not(":checkbox:first").filter(":checkbox:checked").length;
	
	if(countCheck == $(":checkbox").not(":checkbox:first").length){
		$(":checkbox:first").prop("checked",true);
	}else{
		$(":checkbox:first").prop("checked",false);
	}
}

function checkAll(obj){
	$(":checkbox").prop("checked",true);
}

function unCheckAll(obj){
	$(":checkbox").prop("checked",false);
}

$(function(){
	var countCheck;
	
	$(":checkbox:first").on("click",function(){
		if($(":checkbox:first").is(":checked")){
			checkAll($(this));
		}else{
			unCheckAll($(this));
		}
	})
	
	$(":checkbox").on("click",function(){
		countCheckBox();
	});
});

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
