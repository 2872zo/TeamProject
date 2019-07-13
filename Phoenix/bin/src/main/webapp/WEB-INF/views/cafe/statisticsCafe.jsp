<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html lang="ko">

<head>

 	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script type="text/javascript">


		
		
		
		$( function() {


			$("#startDate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
			$("#endDate").val($.datepicker.formatDate('mm/dd/yy', new Date()));

			
			var dateFormat = "mm/dd/yy",
		      from = $( "#startDate" )
		        .datepicker({
		          defaultDate: "+1w",
		          changeMonth: true,
		          numberOfMonths: 2
		        })
		        .on( "change", function() {
		          to.datepicker( "option", "minDate", getDate( this ) );
		          
		        }),
		      to = $( "#endDate" ).datepicker({
		        defaultDate: "+1w",
		        changeMonth: true,
		        numberOfMonths: 2
		      })
		      .on( "change", function() {
		        from.datepicker( "option", "maxDate", getDate( this ) );
		      });
		 
		    function getDate( element ) {
		      var date;
		      try {
		        date = $.datepicker.parseDate( dateFormat, element.value );
		      } catch( error ) {
		        date = null;
		      }
		 
		      return date;
		    }


		    $("#endDate").on("change",function(){

				//ajax통신해야겠네..시븨ㅡㄹ븢라브ㅏㅣ르다ㅣㄹ
					var startDate = $("#startDate").val();
					var endDate = $("#endDate").val();
					$.ajax({

						url : "/cafe/json/no1cafe/manage/getCafeStatistics",
						method : "POST",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json ; charset=UTF-8"
						},
						data : JSON.stringify({ //보내는 data jsonString 화

							startDate : startDate,
							endDate : endDate
						}),
						dataType : "text",
						success : function(serverData){

							var data = JSON.parse(serverData);
							
							$("#et001").text(data.et001);
							$("#et004").text(data.et004);
							$("#et005").text(data.et005);
							$("#et006").text(data.et006);
							$("#et007").text(data.et007);
							
						}//success


					});//ajax끝
				

			  });

		    
		  } );
			   

	
	</script>
	
	
</head>
<body>


	<strong>카페통계</strong>
	<br/>
	<br/>
		<label for="startDate">시작일</label>
		<input type="text" id="startDate" name="startDate" value="">
		<label for="endDate">종료일</label>
		<input type="text" id="endDate" name="endDate" value="">
	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	
	<table>
		<thead>
			<tr>
				<th> 방문자 수 </th>
				<th> 작성된 게시글 수 </th>
				<th> 작성된 댓글 수 </th>
				<th> 가입신청인 수 </th>
				<th> 가입멤버 수 </th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td id="et001">
					<c:if test="${empty statisticMap['et001']}">0</c:if>
					${statisticMap['et001']}
				</td>
				<td id="et004">
					<c:if test="${empty statisticMap['et004']}">0</c:if>
					${statisticMap['et004']}
				</td>
				<td id="et005">
					<c:if test="${empty statisticMap['et005']}">0</c:if>
					${statisticMap['et005']}
				</td>
				<td id="et006">
					<c:if test="${empty statisticMap['et006']}">0</c:if>
					${statisticMap['et006']}
				</td>
				<td id="et007">
					<c:if test="${empty statisticMap['et007']}">0</c:if>
					${statisticMap['et007']}
				</td>
			</tr>
		</tbody>
	
	</table>

</body>
</html>