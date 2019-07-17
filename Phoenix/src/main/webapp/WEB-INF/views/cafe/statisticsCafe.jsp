<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



<html lang="ko">

<head>

 	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script src="https://kit.fontawesome.com/e589319d43.js"></script>
  	
  
	
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

	<div class="container">
		<div class="py-5 text-center">
			<!-- <img class="d-block mx-auto mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			카페 아이콘 넣을것
			<h1>카페 통계</h1>
		</div>
		
		<form name ="form" class="needs-validation" novalidate>
		
			<hr/>
			<div class="row text-center">
				<label for="startDate" class="far fa-calendar-alt"></label>
				<input type="text" id="startDate" name="startDate" value="">
				<label for="endDate" class="far fa-calendar-alt"></label>
				<input type="text" id="endDate" name="endDate" value="">
				
			</div>
			<br/><br/><br/><br/>
			<div class="row text-center">
				<div class="col-md-2">
				</div>
			
				<div class="col-md-2">
					<div class="thumbnail">
						<div class="caption">
							<h5>방문자 수</h5>
							<h4 class="text-success" id="et001">
								<c:if test="${empty statisticMap['et001']}">0</c:if>
								${statisticMap['et001']}
							</h4>
						</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="thumbnail">
						<div class="caption">
							<h5>작성게시글 수</h5>
							<h4 class="text-success" id="et004">
								<c:if test="${empty statisticMap['et004']}">0</c:if>
								${statisticMap['et004']}
							</h4>
						</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="thumbnail">
						<div class="caption">
							<h5>작성댓글 수 </h5>
							<h4 class="text-success" id="et005">
								<c:if test="${empty statisticMap['et005']}">0</c:if>
								${statisticMap['et005']}
							</h4>
						</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="thumbnail">
						<div class="caption">
							<h5>가입신청인 수 </h5>
							<h4 class="text-success" id="et006">
								<c:if test="${empty statisticMap['et006']}">0</c:if>
								${statisticMap['et006']}
							</h4>
						</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="thumbnail">
						<div class="caption">
							<h5>가입멤버 수 </h5>
							<h4 class="text-success" id="et007">
								<c:if test="${empty statisticMap['et007']}">0</c:if>
								${statisticMap['et007']}
							</h4>
						</div>
					</div>
				</div>
			
			</div>

		</form>
	</div>


</body>
</html>