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

		//alert($(".cafeNo").val())
			$("#save").on("click", function(){//update
				//alert($(".gradeFlag1").text())
				$("form").attr("method" , "POST").attr("action" , "/cafe/"+'${cafeURL}'+"/manage/updateCafeGrade?CafeNo="+$(".cafeNo").val()).submit();
			});
		

	});

		
	</script>

</head>


<body>
	
멤버 등급 사용안함 선택시
해당 등급에 해당하는 모든 멤버는 아래등급으로 내려갑니다!
	
	<br/>
	<br/>
	<br/>
	
		
		
		
		<c:set var="i" value="0" /> 
		 <c:set var="j" value="0" /> 
		
			<div class="grade">
			<form id = "submit">
			<c:forEach var="cafeGrade" items="${cafeGradeList}">
			
				<c:set var="i" value="${ i+1 }"/>
				<input type="hidden" class="cafeNo" value="${cafeGrade.cafeNo}"/>
				<c:if test="${i eq 1}">
					${i} 번째 등급명
					<input type ="text" class="gradeName" name="gradeList[${j}].gradeName" value="${cafeGrade.gradeName}" /> 
					<input type ="hidden" class = "cafeGradeNo" name="gradeList[${j}].cafeGradeNo" value="${cafeGrade.cafeGradeNo }"/>
					<br/>
					<br/>
					<br/>

				</c:if>
				
				<c:if test="${i ne 1}">
					${i} 번째 등급명
					<input type ="text" class="gradeName" name="gradeList[${j}].gradeName" value="${cafeGrade.gradeName}" /> 
					<br/>
					<br/>
					출석 <input type ="text"class="visit" name="gradeList[${j}].requiredVisitCount"value="${cafeGrade.requiredVisitCount }"/>이상,
					게시글 <input type ="text" class="post" name="gradeList[${j}].requiredPostCount"value="${cafeGrade.requiredPostCount }"/>이상,
					댓글 <input type ="text" class="reply"name="gradeList[${j}].requiredReplyCount"value="${cafeGrade.requiredReplyCount }"/>이상,&nbsp;&nbsp;&nbsp;
					<input type ="hidden" class = "cafeGradeNo" name="gradeList[${j}].cafeGradeNo" value="${cafeGrade.cafeGradeNo }"/>
					<input type ="hidden" class = "memberGradeCode" name="gradeList[${j}].memberGradeCode" value="${cafeGrade.memberGradeCode }"/>
					
		
					
					<select class ="auto"  name="gradeList[${j}].autoUpgradeFlag">
						<option value="1" ${cafeGrade.autoUpgradeFlag== "1" ? "selected" : "" }>자동등업승인</option>
						<option value="0" ${cafeGrade.autoUpgradeFlag== "0" ? "selected" : "" }>자동등업거부</option>
					</select>
					&nbsp;&nbsp;
					&nbsp;&nbsp;
					
					 <input type="radio" name="gradeList[${j}].gradeFlag" value="1" <c:if test="${cafeGrade.gradeFlag eq true}">checked</c:if>/>사용
		     		 <input type="radio"  name="gradeList[${j}].gradeFlag"value="0"<c:if test="${cafeGrade.gradeFlag eq false}">checked</c:if>/>사용안함
		     		 


					<br/>
					<br/>
					<br/>
				</c:if>
				<c:set var="j" value="${ j+1 }"/>
			</c:forEach>
			</form>
			</div>
			
			<br/>
			<br/>
			<br/>
			<button type="button" id ="save">저장</button>
				

		
		

		

</body>
</html>