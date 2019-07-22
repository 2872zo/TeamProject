<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="common/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">
	.cafe3 {background-color:#000;color: #FFF;}
    .cafe3:hover {background-color: #FFF;}
    
    i:hover{cursor : pointer; color:#f5a142;}
</style>
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {
	
	
	$( "#explore" ).on("click" , function() {
		$(self.location).attr("href","/explore/exploreList");
	});
	$( "#cafe" ).on("click" , function() {
			$(self.location).attr("href","/cafe/main");
		});
	$( "#mail" ).on("click" , function() {
		$(self.location).attr("href","/mail/main");
	});
	$( "#sns" ).on("click" , function() {
		$(self.location).attr("href","/sns/main");
	});
	$( "#shop" ).on("click" , function() {
		$(self.location).attr("href","/shopping/myCartList");
	});

	$( "#cafe1" ).on("click" , function() {
		$(self.location).attr("href","/cafe/no1cafe/manage/dropCafeView");
	});

	$( "#cafe2" ).on("click" , function() {
		$(self.location).attr("href","/cafe/no1cafe/");
	});

	$( "#cafe3" ).on("click" , function() {
		$(self.location).attr("href","/cafe/no1cafe/addCafeApplicationView");
	});

	$( "#cafe4" ).on("click" , function() {
		$(self.location).attr("href","/chat/main");
	});
	

});
</script>

</head>

<body>
<br/>
<div class='container'>
<div class="card">


	<!--  화면구성 div Start /////////////////////////////////////-->
	
		<br/>
	
 

<div class="input-group d-flex justify-content-center" >
  <div class='input-group-prepend'>
  <select class="selectpicker">
    <option selected value="0">통합검색</option>
    <option value="1">google</option>
    <option value="2">NAVER</option>
    <option value="3">DAUM</option>
  </select>
  </div>
  <div class='input-group-append'>
  &nbsp;<input type="text" class="form-control-plaintext" placeholder="검색어 입력해주세요" >
  </div>
  <div class='input-group-append'>
  &nbsp;<button class="btn btn-sm btn-outline-primary" type="button" id="explore">검색</button>
	</div>
</div>



	</div>
	
	<div class="card">

<div class="card-body">
	<br/>
	<div class="d-flex justify-content-around align-items-center">
	<i class="mdi mdi-coffee" style='font-size: 50pt;' id="cafe"></i>
	<i class="mdi mdi-email-outline" style='font-size: 50pt;' id='mail'></i>
	<i class="mdi mdi-heart-box-outline" style='font-size: 50pt;' id='sns'></i>
	<i class="mdi mdi-cart-outline" style='font-size: 50pt;'id="shop"></i>
	</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	
	
	<div class="d-flex justify-content-around">
	<button type="button" class="btn btn-lg btn-outline-danger" id="cafe1">매니저메뉴</button>
	<button type="button" class="btn btn-lg btn-outline-danger" id="cafe2">글작성관련</button>
	<button type="button" class="btn btn-lg black-background cafe3" id="cafe3">가입신청</button>
	<button type="button" class="btn btn-lg black-background cafe3" id="cafe4">채팅채팅</button>
	</div>
	
</div>
</div>
</div>
	<!--  화면구성 div Start /////////////////////////////////////-->


</body>
</html>