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


//체크된 메일 삭제
$(function(){
	$("[name=deleteMailButton]").on("click", function(){

		if(window.location.href.indexOf("trashMailList") != -1){
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
						sweetAlert("게시글 삭제 실패","삭제할 메일을 선택하십시오.","error");
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
//		 							alert("success");
//									swal("변경 완료", "정상적으로 변경되었습니다.", "success");
								
								window.location.reload();
//	 							debugger;
								
							},
							error : function(data) {
								alert("error : " + data)
//	 							debugger;
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
						sweetAlert("게시글 삭제 실패","삭제할 메일을 선택하십시오.","error");
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
//		 							alert("success");
//									swal("변경 완료", "정상적으로 변경되었습니다.", "success");
								
								window.location.reload();
//	 							debugger;
								
							},
							error : function(data) {
								alert("error : " + data)
//	 							debugger;
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
			type:"warning",
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
//	 							alert("success");
							swal("변경 완료", "정상적으로 변경되었습니다.", "success");

							for(var i = 0; i < checked.length; i++){
								checked.eq(i).parent().parent().find("a").find("i").removeClass("mdi-email").addClass("mdi-email-open");
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

//체크된 메일 안 읽음 표시 변경
$(function(){
	$("[name=setUnSeenButton]").on("click", function(){

		swal({
			title:"읽음 표시 변경 확인",
			text:"선택한 메일을 안 읽음 표시로 변경하시겠습니까?",
			type:"warning",
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
								checked.eq(i).parent().parent().find("a").find("i").removeClass("mdi-email-open").addClass("mdi-email");
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
