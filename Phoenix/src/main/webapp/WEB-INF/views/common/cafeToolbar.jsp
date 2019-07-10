<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>

<!--jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<!--bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

    </style>
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {
	$("#login").on("click" , function() {
		$(self.location).attr("href","/login");
	});

	$("#phoenix").on("click" , function() {
		$(self.location).attr("href","/");
	});
	
	$("#cafe").on("click" , function() {
		$(self.location).attr("href","/cafe/main");
	});

	$("#explore").on("click" , function() {
		$("form").attr("method" , "POST").attr("action" , "/cafe/search").submit();
	});
	
	$(".searchCondition").on("click" , function() {
		$("#searchCondition").val($(".searchCondition").index(this));
	});
	
});
</script>
</head>

<body>



	<!--  화면구성 div Start /////////////////////////////////////-->
	<!-- ffb347 FFAA28 FFA01E FFAA28 FFAF00-->
		<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #FFAF00;">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="#" id="phoenix">Phoenix</a>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#" id='cafe'>CafeHome <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>   
    </ul>
    
  
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Chat</a>
     
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit" id = "login">Login</button>
   
  </div>
  
</nav>

 <br/>	
 <div class ='container'>
<form>
<input type="hidden" id="currentPage" name="currentPage" value="0"/>
<input type ="hidden" name = 'cafeURL' value='${ !empty search.cafeURL ? search.cafeURL : "" }'>
<input type ="hidden" name = 'boardName' value='${ !empty search.boardName ? search.boardName : "" }'>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	   <select class="custom-select custom-select-lg" aria-label="Example select with button addon" name='searchCondition' id='searchCondition'>
	    <option class='searchCondition' selected value="0"   ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>카페+게시글</option>
	    <option class='searchCondition' value="1"   ${ !empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>카페</option>
	    <option class='searchCondition' value="2"   ${ !empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>게시글</option>
	   </select>
	    </div>
	  <input type="text" class="form-control form-control-lg" placeholder="검색어 입력해주세요" aria-label="Text input with dropdown button" aria-describedby="button-addon2" value='${ !empty search.searchKeyword ? search.searchKeyword : '' }' name="searchKeyword" id="searchKeyword">
	 <div class="input-group-append">
	    <button class="btn btn-outline-secondary" type="button" id="explore">검색</button>
	 </div>
	</div>
</form>	
</div>	
</body>
</html>