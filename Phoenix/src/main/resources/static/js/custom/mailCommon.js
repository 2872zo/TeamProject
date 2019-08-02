function fncGetMailList(currentPage){
	location.href = "/mail/getMailList?accountNo=" + $("#accountSelector").val() + "&currentPage=" + currentPage; 
}

function fncGetMailMain(){
	location.href = "/mail/getMailList";
}

function fncSendMail(){
	location.href = "/mail/sendMail"
}

function fncOnChangeAccount(accountNo){
	location.href = "/mail/getMailList?accountNo=" + accountNo;
}

function fncGetSentMailList(accountNo){
	location.href = "/mail/getSentMailList?accountNo=" + accountNo;
}

function fncGetImportantMailList(accountNo){
	location.href = "/mail/getImportantMailList?accountNo=" + accountNo;
}

function fncGetTrashMailList(accountNo){
	location.href = "/mail/getTrashMailList?accountNo=" + accountNo;
}

$(function(){
	//선택 계정 변경
	$("#accountSelector").on("change", function(){
		fncOnChangeAccount($(this).val());
	});
});
