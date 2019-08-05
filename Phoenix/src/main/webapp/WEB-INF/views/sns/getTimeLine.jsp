<%@ page contentType="text/html; charset=utf-8"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">

<head>


<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/custom/scroll-top.css">

<style>
.error-text {
	font-size: 2rem;
	line-height: 5rem;
	color: #FFAF00;
}
img {
    vertical-align: middle;
    border-style: none;
    width: 150px;
}
.loader-ellips {
		  display : none;
		  font-size: 20px; /* change size here */
		  position: relative;
		  width: 4em;
		  height: 1em;
		  margin: 10px auto;
		}
		
		.loader-ellips__dot {
		  display: block;
		  width: 1em;
		  height: 1em;
		  border-radius: 0.5em;
		  background: #555; /* change color here */
		  position: absolute;
		  animation-duration: 0.5s;
		  animation-timing-function: ease;
		  animation-iteration-count: infinite;
		}
		
		.loader-ellips__dot:nth-child(1),
		.loader-ellips__dot:nth-child(2) {
		  left: 0;
		}
		.loader-ellips__dot:nth-child(3) { left: 1.5em; }
		.loader-ellips__dot:nth-child(4) { left: 3em; }
		
		@keyframes reveal {
		  from { transform: scale(0.001); }
		  to { transform: scale(1); }
		}
		
		@keyframes slide {
		  to { transform: translateX(1.5em) }
		}
		
		.loader-ellips__dot:nth-child(1) {
		  animation-name: reveal;
		}
		
		.loader-ellips__dot:nth-child(2),
		.loader-ellips__dot:nth-child(3) {
		  animation-name: slide;
		}
		
		.loader-ellips__dot:nth-child(4) {
		  animation-name: reveal;
		  animation-direction: reverse;
		}
</style>
<title>SNS TIMELINE</title>
<!--셀렉터 사이즈 조절-->


</head>

