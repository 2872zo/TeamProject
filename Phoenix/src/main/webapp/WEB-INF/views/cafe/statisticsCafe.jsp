<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    
    <meta charset="utf-8">
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/quixlab/favicon.png">
    <!-- Custom Stylesheet -->
    
    <link href="/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
					if(tenDates[j]==chartData[i].REG_DATE){
						//alert(chartData[i].COUNTS);
						dataArray[j]=chartData[i].COUNTS;
					}
				 }
			 }

			for(var i=0; i<dataArray.length; i++){ //안들어간값아 0을넣어줌
				if(dataArray[i]==null){
				
					dataArray[i]=0;	
				}
			}

			for(var i in tenDates){ //날짜 파씽
				labels[i] = tenDates[i].substr(6,2)+"일";
			}
		 }
		
		$(function(){

			<c:forEach items="${dates}" var="item">
				tenDates.push("${item}");
			</c:forEach>

			<c:forEach items="${chartResult}" var="item">
				var json = new Object();
				json.REG_DATE="${item.REG_DATE}";
				json.COUNTS="${item.COUNTS}";
				chartData.push(json);
			</c:forEach>
			
			setChartData();
			myChart.update();
		

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

							alert(serverData);
							var data = JSON.parse(serverData);
							tenDates = data.dates; //x축설정
							chartData= data.chartResult;

							dataArray = new Array(10); //초기화
							labels =[] //초기화
							setChartData(); //실행하고
							
						//	alert(data.chartResult[0].COUNTS);
						//	alert(data.chartResult[0].REG_DATE);
							//alert(tenDates);
							//alert(chartData);
							//alert(dataArray);
							
							myChart.data.labels = labels;
							myChart.data.datasets[0].data = dataArray;
							
							myChart.update();
							
							$("#et100").text(data.et100);
							$("#et103").text(data.et103);
							$("#et104").text(data.et104);
							$("#et105").text(data.et105);
							$("#et106").text(data.et106);

						}//success


					});//ajax끝
		
			  });

		  } );

	</script>
	
	
	
</head>

<body data-theme-version="light" data-layout="vertical" data-nav-headerbg="color_1" data-headerbg="color_1" data-sidebar-style="full" data-sibebarbg="color_1" data-sidebar-position="static" data-header-position="static" data-container="wide" direction="ltr">
	
	
    <!--*******************
        Preloader start
    ********************-->
   
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <form name ="form" >
    <div id="main-wrapper" class="show">
		
        <!--**********************************
            Nav header start
        ***********************************-->	
        <!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../common/cafeManageTollbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->
       
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
      
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
       	<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/common/cafeManageMenubar.jsp"></c:import>
		</div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body" style="min-height: 743px;">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">관리페이지</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">카페통계</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                    	<h4 class="d-inline">카페통계</h4>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-lg-12 text-center ">
                    	<label for="startDate" class="far fa-calendar-alt"></label>
						<input type="text" id="startDate" name="startDate" value="">
						<label for="endDate" class="far fa-calendar-alt"></label>
						<input type="text" id="endDate" name="endDate" value="">
						<hr/>
                    </div>
                </div>     
                 
                <div class="row">
                
					<div class="col-md-2">
						<div class="card text-center">
							<div class="card-body">
								<h5>방문자 수</h5>
								<h4 class="card-text" id="et100">
									<c:if test="${empty statisticMap['et100']}">0</c:if>
									${statisticMap['et100']}
								</h4>
							</div>
						</div>
					</div>
					
					<div class="col-md-2">
						<div class="card text-center">
							<div class="card-body">
								<h5>게시글 수</h5>
								<h4 class="card-text" id="et103">
									<c:if test="${empty statisticMap['et103']}">0</c:if>
									${statisticMap['et103']}
								</h4>
							</div>
						</div>
					</div>

					<div class="col-md-2">
						<div class="card text-center">
							<div class="card-body">
								<h5>댓글 수 </h5>
								<h4 class="card-text" id="et104">
									<c:if test="${empty statisticMap['et104']}">0</c:if>
									${statisticMap['et104']}
								</h4>
							</div>
						</div>
					</div>

					<div class="col-md-2">
						<div class="card text-center">
							<div class="card-body">
								<h5>가입</h5>
								<h5>신청인 수</h5>
								<h4 class="card-text" id="et105">
									<c:if test="${empty statisticMap['et105']}">0</c:if>
									${statisticMap['et105']}
								</h4>
							</div>
						</div>
					</div>

					<div class="col-md-2">
						<div class="card text-center">
							<div class="card-body">
								<h5>가입 </h5>
								<h5>멤버 수 </h5>
								<h4 class="card-text" id="et106">
									<c:if test="${empty statisticMap['et106']}">0</c:if>
									${statisticMap['et106']}
								</h4>
							</div>
						</div>
					</div>

                   
                </div>
           		
                </div>
                
                <div class="row" style='position: relative; height:80vh; width:70vw'>
                	<div class="col-md-1"></div>
                	<canvas id="myChart" class="col-md-11"></canvas>	 
                </div>   
               
                
            </div>
            <!-- #/ container -->
           
            
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
        
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    

           		
   	 </form>
   
    <script>


			var ctx = document.getElementById('myChart');
			var myChart = new Chart(ctx, {
    					type: 'line',
    					data: {
	    					
        				labels: labels,
       					 datasets: [{
         			   			label: '멤버 방문수  ',
           				 		data: dataArray,
           						backgroundColor: ['rgba(75, 192, 192, 0.2)'],
           						borderColor: ['rgba(75, 192, 192, 1)'],
           				 		borderWidth: 4,
            					fill : false
       								 }]
    					},
    
					options : {
						maintainAspectRatio: false,
						responsive : true,
						scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true,
								stepSize : 1 }
							} ]
						}
					}
			});
			
		</script>
         
        <script src="/js/custom/cafeCommon.js"></script> 
	</body>
</html>