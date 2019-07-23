<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    
    <meta charset="utf-8">
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/quixlab/favicon.png">
    <!-- Custom Stylesheet -->
    <style>
    	li{
    		
    		padding : 10px;
    		
    	}
    	
    	.blogSearch{
    	
    		color:#f5a142;
    	}
    
    </style>
    
    <link href="/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script src="https://kit.fontawesome.com/e589319d43.js"></script>
	
	
	<script type="text/javascript">


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
     	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/toolbar.jsp" />
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
                                             <input type="checkbox" class="form-check-input check-all" name="engineAll" value="">전체검색</label>
                                     </div>
                                     <div class="form-check form-check-inline">
                                         <label class="form-check-label">
                                             <input type="checkbox" class="form-check-input singleCheck" name="engineNaver" value="">네이버</label>
                                     </div>
                                     <div class="form-check form-check-inline disabled">
                                         <label class="form-check-label">
                                             <input type="checkbox" class="form-check-input singleCheck" name="engineDaum" value="">다음</label>
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
   	 
   	<script src="/js/custom/cafeCommon.js"></script> 
	</body>
</html>