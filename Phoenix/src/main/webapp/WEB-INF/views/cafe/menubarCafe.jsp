<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	
	<link rel="stylesheet" href="/css/scroll-top.css">
	<script src="/js/scroll-top.js"></script>
	
	<script type="text/javascript">
		$(function(){
			
			$(".myDetail").hide();
			$(".showMyDetail").on("click",function(){
				if(${cafeMember.userNo}=='400')//1. 로그인이 안되어있으면
				{
					alert("로그인하세요! (로그인창 띄우기)");
				}
				else if(${cafeMember.userNo}=='500')//카페멤버가 아니면
				{
					alert("카페에 가입하세요!(카페에가입하시겠습니까?띄우기)");
				}
				else //카페멤버라면
				{
					$(".myDetail").show(); 
				}
			});

			$("[name=InnerSearch]").attr("method", "GET").attr("action", "/cafe/${cafeURL}/search");
			
			$("[name=menubarSubmit]").on("click", function(){
				location.href = "/cafe/" + "${cafeURL}" + "/search?searchKeyword=" + $("#menubarSearch").val(); 
			});	

			$("[name=toManage]").on("click", function(){
				location.href = "/cafe/${cafeURL}/manage/getCafeStatistics";
			});
			
		});

		$(function(){//카페탈퇴

			$(".deleteMember").on("click",function(){
				$( "#dialog" ).dialog("open");
				});
			var memberNo = '${cafeMember.memberNo}'
			$( "#dialog" ).dialog({ 
				 autoOpen: false, 
				  width: 400, 
				  modal: true, 
				  buttons: [ { 
					   text: "확인", 
					   click: function() { 
						   location.href = "/cafe/" + "${cafeURL}" + "/updateCafeMember?memberNo="+memberNo;
						  } 
				  }, 
				  { 
					   text: "취소", 
					    click: function() { 
						   $( this ).dialog( "close" ); 
						   } 
				   } 
				   ] 
			   });
		});
		
		$(function(){//프로필수정
			var memberNo = '${cafeMember.memberNo}'
			$(".updateProfile").on("click",function(){
				alert("여기")
				window.open("/cafe/" + "${cafeURL}"+ "/updateCafeMemberProfileView?memberNo="+memberNo,"_blank","width=600,height=700");
			
				});
			
			});

		$(function(){//카페가입
			$(".addMember").on("click", function(){
				 location.href = "/cafe/" + "${cafeURL}" + "addCafeApplicationView";
			});
			
		});
		
	</script>

	<div class="nk-nav-scroll">
		<ul class="metismenu" id="menu">
			
			<c:forEach var="board" items="${boardList}">
				<li>
		         	<a href="widgets.html" aria-expanded="false">
		            	<i class="icon-badge menu-icon"></i>
		            	<span class="nav-text">
							<c:if test="${board.boardType eq 'cb102'}"> <!-- 구분선이면 -->
								${board.boardName}
							</c:if>
							
							<c:if test="${board.boardType ne 'cb102'}"> <!-- 구분선이면 -->
								<a href="javascript:fncGetBoardPostList('${board.boardNo}','no1cafe');">${board.boardName}</a>
							</c:if>
						</span>
			     	</a>
			     </li>
			
			</c:forEach>

			<c:if test="${!empty cafeMember.memberNo}">
				<div class="deleteMember">
					카페탈퇴
				</div>
			</c:if>
			
			<div id="dialog" title="카페탈퇴">
	  			<p>카페에서 탈퇴하시겠습니까?
	  			카페 탈퇴시 작성된 게시글은 자동으로 삭제되지 않습니다.</p>
			</div>
			
			 <li>
	         	<a href="widgets.html" aria-expanded="false">
	            	<i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
		     	</a>
		     </li>
			
		    <li class="nav-label">Dashboard</li>
		    <li>
		        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
		            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Dashboard</span>
		        </a>
		        <ul aria-expanded="false">
		            <li><a href="./index.html">Home 1</a></li>
		            <!-- <li><a href="./index-2.html">Home 2</a></li> -->
		        </ul>
		    </li>
		    
		    <li class="mega-menu mega-menu-sm">
		        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
		            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Layouts</span>
		        </a>
		        <ul aria-expanded="false">
		            <li><a href="./layout-blank.html">Blank</a></li>
		            <li><a href="./layout-one-column.html">One Column</a></li>
		            <li><a href="./layout-two-column.html">Two column</a></li>
		            <li><a href="./layout-compact-nav.html">Compact Nav</a></li>
		            <li><a href="./layout-vertical.html">Vertical</a></li>
		            <li><a href="./layout-horizontal.html">Horizontal</a></li>
		            <li><a href="./layout-boxed.html">Boxed</a></li>
		            <li><a href="./layout-wide.html">Wide</a></li>
		            
		            
		            <li><a href="./layout-fixed-header.html">Fixed Header</a></li>
		            <li><a href="layout-fixed-sidebar.html">Fixed Sidebar</a></li>
		        </ul>
		    </li>
		    
		    
		    <li class="nav-label">Apps</li>
		    <li>
		        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
		            <i class="icon-envelope menu-icon"></i> <span class="nav-text">Email</span>
		        </a>
		        <ul aria-expanded="false">
		            <li><a href="./email-inbox.html">Inbox</a></li>
		            <li><a href="./email-read.html">Read</a></li>
		            <li><a href="./email-compose.html">Compose</a></li>
		        </ul>
		    </li>
		    <li>
		        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
		            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Apps</span>
		        </a>
		        <ul aria-expanded="false">
		            <li><a href="./app-profile.html">Profile</a></li>
		            <li><a href="./app-calender.html">Calender</a></li>
		        </ul>
		    </li>
		    <li>
		        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
		            <i class="icon-graph menu-icon"></i> <span class="nav-text">Charts</span>
		        </a>
		        <ul aria-expanded="false">
		            <li><a href="./chart-flot.html">Flot</a></li>
		            <li><a href="./chart-morris.html">Morris</a></li>
		            <li><a href="./chart-chartjs.html">Chartjs</a></li>
		            <li><a href="./chart-chartist.html">Chartist</a></li>
		            <li><a href="./chart-sparkline.html">Sparkline</a></li>
		            <li><a href="./chart-peity.html">Peity</a></li>
		        </ul>
		    </li>
		    
		    
		    <li class="nav-label">UI Components</li>
		    <li>
		        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
		            <i class="icon-grid menu-icon"></i><span class="nav-text">UI Components</span>
		        </a>
		        <ul aria-expanded="false">
		            <li><a href="./ui-accordion.html">Accordion</a></li>
		            <li><a href="./ui-alert.html">Alert</a></li>
		            <li><a href="./ui-badge.html">Badge</a></li>
		            <li><a href="./ui-button.html">Button</a></li>
		            <li><a href="./ui-button-group.html">Button Group</a></li>
		            <li><a href="./ui-cards.html">Cards</a></li>
		            <li><a href="./ui-carousel.html">Carousel</a></li>
		            <li><a href="./ui-dropdown.html">Dropdown</a></li>
		            <li><a href="./ui-list-group.html">List Group</a></li>
		            <li><a href="./ui-media-object.html">Media Object</a></li>
		            <li><a href="./ui-modal.html">Modal</a></li>
		            <li><a href="./ui-pagination.html">Pagination</a></li>
		            <li><a href="./ui-popover.html">Popover</a></li>
		            <li><a href="./ui-progressbar.html">Progressbar</a></li>
		            <li><a href="./ui-tab.html">Tab</a></li>
		            <li><a href="./ui-typography.html">Typography</a></li>
		        <!-- </ul>
		    </li>
		    <li>
		        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
		            <i class="icon-layers menu-icon"></i><span class="nav-text">Components</span>
		        </a>
		        <ul aria-expanded="false"> -->
		                <li><a href="./uc-nestedable.html">Nestedable</a></li>
		                <li><a href="./uc-noui-slider.html">Noui Slider</a></li>
		                <li><a href="./uc-sweetalert.html">Sweet Alert</a></li>
		                <li><a href="./uc-toastr.html">Toastr</a></li>
		            </ul>
		        </li>
		        <li>
		            <a href="widgets.html" aria-expanded="false">
		                <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
		            </a>
		        </li>
		        <li class="nav-label">Forms</li>
		        <li>
		            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
		                <i class="icon-note menu-icon"></i><span class="nav-text">Forms</span>
		            </a>
		            <ul aria-expanded="false">
		                <li><a href="./form-basic.html">Basic Form</a></li>
		                <li><a href="./form-validation.html">Form Validation</a></li>
		                <li><a href="./form-step.html">Step Form</a></li>
		                <li><a href="./form-editor.html">Editor</a></li>
		                <li><a href="./form-picker.html">Picker</a></li>
		            </ul>
		        </li>
		        <li class="nav-label">Table</li>
		        <li>
		            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
		                <i class="icon-menu menu-icon"></i><span class="nav-text">Table</span>
		            </a>
		            <ul aria-expanded="false">
		                <li><a href="./table-basic.html" aria-expanded="false">Basic Table</a></li>
		                <li><a href="./table-datatable.html" aria-expanded="false">Data Table</a></li>
		            </ul>
		        </li>
		        <li class="nav-label">Pages</li>
		        <li>
		            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
		                <i class="icon-notebook menu-icon"></i><span class="nav-text">Pages</span>
		            </a>
		            <ul aria-expanded="false">
		                <li><a href="./page-login.html">Login</a></li>
		                <li><a href="./page-register.html">Register</a></li>
		                <li><a href="./page-lock.html">Lock Screen</a></li>
		                <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
		                    <ul aria-expanded="false">
		                        <li><a href="./page-error-404.html">Error 404</a></li>
		                        <li><a href="./page-error-403.html">Error 403</a></li>
		                        <li><a href="./page-error-400.html">Error 400</a></li>
		                        <li><a href="./page-error-500.html">Error 500</a></li>
		                        <li><a href="./page-error-503.html">Error 503</a></li>
		                    </ul>
		                </li>
		            </ul>
		        </li>
		    </ul>
		</div>



	<div id="cafeMenubar">
		<div class="showMyDetail">
			내정보 보기
		</div>
		
		<c:if test="${empty cafeMember}">
		<br/>
		<div class="addMember">
			카페가입
		</div>
		</c:if>
		<br/>
		<c:if test="${!empty cafeMember.memberNo}">
		<div class="updateProfile">
			프로필수정
		</div>
		</c:if>
		
		
		<div class ="myDetail">
		
			<br/>가입 : ${cafeMember.regDate}
			<br/><strong>닉네임 : ${cafeMember.memberNickname}</strong>
			<br/>등급 : ${cafeMember.gradeName}
			<br/>출석 : ${cafeMember.visitCount}
			<br/>
			<h5><a href='#'>내가 쓴 글 보기</a></h5>
			<h5><a href='#'>내가 쓴 댓글 보기</a></h5>
			<input type="button" value="내 카페 관리" name="toManage"> 
			
		</div>

		<div>
			<form name="InnerSearch">
				<div class="input-group">
					<input type="text" class="form-control" id="menubarSearch" name="searchKeyword">
					<div class="input-group-append">
						<input type="button" class="btn btn-secondary" name="menubarSubmit"	style="z-index: 0" value="검색">
					</div>
				</div>
			</form>
		</div>

	<div class="scroll-top-wrapper ">
			  <span class="scroll-top-inner">
			    <i class="fa fa-2x fa-arrow-circle-up"></i>
			  </span>
	</div>