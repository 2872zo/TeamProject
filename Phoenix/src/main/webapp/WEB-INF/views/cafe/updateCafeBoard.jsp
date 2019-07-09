<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<script type="text/javascript">


		$(function() {

			$("#plusBoard").on("click", function(){ //�Խ����߰�
				
				alert($("select[name=addableBoard]").val());
			});

		});
	
	</script>

</head>


<body>
	
	�޴�����
	<button type="button" id ="cancel"> ��� </button>
	<button type="button" id ="save"> �����ϱ�</button>
	<br/>
	<br/>
	<br/>
	
	�߰��޴�

	<select name="addableBoard" size="2">
		<option value="�����Խ���">�����Խ���</option>
		<option value="���м�">���м�</option>
	</select>
	
	<button type="button" id ="plusBoard"> +�Խ����߰� </button>
	<br/>
	<br/>
	<button type="button" id ="goDown"> �Ʒ���</button>
	<button type="button" id ="goUp"> ����</button>
	<button type="button" id ="goStart"> ������ </button>
	<button type="button" id ="goEnd"> �ǾƷ��� </button>
	<button type="button" id ="delete"> ���� </button>
	
	
	<!--  �Խ��� ����Ʈ �ҷ����� -->
		
		
		<br/>
		<br/>
		
		<select name="board" size="${fn:length(boardList)} ">
    		
    		<c:set var="i" value="0" />  
			<c:forEach var="board" items="${boardList}">
				<c:set var="i" value="${ i+1 }" />
			
			<option value="${board.boardName}">${board.boardName}</option>
		
			</c:forEach>
    		
    		
   			
		</select>
		
		
		<br/>
		<br/>
		�޴���  <input type="text" id="boardName" name="boardName" value="${boardList[0].boardName}"/>
		<br/>
		�޴����� <input type="text" id="boardDetail" name="boardDetail" width ="50" value="${boardList[0].boardDetail}">
		<br/>
		<br/>
		
		�Խ��� �������θ� �����մϴ�. ��������� ���ý�, �Խ����� ������Ը� �������ϴ�.
		<br/>
		<br/>
		��޼���
		<select name="accessGrade">
    		<option value="">��������</option>
   			 <option value="�л�">�л�</option>
    		<option value="ȸ���">ȸ���</option>
    		<option value="��Ÿ">��Ÿ</option>
		</select>
			
	

</body>
</html>