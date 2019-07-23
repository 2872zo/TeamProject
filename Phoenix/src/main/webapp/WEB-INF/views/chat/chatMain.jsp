<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

	<link rel="stylesheet" href="/css/custom/scroll-top.css">
	
	
	
	
	<style>
		#div_menu{
			width:20%;
			height:500px;
			float:left;
			background-color:#82FA58;
		}
		
		#div_con{
			width:80%;
		}
	
		.cursor{
			cursor:pointer;
		}
		
		.cursor:hover{
			text-decoration: underline;
		}
	</style>
	
	<title>${search.cafeURL}</title>
</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
			<div class="brand-logo">
				<a href="/"> <b class="logo-abbr"> <b
						class="align-middle font-weight-bolder text-center"
						style='color: white; font-size: x-large;'>P</b>
				</b> <span
					class="brand-title align-middle font-weight-bolder text-center"
					style='color: white; font-size: x-large;'>Phoenix</span>
				</a>
			</div>
		</div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                <div class="hamburger">
                    </div>
                </div>
                
                <div class="header-left ">
				
				
				
				
				
				</div>

				<div class="header-right">
                    <ul class="clearfix">
                      
                      
                  <button type="button" class="btn btn-primary login"  data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-key">Login</i></button>
					<!--  <button type="button" class="btn btn-outline-primary login" >
						<i class="icon-key">Login</i>
					</button>-->

					<button type="button" class="btn btn-primary logout">
						<i class="icon-key">Logout</i>
					</button>
                     
                    </ul>
                </div>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->

        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
        	
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
          
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

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
	    	
	
	    	
	    	


    </script>
    
	<script type="text/javascript">
		   
			
	</script>
	


</body>

</html>
