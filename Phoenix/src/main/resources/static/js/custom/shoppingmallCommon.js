	$(function(){
		
		$("#purchaseList").on("click",function(){ //통합구매내역 클릭했을시
			
			$(self.location).attr("href", "/shopping/getPurchaseList");
		});
		
		$("#explore").on("click",function(){
			
			var searchKeyword= $("#searchKeyword").val();
			$(self.location).attr("href", "/shopping/getProductList?searchKeyword"+searchKeyword);
		});
		
		$("#cartList").on("click",function(){ //찜 목록 클릭했을시
			
		});
		
	});
	