package com.phoenix.mvc.web.shoppingmall;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.service.domain.ShoppingmallSearch;
import com.phoenix.mvc.service.shoppingmall.ShoppingmallService;

@RestController
@RequestMapping("/shopping/*")
public class ShoppingmallRestController {

	@Autowired
	@Qualifier("shoppingmallServiceImpl")
	private ShoppingmallService shoppingmallService;
	
	
	public ShoppingmallRestController() {
		
		System.out.println(this.getClass().getName()+"생성자 시작");
	}
	
	@RequestMapping("/json/infiniteProductList")
	public Map getInfiniteProductList(@RequestBody ShoppingmallSearch search )
	{
		
		System.out.println("json/infiniteProductList 컨트롤러 시작");
		
		if(search.getSearchKeyword()==null )
		{
			search.setSearchKeyword("자전거");
		}
		if(search.getDetectedItemCount()==0)
		{
			search.setDetectedItemCount(0); //일단 무한스크롤 위해서..
		}
		
		Map<String, Object> returnMap = shoppingmallService.getShoppingmallProductList(search);
		
		//returnMap에 productList랑 search 들어가있음.
		
		return returnMap;
	}

}
