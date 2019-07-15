$(function() {
	state.mainContent = "<script> fncGetReplyList(1); </script>" + $("#mainContent").html().trim();
	history.replaceState(state, state.cafeURL, "/cafe/" + state.cafeURL + "/getPost/" + state.postNo);
	
	$("[name=cafeURL]").val(state.cafeURL);
	
	//임시데이터
	$("[name=memberNo]").val('10000');
	$("[name=memberNickname]").val('매니저1');

	//댓글 1페이지 로드
	fncGetReplyList(1);
	
	//게시글 수정페이지 로드
	$(document).on("click", "[name=update]", function(){
		
		
		
		$("#mainContent").remove();
		$("div.col-10").load("/cafe/" + state.cafeURL + "/updatePost/" + state.postNo + " #mainContent", function(response, status, xhr){
			state.mainContent = response;
			window.CKEDITOR_BASEPATH = "/static/ckeditor/";
			$.getScript("/static/js/form-validation.js");
			$.getScript("/static/ckeditor/ckeditor.js", function(data, status, xhr){
				$.getScript("/static/js/updatePost.js");
			});
			history.pushState(state, state.cafeURL,"/cafe/" + state.cafeURL + "/updatePost/" + state.postNo);
		});
	});

	//게시글 삭제
	$("[name=delete]").on("click",function(){
		location.href = "/cafe/${post.cafeURL}/deletePost?postNo=${post.postNo}&boardNo=${post.boardNo}";
	});
});

//댓글 페이징
function fncGetReplyList(currentPage){
	$(document).find(".replyItems").unbind();
	$(document).find(".replyItems").load("/cafe/" + state.cafeURL + "/getReplyList/" + state.postNo, {currentPage:currentPage});
}
