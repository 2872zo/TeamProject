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
