<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="/static/css/form-validation.css" rel="stylesheet">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"	crossorigin="anonymous"></script>
	<script src="/static/ckeditor/ckeditor.js"></script>
	<script src="/static/js/form-validation.js"></script>

	
	<header>
		<title>카페정보보기화면</title>
	</header>
	
		<script type="text/javascript">

		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-success" ).on("click" , function() {
				var cafeURL = "22";
				alert("수정");
				self.location = "/cafe/"+cafeURL+"/manage/updateCafeInfoView?cafeNo=${cafe.cafeNo}"
				//$("form").attr("method" , "GET").attr("action" , "/cafe/updateCafeInfoView?cafeNo=${cafe.cafeNo}").submit();
			});
		});	

			$(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("a[href='#' ]").on("click", function() {
					//$("form")[0].reset();
					self.location = "/cafe/main"
				});
			});
			
		</script>
<body>
	
<form class="form-horizontal">


		<div class="row" align="center">
	  		<div class="col-sm-4"><strong>카페정보상세조회</strong></div>
		</div>
		
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">카페이름</label>
    <div class="col-sm-10">
      ${cafe.cafeName}
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">카페번호</label>
    <div class="col-sm-10">
      ${cafe.cafeNo }
    </div>
  </div>	
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">매니저번호</label>
    <div class="col-sm-10">
      ${cafe.manageUserNo}
    </div>
  </div>	
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">카페url</label>
    <div class="col-sm-10">
      ${cafe.URL }
    </div>
  </div>	
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">카페설명</label>
    <div class="col-sm-10">
      ${cafe.cafeDetail }
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">배너이미지</label>
    <div class="col-sm-10">
      ${cafe.bannerImg }
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">메인이미지</label>
    <div class="col-sm-10">
      ${cafe.mainImg }
    </div>
  </div>
<div class="form-group">
						<label for="exampleFormControlSelect1"
							class="col-sm-offset-1 col-sm-3 control-label">카페 카 테 고 리</label>
						<div class="col-sm-4">
				
							
							<select class="form-control" name="cafeType" id="exampleFormControlSelect1">
				  	<option value="cc100" ${ ! empty cafe.cafeType && cafe.cafeType == "cc100" ? "selected" : ""  } >친목/모임</option>
					<option value="cc101" ${ ! empty cafe.cafeType && cafe.cafeType == "cc101" ? "selected" : ""  } >스포츠/레저</option>
					<option value="cc102" ${ ! empty cafe.cafeType && cafe.cafeType == "cc102" ? "selected" : ""  } >영화</option>
					<option value="cc103" ${ ! empty cafe.cafeType && cafe.cafeType == "cc103" ? "selected" : ""  } >게임</option>
					<option value="cc104" ${ ! empty cafe.cafeType && cafe.cafeType == "cc104" ? "selected" : ""  } >음악</option>
					<option value="cc105" ${ ! empty cafe.cafeType && cafe.cafeType == "cc105" ? "selected" : ""  } >여행</option>
				</select>
						</div>
					</div>   
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">가입안내</label>
    <div class="col-sm-10">
      ${cafe.applicationDetail }
    </div>
  </div>
 <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">등록일</label>
    <div class="col-sm-10">
      ${cafe.regDate}
    </div>
  </div>       	        		 

		  

		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >수정</button>
		      <a class="btn btn-success btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		  

		  
		</form>
		<!-- form Start /////////////////////////////////////-->
	
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>

					