			$(function(){
	    		$("[name=InnerSearch]").attr("method", "GET").attr("action", "/cafe/" + cafeURL + "/search");
	    		
	    		$("[name=menubarSubmit]").on("click", function(){
	    			location.href = "/cafe/" + cafeURL + "/search?searchKeyword=" + $("#menubarSearch").val(); 
	    		});	
	
	    		$("[name=toManage]").on("click", function(){
	    			location.href = "/cafe/" + cafeURL + "/manage/getCafeStatistics";
	    		});
	    		
	    	});
	
	    	$(function(){//카페탈퇴
	    		document.querySelector(".sweet-withdraw").onclick =
		    		function(){
		    			swal({
		    				title:"카페에서 탈퇴하시겠습니까?",
		    				text:"카페 탈퇴시 작성된 게시글은 자동으로 삭제되지 않습니다.",
		    				type:"warning",
		    				showCancelButton:!0,
		    				confirmButtonColor:"#DD6B55",
		    				confirmButtonText:"예",
		    				cancelButtonText:"아니오",
		    				closeOnConfirm:!1
		    				},
		    				function(isConfirm){
			    				if(isConfirm){
				    				$.ajax({
					    				type : "POST",
					    				url : "/cafe/json/" +cafeURL + "/updateCafeMember",
					    				contentType: 'application/json',
					    				data : JSON.stringify({
											memberNo : memberNo,
											cafeNo : cafeNo,
											userNo : userNo
										}),
										success : function(JSONData,status){
											if (JSONData.result == true){
												swal("카페 탈퇴 완료","탈퇴 되었습니다.","success");
											}
										},
										error : function(){
											
											swal("카페 탈퇴 실패","탈퇴 못함","error");
										}
					    			});//ajax 끝
			    				}
			    			
		    				});
		    			}
	    	});
	    	
	    	$(function(){//프로필수정
	    		
	    		$(".updateProfile").on("click",function(){
// 	    			alert("여기")
	    			window.open("/cafe/" + cafeURL + "/updateCafeMemberProfileView?memberNo="+memberNo,"_blank","width=600,height=700","location=no");
	    			});
	    		
	    		});
	
	    	$(function(){//카페가입
	    		$(".addMember").on("click", function(){
	    			 location.href = "/cafe/" + cafeURL + "/addCafeApplicationView";
	    		});
	    		
	    	});
	    	
	    	$(function(){ //카페설정이동
	    		$(".text-dark.mr-4.manage.cursor").on("click",function(){
	    			location.href = "/cafe/" + cafeURL + "/manage/getCafeStatistics";
	    		});
	    	});
	    	
	    	$(function(){ //카페등급확인
	    		$(".getCafeGrade").on("click",function(){
	    			//alert("등급확인이여!");
	    			window.open("/cafe/" + cafeURL + "/updateCafeGradeView?modal='modal'","width=600,height=700");

	    		});
	    		
	    	});
	    	
	    	$(function(){ //내글
	    		$(".myPost").on("click",function(){
	    			location.href = "/cafe/" + cafeURL + "/getMyPostList";
	    		});
	    	});
	    	
	    	$(function(){ //내글
	    		$(".myReply").on("click",function(){
	    			location.href = "/cafe/" + cafeURL + "/getMyPostList";
	    		});
	    	});
