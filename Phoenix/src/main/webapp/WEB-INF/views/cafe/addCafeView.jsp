<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	
	
	<header>
		<title>카페가입신청화면</title>
	</header>
	
		<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-success" ).on("click" , function() {
				alert("만들기");
				$("form").attr("method" , "POST").attr("action" , "/cafe/addCafe").submit();
			});
		});

			
		</script>
<body>
	
<form class="form-horizontal">

   <div class="container">
	   <div class="form-group">
         <h4 class="col-sm-offset-3 col-sm-12">카페 만들기</h4>
         
        </div>
		


  <div class="form-group">
    <label for="exampleFormControlInput1" class="col-sm-offset-3 col-sm-3 control-label">카 페 이 름</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" name="cafeName">
    </div>
  </div>
  <div class="form-group">
    <label for="exampleFormControlInput1" class="col-sm-offset-3 col-sm-3 control-label">카페 URL</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" name="url">
    </div>
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1" class="col-sm-offset-3 col-sm-3 control-label">카페 설명</label>
    <div class="col-sm-4">
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="cafeDetail"></textarea>
    </div>
  </div>  
  <div class="form-group">
    <label for="exampleFormControlSelect1" class="col-sm-offset-3 col-sm-3 control-label">카페 카 테 고 리</label>
    <div class="col-sm-4">
    <select class="form-control" id="exampleFormControlSelect1" name="cafeType">
      <option>0</option>
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
    </div>
  </div>
   <div class="form-group">
    <label for="exampleFormControlTextarea1" class="col-sm-offset-3 col-sm-3 control-label">가입 안내</label>
    <div class="col-sm-4">
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="applicationDetail"></textarea>
    </div>
  </div> 
  
   
        
   <div class="form-group">
    <label for="exampleFormControlSelect1" class="col-sm-offset-3 col-sm-12 control-label">가입 질문</label>
    <div class="col-sm-4">
    <select class="form-control" id="exampleFormControlSelect1" name="applicationQuestion1">
      <option>0</option>
      <option>1</option>
    </select>
    </div>
  </div> 



					
					<!--  <div>
						카페이름<input type="text" name="cafeName" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
					</div>
					
					<div>
						카페url<input type="text" name="url" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
					</div>
		
					<div>
						카페설명<input type="text" name="cafeDetail" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
					</div>
		
					<div>
						카페카테고리<input type="text" name="cafeType" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
					</div>
					<div>
						가입안내<input type="text" name="applicationDetail" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
					</div>
			
					<div>
						가입질문<input type="text" name="applicationQuestion1" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
					</div>-->
		
		  
				  
		
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >만들기</button>
		    </div>
		  </div>
		</div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	
 	</div>
 	
	<!--  화면구성 div end /////////////////////////////////////-->
	</head>
</body>

</html>
					