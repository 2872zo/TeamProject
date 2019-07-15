<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html lang="ko">

<head>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<script type="text/javascript">

	$(function(){
			$("#save").on("click", function(){//update
				alert("겨이굥~")
				$("form").attr("method" , "POST").attr("action" , "/cafe/no1cafe/manage/updateCafeGrade").submit();
			});
		

	});
	
	

		
	</script>

</head>


<body>
	

	
	<br/>
	<br/>
	<br/>
		<input type="hidden" class="gradeCount" value="${cafeGradeList.size()}"/>
		
		
		<c:set var="i" value="0" />  
			<div class="grade">
			<form id = "submit">
			<c:forEach var="cafeGrade" items="${cafeGradeList}">
			
				<c:set var="i" value="${ i+1 }"/>
				
				<c:if test="${i eq 1}">
					${i} 번째 등급명
					<input type ="text" class="gradeName" name="gradeName${i}" value="${cafeGrade.gradeName}" /> 
					<input type ="hidden" class = "cafeGradeNo" name="gradeNo${i}" value="${cafeGrade.cafeGradeNo }"/>
					<input type ="hidden" class="flag"name="gradeFlag${i}"value="${cafeGrade.gradeFlag }"/>
					<input type ="hidden"class="visit" name ="gradeVisit${i}"value="${cafeGrade.requiredVisitCount }"/>
					<input type ="hidden" class="post" name="gradePost${i}"value="${cafeGrade.requiredPostCount }"/>
					<input type ="hidden" class="reply"name="gradeReply${i}"value="${cafeGrade.requiredReplyCount }"/>
					<input type="hidden" class="auto" name="autoFlag${i}" value="${cafeGrade.autoUpgradeFlag }"/>
					<br/>
					<br/>
					<br/>

				</c:if>
				
				<c:if test="${i ne 1}">
					${i} 번째 등급명
					<input type ="text" class="gradeName" name="gradeName${i}" value="${cafeGrade.gradeName}" /> 
					<br/>
					<br/>
					출석 <input type ="text"class="visit" name ="gradeVisit${i}"value="${cafeGrade.requiredVisitCount }"/>이상
					게시글 <input type ="text" class="post" name="gradePost${i}"value="${cafeGrade.requiredPostCount }"/>이상
					댓글 <input type ="text" class="reply"name="gradeReply${i}"value="${cafeGrade.requiredReplyCount }"/>이상&nbsp;
					<input type ="hidden" class = "cafeGradeNo" name="gradeNo${i}" value="${cafeGrade.cafeGradeNo }"/>
					<input type ="hidden" class="flag"name="gradeFlag${i}"value="${cafeGrade.gradeFlag }"/>
					
					<select class ="auto"  name="autoFlag${i}">
						<option value="true">자동가입거부</option>
						<option value="false">자동가입승인</option>
					</select>
					
					
					<c:if test ="${cafeGrade.gradeFlag eq true}">
					 <button type="button" class = "delete">삭제</button>
					 </c:if>
					 <c:if test ="${cafeGrade.gradeFlag eq false}">
					 <button type="button" class = "insert">추가</button>
					 </c:if>
					 
					<br/>
					<br/>
					<br/>
				</c:if>
			</c:forEach>
			</form>
			</div>
			
			<br/>
			<br/>
			<br/>
			<button type="button" id ="save">저장</button>
				

		
		

		

</body>
</html>