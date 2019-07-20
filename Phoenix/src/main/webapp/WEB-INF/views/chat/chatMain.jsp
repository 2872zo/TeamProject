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
	
	</style>
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

        <jsp:include page="../common/newToolBar.jsp" />

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
        	<c:import url="/WEB-INF/views/cafe/menubarCafe.jsp"></c:import>
       	</div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
			<div id="mainContent">
					공지게시글
					
				</div>

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">

            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>CCCopyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
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
    
    <!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
    <script type="text/javascript">
	    (function($) {
	        "use strict";
	
	    	$(function(){
	    		
	    		$(".myDetail").hide();
	    		$(".showMyDetail").on("click",function(){
	    			if(${cafeMember.userNo}=='400')//1. 로그인이 안되어있으면
	    			{
	    				alert("로그인하세요! (로그인창 띄우기)");
	    			}
	    			else if(${cafeMember.userNo}=='500')//카페멤버가 아니면
	    			{
	    				alert("카페에 가입하세요!(카페에가입하시겠습니까?띄우기)");
	    			}
	    			else //카페멤버라면
	    			{
	    				$(".myDetail").show(); 
	    			}
	    		});
	
	    		$("[name=InnerSearch]").attr("method", "GET").attr("action", "/cafe/${cafeURL}/search");
	    		
	    		$("[name=menubarSubmit]").on("click", function(){
	    			location.href = "/cafe/" + "${cafeURL}" + "/search?searchKeyword=" + $("#menubarSearch").val(); 
	    		});	
	
	    		$("[name=toManage]").on("click", function(){
	    			location.href = "/cafe/${cafeURL}/manage/getCafeStatistics";
	    		});
	    		
	    	});
	
	    	$(function(){//카페탈퇴
	
	    		$(".deleteMember").on("click",function(){
	    			$( "#dialog" ).dialog("open");
	    			});
	    		var memberNo = '${cafeMember.memberNo}'
	    		$( "#dialog" ).dialog({ 
	    			 autoOpen: false, 
	    			  width: 400, 
	    			  modal: true, 
	    			  buttons: [ { 
	    				   text: "확인", 
	    				   click: function() { 
	    					   location.href = "/cafe/" + "${cafeURL}" + "/updateCafeMember?memberNo="+memberNo;
	    					  } 
	    			  }, 
	    			  { 
	    				   text: "취소", 
	    				    click: function() { 
	    					   $( this ).dialog( "close" ); 
	    					   } 
	    			   } 
	    			   ] 
	    		   });
	    	});
	    	
	    	$(function(){//프로필수정
	    		var memberNo = '${cafeMember.memberNo}'
	    		$(".updateProfile").on("click",function(){
	    			alert("여기")
	    			window.open("/cafe/" + "${cafeURL}"+ "/updateCafeMemberProfileView?memberNo="+memberNo,"_blank","width=600,height=700");
	    		
	    			});
	    		
	    		});
	
	    	$(function(){//카페가입
	    		$(".addMember").on("click", function(){
	    			 location.href = "/cafe/" + "${cafeURL}" + "addCafeApplicationView";
	    		});
	    		
	    	});
	    	
	    })(jQuery);
    </script>
    
	<script type="text/javascript">
		(function($) {
		    "use strict";
	
		    var state = new Object();
	
			$(function(){
				state.cafeURL = "${cafeURL}"; 
				state.mainContent = $("#mainContent").html().trim();
				state.mainContent = "<script>fncGetCafeMain()</script" + ">";
				history.replaceState(state, state.cafeURL, "/cafe/" + state.cafeURL);
			});
	
			
			function fncGetBoardPostList(boardNo, cafeURL){
				location.href = "/cafe/" + cafeURL + "/getBoard/" + boardNo;
				
				$("#mainContent").remove();
				$("div.col-10").load("/cafe/" + cafeURL + "/getBoard/" + boardNo + " #mainContent", function(response, stauts, xhr){
					$.getScript("/js/listCafePostByBoard.js");
					history.replaceState(state, state.cafeURL, "/cafe/" + state.cafeURL);
					
					state.boardNo = boardNo;
					state.mainContent = response;
	
					history.pushState(state, cafeURL, "/cafe/" + state.cafeURL + "/getBoard/" + boardNo);
				});
			}
	
			$(window).on('popstate', function(event) {
	//				console.log("popState : " + event.originalEvent.state);
				alert("popstate 실행")
				state = event.originalEvent.state;
				$(".cke_screen_reader_only").remove();
				$("#mainContent").remove();
				console.log(event.originalEvent.state.mainContent);
				$(".col-10").html( event.originalEvent.state.mainContent );
			});
		})(jQuery);
	</script>
	
	<script src="/js/custom/cafeCommon.js"></script>

</body>

</html>
