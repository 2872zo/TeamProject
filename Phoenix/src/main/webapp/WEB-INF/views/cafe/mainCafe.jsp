<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html lang="ko">

<head>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<script type="text/javascript">


	
		function fncGetBoardPostList(boardNo) { 

			//boardNo가지고 게시글 목록으로이동.
			
			//$(".form-inline").attr("method", "POST").attr("action","/product/listProduct?menu=search").submit();

		}
		
	</script>
	
	<style>
		#div_menu{
			width:20%;
			height:300px;
			float:left;
		}
		
		#div_con{
			width:80%;
		}
	
	</style>

</head>


<body>
	
	<div id="div_menu">
		
		<!-- PageNavigation Start... -->
			<jsp:include page="./menubarCafe.jsp"/>
		<!-- PageNavigation End... -->
		
	</div>

	<div id="div_con">
		아하하ㅏㅎ하하ㅏ
	</div>

</body>
</html>