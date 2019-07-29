<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/toolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>ȸ�����</title>


<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">
<link rel="stylesheet" href="/plugins/sweetalert/css/sweetalert.css">
	<!--  ///////////////////////// CSS ////////////////////////// -->

    
  
	
</head>

<body>


<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10"></circle>
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

	<div class="content-body" style="min-height: 743px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">manage</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">application</a></li>
					</ol>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">>���Խ�û���</h4>

								�츮 ī�信 ������ ��û�� ����Դϴ�. ������ �����ϰų�, ������ �� �ֽ��ϴ�. <br> <br>


								<div class="col-md-6 text-right">
									<form class="form-inline" name="detailForm" id="detailFrom">
										<input type="hidden" id="status" name="status"
											value="${search.status }" />
										<div class="form-group">
											<select class="form-control" name="searchCondition">
												<option value="0">ȸ�����̵�</option>
												<option value="1">ȸ���г���</option>
												<option value="2">ȸ����ȣ</option>
												

											</select>
										</div>
										&nbsp;&nbsp;
										<div class="form-group">
											<label class="sr-only" for="searchKeyword">�˻���</label> 
												<input type="text" class="form-control" id="searchKeyword"name="searchKeyword" placeholder="�˻���">
										</div>
										&nbsp;&nbsp;
										<button type="button" id="search"class="btn btn-outline-success">�˻�</button>
										<input type="hidden" id="currentPage" name="currentPage"value="" /> &nbsp;&nbsp; ����: &nbsp;&nbsp;
										<button type="button" value="100" id="ing"class="btn mb-1 btn-outline-warning btn-xs">ó����</button>
										&nbsp;&nbsp;&nbsp;
										

									</form>
									
								</div>
								<br>


								<!--  table Start /////////////////////////////////////-->
								<table class="table header-border">

									
									<thead class="thead-light">
										<tr>
											<th><input type="checkbox" id="allCheck" /></th>
											<th align="center">ȸ����ȣ</th>
											<th align="left">ȸ�����̵�</th>
											<th align="left">ȸ���г���</th>
											<th align="left">��������</th>
											<th align="left">ȸ������</th>
										</tr>
									</thead>

									<tbody>

										<c:set var="i" value="0" />
										<c:forEach var="user" items="${list}">
										<c:set var="i" value="${ i+1 }" />
										
											<tr>
												
												<td align="left" class="applicationNo" name="userNo" value="${user.userNo}"></td>
												<td align="left">${user.userNo}</td>
												<td align="left">${user.userId}</td>
												<td align="left">${user.userNickname}</td>
												<td align="left">${user.regDate }</td>
												<td align="left"></td>
																												
													<td>
													<input type="hidden" class="userNo"value="${cafeApplication.userNo}" /> 
													<input type="hidden"class="cafeNo" value="${cafeApplication.cafeNo}" /></td>
											
											</tr>
										</c:forEach>

									</tbody>

								</table>
								
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>
 	</div>
 	
 	<!-- PageNavigation Start... -->
	
	<!-- PageNavigation End... -->
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>
	<!-- �޴��� �̿��� ���� ��ũ��Ʈ -->
	<script src="/js/custom/scroll-top.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script type="text/javascript">



	//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
	}
	
	
	//============= "�˻�"  Event  ó�� =============	
	 $(function() {
		 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 //$( "button.btn.btn-default" ).on("click" , function() {
		//	fncGetUserList(1);
		//});
	 });
	
	
	//============= userId �� ȸ����������  Event  ó��(Click) =============	
	 $(function() {
	
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "td:nth-child(2)" ).on("click" , function() {
			 self.location ="/user/getUser?userId="+$(this).text().trim();
		});
					
		//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$( "td:nth-child(2)" ).css("color" , "red");
		
	});	
	
	
	//============= userId �� ȸ����������  Event  ó�� (double Click)=============
	 $(function() {
		 
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(  "td:nth-child(5) > i" ).on("click" , function() {

				var userId = $(this).next().val();
			
				$.ajax( 
						{
							url : "/user/json/getUser/"+userId ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								var displayValue = "<h6>"
															+"���̵� : "+JSONData.userId+"<br/>"
															+"��  �� : "+JSONData.userName+"<br/>"
															+"�̸��� : "+JSONData.email+"<br/>"
															+"ROLE : "+JSONData.role+"<br/>"
															+"����� : "+JSONData.regDate+"<br/>"
															+"</h6>";
								$("h6").remove();
								$( "#"+userId+"" ).html(displayValue);
							}
					});
					////////////////////////////////////////////////////////////////////////////////////////////
				
		});
		
		//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		//==> �Ʒ��� ���� ������ ������ ??
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});	

	</script>
	<script src="/js/custom/cafeCommon.js"></script>
</body>

</html>