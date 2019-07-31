<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/toolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>회원상세정보</title>


<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">
<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">


</head>

<style>
#profile {
    margin-bottom: 6.5%;
    }
    
    
</style>

<body>
		<c:if test="${user.userRoleCode=='ur100'}">
		<div class="nk-sidebar">
					
			<c:import url="/WEB-INF/views/common/userAdminMenubar.jsp"></c:import>
			
		</div>
		</c:if>
<div class="content-body" style="min-height: 743px;">



		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">			
							<h2 class="text-center">회원상세정보</h2>
							<hr style="border: solid 1px gray;">		
								<div class="basic-form">			
								<br>
									<form id="adduser">
						<input type="hidden" name="userNo" value="${user.userNo }"/>
                           
                           
                           <div class="row">
                    <div class="col-12 m-b-30">
                        <h4 class="d-inline">Phoenix</h4>
                        <p class="text-muted"></p>
                        <div class="row">
                        
                        
                            <div class="col-md-7 col-lg-6">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <h5 class="card-title">프로필</h5>
                                        <h6 class="card-subtitle mb-2 text-muted"></h6>
                                    </div>
                                    <img class="img-fluid" src="images/big/img1.jpg" alt="">
                                    <div class="card-body">
                                        <img src="/images/uploadFiles/profileimg/${user.profileImg}" height="55" width="55" alt="" id="profile">
                                        <h5><p class="card-text">이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;${user.userName }</p></h5>
                                        <h5><p class="card-text">닉네임 &nbsp;&nbsp;: &nbsp;&nbsp;${user.userNickname }</p></h5>
                                        
                                    </div>
                                    <div class="card-footer">
                                        <p class="card-text d-inline"><small class="text-muted"></small>
                                        </p><a href="/user/updateUserView?userNo=${user.userNo}" class="card-link float-right"><small>수정</small></a>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <!-- End Col -->
                            <div class="col-md-7 col-lg-6">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <h5 class="card-title">연락처</h5>
                                        <h6 class="card-subtitle mb-2 text-muted"></h6>
                                    </div>
                                    <img class="img-fluid" src="images/big/img2.jpg" alt="">
                                    <div class="card-body">
                                        <h5><p class="card-text">이메일 &nbsp;&nbsp;: &nbsp;&nbsp; ${ user.email } </p></h5><br>
                                        <h5><p class="card-text">전화번호 &nbsp;&nbsp;: &nbsp;&nbsp; ${ user.phone } </p></h5><br>
                                        <h5><p class="card-text">가입일자 &nbsp;&nbsp;: &nbsp;&nbsp; ${ user.regDate } </p></h5><br>
                                                                                                                                             
                                    </div>
                                    <div class="card-footer">
                                        <p class="card-text d-inline"><small class="text-muted"></small>
                                        </p><a href="/user/updateUserView?userNo=${user.userNo}" class="card-link float-right"><small>수정</small></a>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>           
                                        
                           
                           <div class="row">
                    <div class="col-12 m-b-30">                        
                        <p class="text-muted"></p>
                        <div class="row">
                        
                        
                            <div class="col-md-7 col-lg-6">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <h5 class="card-title">연동로그인</h5>
                                        <h6 class="card-subtitle mb-2 text-muted"></h6>
                                    </div>
                                    <img class="img-fluid" src="images/big/img1.jpg" alt="">
                                    <div class="card-body">                                
                                         
                                    <a id="kakaos"><img src="/images/uploadFiles/kakao/kakaoIcon.jpg" width=50; height=45;/></a>   
                                        <h5><p class="card-text">카카오 &nbsp;&nbsp;: &nbsp;&nbsp;연동</p></h5><br>
                                    <a id="navers"><img src="/images/uploadFiles/naver/naverIcon.jpg" width=50; height=45;/></a>
                                        <h5><p class="card-text">네이버 &nbsp;&nbsp;: &nbsp;&nbsp;미연동</p></h5>
                                        
                                    </div>
                                    <div class="card-footer">
                                        <p class="card-text d-inline"><small class="text-muted"></small>
                                        </p><a href="/user/updateUserView?userNo=${user.userNo}" class="card-link float-right"><small>수정</small></a>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <!-- End Col -->
                                     
                        </div>
                    </div>
                </div>           
										
				  				<div class="form-group row">
                                	<div class="col-lg-6 ml-auto">
                                  		<!--  <button type="button" class="btn btn-primary" id="add">가입</button>-->
                                  		 <a class="btn btn-success btn" href="#" role="button" id="cancle">취&nbsp;소</a>
                                    </div>
                                   </div>
						  
	 					</form>
	 						
		 			 </div>
		  			</div>
		  		   </div>
		 		  </div>
		 		 </div>
		 	    </div>
		 	   </div>
			  </div>
	
		<!--  화면구성 div end /////////////////////////////////////-->
	<!--  화면구성 div end /////////////////////////////////////-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>
	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script type="text/javascript">
	
	var checkSessionUser = ${empty sessionScope.user};
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-success").on("click", function() {
			self.location = "/user/updateUserView?userNo=${user.userNo}"	
		});
	});

	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click", function() {
			//$("form")[0].reset();
			self.location = "/cafe/main"
		});
	});
</script>
<script src="/js/custom/userCommon.js"></script>
<script src="/js/custom/toolbarScript.js"></script>
</body>

</html>
