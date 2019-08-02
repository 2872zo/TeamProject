<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



	      <!--**********************************
            Nav header start
        ***********************************-->
     
        <!--**********************************
            Nav header end
        ***********************************-->
        

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header" style="margin-left:0px; width:1310px;">
			
			<div class="form-inline">
				<a href="/">
					<span class="brand-title align-middle font-weight-bolder text-center">Phoenix</span>
				</a>
				<a href="/">
					<span class="shopping-title align-middle font-weight-bolder text-center">쇼핑</span>
				</a>
				<div class="input-group col-lg-6" style='width: 50%; margin :15px'>
					<input type="text" class="form-control input-rounded form-control-lg" id='searchKeyword' name="searchKeyword" value="${search.searchKeyword}" style="border: 1px solid #f5a142;">
					<div class="input-group-append">
						<button class="btn btn-lg btn-outline-primary" type="button" id="explore">
							<i class="mdi mdi-magnify" style='font-size: 18pt;' ></i>
						</button>
					</div>
				</div>
				
				<c:if test="${empty user.userNo}"> <!-- 로그인 안되어있을때 -->
					<div class="input-group col-lg-2"  style='margin-top :0px; margin-left:80px; padding-left: 60px;'>
						<button type="button" class="btn btn-primary login" data-toggle="modal" data-target="#exampleModalCenter">
							<i class="icon-key">Login</i>
						</button>
					</div>
				</c:if>
				
				<c:if test="${!empty user.userNo}"> <!-- 로그인이 되어있을때 -->
					<div class="input-group"> <!-- 로그인된 후에 class col-lg 잡기 -->
						<i class="mdi mdi-comment-processing-outline" id='goChat' style='font-size: 30pt'></i>
						<button type="button" class="btn btn-primary logout">
							<i class="icon-key">Logout</i>
						</button>
					</div>
				</c:if>
					
				
				
			
			</div>
			
			
		</div>

		<!-- 로그인시작 -->
		


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
								<button class="btn login-form__btn submit w-100" id="login1">로그인</button>
							</form>
							<p class="mt-5 login-form__footer">
								<a href="/user/addUserView" class="text-primary" id="addUser1">회원가입</a>
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>


