<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">

<style type="text/css">

i:hover {
	cursor: pointer;
	color: #f5a142;
}

#div_menu {
	width: 20%;
	height: 500px;
	float: left;
	background-color: #82FA58;
}

#div_con {
	width: 80%;
}

#login1{
	margin-bottom:2%;
}

.cursor {
	cursor: pointer;
}

.cursor:hover {
	text-decoration: underline;
}

.member {
	font-size: 50px;
	text-shadow: 0 0 10px #666;
	color: #fff;
	margin: 0 auto;
	text-align: left;
	text-transform: capitalize;
	font-family: "맑은 고딕";
	font-style: italic;
}

body {
	font-family: "맑은 고딕";
	font-size: 12px;
}

.form {
	max-width: 100%;
	width: auto;
	display: table;
	border-radius: 25px;
	border: 5px double #999;
	margin: center;
}

.form2 {
	width: 380px;
	min-width: 320px;
	height: 200px;
	margin: 60px auto;
	margin-left: 20px;
}

.form3 {
	float: left;
	/*   background:#f00;  */
}

.form3 label {
	width: 100px;
	height: 20px;
	/*  display: block; */
	float: left;
}

.form4 {
	padding: 0px 0px 0px 70px;
}

#wrap {
	width: 600px;
	height: 500px;
	margin: 0 auto;
}

.clear {
	clear: both;
}

input[type="submit"] {
	float: left;
	/*  display:block; */
	height: 50px;
	background: #FFBB00;
	border-radius: 5px;
	border: none;
	font-family: "맑은 고딕";
}

input[type="button"] {
	height: 30px;
	background: gray;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 10px;
	margin-right: 20px;
}

input[type="checkbox"] {
	margin-top: 20px;
}

</style>

	<!--**********************************
        Main wrapper start
    ***********************************-->
   
<!--**********************************
            Header start
        ***********************************-->
        <c:set var="URI" value="${pageContext.request.requestURI}" />
		<div class="header">
			<div class="header-content clearfix">

				<c:if test='${fn:startsWith(URI,"/WEB-INF/views/chat/")}'>
					<div class="nav-control">
							<div class="hamburger">
								<span class="toggle-icon"><i class="icon-menu"></i></span>
							</div>
					</div>
				</c:if>
				
				<div class="header-left d-flex align-items-center">
				
						<c:if test='${fn:startsWith(URI,"/WEB-INF/views/cafe/")}'>
							<i class="mdi mdi-coffee" style='font-size: 30pt;' id="cafeHomeButton"  data-toggle="tooltip" data-placement="bottom" title="카페홈"></i>
						</c:if>
						
						<c:if test='${fn:startsWith(URI,"/WEB-INF/views/cafe/cafeHomeMain.jsp")
						 || fn:startsWith(URI,"/WEB-INF/views/cafe/listCafeNewsFeed.jsp") 
						 || fn:startsWith(URI,"/WEB-INF/views/cafe/listUserCafeApplication.jsp")
						 || fn:startsWith(URI,"/WEB-INF/views/cafe/listCafeSearch.jsp")}'>
							<c:if test="${!empty sessionScope.user}">
								<i class="mdi mdi-library-books" id='newsFeeding' style='font-size: 30pt'  data-toggle="tooltip" data-placement="bottom" title="뉴스피드"></i>
								<i class="mdi mdi-clipboard-outline" id='myApplications' style='font-size: 30pt'  data-toggle="tooltip" data-placement="bottom" title="가입신청내역"></i>
							</c:if>
						</c:if>
				</div>
						 
						
				
				

				<div class="header-right">
					<ul class="clearfix d-flex align-items-center justify-content-around">
					<!-- 로그인상태시 표시되는 부분 -->
					<c:if test="${!empty sessionScope.user}">
						<li class="icons dropdown" style='position: relative;right: 15%;'>
                            <div class="user-img c-pointer position-relative" data-toggle="dropdown" aria-expanded="false">
                                <span class="activity active"></span>
                                <img src="/images/uploadFiles/profileimg/${user.profileImg}" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-132px, 57px, 0px);">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href=/user/getUserInfo?userNo=${user.userNo }><i class="icon-user"></i> <span>회원정보상세</span></a>
                                        </li>
                                        
                                        <!-- 
                                        <li>
                                             
                                            <div class="badge gradient-3 badge-pill gradient-1"></div>
                                            
                                        </li>
                                        <hr class="my-2">
                                      <c:if test="${user.userRoleCode=='ur100'}">
                                        <li>
                                            <a href=/user/listUser><i class="icon-list"></i> <span>회원목록</span></a>
                                        </li>
                                        </c:if>
                                        <li><a href="page-login.html"><i class="icon-list"></i> <span>신고목록</span></a></li>
                                        <li><a href="page-login.html"><i class="icon-list"></i> <span>문의목록</span></a></li>
                                         -->
                                         
                                    </ul>
                                </div>
                            </div>
                        </li>

                        <!-- 회원관리부분 -->
                        <!-- 채팅부분 -->
                         </c:if>

						<c:if test="${!empty sessionScope.user}">

							<i class="mdi mdi-comment-processing-outline" id='goChat'
								style='font-size: 35pt; position: relative; right: 5%;'></i>
								 <div style='margin-left: 2%;margin-right: 2%;'></div>
							<!-- 채팅 -->
							<!-- 로그아웃버튼 -->
							<button type="button" class="btn btn-primary logout">
								<i class="icon-key">Logout</i>
							</button>
							<!-- 로그아웃버튼 -->
						</c:if>
						<!-- 로그인상태시 표시되는 부분 -->
						<c:if test="${empty sessionScope.user}">
							<button type="button" class="btn btn-primary login"
								data-toggle="modal" data-target="#exampleModalCenter">
								<i class="icon-key">Login</i>
							</button>
						</c:if>
		
					</ul>
				</div>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!-- Modal 내용 시작 -->
		<div class="modal fade" id="exampleModalCenter" style="display: none;"
			aria-hidden="true" style="max-width:100%;" style=" width: auto;">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">

						<button type="button" class="close" data-dismiss="modal">
							<span>×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="card-body pt-5">
							<a class="text-center">
								<h4>불사조</h4>
							</a>

							<form class="mt-5 mb-5 login-input">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="ID"
										name="userId">
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="PASSWORD" name="password">
								</div>
								<button class="btn login-form__btn submit w-100" id="login1" style= "margin-bottom:50" >로그인</button>
								<center>								
								<a id="kakaos"><img src="/images/uploadFiles/kakao/kakaos.jpg" width=210; height=45;/></a>
     							<a id="navers"><img src="/images/uploadFiles/naver/navers.jpg" width=210; height=45;/></a>		
						
     							</center>
							</form>
							<p class="mt-5 login-form__footer">
								<a href="/user/addUserView" class="text-primary" id="addUser1">회원가입</a>
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- Modal 내용 끝 -->
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

	<!--**********************************
        Main wrapper end
    ***********************************-->
    
    
<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">  
<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
</html>
