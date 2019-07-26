$(function(){
		
		$("#explore").on("click",function(){ //exploreToolbar.jsp의 검색 버튼 누르면
											 //searchKeyword 제외 다른애들은 초기화 그냥 get방식으로 가야하나.
											 //pageNavigation 할때만 Search 살린다.
			var searchTheme = $("#searchTheme").val();
			var searchKeyword = $("#searchKeyword").val();
			
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
	
	$(function(){
		
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
		
		
		