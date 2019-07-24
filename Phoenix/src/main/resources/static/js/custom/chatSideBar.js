$(function() {
	$("#friendsList").on("click", function() {
		//alert("친구목록이야");
		$(self.location).attr("href", "/chat/chatFriendsList");		
	});
	
	$("#chatRoomList").on("click", function() {
		//alert("채팅방 목록이야");
		$(self.location).attr("href", "/chat/chatRoomList");
	});
	
	$("#config").on("click", function() {
		//alert("환경설정이야");
		$(self.location).attr("href", "/chat/config");
	});
	
});