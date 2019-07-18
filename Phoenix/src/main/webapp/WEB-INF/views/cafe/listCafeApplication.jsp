<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	

	
	
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<!-- Bootstrap CDN -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script type="text/javascript">

		function fncGetList(currentPage) {
			var cafeURL = '${search.cafeURL}'
			$("#currentPage").val(currentPage)
			$("#detailFrom").attr("method" , "POST").attr("action" , "/cafe/"+cafeURL+"/manage/getCafeApplicationList").submit();	
		}
		
			$(function(){
				
				$(".btn-outline-success").on("click", function(){
					alert("검색");
					fncGetList(1);
				});
			});//검색

			$(function(){
				$(".applicationNo").on("click", function(){
					alert($(this).text());
					var cafeURL = '${search.cafeURL}'
					self.location ="/cafe/"+cafeURL+"/manage/getCafeApplication?applicationNo="+$(this).text().trim();
				});
			});


			$(function(){
				$("#allCheck").click(function(){
	                  //클릭되었으면
	                  if($("#allCheck").not(":disabled").prop("checked")){
	                      //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	                      $(".applicationCheck").not(":disabled").prop("checked",true);
	                      //클릭이 안되있으면
	                  }else{
	                      //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	                      $(".applicationCheck").not(":disabled").prop("checked",false);
	                  }
	              });
				$("#accept").on("click", function(){//승인
					var application="";
					
					$("input[type=checkbox]:checked").each(function(){
					//alert($(".applicationCheck").index(this));
					var count = $(".applicationCheck").index(this);
					application += $($(".nickname")[count]).text()+"&"+$($(".userNo")[count]).val()+"&"+$($(".cafeNo")[count]).val()+"&"+$($(".applicationNo")[count]).text();
					application+=",";
					
					});
				//alert(application);
					var cafeURL = '${search.cafeURL}'
					$("#boardName").val(application);
					$("#checkBox").attr("method" , "POST").attr("action" , "/cafe/"+cafeURL+"/manage/updateCafeApplication").submit();	
					
					});
				
				$("#reject").on("click",function(){//거절
					var reject='';
					$("input[type=checkbox]:checked").each(function(){
						var count = $(".applicationCheck").index(this);
						reject += $($(".applicationNo")[count]).text();
						reject+=",";
						
						});
					alert(reject);
					var cafeURL = '${search.cafeURL}'
						$("#boardName").val(reject);
						$("#checkBox").attr("method" , "POST").attr("action" , "/cafe/"+cafeURL+"/manage/updateCafeApplication").submit();	
					
					});//거절
					

				});//끝
			

		</script>
		
		
		<title>가입신청관리</title>

	
	<body>
		<h1>가입신청관리</h1>
		우리 카페에 가입을 신청한 사람입니다.
		가입을 승인하거나, 거절할 수 있습니다.
		
		
	
	<div class="col-md-6 text-left">
				<p class="text-success">전체 ${page.totalCount } 건수, 현재
					${page.currentPage} 페이지</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm" id ="detailFrom">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0">별명</option>
							<option value="1">userID</option>
							
						</select>
					</div>
					&nbsp;&nbsp;
					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label>
						 <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어">
					</div>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-success">검색</button>
					 <input type="hidden" id="currentPage" name="currentPage" value=""/>
					
					


				</form>
			</div>
			
			<button type="button" id="accept"class="btn btn-outline-secondary">가입승인</button>
			<button type="button" id="rejecr"class="btn btn-outline-secondary">가입거절</button>
			
			</br>
			</br>
			
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
      <form id = "checkBox"><input type="hidden" name ="boardName" id ="boardName" value="" /></form>
          <tr>
         	 <th><input type="checkbox" id ="allCheck"/></th>
            <th align="center">applicationNo</th>
            <th align="left" >userId</th>
            <th align="left">별명</th>
            <th align="left">가입신청일</th>
            <th align="left">처리결과</th>
          </tr>
        
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="cafeApplication" items="${list}">
		  
			<tr>
			<td><input type="checkbox" class="applicationCheck" ></td>
			  <td align="left" class="applicationNo" value="${cafeApplication.applicationNo}">${cafeApplication.applicationNo}</td>
			  <td align="left" >${cafeApplication.userId}</td>
			  <td align="left" class="nickname" value="${cafeApplication.memberNickname}">${cafeApplication.memberNickname}</td>
			  <td align="left">${cafeApplication.regDate}</td>
			   <td align="left">${cafeApplication.acceptStatusCode}
			   <input type="hidden" class="userNo"  value="${cafeApplication.userNo}"/>
			   <input type="hidden" class="cafeNo"  value="${cafeApplication.cafeNo}"/></td>

			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
	 <!-- 페이지 시작 -->
	<jsp:include page="../common/pageNavigator.jsp" />
	<!-- 페이지 끝 -->
	</body>

</html>