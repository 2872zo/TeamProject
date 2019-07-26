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

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/WEB-INF/views/explore/exploreToolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->

<!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
    	li{
    		
    		padding : 10px;
    		
    	}
    	
    	.blogSearch{
    	
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
    	
    	#blogContent{
    	
    		display: inline-block;
    		width: 450px; 
    		white-space: nowrap; 
    		overflow: hidden; 
    		text-overflow: ellipsis;
    		
    		white-space: normal; 
    		line-height: 1.2; 
    		height: 2.6em; 
    		text-align: left; 
    		word-wrap: break-word; 
    		display: -webkit-box; 
    		-webkit-line-clamp: 3; 
    		-webkit-box-orient: vertical;
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
           			<input type="hidden" name="searchTheme" id="searchTheme" value="1">
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
	           						<c:if test="${empty blog.thumbnail}"> <!-- 검색 이미지없을때  -->
	           							<img alt="" src="/images/no_Image.jpg" width="130" height="130" style="margin-left:20px;">
	           						</c:if>
	           						<c:if test="${!empty blog.thumbnail}"> <!-- 검색 이미지있을때 -->
	           							<img alt="" src="${blog.thumbnail}" style="margin-left:20px; margin-top: 20px">
	           						</c:if>
									<div class="media-body" style="margin-left:50px; margin-top:8px;">
										<div class="form-inline">
											<h6>
												<a href="${blog.resultLink}" id="blogTitle" >${blog.title}</a>
											</h6> &nbsp;&nbsp;&nbsp; 
											<p>${blog.dateTime}</p>
										</div>
										
										<div class="form-group" id="blogContent">${blog.contents}</div>
										
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
   	<!-- 검색 공통 스크립트 -->
   		<script src="/js/custom/exploreCommon.js"></script>
	</body>
</html>