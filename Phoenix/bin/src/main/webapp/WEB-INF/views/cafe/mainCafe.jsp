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
		
		.postTitle:hover{
			cursor : pointer;
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
            <c:import url="/WEB-INF/views/common/brand-logo.jsp"/>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">
			<c:import url="/WEB-INF/views/common/cafeToolbar.jsp"></c:import>
		</div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->
			
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
        	<br/>
			<div id="container-fluid">
				 <div class="col-lg-12"> <!-- 대문 -->
                      <div class="card">
                           <div class="card-body">
                           		 
                            	   <c:if test="${empty cafe.mainImg}"> <!--대문이 없을경우  -->
                            	   	<div class="form-inline">
		                           	   	<div class="col-lg-6">
		                           	   		<h2><strong>카페에 오신것을 환영합니다.</strong></h2>
		                           	   		<h5>혼자보단 둘이, 둘보단 셋이 더 재미있을 거예요.</h5>
		                           	   		<h5>함께 재미있는 이야기 나누며 행복한 카페를 만들어 가요!</h5>
		                           	   		 <c:if test="${cafe.manageUserNo == user.userNo}"> <!-- 로그인한매니저일경우 -->
		                           	   			<div class="btn btn-primary mainImg">카페대문 꾸미기</div>
		                           	   		 </c:if>
		                           	   	</div>
		                           	   	<div class="col-lg-5">
		                                  	 	<img class="mr-3" src="/images/default-cafe-mainImg.jpg" width="400" alt="">
		                           	   	</div>
                            	   	</div>
                            	   </c:if>
                            	   <c:if test="${!empty cafe.mainImg}"> <!-- 대문있을경우 -->
                                   	 	<img class="mr-3" src="/images/uploadfiles/mainImg/${cafe.mainImg}" width="910" height="auto" alt="">
                            	   </c:if>
                            	   
                           </div>
                       </div>
                      
                       <div class="card"> <!-- 공지게시판 -->
                           <div class="card-body">
                            <div class="table-responsive">
                                   <h4 class="card-title">공지게시판</h4>
                                   <table class="table header-border">
                                       <thead>
                                           <tr>
                                           		<th scope="col">제목</th>
												<th scope="col">작성자</th>
												<th scope="col">등록일</th>
												<th scope="col">조회수</th>
                                       	   </tr>
                                       </thead>
                                       <tbody>
                                       	   <c:forEach var="post" items="${noticePostList}" > <!-- 링크이어야함 -->
												<tr>
													<input type="hidden" class="postNo" value="${post.postNo }">
													<td class="postTitle">${post.postTitle}  </td>
													<td>${post.memberNickname}  </td>
													<td>${post.regDate}  </td>
													<td>${post.viewCount}  </td>
										   		</tr>
										   </c:forEach>
                                       </tbody>
                                   </table>
                               </div>
                           </div>
                       </div>
                       
                       
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
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
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
    
    <script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
    <script src="/plugins/sweetalert/js/sweetalert.init.js"></script>
    
    <!-- 메뉴바 이용을 위한 스크립트 -->
    <script>
    	var memberNo = '${cafeMember.memberNo}'
    	var userNo ='${user.userNo}'
    	var cafeNo= '${cafeMember.cafeNo}'
		var cafeURL = "${cafeURL}";

		$(function(){

			$(".btn.btn-primary.mainImg").on("click",function(){
				$(self.location).attr("href", "/cafe/${cafeURL}/manage/updateCafeInfoView");
			});
	
		});
		
    </script>
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/js/custom/menubarCafe.js"></script>
	<script src="/js/custom/cafeCommon.js"></script>
    
    <!-- 이 페이지에서 사용하는 스크립트 -->
	<script type="text/javascript">
// 		    var state = new Object();
	
// 			$(function(){
// 				state.cafeURL = "${cafeURL}"; 
// 				state.mainContent = $("#mainContent").html().trim();
// 				state.mainContent = "<script>fncGetCafeMain()</script" + ">";
// 				history.replaceState(state, state.cafeURL, "/cafe/" + state.cafeURL);
// 			});
	
			
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

			$(function(){
				$(".postTitle").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getPost/" + 	$(this).parent().find(".postNo").val();				
				});			
			});
	</script>
	

</body>

</html>
