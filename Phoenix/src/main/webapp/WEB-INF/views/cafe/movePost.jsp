<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	
	<header>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="/js/cafeCommon.js"></script>
		
		<script>
		
			$(function(){
				$("#targetPostList").val("${targetPostList}")
				$("#targetPostList").val(opener.document.getElementById("targetPostList").value);
				
				$("#movePost").on("click", function(){
					var tmpForm = document.createElement("form");
					tmpForm.setAttribute("charset", "UTF-8");
					tmpForm.setAttribute("method", "Post");
					tmpForm.setAttribute("action", "/cafe/${cafeURL}/movePost");

					var tmpInputTargetPostList = document.createElement("input");
					tmpInputTargetPostList.setAttribute("type", "hidden");
					tmpInputTargetPostList.setAttribute("name", "targetPostList");
					tmpInputTargetPostList.setAttribute("value", $("#targetPostList").val());
					tmpForm.appendChild(tmpInputTargetPostList);

					var tmpInputTargetBoardNo = document.createElement("input");
					tmpInputTargetBoardNo.setAttribute("type", "hidden");
					tmpInputTargetBoardNo.setAttribute("name", "targetBoardNo");
					tmpInputTargetBoardNo.setAttribute("value", $("#targetBoardNo").val());
					tmpForm.appendChild(tmpInputTargetBoardNo);

					var tmpInputTargetBoardNo = document.createElement("input");
					tmpInputTargetBoardNo.setAttribute("type", "hidden");
					tmpInputTargetBoardNo.setAttribute("name", "targetBoardNo");
					tmpInputTargetBoardNo.setAttribute("value", $("#targetBoardNo").val());
					tmpForm.appendChild(tmpInputTargetBoardNo);

					var tmpInputTargetBoardName = document.createElement("input");
					tmpInputTargetBoardName.setAttribute("type", "hidden");
					tmpInputTargetBoardName.setAttribute("name", "targetBoardName");
					tmpInputTargetBoardName.setAttribute("value", $("#targetBoardNo option:selected").text());
					tmpForm.appendChild(tmpInputTargetBoardName);

					opener.document.body.appendChild(tmpForm);
					tmpForm.submit();

					debugger;
					self.close();
				});
	
				$("#close").on("click", function(){
					self.close();
				});
			});
		</script>
	</header>
	
	<body>
		
		
		
		
		<div id="wrap" style="width:280px">
	        <div id="header" style="background: #FFAF00; text-align: center; padding-top:5px; padding-bottom:5px;">
	                <h4>게시글 이동</h1>
	        </div>
	        <div id="content" style="text-align: center; margin-top:10px; margin-bottom:10px;">
                <input type="hidden" id="targetPostList" name="targetPostList">
                <span>게시판 선택</span>
				<select name="targetBoardNo" id="targetBoardNo">
					<c:forEach items="${boardList }" var="board">
						<c:if test="${board.boardType != 'cb102' }">
							<option value="${board.boardNo }">${board.boardName }</option>
						</c:if>
					</c:forEach>
				</select>
	        </div>
			<div style="text-align: center; margin-top:10px; margin-bottom:10px;">
				<button id="movePost">이동</button>
				<button id="close">닫기</button>
    		</div>
		</div>
	</body>

</html>


