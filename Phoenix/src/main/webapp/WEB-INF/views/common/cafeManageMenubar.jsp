<%@ page contentType="text/html; charset=utf-8"%>


	<script type="text/javascript">

	$(function() {

		$(".statistics").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/getCafeStatistics";
		});

		$(".info").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeInfoView";
		});

		$(".menu").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeBoardView";
		});

		$(".form").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeApplicationFormView";
		});

		$(".application").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/getCafeApplicationList";
		});

		$(".grade").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/updateCafeGradeView";
		});

		$(".member").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/getCafeMemberList";
		});

		$(".closed").on("click",function(){
			location.href = "/cafe/"+"${cafeURL}"+"/manage/dropCafeView";
		});

		$(".notice").on("click",function(){
			location.href = "";
		});
		
	});
		
		
	</script>
	

			<div class="nk-nav-scroll" style="overflow: hidden; width: auto; height: 100%;">
                <ul class="metismenu" id="menu">
                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Dashboard</span>
                        </a>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="#" aria-expanded="false">
                           <i class="icon-speedometer menu-icon"></i><span class="nav-text">Layouts</span>
                        </a>
                    </li>
                </ul>
            </div>
            
            
