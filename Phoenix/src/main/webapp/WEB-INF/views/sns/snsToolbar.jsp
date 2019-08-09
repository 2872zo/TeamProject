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

#login1 {
	margin-bottom: 2%;
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
            Nav header start
        ***********************************-->
<div class="nav-header">
	<c:import url="/WEB-INF/views/common/brand-logo.jsp" />
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
		<div class="header-left">
			<div class="input-group icons" style=" margin-top: 30px;">
				<div class="input-group-prepend">
					<a href="/"> <span
						class="shopping-title align-middle font-weight-bolder text-center">SNS</span>
					</a>
				</div>
			</div>
		</div>


		<div class="header-right">
			<ul class="clearfix d-flex align-items-center justify-content-around">


				<c:if test="${!empty sessionScope.user}">

					<i class="mdi mdi-comment-processing-outline" id='goChat'
						style='font-size: 35pt; position: relative; right: 5%;'></i>
					<div style='margin-left: 2%; margin-right: 2%;'></div>
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

		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

	</div>
</div>
<!--**********************************
        Main wrapper end
    ***********************************-->

<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">
<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
</html>
