<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">




<style>
#div_menu {
	width: 20%;
	height: 500px;
	float: left;
	background-color: #82FA58;
}

#div_con {
	width: 80%;
}

.cursor {
	cursor: pointer;
}

.cursor:hover {
	text-decoration: underline;
}

   .member {
 font-size: 50px;
 text-shadow: 0 0 10px #666;
 color: #fff;
 margin: 0 auto;
 text-align: left;
 text-transform: capitalize;
 font-family: "맑은 고딕";
 font-style: italic;
}

body {
 font-family: "맑은 고딕";
 font-size: 12px;
}

.form {
 max-width: 100%;
 width: auto;
 display: table;
 border-radius: 25px;
 border: 5px double #999;
 margin: center;
}

.form2 {
 width: 380px;
 min-width: 320px;
 height: 200px;
 margin: 60px auto;
 margin-left:20px;
}

.form3 {
 float: left;
 /*   background:#f00;  */
}

.form3 label {
 width: 100px;
 height: 20px;
 /*  display: block; */
 float: left;
}

.form4 {
 padding: 0px 0px 0px 70px;
}

#wrap {
 width: 600px;
 height: 500px;
 margin: 0 auto;
}

.clear {
 clear: both;
}

input[type="submit"] {
 float: left;
 /*  display:block; */
 height: 50px;
 background: #FFBB00;
 border-radius: 5px;
 border: none;
 font-family: "맑은 고딕";
}
input[type="button"] {
 height: 30px;
 background: gray;
 border-radius: 5px;
/*  width: 140px; */
 font-family:"맑은 고딕";
 margin-top:10px;
 margin-right:20px;
}
input[type="checkbox"] {
 margin-top:20px;
}


</style>
</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->


		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<div class="brand-logo">
				<a href="/"> <b class="logo-abbr"> <b
						class="align-middle font-weight-bolder text-center"
						style='color: white; font-size: x-large;'>P</b>
				</b> <span
					class="brand-title align-middle font-weight-bolder text-center"
					style='color: white; font-size: x-large;'>Phoenix</span>
				</a>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content clearfix">

				<div class="nav-control">
					<div class="hamburger">
						<span class="toggle-icon"><i class="icon-menu"></i></span>
					</div>
				</div>
				<div class="header-left d-flex align-items-center">
				
				
				
				
				
				</div>

				<div class="header-right d-flex align-items-center">
					<button type="button" class="btn btn-outline-success" id='goChat'>
						<i class="fa fa-paper-plane">Chat</i>
					</button>
					
					<button type="button" class="btn btn-primary login"  data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-key">&nbsp;Login</i></button>
					<!--  <button type="button" class="btn btn-outline-primary login" >
						<i class="icon-key">Login</i>
					</button>-->

					<button type="button" class="btn btn-primary logout">
						<i class="icon-key">Logout</i>
					</button>
				</div>
			</div>
		</div>
		
		<!-- 로그인시작 -->              
                      
                               
                                  
                                    <!-- Modal 내용 시작 -->	
                                    <div class="modal fade" id="exampleModalCenter" style="display: none;" aria-hidden="true" style="max-width:100%;" style=" width: auto;" >
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                     
                                                    <button type="button" class="close" data-dismiss="modal"><span>×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="card-body pt-5">
                                <a class="text-center"> <h4>불사조</h4></a>
        
                                <form class="mt-5 mb-5 login-input">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="ID" name="userId">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" placeholder="PASSWORD" name="password">
                                    </div>
                                    <button class="btn login-form__btn submit w-100" id="login1">로그인</button>
                                </form>
                                <p class="mt-5 login-form__footer"><a href="/user/addUserView" class="text-primary" id="addUser1">회원가입</a></p>
                            </div>
                                                </div>
                                               
                                            </div>
                                        </div>
                                    </div>
                    
                        <!-- Modal 내용 끝 -->	
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

			

	<!--**********************************
        Main wrapper end
    ***********************************-->

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

	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/scroll-top.js"></script>
	<script type="text/javascript">
	    	$(function(){
		    	
		    	//로그인 안해서 세션에 유저가 없을 때
	    		if(${empty sessionScope.user}){
	    			$("#goChat").remove();
		    		$(".logout").remove();
	    		}
	    		
	    		//로그인해서 세션에 유저가 있을 때
	    		if(${!empty sessionScope.user}){
		    		$(".login").remove();
	    		}

	    		//$(".login").on("click" , function() {
	    		//	$(self.location).attr("href","/user/loginView");
	    		//});

	    		$(".logout").on("click" , function() {
	    			$(self.location).attr("href","/user/logout");
	    		});
	    		
	    		$("#goChat").on("click" , function() {
	    			$(self.location).attr("href","/chat/chatRoomList");
	    		});

	    		
	    	});

	    	//로그인시작
	    	$( function() {
	    			
	    			$("#userId").focus();
	    			
	    			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	    			$("#login1").on("click" , function() {
	    				var id=$("input:text").val();
	    				var pw=$("input:password").val();
	    				
	    				if(id == null || id.length <1) {
	    					alert('ID 를 입력하지 않으셨습니다.');
	    					$("#userId").focus();
	    					return;
	    				}
	    				
	    				if(pw == null || pw.length <1) {
	    					alert('패스워드를 입력하지 않으셨습니다.');
	    					$("#password").focus();
	    					return;
	    				}
	    				$("form").attr("method","POST").attr("action","/user/login").submit();
	    				//$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
	    			}); 
	    		});	
	    	
	    		//로그인끝
		
	</script>


</body>

</html>
