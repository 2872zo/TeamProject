package com.phoenix.mvc.web.cafe;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;

@RestController
@RequestMapping("/cafe/*")
public class CafeTabRestContoller {
	
	@Autowired
	@Qualifier("cafeTabServiceImpl")
	private CafeTabService cafeTabService;
	

	
	public CafeTabRestContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
///////////////////////////////준호시작///////////////////////////////////////
	@RequestMapping(value = "/json/checkCafeNameDuplication", method=RequestMethod.POST)
	public boolean checkCafeNameDuplication(@RequestBody Cafe cafe)throws Exception{
		
		System.out.println("/cafe/json/checkCafeNameDuplication : POST");
		
		boolean result = cafeTabService.checkCafeNameDuplication(cafe.getCafeName());

		System.out.println("이상하ㄴ네."+result);
		
		return result;
		
	}
	
	@RequestMapping(value = "/json/checkCafeURLDuplication", method=RequestMethod.POST)
	public boolean checkCafeURLDuplication(@RequestBody Cafe cafe)throws Exception{
		
		System.out.println("/cafe/json/checkCafeURLDuplication : POST");
		
		boolean result = cafeTabService.checkCafeURLDuplication(cafe.getURL());

		System.out.println("이상하ㄴ네."+result);
		
		return result;
		
	}
	
	
	/*
	 * if 입력값.equals(get){ return "ok"; }else
	 */
	
///////////////////////////////준호끝///////////////////////////////////////	
}
