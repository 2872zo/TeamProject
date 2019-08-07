<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
			<div class="input-group icons">
				<div class="input-group-prepend">
					<a href="javascript:fncGetStatistics('${cafeURL}')"> <span
						class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
						id="cafemanage" style="padding-top: 10px; font-size: 1rem;">카페관리</span>
					</a> <a href="javascript:fncGetCafeMain('${cafeURL}')"> <span
						class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
						id="cafeName" style="padding-top: 10px; font-size: 1rem;">my
							cafe</span>
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