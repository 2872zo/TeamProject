<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>CafeSearch</title>
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
<jsp:include page="../common/cafeToolbar.jsp" />
</head>

<body>
<div class="container">
<br/>
<form>
<div class="input-group mb-3">
	<div class="input-group-prepend">
	<select class="custom-select custom-select-lg" aria-label="Example select with button addon">
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


  ī����ü�˻�â�Դϴ�.
  
  <c:forEach var="cafe" items="${cafeList}">
  ${cafe.cafeNo}/${cafe.cafeName}/${cafe.cafeDetail}/${cafe.url}
  <br/>
  </c:forEach>
</div>
</body>
</html>