<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html lang="ko">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/WEB-INF/views/explore/exploreToolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
    	li{
    		
    		padding : 10px;
    		
    	}
    	
    	.uniSearch{
    	
    		color:#f5a142;
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
	<script src="/js/custom/scroll-top.js"></script>
	<script type="text/javascript">

	var checkSessionUser = ${empty sessionScope.user};
	
		$(function(){

			$(".check-all").on("click",function(){
				
				$(".singleCheck").prop("checked",this.checked);
			})


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
           						<select class="form-control" name="orderState">
									<option value="0">관련도순</option>
									<option value="1">최신순</option>
								</select>
           					</li>
           					<li></li>
           					<li>
           						<div class="form-group">
                                     <div class="form-check form-check-inline">
                                         <label class="form-check-label">
                                             <input type="checkbox" class="form-check-input check-all" name="engineAll" value="" checked>전체검색</label>
                                     </div>
                                     <div class="form-check form-check-inline">
                                         <label class="form-check-label">
                                             <input type="checkbox" class="form-check-input singleCheck" name="engineNaver" value="" checked>네이버</label>
                                     </div>
                                     <div class="form-check form-check-inline disabled">
                                         <label class="form-check-label">
                                             <input type="checkbox" class="form-check-input singleCheck" name="engineDaum" value="" checked>다음</label>
                                     </div>
                                 </div>
           					</li>
           				</ul>
           			<hr/>
           			<input type="hidden" name="searchTheme" id="searchTheme" value="0">
           			</div>
           			
           			<div class="col-md-1">
           			</div>
           			
           			<div class="card-body col-md-7">
           				<div class="bootstrap-media">
           					<ul class="list-unstyled">
	           				
	           				<c:set var="i" value="0"/>
	           				<c:forEach var="blog" items="${blogList}">
	           					<c:set var="i" value="${i+1}"/>
	           					<li class="media">
	           						<img alt="이미지없음" src="${blog.thumbnail}">
									<div class="media-body">
										<a href="${blog.resultLink}">${blog.title}</a>${blog.dateTime}
										<br/>
										${blog.contents}
										<br/>
										<a href="${blog.blogLink}">${blog.blogName}</a>
									</div>           					
	           					</li>
	           				</c:forEach>
	           			
           					</ul>
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
   	 
   	 <!-- 검색 엔터용 스크립트같은데 -->
   		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
   	<!-- 공통 툴바용 스크립트 -->	
		<script src="/js/custom/toolbarScript.js"></script>
   	<!-- 검색 공통 스크립트 -->
   		<script src="/js/custom/exploreCommon.js"></script>
	</body>
</html>