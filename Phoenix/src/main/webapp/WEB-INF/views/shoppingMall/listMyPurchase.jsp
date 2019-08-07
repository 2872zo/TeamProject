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
    	
    	.container-fluid{
    	
    		font-family: 'Nanum Gothic', sans-serif;
    		font-weight : 400;
    	}
    	
    	.pageTitle{
    	
    		color : black;
    		font-size:23px;
    		font-weight:bold;
    		padding-left: 4%;
    		margin:2%;
    		text-decoration:underline;
    	}
    	
    	.card.left{
    	
    		width:700px;
    		
    	}
		.card.right{
		
			width:200px;
			margin-left:40px;
		}    	
    	
    	.row{
    		
    		margin-left:23%;
    		
    	}
    	
    	.card{
    	
    		margin-bottom:10%;
    	}
    	
    	.orderDate{
    		
    		color:black;
    		font-size:14px;
    		font-weight:800;
    		margin-top:10%;
    	}
    	
    	.orderTime{
    		
    		font-size:11px;
    		color:black;
    	}
    	
    	.orderNumber{
    		
    		margin-top:10%;
    	}
    	
    	.totalPrice{
    	
    	}
    	
    	
    	
    
    </style>
    
	<!--********************************** Scripts ***********************************-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>

	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.init.js"></script>

	<!-- 메뉴바 이용을 위한 스크립트 -->
	
	<script type="text/javascript">

	$(function(){

		$(".btn-danger").on("click",function(){ //개인정보수정페이지로 이동

				var userNo = $("#userNo").val();
				
				$(self.location).attr("href","/user/getUserInfo?userNo="+userNo);
				
		});
			
		
	});
	
	

		
	
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
           		<div class="pageTitle">상품구매내역</div>
           		
           			
           				<c:if test="${empty myAccountList }">
           					<div class="row">
           						<div class="card"> <!-- 왼쪽카드 -->
     								<div class="card-body" style="display:unset; width:800px; height:400px; text-align:center;">
        								
           								<p style="color:black; font-size:21px; font-weight:bold; margin-top:15%;">"연동된 쇼핑몰 계정이 없습니다!"</p>
           								<p style="color:black; font-size:21px; font-weight:bold;">"개인정보 수정페이지에서 계정을 연동해주세요."</p>
           								<input type="hidden" id="userNo" name="userNo" value="${user.userNo}"/>
           								
           								<button type="button" class="btn mb-1 btn-danger">연결 바로가기</button>
       								</div>
     							</div>
           					</div>
           				</c:if>
           				
           				<c:if test="${!empty myAccountList }">
           					
           					<div class="form-inline" style="margin:2%; display:flex; padding-left:70%;">
           					<span>연동된 쇼핑몰</span>
           					<c:forEach var="account" items="${myAccountList}">
		           				 <div class="form-check form-check-inline">
	                             	<label class="form-check-label">
	                                 <input type="checkbox" class="form-check-input check-all" name="shoppingmallAll" value="true" >전체</label>
	                        	 </div>
	           			
		           				<c:if test="${account.accountType eq 'ua103' }">
		           					 <div class="form-check form-check-inline">
	                            		 <label class="form-check-label">
	                                 	<input type="checkbox" class="form-check-input check-all" name="11stCheckbox" value="true" >11번가</label>
	                        		 </div>
		           				</c:if>
		           				<c:if test="${account.accountType eq 'ua104' }">
		           					<div class="form-check form-check-inline">
	                            		 <label class="form-check-label">
	                                 	<input type="checkbox" class="form-check-input check-all" name="coupangCheckbox" value="true" >쿠팡</label>
	                        		 </div>
		           				</c:if>
		           				<c:if test="${account.accountType eq 'ua105' }">
		           					<div class="form-check form-check-inline">
	                            		 <label class="form-check-label">
	                                 	<input type="checkbox" class="form-check-input check-all" name="tmonCheckbox" value="true" >티몬</label>
	                        		 </div>
		           				</c:if>
		           				<c:if test="${account.accountType eq 'ua106' }">
		           					<div class="form-check form-check-inline">
	                            		 <label class="form-check-label">
	                                 	<input type="checkbox" class="form-check-input check-all" name="gmarketCheckbox" value="true" >G마켓</label>
	                        		 </div>
		           				</c:if>
		           				<c:if test="${account.accountType eq 'ua107' }">
		           					<div class="form-check form-check-inline">
	                            		 <label class="form-check-label">
	                                 	<input type="checkbox" class="form-check-input check-all" name="wmpCheckbox" value="true" >위메프</label>
	                        		 </div>
		           				</c:if>
		           				<c:if test="${account.accountType eq 'ua108' }">
		           					<div class="form-check form-check-inline">
	                            		 <label class="form-check-label">
	                                 	<input type="checkbox" class="form-check-input check-all" name="AuctionCheckbox" value="true" >옥션</label>
	                        		 </div>
		           				</c:if>
	           				</c:forEach>
           					</div>
           				
	           	
           		<div class="nowDelivery">배송중 </div>
           		<div class="row" style="height:50px;">
     	
     				<div class="card left" style="background-color:#f5a142; height:30px;"> <!-- 왼쪽카드 -->
     					<div class="card-body" style="color:white; padding-left:45%; font-size:16px; padding-top:4px; font-weight:600;">
        					구매내역
       					</div>
     				</div>
     				
     				<div class="card right" style="background-color:#f5a142; height:30px;"> <!-- 오른쪽카드 -->
     					<div class="card-body" style="color:white; padding-left:35%; font-size:16px; padding-top:4px; font-weight:600;">
        					배송상태
       					</div>
     				</div>
     				
           		</div><!-- end row -->
           		
           		<c:if test="${empty totalPurchaseList }">
           		
           			<div class="row">
           				<p>구매 내역이 없습니다.</p>
           			</div>
           		
           		</c:if>
           		
           		<c:if test="${!empty totalPurchaseList}">
           			<c:forEach var="purchase" items="${totalPurchaseList}">
           			<div class="row">
           			
           				<div class="card left"> <!-- 왼쪽카드 -->
           					<div class="card-body">
			           				<div class="row context" style="margin:0;">
			           					<div class="col-lg-3" style="text-align:center;">
				           					<div class="orderDate">${purchase.orderDate}</div>
				           					<div class="orderTime">${purchase.orderTime}</div>
				           					<div class="orderNumber">
				           						<p>주문번호</p>
				           						<span style="font-weight:800;">${purchase.orderNumber}</span>
				           					</div>
				           					<hr/>
				           					<div class="totalPrice">
				           						<p>총 주문금액</p>
				           						<span style="color:#f5a142; font-size:17px; font-weight:800;">${purchase.totalPrice}</span>
				           						
				           					</div>
			           					</div>
			           					<div class="col-lg-9">
			           						<div class="row">
			           							<a href="${purchase.originPageLink}"><img src="${purchase.imageSrc}"/></a>
			           							<div>
			           								<div class="productName">${purchase.productName}</div>
			           								<div class="totalPrice">${purchase.totalPrice}</div>
			           							</div>
			           							
			           						</div>
			           						<div class="productDetail">${purchase.productDetail}</div>
			           					</div>
			           				</div>
			           			
		           			</div>
           				</div>
           				
           				<div class="card right"> <!-- 오른쪽카드 -->
           				
           					<div class="card-body">
			           				<div class="context">
			           					<div class="orderState">${purchase.orderState}</div>
			           					<div class="deliveryPrice">${purchase.deliveryPrice}</div>
			           				</div>
			           			
		           			</div>
           				</div>
           				
           			</div><!-- end row -->
           			</c:forEach>
           		</c:if>
           		
           		
           		</c:if>
           	
           		
           		
           
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
   		<script src="/js/custom/shoppingmallCommon.js"></script>
   	<!-- 공통 툴바용 스크립트 -->	
		<script src="/js/custom/toolbarScript.js"></script>
	</body>
</html>