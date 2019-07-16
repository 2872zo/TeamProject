<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html lang="ko">

<head>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<script type="text/javascript">


	
		function fncGetBoardPostList(boardNo,cafeURL) { 

			//boardNo가지고 게시글 목록으로이동.
			self.location ="/cafe/"+cafeURL+"/getBoard/"+boardNo;

		}
		
	</script>
	
	<style>
		#div_menu{
			width:20%;
			height:500px;
			float:left;
			background-color:#82FA58;
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
		공지게시글
		<table>
			<thead>
			</thead>
				<tr>
					<th>게시글 제목  </th>
					<th>작성자      </th>
					<th>등록일      </th>
					<th>조회수      </th>
				</tr>
				
				
			<tbody>
				
				<c:forEach var="post" items="${noticePostList}" > <!-- 링크이어야함 -->
					<tr>
						<td>${post.postTitle}  </td>
						<td>${post.memberNickname}  </td>
						<td>${post.regDate}  </td>
						<td>${post.viewCount}  </td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
		
		
		
		
		
	</div>

</body>
</html>