<body>
<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10"></circle>
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->
    
    <!--**********************************
            Nav header start
        ***********************************-->
           <div class="nav-header">
            <c:import url="/WEB-INF/views/common/brand-logo.jsp"/>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->
        
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../common/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div start /////////////////////////////////////-->

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">SNS</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">TIMELINE</a></li>
			</ol>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			
			

			<!-- 피드시작 -->
			<div class="col-lg-8 col-xl-12">
			
				<div class="card">
                      <div class="card-body">
                           <form class="form-profile">
                              <div class="form-group">
                                  <textarea class="form-control" name="textarea" id="post" cols="30" rows="2" placeholder="Post a new message"></textarea>
                              </div>
                              <div class="d-flex align-items-center">
                                  <button class="btn btn-primary px-3 ml-4" id ="send">Send</button>
                              </div>
                          </form>
                      </div>
                  </div>
                 <input type="hidden" id ="faceSize" value="${faceSearch.currentPage }"/> 
                 <input type="hidden" id ="instaSize" value = "${instaSearch.pageSize}"/>
                 <input type="hidden" id ="total" value = "${instaSearch.status}"/>
                 
				<div class="card">
					<div class="card-body" id = "here">
					<!--여기 나눠지는곳  -->
						<c:set var="i" value="0" />
						<c:forEach var="timeLine" items="${faceTimeLine}">
							<c:set var="i" value="${i+1}" />
							<div class="media media-reply">
								<c:if test="${faceSearch.face eq 100 }">
									<i class="mdi mdi-facebook-box"  style="font-size: 25px"></i>
								</c:if>
								
								<div class="media-body">
									<div class="d-sm-flex justify-content-between mb-2">
										<h5 class="mb-sm-0">
											${timeLine.postId} 
											<small class="text-muted ml-3">${timeLine.regDate }</small>
										</h5>
										<div class="media-reply__link">
											<button class="btn btn-transparent p-0 mr-3">
												<i class="fa fa-thumbs-up"></i>
											</button>
											${timeLine.likeCount }
											
										</div>
									</div>

									<p>${timeLine.post }</p>
									<input type="hidden" class="postSize" value ="${timeLine.postSize }"/>
									
									<c:set var = "j" value = "0"/>
									
									<c:if test="${!empty timeLine.img1List}"> <!-- 이미지1 -->
									<c:forEach var ="img1List" items="${timeLine.img1List }" varStatus="status">
									<c:set var="j" value="${j+1}" />
	           							<a href="${timeLine.img1LinkList[status.index] }"><img alt="" src="${img1List}" style="margin-left:20px; margin-top: 10px"></a>
	           						</c:forEach>
	           						</c:if>
	           						
	           						
	           						<c:if test="${!empty timeLine.img2List}"> <!-- 이미지2 -->
	           						<c:forEach var ="img2List" items="${timeLine.img2List }"  varStatus="status">
	           						<c:set var="j" value="${j+1}" />
	           							<a href="${timeLine.img2LinkList[status.index] }"><img alt="" src="${img2List}" style="margin-left:20px; margin-top: 10px"></a>
	           						</c:forEach>	
	           						</c:if>
	           						
	           						
									<c:if test="${!empty timeLine.img3List}"> <!-- 이미지3 -->
									<c:forEach var ="img3List" items="${timeLine.img3List }"  varStatus="status" >
									<c:set var="j" value="${j+1}" />
	           							<a href="${timeLine.img3LinkList[status.index] }"><img alt="" src="${img3List}" style="margin-left:20px; margin-top: 10px"></a>
	           						</c:forEach>
	           						</c:if>
	           						
	           						<c:if test="${!empty timeLine.img4List}"> <!-- 이미지4 -->
									<c:forEach var ="img4List" items="${timeLine.img4List }"  varStatus="status" >
									<c:set var="j" value="${j+1}" />
	           							<a href="${timeLine.img4LinkList[status.index] }"><img alt="" src="${img4List}" style="margin-left:20px; margin-top: 10px"></a>
	           						</c:forEach>
	           						</c:if>
	           						
									<c:if test="${!empty timeLine.videoList}"> <!-- 동영상 -->
									<c:forEach var ="videoList" items="${timeLine.videoList }"  varStatus="status" >
									<c:set var="j" value="${j+1}" />
	           							<a href="${timeLine.videoLinkList[status.index] }"><img alt="" src="${videoList }" style="margin-left:20px; margin-top: 10px"></a>
	           						</c:forEach>
										
	           						</c:if>	           						
									
								</div>
							</div>
						</c:forEach>
					<!--여기 나눠지는곳  -->
						<c:set var="i" value="0" />
						<c:forEach var="timeLine" items="${instaTimeLine}">
							<c:set var="i" value="${i+1}" />
							<div class="media media-reply">

								<c:if test="${instaSearch.insta eq 200 }">
									<i class="mdi mdi-instagram" style="font-size: 25px"></i>
								</c:if>
								
								<div class="media-body">
									<div class="d-sm-flex justify-content-between mb-2">
										<h5 class="mb-sm-0">
											${timeLine.postId} 
											<small class="text-muted ml-3">${timeLine.regDate }</small>
										</h5>
										<div class="media-reply__link">
											<button class="btn btn-transparent p-0 mr-3">
												<i class="fa fa-thumbs-up"></i>
											</button>
											${timeLine.likeCount }
											
										</div>
									</div>

									<p>${timeLine.post }</p>
									<input type="hidden" class="postSize" value ="${timeLine.postSize }"/>
									
									<c:set var = "j" value = "0"/>
									
									<c:if test="${!empty timeLine.img1List}"> <!-- 이미지1 -->
									<c:forEach var ="img1List" items="${timeLine.img1List }" >
									<c:set var="j" value="${j+1}" />
	           							<img alt="" src="${img1List}" style="margin-left:20px; margin-top: 10px">
	           						</c:forEach>
	           						</c:if>
	           					
									<c:if test="${!empty timeLine.videoList}"> <!-- 동영상 -->
									<c:forEach var ="videoList" items="${timeLine.videoList }"  >
									<c:set var="j" value="${j+1}" />
	           							<video src="${videoList }" autoplay="autoplay" controls="controls" width="300px"  style='margin-left:20px; margin-top: 10px'></video>
	           						</c:forEach>
	           						</c:if>	           						
									
								</div>
							</div>
						</c:forEach>
					</div>
					<br/>
          				<div class="loader-ellips">
						  <span class="loader-ellips__dot"></span>
						  <span class="loader-ellips__dot"></span>
						  <span class="loader-ellips__dot"></span>
						  <span class="loader-ellips__dot"></span>
						</div>
	           					
				</div>
			</div>
			<!-- 피드끝 -->
		</div>
	</div>
	<!-- #/ container -->


	<!--  화면구성 div end /////////////////////////////////////-->
	<!--**********************************
        Scripts
    ***********************************-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>

	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.init.js"></script>
	
	<script type="text/javascript">
	var merong =  false;
	
	
	$(document).ready(function(){

		$(window).scroll(function(){

			if($(window).scrollTop()>=( $(document).height()- $(window).height() ) ){

				//alert("hi")
				if( merong == false){

					loadNext();
				}
				
			}

		});
	});

	

	function loadNext(){
		
		var currentPage = Number($("#faceSize").val())
		var pageSize = Number($("#instaSize").val())
		var face = '${faceSearch.face}'
		var insta = '${instaSearch.insta}'
		var status = Number($("#total").val())

			//alert("currentPage"+currentPage)
			//alert("pageSize"+pageSize)
			//alert("face"+face)
			//alert("insta"+insta)
			//alert("status"+status)
		

		$.ajax({
			url : "/sns/json/getTimeLine",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json ; charset=UTF-8"
			},
			data : JSON.stringify({
				currentPage : currentPage,
				face : face,
				insta : insta,
				pageSize : pageSize,
				status : status
			}),
			dataType : "text",
			beforeSend : function(){
				$(".loader-ellips").css("display","block");
				merong = true;
			},
			complete : function(){
				merong = false;
			},
			success : function(serverData) {
				//alert(serverData)
	
				var data = JSON.parse(serverData);
				var faceTimeLine= data.faceTimeLine;
				var instaTimeLine= data.instaTimeLine;
				var faceSearch= data.faceSearch;
				var instaSearch= data.instaSearch;

				//alert("data "+data)
				//alert("instaTimeLine "+instaTimeLine)
				//alert("instaSearch "+instaSearch)
				
				$("#faceSize").val(faceSearch.currentPage)
				//alert("페북후의 값 확인 "+$("#faceSize").val())
				$("#instaSize").val(instaSearch.pageSize)
				//alert("인스타후의 값 확인 "+$("#instaSize").val())
				$("#total").val(instaSearch.status)
				//alert("인스타후의status 값 확인 "+$("#total").val())
				
				
				if(faceTimeLine !="" && instaTimeLine !=""){
					//alert($(timeLine).length);

					$(faceTimeLine).each(function(index){

						//alert("index값 "+index)
						
						var start = '';
						
						start += "<div class='media media-reply'>";
						
						if(faceSearch.face == 100){//페북
							start+= "<i class='mdi mdi-facebook-box' style='font-size: 25px'></i>"+
							"<div class='media-body'><div class='d-sm-flex justify-content-between mb-2'><h5 class='mb-sm-0'>";
						}
						
					
						start+= this.postId+"<small class='text-muted ml-3'>"+this.regDate+"</small></h5>"
								+"<div class='media-reply__link'><button class='btn btn-transparent p-0 mr-3'><i class='fa fa-thumbs-up'></i></button>"
								+this.likeCount
								+"</div></div>"
								+"<p>"+this.post+"</p>";

								//alert("start "+start);
							
						

							if(this.img1List!= null){

							//alert("img1List "+this.img1List)
							var length = $(this.img1List).length;
							//alert("length"+length);
								
								for( var i = 0; i< length; i++){

									//alert("dpd?")
									
									start += "<a href="+this.img1LinkList[i]+"><img alt='' src=";
									start += this.img1List[i] +" style='margin-left:20px; margin-top: 10px'></a>";

								}

							}

							else if(this.img2List!= null){
								
								//alert("img2List "+this.img2List)
								var length = $(this.img2List).length;
								//alert("length"+length);
								
								for( var i = 0; i< length; i++){

									//alert("dpd1?")
									//alert($(this.img2LinkList))
									//alert(this.img2LinkList[i]);

									start += "<a href="+this.img2LinkList[i]+"><img alt='' src=";
									start += this.img2List[i] +" style='margin-left:20px; margin-top: 10px'></a>";

							
								}
					
							}

							else if(this.img3List!= null){

								//alert("img3List "+this.img3List)
								var length = $(this.img3List).length;
								//alert("length"+length);
								
								for( var i = 0; i< length; i++){

									//alert("dpd2?")
									//alert($(this.img3LinkList))
									//alert(this.img3LinkList[i]);

									start += "<a href="+this.img3LinkList[i]+"><img alt='' src=";
									start += this.img3List[i] +" style='margin-left:20px; margin-top: 10px'></a>";

							
								}
								
					
							}

							else if(this.img4List!= null){
								
								//alert("img4List "+this.img4List)
								var length = $(this.img4List).length;
								//alert("length"+length);
								
								for( var i = 0; i< length; i++){

									//alert("dpd3?")
									//alert($(this.img4LinkList))
									//alert(this.img4LinkList[i]);

									start += "<a href="+this.img4LinkList[i]+"><img alt='' src=";
									start += this.img4List[i] +" style='margin-left:20px; margin-top: 10px'></a>";

									
							
								}
					
							}

							else if(this.videoList!= null){

								//alert("videoList"+this.videoList)
								var length = $(this.videoList).length;
								//alert("length"+length);
								
								for( var i = 0; i< length; i++){
						
									
									//alert(this.videoLinkList[i]);

									start += "<a href="+this.videoLinkList[i]+"><img alt='' src=";
									start += this.videoList[i] +" style='margin-left:20px; margin-top: 10px'></a>";

							
								}
								
					
							}

						start+="</div></div>"
						$("#here").append(start);
					});//fbtimeline끝

					$(instaTimeLine).each(function(){

						var end ='';

						end += "<div class='media media-reply'>";

						if(instaSearch.insta==200){//인스타

							end +="<i class='mdi mdi-instagram' style='font-size: 25px'></i>"+
							"<div class='media-body'><div class='d-sm-flex justify-content-between mb-2'><h5 class='mb-sm-0'>";
						}

						end+= this.postId+"<small class='text-muted ml-3'>"+this.regDate+"</small></h5>"
						+"<div class='media-reply__link'><button class='btn btn-transparent p-0 mr-3'><i class='fa fa-thumbs-up'></i></button>"
						+this.likeCount
						+"</div></div>"
						+"<p>"+this.post+"</p>";

						if(this.img1List!=null){
							
						//alert("img1List"+this.img1List)
						var length = $(this.img1List).length;
						//alert("length"+length);
						
							for( var i = 0; i< length; i++){
	
								//alert(this.img1List[i]);
							
								
								end += "<img alt='' src="+this.img1List[i] +" style='margin-left:20px; margin-top: 10px'>";
	
							}


						}

						else if(this.videoList!= null){

							//alert("videoList"+this.videoList)
							var length = $(this.videoList).length;
							//alert("length"+length);
							
							for( var i = 0; i< length; i++){

								//alert(this.videoList[i]);
								
								end += "<video src="+ this.videoList[i] +" autoplay='autoplay' controls='controls' width='300px'  style='margin-left:20px; margin-top: 10px'></video>";

						
							}
							
				
						}
						end+="</div></div>"
						$("#here").append(end);

					});//istatimeline끝

					


				}//if끝
				
				
			}//success 끝

		});//ajax
	}//nextload
		
	</script>
	<script src="/js/custom/cafeCommon.js"></script>
</body>
</html>