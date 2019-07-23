function fncGetBoardPostList(boardNo, cafeURL){
	location.href = "/cafe/" + cafeURL + "/getBoard/" + boardNo;
}

function fncGetCafeMain(cafeURL){
	location.href = "/cafe/" + cafeURL;
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
	location.href = "/cafe/" + cafeURL + "";
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