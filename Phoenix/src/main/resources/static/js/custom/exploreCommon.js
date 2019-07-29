	
	function fncFormAction(searchTheme) //form형식으로 action
	{
		if(searchTheme==0){	
			$("form").attr("method","POST").attr("action","/explore/getUnifiedList").submit();
		}
		if(searchTheme==1){	
			$("form").attr("method","POST").attr("action","/explore/getBlogList").submit();
		}
		if(searchTheme==2){	
			$("form").attr("method","POST").attr("action","/explore/getCafeList").submit();
		}
		if(searchTheme==3){	
			//alert("이미지!");
			$("form").attr("method","POST").attr("action","/explore/getImageList").submit();
		}
		if(searchTheme==4){	
			$("form").attr("method","POST").attr("action","/explore/getWebsiteList").submit();
		}
	}
	
	function fncSelfLocation(searchTheme, searchKeyword) //selfLocation action
	{
		if(searchTheme==0){
			$(self.location).attr("href", "/explore/getUnifiedList?searchKeyword="+searchKeyword);
			//$("form").attr("method","POST").attr("action","/explore/getUnifiedList").submit();
		}
		else if(searchTheme==1){
			$(self.location).attr("href", "/explore/getBlogList?searchKeyword="+searchKeyword);
		}
		else if(searchTheme==2){
			$(self.location).attr("href", "/explore/getCafeList?searchKeyword="+searchKeyword);
		}
		else if(searchTheme==3){
			$(self.location).attr("href", "/explore/getImageList?searchKeyword="+searchKeyword);
		}
		else if(searchTheme==4){
			$(self.location).attr("href", "/explore/getWebsiteList?searchKeyword="+searchKeyword);
		}
	}
	
	function fncGetBlogList(idx){
		
		$("form").attr("method","POST").attr("action","/explore/getBlogList?currentPage="+idx).submit();
		//location.href = "/cafe/" + cafeURL + "/getMyPostList?currentPage=" + idx ;
	}
	function fncGetCafeList(idx){
		
		$("form").attr("method","POST").attr("action","/explore/getCafeList?currentPage="+idx).submit();
		//location.href = "/cafe/" + cafeURL + "/getMyPostList?currentPage=" + idx ;
	}
	

	$(function(){
		
		$("#explore").on("click",function(){ //exploreToolbar.jsp의 검색 버튼 누르면
											 //searchKeyword 제외 다른애들은 초기화 그냥 get방식으로 가야하나.
											 //pageNavigation 할때만 Search 살린다.
			var searchTheme = $("#searchTheme").val();
			var searchKeyword = $("#searchKeyword").val();
			
			fncSelfLocation(searchTheme, searchKeyword);
			
		});
		
	});
	
	$(function(){ //검색어치고 엔터키 press
		
		$("#searchKeyword").keypress(function(event){
			
			if(event.which==13){ //event가 엔터키를 누른경우
				$("#explore").click(); //클릭한경우랑 같은거
				//return false; 
			}
		});
		
	});
	
	$(function(){  //통합검색 블로그 카페 ... 등등 눌렀을때 searchKeyword가지고 초기화 검색
		
		var searchKeyword = $("#searchKeyword").val();
		
		$("#uniSearch").on("click",function(){ //통합검색 눌렀을때
			$(self.location).attr("href", "/explore/getUnifiedList?searchKeyword="+searchKeyword);
		});
		
		$("#blogSearch").on("click",function(){ //통합검색 눌렀을때
			$(self.location).attr("href", "/explore/getBlogList?searchKeyword="+searchKeyword);
		});
		
		$("#cafeSearch").on("click",function(){ //통합검색 눌렀을때
			$(self.location).attr("href", "/explore/getCafeList?searchKeyword="+searchKeyword);
		});
		
		$("#imageSearch").on("click",function(){ //통합검색 눌렀을때
			$(self.location).attr("href", "/explore/getImageList?searchKeyword="+searchKeyword);
		});
		
		$("#webSearch").on("click",function(){ //통합검색 눌렀을때
			$(self.location).attr("href", "/explore/getWebsiteList?searchKeyword="+searchKeyword);
		});
		
		
	});
	
	$(function(){
		
		$("#orderState").change(function(){  //검색 정렬 변경했을때. (관련도순 최신순)
			
			var searchTheme = $("#searchTheme").val();
			
			fncFormAction(searchTheme);
			
		});
		
	});
	
	$(function(){ //체크박스 클릭언클릭
		
		var searchTheme = $("#searchTheme").val(); //네이버블로그 what?
		
		$("input[name=engineNaver").on("change",function(){ //네이버체크박스 변경이됐는데
			
			if( $("input[name=engineNaver").is(":checked")){ //체크됐을때
				
				fncFormAction(searchTheme);
			}
			else{ 	// 해제일때, 다음버튼확인하고 다음도 해제되어있으면? 전체검색을 체크상태로 만든다.
				
				$(".check-all").prop("checked",false); //하나선택해제하면 전체선택이 더이상 아니니까.
				
				if(!$("input[name=engineDaum").is(":checked")){ // 다음도 체크되어있지않으면
					
					$(".check-all").click();
				}
				else{ //다음이 체크되어있으면 다음만 체크된 상태 전송
					
					fncFormAction(searchTheme);
				}
			}
		
		});
		
		$("input[name=engineDaum").on("change",function(){ //다음체크박스가 변경됐는데
			
			if($("input[name=engineDaum").is(":checked")){ //체크됐을때
				
				fncFormAction(searchTheme);
				
			}
			else{ 	// 해제일때, 네이버버튼확인하고 네이버도 해제되어있으면? 전체검색을 체크상태로 만들고 밑에 실행 x return 
				
				$(".check-all").prop("checked",false); //하나선택해제하면 전체선택이 더이상 아니니까.
				
				if(!$("input[name=engineNaver").is(":checked"))	{ // 다음도 체크되어있지않으면
			
					$(".check-all").click();
				}
				else{//네이버 체크되어있으면 네이버만 체크된 상태 전송
					
					fncFormAction(searchTheme);
				}
			}
			
		});//daum change끝
		
	});//ready끝
		
		
		