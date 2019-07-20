<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/quixlab/favicon.png">
    <!-- Custom Stylesheet -->
    
    <link href="/plugins/quixlab/sweetalert/css/sweetalert.css" rel="stylesheet">
    <link href="/css/quixlab/style.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
	<script type="text/javascript">
	$(function() {
		
		$("button[name=button]" ).on("click" , function() {
			alert($(".cafeNo").val())
			alert('${cafe.cafeURL}')
		
			//$("form").attr("method" , "POST").attr("action" , "/cafe/"+'${cafe.cafeURL}'+"/manage/dropCafe").submit();
		});
	});
	</script>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="../common/cafeManageTollbar.jsp" /> 
	<!-- ToolBar End /////////////////////////////////////-->
	
</head>

<body>

		<!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
        	<c:import url="/WEB-INF/views/common/cafeManageMenubar.jsp"></c:import>
       	</div>
        <!--**********************************
            Sidebar end
        ***********************************-->
        
        <!--**********************************
            Content body start
        ***********************************-->

	<div class="content-body" style="min-height: 743px;">
	
		<div class="row page-titles mx-0">
	                <div class="col p-md-0">
	                    <ol class="breadcrumb">
	                        <li class="breadcrumb-item"><a href="javascript:void(0)">매니저페이지</a></li>
	                        <li class="breadcrumb-item active"><a href="javascript:void(0)">폐쇄</a></li>
	                    </ol>
	                </div>
	    </div>
	
         <div class="container-fluid">
               <div class="row">
                   <div class="col-lg-12">
						<div class="card">
	                            <div class="card-body">
	                                <h4 class="card-title">>카페폐쇄</h4>
	                                <div class="basic-form">
	                                    <form>
	                                        <div class="form-group">
	                                            <label>폐쇄 이유를 입력해주세요</label>
	                                            <textarea class="form-control h-150px" rows="6" id="comment"></textarea>
	                                        </div>
	                                    </form>
	                                </div>
	                                <input type="hidden" name="cafeNo" class="cafeNo" value="${cafe.cafeNo }"/>
	                                <div align="center">
	                                <button type="button" name="button" class="btn mb-1 btn-outline-warning">카페폐쇄하기</button>
	                                </div>
	                            </div>
	                        </div>
                        </div>
                      </div>
                     </div>
         </div>
         
         
			
			
	
	<!--**********************************
        Scripts
    ***********************************-->
    <script src="/plugins/quixlab/common/common.min.js"></script>
    <script src="/js/quixlab/custom.min.js"></script>
    <script src="/js/quixlab/settings.js"></script>
    <script src="/js/quixlab/gleek.js"></script>
    <script src="/js/quixlab/styleSwitcher.js"></script>
    
	</body>
</html>

						