<%@ page contentType="text/html; charset=utf-8"%>


	<script type="text/javascript">

	$(function() {

		$("#statistics").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/getCafeStatistics";
			alert("1")
			alert('${cafeURL}')
		});

		$("#info").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeInfoView";
			alert("2")
		});

		$("#board").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeBoardView";
			alert("3")
		});

		$("#form").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeApplicationFormView";
			alert("4")
		});

		$("#application").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/getCafeApplicationList";
			alert("5")
		});

		$("#grade").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeGradeView";
			alert("6")
		});

		$("#member").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/getCafeMemberList";
			alert("7")
		});

		$("#closed").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/dropCafeView";
			alert("8")
		});

		$("#notice").on("click",function(){
			location.href = "";
		});
		
	});
		
		
	</script>
	

			<div class="nk-nav-scroll" style="overflow: hidden; width: auto; height: 100%;">
                <ul class="metismenu" id="menu">
                    <li>
                        <a class="has-arrow" id="statistics" href="#" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">카페통계</span>
                        </a>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow"id="board" href="#" aria-expanded="false">
                           <i class="icon-speedometer menu-icon"></i><span class="nav-text">게시판관리</span>
                        </a>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow"id="info" href="#" aria-expanded="false">
                           <i class="icon-speedometer menu-icon"></i><span class="nav-text">카페정보수정</span>
                        </a>
                    </li>
                    
                     <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow"id="form" href="#" aria-expanded="false">
                           <i class="icon-speedometer menu-icon"></i><span class="nav-text">가입양식관리</span>
                        </a>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow"id="application" href="#" aria-expanded="false">
                           <i class="icon-speedometer menu-icon"></i><span class="nav-text">가입신청목록</span>
                        </a>
                    </li>
                    
                     <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow"id="grade" href="#" aria-expanded="false">
                           <i class="icon-speedometer menu-icon"></i><span class="nav-text">카페등급관리</span>
                        </a>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow"id="member" href="#" aria-expanded="false">
                           <i class="icon-speedometer menu-icon"></i><span class="nav-text">카페멤버목록</span>
                        </a>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow"id="closed" href="#" aria-expanded="false">
                           <i class="icon-speedometer menu-icon"></i><span class="nav-text">카페폐쇄</span>
                        </a>
                    </li>
                                        
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow"id="notice" href="#" aria-expanded="false">
                           <i class="icon-speedometer menu-icon"></i><span class="nav-text">공지관리</span>
                        </a>
                    </li>
                </ul>
            </div>
            
            
