<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<title>Insert title here</title>

	<script type="text/javascript">

	</script>

</head>


<body>
	
	카페만들기
	
	<!--카페 만들기 -->
<!--  	<c:set var='i' value="0"/>
	<c:forEach var='cafe' items="${list}">
		<c:set var="i" value="${i+1 }"/>
		
	</c:forEach>-->
	
	<td width="105">  ${cafe.cafeName} </td>
	<td width="105">  ${cafe.cafeNo} </td>
	<td width="105">  ${cafe.cafeName} </td>
	<td width="105">  ${cafe.cafeName} </td>
	<td width="105">  ${cafe.cafeName} </td>
	<td width="105">  ${cafe.cafeName} </td>
	<td width="105">  ${cafe.cafeName} </td>
	

</body>
</html>