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
    	}
    	
    	.card.left{
    	
    		width:700px;
    		
    	}
		.card.right{
		
			width:200px;
			margin-left:40px;
		}    	
    	
    	.row{
    		
    		margin-left:13%;
    		height:200px;
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
           		<div class="row">
           			<div class="nowDelivery">배송중 </div>
           			<div class="form-inline">
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
           		</div>
           		
           		<div class="row">
           			<div>구매내역</div>
           			<div>배송상태</div>
           		</div>
           		<c:forEach var="purchase" items="${totalPurchaseList}">
           			<div class="row">
           			
           				<div class="card left"> <!-- 왼쪽카드 -->
           					<div class="card-body">
			           				<div class="context">
			           					<div class="col-lg-3">
				           					<div class="orderDate">${purchase.orderDate}</div>
				           					<div class="orderTime">${purchase.orderTime}</div>
				           					<div class="orderNumber">${purchase.orderNumber}</div>
				           					<div class="totalPrice">${purchase.totalPrice}</div>
			           					</div>
			           					<div class="col-lg-8">
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
	</body>
</html>