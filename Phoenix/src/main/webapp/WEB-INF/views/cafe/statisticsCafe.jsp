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
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
  	
  
	
	<script type="text/javascript">

		//var labels = ${dates};
		var chartData = new Array(); //연산에따른 count와 reg_date가있는 list(map)
		var tenDates =[]; //10일 날짜 array ->ok
		var dataArray = new Array(10);//count값을 넣어줄 array
		var labels =[];

		function setChartData(){

			for(var i in chartData){
				for(var j in tenDates){
					if(tenDates[j]==chartData[i].regDate){
						dataArray[j]=chartData[i].count;
					}
				 }
			 }
		 }
		
		$(function(){

			<c:forEach items="${dates}" var="item">
				tenDates.push("${item}");
			</c:forEach>

			<c:forEach items="${chartResult}" var="item">
				var json = new Object();
				json.regDate="${item.REG_DATE}";
				json.count="${item.COUNTS}";
				chartData.push(json);
			</c:forEach>
			
			setChartData();
			
			for(var i=0; i<dataArray.length; i++){
				if(dataArray[i]==null){
					dataArray[i]=0;	
				}
			}

			for(var i in tenDates){
				labels[i] = tenDates[i].substr(6,2)+"일";
			}

		});
		
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
							
							$("#et100").text(data.et100);
							$("#et103").text(data.et103);
							$("#et104").text(data.et104);
							$("#et105").text(data.et105);
							$("#et106").text(data.et106);

							basisDate = endDate;
							
							
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
							<h4 class="text-success" id="et100">
								<c:if test="${empty statisticMap['et100']}">0</c:if>
								${statisticMap['et100']}
							</h4>
						</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="thumbnail">
						<div class="caption">
							<h5>작성게시글 수</h5>
							<h4 class="text-success" id="et103">
								<c:if test="${empty statisticMap['et103']}">0</c:if>
								${statisticMap['et103']}
							</h4>
						</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="thumbnail">
						<div class="caption">
							<h5>작성댓글 수 </h5>
							<h4 class="text-success" id="et104">
								<c:if test="${empty statisticMap['et104']}">0</c:if>
								${statisticMap['et104']}
							</h4>
						</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="thumbnail">
						<div class="caption">
							<h5>가입신청인 수 </h5>
							<h4 class="text-success" id="et105">
								<c:if test="${empty statisticMap['et105']}">0</c:if>
								${statisticMap['et105']}
							</h4>
						</div>
					</div>
				</div>
			
				<div class="col-md-2">
					<div class="thumbnail">
						<div class="caption">
							<h5>가입멤버 수 </h5>
							<h4 class="text-success" id="et106">
								<c:if test="${empty statisticMap['et106']}">0</c:if>
								${statisticMap['et106']}
							</h4>
						</div>
					</div>
				</div>
			
			</div>
			
			<canvas id="myChart" width="10" height="10"></canvas>
						<script>
							
							
							var ctx = document.getElementById('myChart');
							var myChart = new Chart(ctx, {
				    					type: 'line',
				    					data: {
					    					
				        				labels: labels,
				       					 datasets: [{
				         			   label: '멤버 방문수  ',
				           				 data: dataArray,
				           		 backgroundColor: [
				                'rgba(75, 192, 192, 0.2)'
				                
				            ],
				            borderColor: [
				                
				                'rgba(75, 192, 192, 1)'
				              
				            ],
				            borderWidth: 4,
				            fill : false
				        }]
				    },
				    
							options : {
								maintainAspectRatio: false,
									scales : {
										yAxes : [ {
											ticks : {
												beginAtZero : true
											}
										} ]
									}
								}
							});
						</script>

		</form>
	</div>


</body>
</html>