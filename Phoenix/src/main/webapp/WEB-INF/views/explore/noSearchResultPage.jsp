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
           					<li id="uniSearch" value="0"><h4 class="uniSearch" ${search.searchTheme==0? "style='color: #f5a142;'" : "" }>통합검색</h4></li>
           					<li></li>
           					<li id="blogSearch" value="1"><h4 class="blogSearch" ${search.searchTheme==1? "style='color: #f5a142;'" : "" }>블로그</h4></li>
           					<li></li>
           					<li id="cafeSearch" value="2"><h4 class="cafeSearch" ${search.searchTheme==2? "style='color: #f5a142;'" : "" }>카페</h4></li>
           					<li></li>
           					<li id="imageSearch" value="3"><h4 class="imageSearch" ${search.searchTheme==3? "style='color: #f5a142;'" : "" }>이미지</h4></li>
           					<li></li>
           					<li id="webSearch" value="4"><h4 class="webSearch" ${search.searchTheme==4? "style='color: #f5a142;'" : "" }>웹사이트</h4></li>
           					<li></li>
           					<li></li>
           					<li></li>
           					<li>
           						<select class="form-control" name="orderState">
									<option value="0" ${search.orderState==0 ? "selected" : "" }>관련도순</option>
									<option value="1" ${search.orderState==1 ? "selected" : "" }>최신순</option>
								</select>
           					</li>
           					<li></li>
           					<li>
           						<div class="form-group">
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
           			<input type="hidden" name="searchTheme" id="searchTheme" value="${search.searchTheme}">
           			</div>
           			
           			<div class="col-md-1">
           			</div>
           			
           			<div class="card-body col-md-12" style="margin-left:30px">
           				<div class="bootstrap-media">
           					<div class="form-inline" >
           						<h3><strong style="color:#f5a142;">'${search.searchKeyword}'</strong></h3>
           						<h3><strong>에 대한 검색결과가 없습니다.</strong></h3>
           					</div>
           					<ul class="list-icons">
           							<li>
           								<i class="fa fa-chevron-right"></i>
           								단어의 철자가 정확한지 확인해 보세요.
           							</li>
           							<li>
           								<i class="fa fa-chevron-right"></i>
           								한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.
           							</li>
           							<li>
           								<i class="fa fa-chevron-right"></i>
           								검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.
           							</li>
           							<li>
           								<i class="fa fa-chevron-right"></i>
           								두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.
           							</li>
           							<li>
           								<i class="fa fa-chevron-right"></i>
           								검색 옵션을 변경해서 다시 검색해 보세요.
           							</li>
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