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
    	
    	.imageGroup{
    		height : 167px;
    		width : 185px;
    		margin:3px;
    		position : relative; 
    	}
    	
    	img{
    		
    		position :absolute;
    		width:100%;
    		height :100%;
    	}
    	
    	.imageTitle{
    	
    		display: block;
    		z-index :100;
    		position:absolute;
    		color : white;
    		background-color : #000000ad;
    		width: 185px;
    		height : 35px;
    		overflow : hidden;
    		text-overflow :ellipsis;
    		line-height :4;
    		top : 79%;
    		font-family:"굴림";
    		font-size:11px;
    		text-align : center;
    		
    	}
    	
    	.imageViewer{
    		
    		background-color : black;
    		width : 1175px;
    		height : 350px;
    	}
    	
    	.viewerImage{
    	
    		width: 300px;
    		height: 300px;
    		margin-left : 450px;
    		margin-top : 25px;
    	}
    	.viewerTitle{
    		
    		
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

		$(function(){ //이미지 호버 , 클릭

			$(".imageTitle").hide(); //기본으로 hide
			imageTitleHide();
	
		});
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
			//alert("currentPage"+currentPage);
			//alert("maxPage"+maxPage);
			
			if(currentPage < maxPage){ //이해할수 없어 왜 안되냐고 첫번째는 되고 왜 안돼??으시바아아아아아아아아아아아아아아아아알1~!~!~!~!
				//alert("들어옴");
				
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

							str +="<div class ='photo-grid-box'>" //메모장에있는거 그냥 가져다 붙이면 되지않나. ->이거 안댐 왜냐면 js(jquery)보다 jstl이 먼저 실행되기때문이다
								+"<div class='form-inline'>";
						$(list).each( //말고 jstl 해도된잔하아.
								
							function(){
							
								console.log(this);
								c++;
								if(this.title==null)
								{
									this.title ="";
								}
								str +="<div class='imageGroup'>" 
									+"<img alt='' class='imageThumbnail' src='"+this.thumbnail+"' width='190' height='167' data-row='"+r+"' data-col='"+c+"'>"
									+"<p class='imageTitle'>"+this.title+"</p></div>";
								i++;

								if(i%6==0){ //6개씩 줄바꿈
									str +="</div>";
									r++;
									c=0;
									str+="<div class='form-inline'>";
								}
								
						});

						str+="</div></div>"
					}//end list 반복문
					
					$(".card-body.col-md-12").append(str);
					imageTitleHide();//다시 하이드 시켜준다.
				}//end success
				
				
			});//ajax
			
			}
		}

		function imageTitleHide()
		{

			//var startViewStr ="<div class='imageViewer'></div> ";
			//var endViewStr 음 얠 그냥 
			var firstThis = null;
			var secondThis = null;
			
			$(".imageTitle").hide(); //기본으로 hide
			
			$(".imageGroup").hover(function(){ // hover
				$(this).find(".imageTitle").show(); },
				function(){ $(this).find(".imageTitle").hide() });

			$(".imageGroup").unbind('click'); //액션한번만
			$(".imageGroup").on("click",function(){ //click
				//하면 선택한 그림 그 한줄 밑에 str을 더한다.
			
				
				secondThis= this;
				//debugger;
				if(firstThis==secondThis && firstThis != null) //같은걸 두번 클릭하면
				{
					//alert("같은거 클릭");
					$(".imageViewer").fadeOut(300,function(){
						$(this).remove();
						});
					firstThis=null;
					secondThis=null;
					//viewer접기
				}
				else if(firstThis!=null && firstThis!=secondThis){ //다른 이미지를 클릭하면 /그냥 else맞다 이미 위에서 .imageGroup으로 걸렀기때문에

					//alert("다른거 클릭");
					$(".imageViewer").remove();//지우고 다시 append

					var str="<div class='imageViewer' height='350px' style='background-color:black;'>"
						  +"<a href='"+$(this).find("[name=imageLink]").attr("value")+"' target='_black'><img class='viewerImage' src='"+$(this).find("img").attr("src")+"' width='400px' height='300px'></a>"
						  +"<p class='viewerTitle'>"+$(this).find(".imageTitle").text().trim()+"</p>"	
						  +"</div>";
						  
					$(this).parent().after(str);
					
					//view 새로 img 세팅  .after();
				}
				else if(firstThis==null) //처음 열었을때
				{
					//alert("처음클릭");
					//if($(this).find("[name=]"))
					//if($(this).find(".imageViewer").get().length === 0){ //음 없을때만.
						
						var str="<div class='imageViewer' height='350px' style='background-color:black;'>"
							  +"<a href='"+$(this).find("[name=imageLink]").attr("value")+"' target='_black'><img class='viewerImage' src='"+$(this).find("img").attr("src")+"' width='400px' height='300px'></a>"
							  +"</div>";
							  
						$(this).parent().after(str);
						//alert($(this).find("img").attr("src"));
						//view연듸
					//}
				}
				
				firstThis = secondThis;
				
			});
		}

		
		
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
           					<li id="uniSearch" value="0" style="cursor:pointer;"><h4 class="uniSearch">통합검색</h4></li>
           					<li></li>
           					<li id="blogSearch" value="1" style="cursor:pointer;"><h4 class="blogSearch" >블로그</h4></li>
           					<li></li>
           					<li id="cafeSearch" value="2" style="cursor:pointer;"><h4 class="cafeSearch">카페</h4></li>
           					<li></li>
           					<li id="imageSearch" value="3" style="cursor:pointer;"><h4 class="imageSearch">이미지</h4></li>
           					<li></li>
           					<li id="webSearch" value="4" style="cursor:pointer;"><h4 class="webSearch">웹사이트</h4></li>
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
           					<div class="form-inline">
           						<c:forEach var="image" items="${imageList}">
           							<c:set var="c" value="${c+1}"/>
           							
           							<div class="imageGroup">
           								<img class="imageThumbnail" alt="" src="${image.thumbnail}" data-row="${r}" data-col="${c}">
           								<p class="imageTitle">${image.title}</p>
           								<input type="hidden" name="imageLink" value="${image.resultLink}"/>
           								<input type="hidden" name="sizeHeight" value="${image.sizeHeight}"/>
           								<input type="hidden" name="sizeWidth" value="${image.sizeWidth}"/>
           								<input type="hidden" name="dateTime" value="${image.dateTime}"/>
           								<input type="hidden" name="siteName" value="${image.siteName}"/>
           								<input type="hidden" name="collection" value="${image.collection}"/>
           								<input type="hidden" name="image" value="${image.image}"/>
           								<input type="hidden" name="engineFrom" value="${image.engineFrom}"/>
           								
           							 </div>
           							 
           							<c:set var="i" value="${i+1}"> </c:set>
           							<c:if test="${i%6==0}">
           								</div>
           
           								<c:set var="r" value="${r+1}"/>
           								<c:set var="c" value="0"/>
           								<div class="form-inline">
           							</c:if>
           						</c:forEach>
           						</div>
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