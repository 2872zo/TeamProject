<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">


<!-- ////////////////////////////// jQuery CDN ////////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
 integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
 crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
 integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
 crossorigin="anonymous"></script>
<!-- ////////////////////////////// bootstrap CDN ////////////////////////////// -->
<link rel="stylesheet"
 href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
 crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
 integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
 crossorigin="anonymous"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->

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

	

	
});
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="common/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<br/>
	<div class="input-group mb-3">
  <div class="input-group-prepend">
   <select class="custom-select custom-select-lg" aria-label="Example select with button addon">
    <option selected value="0">���հ˻�</option>
    <option value="1">google</option>
    <option value="2">NAVER</option>
    <option value="3">DAUM</option>
  </select>
    </div>
  <input type="text" class="form-control form-control-lg" placeholder="�˻��� �Է����ּ���" aria-label="Text input with dropdown button" aria-describedby="button-addon2">
 <div class="input-group-append">
    <button class="btn btn-outline-secondary" type="button" id="explore">�˻�</button>
  </div>
</div>
	
	<br/>
	<div class="d-flex justify-content-around">
	<button type="button" class="btn btn-lg btn-success" id="cafe">CAFE</button>
	<button type="button" class="btn btn-lg btn-primary" id="mail">MAIL</button>
	<button type="button" class="btn btn-lg btn-info" id="sns">SNS</button>
	<button type="button" class="btn btn-lg btn-dark" id="shop">SHOP</button>
	</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	
	
	<div class="d-flex justify-content-around">
	<button type="button" class="btn btn-lg btn-outline-danger" id="cafe1">�Ŵ����޴�</button>
	<button type="button" class="btn btn-lg btn-outline-danger" id="cafe2">���ۼ�����</button>
	<button type="button" class="btn btn-lg btn-outline-danger" id="cafe3">�������ȸ����</button>
	</div>
	
	
	
</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>