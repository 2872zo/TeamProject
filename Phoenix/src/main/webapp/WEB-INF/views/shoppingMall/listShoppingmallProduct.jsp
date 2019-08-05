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
<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi|Ubuntu&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">

<!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
    	
    	.brand-title{
    		
    		color:#f5a142;
    		background-color : white;
    		font-family: 'Ubuntu', sans-serif;
    		font-size:30px;
    		margin-left:15px;
    	}
    	
    	.shopping-title{
    		
    		font-family: 'Gugi', cursive;
    		margin : 30px;
    		color: #f5a142;
    		border : 3px solid;
    		padding: 10px;
    	}
    	dt{
    		
    		display : inline-block;
    		border : 1px solid #f5a142;
    		border-radius: 10px;
    		color: #f5a142;
    		padding: 0 5px;
    		
    	}
    	
    	dd{
    		
    		margin:5px 10px;
    	}
    	
    	
    	.container-fluid{
    	
    		font-family: 'Nanum Gothic', sans-serif;
    		font-weight : 400;
    	}
    	
    	.result-info{
    		
    		color : black;
    		font-size:23px;
    		
    	}
    	
    	.thumbnail{
    		
    		display:block;
    		width: 326px;
    		height:508px;
    		border-bottom: 1px solid #80808038;
    		border-right : 1px solid #80808038;
    	}
    	
    	.title{
    	
 			width: 250px;
 			color : black;
 			height :30px;
 			display : block;
 			float : left;
 			font-size: 16px;
    	}
    	
    	.price_area{
    	
    		display : block;
    		margin-top : 80px;
    		width : 300px;
    		height : 100px;
    		
    	
    	}
    	
    	.price{
    	
    		color:black;
    		margin-bottom : 0;
    		
    	}
    	.delivery{
    		
    		display : block;
    		width: 300px;
    		height: 20px;
    		font-size: 10px;
    		
    	}
    	img{
    		display : block;
    		width:250px;
    		height:250px;
    		margin : 20px;
    		margin-left:40px;
  
    	}
    	.caption{
    		
    		margin-left :40px;
    	}
    	
    	.buyCount{
    		
    		border-left:1px solid #e3e5e8; 
    		padding-left :10px; 
    		font-size:10px;
    	}
    	
    	hr{
    		width:80%;
    	}
    	
    	.loader-ellips {
		  display : none;
		  font-size: 20px; /* change size here */
		  position: relative;
		  width: 4em;
		  height: 1em;
		  margin-left:40%;
		  margin: 10px auto;
		}
		
		.loader-ellips__dot {
		  display: block;
		  width: 1em;
		  height: 1em;
		  border-radius: 0.5em;
		  background: #555; /* change color here */
		  position: absolute;
		  animation-duration: 0.5s;
		  animation-timing-function: ease;
		  animation-iteration-count: infinite;
		}
		
		.loader-ellips__dot:nth-child(1),
		.loader-ellips__dot:nth-child(2) {
		  left: 0;
		}
		.loader-ellips__dot:nth-child(3) { left: 1.5em; }
		.loader-ellips__dot:nth-child(4) { left: 3em; }
		
		@keyframes reveal {
		  from { transform: scale(0.001); }
		  to { transform: scale(1); }
		}
		
		@keyframes slide {
		  to { transform: translateX(1.5em) }
		}
		
		.loader-ellips__dot:nth-child(1) {
		  animation-name: reveal;
		}
		
		.loader-ellips__dot:nth-child(2),
		.loader-ellips__dot:nth-child(3) {
		  animation-name: slide;
		}
		
		.loader-ellips__dot:nth-child(4) {
		  animation-name: reveal;
		  animation-direction: reverse;
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

		$(document).ready(function(){ //스크롤액션
			
			var i =0;
			var win  = $(window);
			
			win.scroll(function(){
	
				
				if( win.scrollTop() >= ($(document).height() - win.height())*0.9){
					
					if(boolsw){
						
						if(i>0){
							var totalCount = $("#searchTotal").val();
							totalCount= totalCount.replace(/,/gi,'');
							var detectedItemCount = $("#detectedItemCount").val();

							totalCount--;
							//alert(totalCount);
							//alert(detectedItemCount);
							//debugger;
							
							if(totalCount>detectedItemCount){
								//alert("안녕");
								sendData();
							}
							
						}
						i++;
					}
					
				}//if
			});//scroll
		});//document	


		var boolsw = true;

		function sendData(){ //무한스크롤 에이잭스 통신
					
					boolsw = false;
					var totalCount = $("#searchTotal").val();
					totalCount = totalCount.replace(/,/gi,'');
					
					$.ajax({
						url : "/shopping/json/infiniteProductList",
						method : "POST",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json ; charset=UTF-8"
						},
						data : JSON.stringify({ //보내는 data jsonString 화
							searchKeyword : $("input[name=searchKeyword]").val(), //있음
							detectedItemCount : $("input[name=detectedItemCount]").val(),
							searchTotal : totalCount
						
						}),
						beforeSend : function(){
							$(".loader-ellips").css("display","block");
						},
						dataType : "text",
						success : function(serverData){
							alert("serverData : "+serverData);
							setTimeout(function(){boolsw = true;},500);
							
							
							var data = JSON.parse(serverData);
							
							var str = "";
							var search = data.search;
							var productList = data.productList;

							var j=0;
							//alert(search);
							//alert(list);
							$("#searchTotal").val(search.searchTotal);
							$("#detectedItemCount").val(search.detectedItemCount);
							
							if(productList != ""){ 
		
									str +="<div class ='row'>";
						
								$(productList).each( 
										
									function(){
									
										if(j%3==2)
										{ //맨 오른쪽 인애
											str+="<div class='thumbnail' style='border-right:0px;'>";
										}
										else
										{ //나머지
											str+="<div class='thumbnail'>";
										}

										str+= "<a href='"+this.detailPageLink+"'>"
										+"<img src='"+this.productImage+"' alt='' />"
										+"<div class='caption'><div class='title'>"+this.productName+"</div><br/>"
										+"<div class='price_area'>"
										+"<p class='price'><span style='font-weight:800; font-size:20px;'>"+this.price+"</span> 원</p><p class='delivery'>";

										if(this.averageDeliveryDate!=null && this.averageDeliveryDate.indexOf('.')!= -1)
										{
											str+=this.averageDeliveryDate;
										}

										str+="</p><span class='reviewAverage'>"+this.reviewAverage+"</span>" //this.reviewAverage null처리
										+"<span class='reviewCount'>";

										if(this.reviewCount!="" || this.reviewCount!=null)
										{
											str+="("+this.reviewCount+")";
										}

										str+="</span><span class='buyCount'>"+this.buyCount+" 개 구매</span></div></div></a></div>";
										j++;

										if(j%3==0)
										{
											str+="</div>";
											if(j!=24)
											{
												str+="<div class='row'>";
											}
										}
										

									});

							
							}//end list 반복문
							
							$(".context-body").append(str);
							
						}//end success
						
						
					});//ajax
					
				
				}
	
	</script>
	
	
	
