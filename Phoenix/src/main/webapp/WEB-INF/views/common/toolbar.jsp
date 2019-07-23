<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>

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



</head>

<body>




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
			</div>


				<div class="header-left d-flex align-items-center">
				<ul class="clearfix d-flex align-items-center">
				
				<i class="mdi mdi-coffee" style='font-size: 30pt;' id="cafeHomeButton"></i> 
				<i class="mdi mdi-home-variant" style='font-size: 30pt;' id="thisCafeHome"></i>
				<div id='cafeMainTools'>
				<i class="mdi mdi-clipboard-outline" id='newsFeeding'
				style='font-size: 30pt' data-toggle="tooltip" data-placement="bottom" title="카페 뉴스피드 보기"></i>
				<i class="mdi mdi-library-books" id='myApplications'
				style='font-size: 30pt' data-toggle="tooltip" data-placement="bottom" title="가입신청내역 보기"></i>
				</div>			
				</ul>
				</div>

				<div class="header-right">
					<ul class="clearfix d-flex align-items-center">

						<i class="mdi mdi-comment-processing-outline" id='goChat'
							style='font-size: 30pt'></i>


						<button type="button" class="btn btn-primary login"
							data-toggle="modal" data-target="#exampleModalCenter">
							<i class="icon-key">Login</i>
						</button>

						<button type="button" class="btn btn-primary logout">
							<i class="icon-key">Logout</i>
						</button>
				</div>
			</div>
		</div>

		<!-- 로그인시작 -->
		<div class="nk-sidebar"></div>


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

		<!-- Modal 내용 끝 -->
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

	</div>

	<!--**********************************
        Main wrapper end
    ***********************************-->
    
    
   
  
</body>

</html>
