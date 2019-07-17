package com.phoenix.mvc.web.util;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.mvc.service.util.UtilService;

@RestController
@RequestMapping("/util/*")
public class UtilController {

	@Autowired
	@Qualifier("utilServiceImpl")
	private UtilService utilService;
	
	public UtilController() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@PostMapping( "json/validationCheck")
	public boolean validationCheck(@RequestBody Map<String,String> map) throws Exception{
		System.out.println("json/validationCheck : POST");
		
		System.out.println(map);
		
		//Business Logic
		return utilService.validationCheck(map);
	}
}
