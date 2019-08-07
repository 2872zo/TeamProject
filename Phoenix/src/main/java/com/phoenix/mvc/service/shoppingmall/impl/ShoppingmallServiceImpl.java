package com.phoenix.mvc.service.shoppingmall.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Purchase;
import com.phoenix.mvc.service.domain.ShoppingmallSearch;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.shoppingmall.ShoppingmallDao;
import com.phoenix.mvc.service.shoppingmall.ShoppingmallService;

@Service("shoppingmallServiceImpl")
public class ShoppingmallServiceImpl implements ShoppingmallService
{
	
	@Value("${accountType.tmon}")
	private String tmonCode;
	
	@Autowired
	@Qualifier("shoppingmallDaoImpl")
	private ShoppingmallDao shoppingmallDao;
	
	public ShoppingmallServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	
	@Override
	public Map<String, Object> getShoppingmallProductList(ShoppingmallSearch search) {
		
		return shoppingmallDao.getTmonProductList(search);
	}


	@Override
	public Map<String, Object> getPurchaseList(User user, ShoppingmallSearch search) {
		
		//여기서 userno로 연결된 계정들을 가져온다.
		Map returnMap = new HashMap(); //return할 Map
		List<Purchase> totalPurchaseList = new ArrayList<Purchase>(); // 모든 쇼핑몰 다 섞은 totalPurchaseList(정렬필요)
		
		List<Account> myAccountList = shoppingmallDao.getShoppingmallAccount(user.getUserNo());
		
		//accountList를 확인하고 + search조건확인해서 dao실행.
		//가짜데이터
		//Account testAccount = new Account();
		//testAccount.setAccountType("ua105");
		//testAccount.setAccountId("blueberriii");
		//testAccount.setAccountPw("123abc!@#");
		//myAccountList.add(testAccount);
		
		for(Account account : myAccountList) {
			
			if(account.getAccountType().equals(tmonCode)) //tmonCode이면 tmondao 실행
			{
				System.out.println("dao실행");
				Map<String,Object> tmonMap = shoppingmallDao.getTmonPurchaseList(search, account);
				returnMap.put("tmonPurchaseList",tmonMap.get("purchaseList")); //map에 따로 넣어주고
				totalPurchaseList.addAll((List<Purchase>)tmonMap.get("purchaseList"));//전체 list에도 넣어줌
			}
			//else if로 다른쇼핑몰계속 ...
		}
		
		returnMap.put("totalPurchaseList", totalPurchaseList);
		returnMap.put("myAccountList", myAccountList);
		
		return returnMap;
	}


	@Override
	public String login(Account account, User user) {
		
		int loginResult = shoppingmallDao.login(account, user);
		String result = "400";
		
		if(loginResult==100) { //login success
			
			//account 저장하기전에 domain set해줘얗마닝;
			shoppingmallDao.addShoppingmallAccount(account, user);
			result ="100";
		}
		else if(loginResult==400) { //login fail
			
			//return fail
			result="400";
		}
		
		return result;
	}
	
	
	
}
