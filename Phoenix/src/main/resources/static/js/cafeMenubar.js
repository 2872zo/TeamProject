(function($) {
    "use strict";

	$(function(){
		
		$(".myDetail").hide();
		$(".showMyDetail").on("click",function(){
			if(${cafeMember.userNo}=='400')//1. 로그인이 안되어있으면
			{
				alert("로그인하세요! (로그인창 띄우기)");
			}
			else if(${cafeMember.userNo}=='500')//카페멤버가 아니면
			{
				alert("카페에 가입하세요!(카페에가입하시겠습니까?띄우기)");
			}
			else //카페멤버라면
			{
				$(".myDetail").show(); 
			}
		});

		$("[name=InnerSearch]").attr("method", "GET").attr("action", "/cafe/${cafeURL}/search");
		
		$("[name=menubarSubmit]").on("click", function(){
			location.href = "/cafe/" + "${cafeURL}" + "/search?searchKeyword=" + $("#menubarSearch").val(); 
		});	

		$("[name=toManage]").on("click", function(){
			location.href = "/cafe/${cafeURL}/manage/getCafeStatistics";
		});
		
	});

	$(function(){//카페탈퇴

		$(".deleteMember").on("click",function(){
			$( "#dialog" ).dialog("open");
			});
		var memberNo = '${cafeMember.memberNo}'
		$( "#dialog" ).dialog({ 
			 autoOpen: false, 
			  width: 400, 
			  modal: true, 
			  buttons: [ { 
				   text: "확인", 
				   click: function() { 
					   location.href = "/cafe/" + "${cafeURL}" + "/updateCafeMember?memberNo="+memberNo;
					  } 
			  }, 
			  { 
				   text: "취소", 
				    click: function() { 
					   $( this ).dialog( "close" ); 
					   } 
			   } 
			   ] 
		   });
	});
	
	$(function(){//프로필수정
		var memberNo = '${cafeMember.memberNo}'
		$(".updateProfile").on("click",function(){
			alert("여기")
			window.open("/cafe/" + "${cafeURL}"+ "/updateCafeMemberProfileView?memberNo="+memberNo,"_blank","width=600,height=700");
		
			});
		
		});

	$(function(){//카페가입
		$(".addMember").on("click", function(){
			 location.href = "/cafe/" + "${cafeURL}" + "addCafeApplicationView";
		});
		
	});
	
})(jQuery);
