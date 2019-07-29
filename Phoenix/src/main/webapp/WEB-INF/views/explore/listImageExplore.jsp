<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html lang="ko">
<head>

<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->

<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">

<!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
    	li{
    		
    		padding : 10px;
    		
    	}
    	
    	.imageSearch{
    	
    		color:#f5a142;
    	}
    	
    	#blogTitle{
    	
    		display: inline-block;
    		width: 350px; 
    		white-space: nowrap; 
    		overflow: hidden; 
    		text-overflow: ellipsis;
    		text-decoration:underline; 
    		color:#f5a142; 
    		
    	}
    	#blogName{
    		
    		display: inline-block;
    		width: 160px; 
    		white-space: nowrap; 
    		overflow: hidden; 
    		text-overflow: ellipsis;
    	}
    	
    	#blogLink{
    	
    		display: inline-block;
    		width: 160px; 
    		white-space: nowrap; 
    		overflow: hidden; 
    		text-overflow: ellipsis;
    		color:#f5a142; 
    	}
    	
    	#blogContent{
    	
    		display: inline-block;
    		width: 450px; 
    		white-space: nowrap; 
    		overflow: hidden; 
    		text-overflow: ellipsis;
    		
    		white-space: normal; 
    		line-height: 1.5; 
    		text-align: left; 
    		word-wrap: break-word; 
    		display: -webkit-box; 
    		-webkit-line-clamp: 3; 
    		-webkit-box-orient: vertical;
    		color : black;
    		margin-bottom : 10px;
    	}
    
    </style>
<!--**********************************
        Scripts
    ***********************************-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>

	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.init.js"></script>

	<!-- 메뉴바 이용을 위한 스크립트 -->
	
	<script type="text/javascript">

	var checkSessionUser = ${empty sessionScope.user};
	
		$(function(){  //전체검색, 네이버, 다음 체크박스

			$(".check-all").on("click",function(){
				
				$(".singleCheck").prop("checked",this.checked); //전체선택에 따라서 변경하도록

				if($(".check-all").is(":checked")){ //전체 선택 체크되었을때만! 체크안되면  action안일어남

					var searchTheme = $("#searchTheme").val();

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
						$("form").attr("method","POST").attr("action","/explore/getImageList").submit();
					}
					if(searchTheme==4){	
						$("form").attr("method","POST").attr("action","/explore/getWebsiteList").submit();
					}
									
				}
			});

		});
		
		// 무한스크롤 
		
		
		

		$(document).ready(function(){ //스크롤액션
			
			var win  = $(window);
			var i =0;
			
			win.scroll(function(){

				//alert("@@@@@@!");
				if( $(window).scrollTop() >= ($(document).height() - $(window).height())*0.9){
					//alert("엑?");
					if(boolsw){
						//alert("???????");
						if(i>0){
							sendData();
						}
						i++;
					}
				
					//$(".row-inline").append("안녕안녕!");
					
				}//if
			});//scroll
		});//document
			
		var boolsw = true;
		var maxPage = 0;
		var currentPage =1;
		
		function sendData(){ //무한스크롤 에이잭스 통신
			
			boolsw = false;
			//alert("sendData");
			//var currentPage = $("#currentPage").val();
			maxPage = $("#maxPage").val();
			//currentPage++;
			alert("currentPage"+currentPage);
			alert("maxPage"+maxPage);
			debugger;
			if(currentPage < maxPage){ //이해할수 없어 왜 안되냐고 첫번째는 되고 왜 안돼??으시바아아아아아아아아아아아아아아아아알1~!~!~!~!
				alert("들어옴");
				
				currentPage++;
			
			$.ajax({
				url : "/explore/json/infiniteImageList",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json ; charset=UTF-8"
				},
				data : JSON.stringify({ //보내는 data jsonString 화
					searchKeyword : $("input[name=searchKeyword]").val(), //있음
					engineAll : $("input[name=engineAll]").val(),
					engineNaver : $("input[name=engineNaver]").val(),
					engineDaum : $("input[name=engineDaum]").val(),
					orderState : $("select[name=orderState]").val(), //있음
					currentPage : currentPage+""
				
				}),
				dataType : "text",
				success : function(serverData){
					//alert(serverData);
					setTimeout(function(){boolsw = true;},500);
					
					$("input[name=currentPage]").val(currentPage);
					
					var data = JSON.parse(serverData);
					
					var str = "";
					//var resultPage = data.page;
					var search = data.search;
					var list = data.imageList;
					var i=0;
					var r=1;
					var c=0;
					//alert(resultPage);
					//alert(search);
					//alert(list);
				
					if(list != ""){ //한번 불러올때마다 inline이랑 시켜줘야한다.

							str +="<div class ='photo-grid-box'>"; //메모장에있는거 그냥 가져다 붙이면 되지않나. ->이거 안댐 왜냐면 js(jquery)보다 jstl이 먼저 실행되기때문이다
						
						$(list).each( //말고 jstl 해도된잔하아.
								
							function(){
							
								console.log(this);
								c++;
								str += "<img alt='' src='"+this.thumbnail+"' width='190' height='167' data-row='"+r+"' data-col='"+c+"'>"
								i++;

								if(i%6==0){ //6개씩 줄바꿈
									r++;
									c=0;
								}
								
						});

						str+="</div>"
					}//end list 반복문
					
					$(".card-body.col-md-12").append(str);
					
				}//end success
				
				
			});//ajax
			
			}
		}

		$(function(){ //이미지 호버

			$("img").hover(function(){기술},function(){기술})

		});
		
	</script>
	
	
	