</head>

<body  data-layout="vertical" data-nav-headerbg="color_1" data-headerbg="color_1" data-sidebar-style="full" data-sibebarbg="color_1"data-container="wide">
	
	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"></circle>
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->
	

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <form name ="form" >
    <div id="main-wrapper" class="show">
		
        <!--**********************************
            Nav header start
        ***********************************-->	
     	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/WEB-INF/views/shoppingMall/shoppingmallToolbar.jsp" />
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
           			
           			
           			
           			</div>
           			
           			<!--카드바디 안에 col-md를 나눠라 -->
           	
           			<div class="card-body">
           				<div class="row">
	           				<div class="choose-area col-lg-2" >
	           				
	           				</div>
	           				<div class="context col-lg-10">
	           					<div class="context-head" style="width:80%;">
	           						<div class="result-info">
	           							<strong>
	           								<span>'${search.searchKeyword}'에 대한 검색 결과</span>
	           								<span style="color:#f5a142;" > '${search.searchTotal}'</span> 건
	           								<input type="hidden" id ="searchTotal" name="searchTotal" value="${search.searchTotal}" />
	           								<input type="hidden" id="detectedItemCount" name="detectedItemCount" value="${search.detectedItemCount}"/>
	           							</strong>
	           						</div>
	           						<br/>
	           						<div class="related_keyword">
	           							<dl class="form-inline">
	           								<c:if test="${!empty search.relativeKeyword}"><!-- 연관검색어 있을경우 -->
	           									<dt>연관검색어</dt>
		           								<c:set var="i" value="0"/>
		           								<c:forEach var="relativeKeyword" items="${search.relativeKeyword}">
		           									<dd><a href="${search.relativeKeywordLink[i]}">${relativeKeyword}</a></dd>
		           									<c:set var="i" value="${i+1}"/>
		           								</c:forEach>
	           								</c:if>
	           								
	           							</dl>
	           						</div>
	           					</div>
	           					<hr/>
	           					
	           					<div class="context-body">
	           						<div class="row">
	           						<c:set var="j" value="0"/>
	           						<c:forEach var="product" items="${productList}">
	           							<c:if test="${j%3==2}">
	           								<div class="thumbnail" style="border-right:0px;">
	           							</c:if>
	           							<c:if test="${j%3!=2}">
	           								<div class="thumbnail">
	           							</c:if>
	           							<a href="${product.detailPageLink}"> <!-- 썸네일 클릭하면 이동하도록  묶어버림 -->
	           								<img src="${product.productImage}" alt="" />
	           								<div class="caption">
	           									<div class="title">
	           										${product.productName}
	           									</div>
	           									<br/>
	           									<div class="price_area">
		           									<p class="price"><span style="font-weight:800; font-size:20px; ">${product.price}</span> 원</p>
		           									<p class="delivery">
													<c:if test="${fn:contains(product.averageDeliveryDate,'.')}">
														${product.averageDeliveryDate}
													</c:if>	           									
		           									</p>
		           									<span class="reviewAverage">${product.reviewAverage}</span>
		           									<span class="reviewCount">
			           									<c:if test="${!empty product.reviewCount}">
			           										(${product.reviewCount})
			           									</c:if>
		           									</span>
		           									<span class="buyCount">${product.buyCount }개 구매</span>
	           									</div>
	           								</div>
	           							</a>
	           							</div>
	           							<c:set var="j" value="${j+1}"/>
	           							<c:if test="${j%3==0}">
	           								</div>
	           								<c:if test="${j!=24}">
	           									<div class="row">
	           								</c:if>
	           								
	           							</c:if>
	           						</c:forEach>
	           					
	           					
	           					</div>
	           					<br/>
	           					<div class="loader-ellips">
								  <span class="loader-ellips__dot"></span>
								  <span class="loader-ellips__dot"></span>
								  <span class="loader-ellips__dot"></span>
								  <span class="loader-ellips__dot"></span>
								</div>
	           					
	           				</div>
           				</div>
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
   	 
   <!--	 검색 엔터용 스크립트같은데 -->
   		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> -->
   	<!-- 검색 공통 스크립트-->
   		<script src="/js/custom/shoppingmallCommon.js"></script>
	</body>
</html>