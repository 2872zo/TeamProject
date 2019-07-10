<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	

	
	
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<!-- Bootstrap CDN -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script type="text/javascript">

		function fncGetList(currentPage) {
			var cafeURL = "1234";
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/cafe/"+cafeURL+"/manage/getCafeApplicationList").submit();	
		}
		
			$(function(){
				$(".btn-default").on("click", function(){
					alert("검색");
					fncGetList(1);
				});
			});


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
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0">별명</option>
							<option value="1">userID</option>
							
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label>
						 <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어">
					</div>

					<button type="button" class="btn btn-default">검색</button>
					 <input type="hidden" id="currentPage" name="currentPage" value=""/>
					
					


				</form>
			</div>
      <!--  table Start /////////////////////////////////////-->
      <table>
      
      
          <tr>
            <th align="center">applicationNo</th>
            <th align="left" >userId</th>
            <th align="left">별명</th>
            <th align="left">가입신청일</th>
            <th align="left">처리결과</th>
            <th align="left">처리결과</th>
          </tr>
        
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="cafeApplication" items="${list}">
			<tr>
			  <td align="center">${cafeApplication.applicationNo}</td>
			  <td align="left" >${cafeApplication.userId}</td>
			  <td align="left">${cafeApplication.memberNickname}</td>
			  <td align="left">${cafeApplication.regDate}</td>
			   <td align="left">${cafeApplication.acceptStatusCode}</td>
			  
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