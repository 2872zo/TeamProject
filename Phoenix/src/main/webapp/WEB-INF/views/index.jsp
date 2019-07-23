<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="common/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">

</style>
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	$(function() {

		$("#explore").on("click", function() {
			var keyword = $("#searchKeyword").val()
			$(self.location).attr("href", "/explore/" + keyword);
		});

		$("#searchKeyword").focus(function() {
			$(this).attr("style", "border: 2px solid #f5a142");
		});

		$("#searchKeyword").blur(function() {
			$(this).attr("style", "");
		});

		$("#searchKeyword").on("keyup", function(a) {
			if (a.keyCode == 13) {
				$('#explore').trigger('click');
			}
		});

		$("#cafe").on("click", function() {
			$(self.location).attr("href", "/cafe/main");
		});
		
		$("#mail").on("click", function() {
			$(self.location).attr("href", "/mail/main");
		});
		
		$("#sns").on("click", function() {
			$(self.location).attr("href", "/sns/main");
		});
		
		$("#shop").on("click", function() {
			$(self.location).attr("href", "/shopping/myCartList");
		});

	});
</script>

</head>

<body>
	<br />
	<div class='container-fluid'>



		<!--  화면구성 div Start /////////////////////////////////////-->

	</div>

	<div class="card">

		<div class="card-body">
		<br/>
			<p class="text-center" style='color: #f5a142; font-size: xx-large;'>Phoenix</p>
		<br/>
		<br/>
			<div class='d-flex justify-content-center'>
				<div class="input-group mb-3 " style='width: 50%;'>
					<input type="text" class="form-control form-control-lg"
						placeholder="검색어를 입력해주세요" id='searchKeyword'>
					<div class="input-group-append">
						<button class="btn btn-lg btn-outline-primary" type="button"
							id="explore">
							<i class="mdi mdi-magnify" style='font-size: 18pt;'></i>
						</button>
					</div>
				</div>
			</div>

			<br/>
			<br/>
			<div class="d-flex justify-content-around align-items-center">
				<i class="mdi mdi-coffee" style='font-size: 75pt;' id="cafe"></i> 
				<i class="mdi mdi-email-outline" style='font-size: 75pt;' id='mail'></i>
				<i class="mdi mdi-heart-box-outline" style='font-size: 75pt;' id='sns'></i>
				<i class="mdi mdi-cart-outline" style='font-size: 75pt;' id="shop"></i>
			</div>
			
			<br/>
			<br/>

		</div>
	</div>


	<!--  화면구성 div Start /////////////////////////////////////-->


</body>
</html>