<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>CafeTabMain</title>
<meta charset="EUC-KR">


<!--  /////////////////////////  jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {
	$("#addCafe").on("click" , function() {
		$(self.location).attr("href","/cafe/addCafe");
	});
	$("#explore").on("click" , function() {
		$("form").attr("method" , "POST").attr("action" , "/cafe/search").submit();
	});
	
});
</script>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../common/cafeToolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
</head>

<body>



	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
<br/>		
<form>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	   <select class="custom-select custom-select-lg" aria-label="Example select with button addon" name='searchCondition'>
	    <option selected value="0">���հ˻�</option>
	    <option value="1">ī���̸�</option>
	    <option value="2">ī��Խñ�</option>
	   </select>
	    </div>
	  <input type="text" class="form-control form-control-lg" placeholder="�˻��� �Է����ּ���" aria-label="Text input with dropdown button" aria-describedby="button-addon2" name="searchKeyword" id="searchKeyword">
	 <div class="input-group-append">
	    <button class="btn btn-outline-secondary" type="button" id="explore">�˻�</button>
	 </div>
	</div>
</form>	
	<br/>
		<button type="button" class="btn btn-outline-warning btn-block" id='addCafe'>ī�丸���</button>
	<br/>
	
	<div class="center-block">
	<div class="btn-group btn-group-toggle" data-toggle="buttons" id='cafeListing' style="float:none; margin:0 auto">
  <label class="btn btn-lg btn-outline-primary active">
    <input type="radio" name="options" id="managed" autocomplete="off" checked> ����� ī��
  </label>
  <label class="btn btn-lg btn-outline-primary">
    <input type="radio" name="options" id="open" autocomplete="off"> Ȱ������ ī��
  </label>
  <label class="btn btn-lg btn-outline-primary">
    <input type="radio" name="options" id="favorite" autocomplete="off"> ���ã�� ī��
  </label>
  <label class="btn btn-lg btn-outline-primary">
    <input type="radio" name="options" id="application" autocomplete="off"> ���� ��û����
  </label>
  <label class="btn btn-lg btn-outline-primary">
    <input type="radio" name="options" id="blocked" autocomplete="off"> �������� ī��
  </label>
	<label class="btn btn-lg btn-outline-primary">
    <input type="radio" name="options" id="newsfeed" autocomplete="off"> ī�� ���Խñ�
  </label>
	</div>
	</div>
	<br/>
	<br/>
	<br/>
	
	
<div class="center-block">
	<div class="btn-group btn-group-toggle" data-toggle="buttons" id='cafeCategorized' style="float:none; margin:0 auto">
  <label class="btn btn-outline-success active">
    <input type="radio" name="options" id="friendship" checked> ģ��/����
  </label>
  <label class="btn btn-outline-success">
    <input type="radio" name="options" id="sports"> ������/����
  </label>
  <label class="btn btn-outline-success">
    <input type="radio" name="options" id="movie"> ��ȭ
  </label>
  <label class="btn btn-outline-success">
    <input type="radio" name="options" id="game"> ����
  </label>
  <label class="btn btn-outline-success">
    <input type="radio" name="options" id="music"> ����
  </label>
  <label class="btn btn-outline-success">
    <input type="radio" name="options" id="trip"> ����
  </label>
</div>
</div>

	
</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>