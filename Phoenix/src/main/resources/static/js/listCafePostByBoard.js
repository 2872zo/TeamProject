

function fncGetList(currentPage){
	var boardNo = $(".main .boardNo").val();
	var obj = {currentPage : currentPage};
	$("div.col-10").load("/cafe/" + state.cafeURL + "/getBoard/" + state.boardNo + " #mainContent", obj); 
};

//게시글 조회
$(function(){
	state.mainContent = $("div.col-10").html().trim();
	history.replaceState(state, state.cafeURL, "/cafe/" + state.cafeURL + "/getBoard/" + state.boardNo);

	$("div.col-10").on("click", ".postTitle", function(){
		state.postNo = $(this).parent().find(".postNo").val();
		
		$("#mainContent").remove();
		$("div.col-10").load("/cafe/" + state.cafeURL + "/getPost/" +	state.postNo + " #mainContent", state.cafeURL, function(response, status, xhr){
			$.getScript("/static/js/getCafePost.js");
			
			state.mainContent = response;
			history.pushState(state, state.cafeURL, "/cafe/" + state.cafeURL + "/getPost/" + state.postNo);
		});
	});			
});
