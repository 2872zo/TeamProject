<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!--**********************************
            Nav header start
        ***********************************-->
<div class="nav-header" text-align="center">
	<div class="brand-logo">
		<a id="phoenix" href="javascript:fncGetPhoenix()"> <span
			class="brand-title" font-size="1.5rem" align="center"> Phoenix
		</span>
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


		<c:if test='${empty sessionScope.user}'>
			<div class="header-right">
				<div class="input-group icons">
					<div class="input-group-prepend">
						<a href="javascript:fncLogin()"> <span
							class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
							id="login">login</span>
						</a>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${!empty sessionScope.user }">
			<div class="header-right">
				<div class="input-group icons">
					<div class="input-group-prepend">
						<a href="javascript:fncLogout()"> <span
							class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
							id="logout">logout</i></span>
						</a>
					</div>
				</div>
			</div>
		</c:if>

	</div>

	<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

</div>
<!--**********************************
        Main wrapper end
    ***********************************-->