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
            <c:import url="/WEB-INF/views/common/brand-logo.jsp"/>
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
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                
                <div class="header-right">
                    <ul class="clearfix">
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-email-outline"></i>
                                <span class="badge gradient-1 badge-pill badge-primary">3</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">3 New Messages</span>  
                                    
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="/images/avatar/1.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Saiful Islam</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="/images/avatar/2.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Adam Smith</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Can you do me a favour?</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="/images/avatar/3.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Barak Obama</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="/images/avatar/4.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Hilari Clinton</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hello</div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-bell-outline"></i>
                                <span class="badge badge-pill gradient-2 badge-primary">3</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">2 New Notifications</span>  
                                    
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Events near you</h6>
                                                    <span class="notification-text">Within next 5 days</span> 
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Event Started</h6>
                                                    <span class="notification-text">One hour ago</span> 
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Event Ended Successfully</h6>
                                                    <span class="notification-text">One hour ago</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Events to Join</h6>
                                                    <span class="notification-text">After two days</span> 
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown d-none d-md-flex">
                            <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
                                <span>English</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                            </a>
                            <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li><a href="javascript:void()">English</a></li>
                                        <li><a href="javascript:void()">Dutch</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="/images/user/1.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile   dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                        </li>
                                        <li>
                                            <a href="email-inbox.html"><i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill badge-primary">3</div></a>
                                        </li>
                                        
                                        <hr class="my-2">
                                        <li>
                                            <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                        </li>
                                        <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            
            <img class="mr-3" src="/images/uploadfiles/mainImg/${cafe.mainImg}" width="100%" height="100" alt="">
            <br/>
            <br/>
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
        	<div class="row page-titles mx-0">
                <div class="col p-md-0">
                  
                </div>
            </div>
			<div id="container-fluid">
				 <div class="col-lg-12"> <!-- 배너 -->
                      <div class="card">
                           <div class="card-body">
                            <div class="table-responsive">
                                   <img class="mr-3" src="/images/uploadfiles/mainImg/${cafe.mainImg}" width="910" height="auto" alt="">
                               </div>
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
													<td>${post.postTitle}  </td>
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
	</script>
	

</body>

</html>