</head>

<body  data-layout="vertical" data-nav-headerbg="color_1" data-headerbg="color_1" data-sidebar-style="full" data-sibebarbg="color_1"data-container="wide">
	

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <form name ="form" >
    <div id="main-wrapper" class="show">
		
        <!--**********************************
            Nav header start
        ***********************************-->	
     	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/WEB-INF/views/explore/exploreToolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->
       
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
     	<br/>
            <!-- row -->
            <div class="container-fluid">
           		<div class="card">
           			<div class="card-header">
           			<hr/>
           				<ul class="form-inline">
           					<li></li>
           					<li></li>
           					<li id="uniSearch" value="0"><h4 class="uniSearch">통합검색</h4></li>
           					<li></li>
           					<li id="blogSearch" value="1"><h4 class="blogSearch">블로그</h4></li>
           					<li></li>
           					<li id="cafeSearch" value="2"><h4 class="cafeSearch">카페</h4></li>
           					<li></li>
           					<li id="imageSearch" value="3"><h4 class="imageSearch">이미지</h4></li>
           					<li></li>
           					<li id="webSearch" value="4"><h4 class="webSearch">웹사이트</h4></li>
           					<li></li>
           					<li></li>
           					<li></li>
           					<li>
           						<select class="form-control" name="orderState" id="orderState">
									<option value="0" ${search.orderState==0 ? "selected" : "" }>관련도순</option>
									<option value="1" ${search.orderState==1 ? "selected" : "" }>최신순</option>
								</select>
           					</li>
           					<li></li>
           					<li>
           						<div class="form-inline">
                                     <div class="form-check form-check-inline">
                                         <label class="form-check-label">
                                             <input type="checkbox" class="form-check-input check-all" name="engineAll" value="true" ${search.engineAll ? "checked" : "" }>전체검색</label>
                                     </div>
                                     <div class="form-check form-check-inline">
                                         <label class="form-check-label">
                                             <input type="checkbox" class="form-check-input singleCheck" name="engineNaver" value="true" ${search.engineNaver ? "checked" : "" }>네이버</label>
                                     </div>
                                     <div class="form-check form-check-inline disabled">
                                         <label class="form-check-label">
                                             <input type="checkbox" class="form-check-input singleCheck" name="engineDaum" value="true" ${search.engineDaum ? "checked" : "" }>다음</label>
                                     </div>
                                 </div>
           					</li>
           				</ul>
           			<hr/>
           			<input type="hidden" name="searchTheme" id="searchTheme" value="3">
           			<input type="hidden" name="currentPage" id="currentPage" value="${search.currentPage}">
           			<input type="hidden" name="maxPage" id="maxPage" value="${page.maxPage}"/>
           			</div>
           			
           			
           			<div class="card-body col-md-12">
           				
           				<div class ="photo-grid-box"> <!-- 54개 한 뭉텅이  x반복 -->
           					<c:set var="i" value="0"/>
           					<c:set var="r" value="1"/>
           					<c:set var="c" value="0"/>
           						<c:forEach var="image" items="${imageList}">
           							<c:set var="c" value="${c+1}"/>
           							
           							<img alt="" src="${image.thumbnail}" width="190" height="167" data-row="${r}" data-col="${c}">
           							
           							<c:set var="i" value="${i+1}"> </c:set>
           							<c:if test="${i%6==0}">
           								<br/>
           								<c:set var="r" value="${r+1}"/>
           								<c:set var="c" value="0"/>
           							</c:if>
           						</c:forEach>
           				</div>
           				
           			</div>
           			
           			<div>
           		  </div>
           			
           		</div>
            </div>
      
            <!-- #/ container -->
           
            
    </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        
        <!--********************************** Footer start ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
        </div>
        <!--**********************************Footer end ***********************************-->
        
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    

           		
   	 </form>
   	 
   	<!-- 검색 엔터용 스크립트같은데 -->
   		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
   	<!-- 검색 공통 스크립트 -->
   		<script src="/js/custom/exploreCommon.js"></script>
	</body>
</html>