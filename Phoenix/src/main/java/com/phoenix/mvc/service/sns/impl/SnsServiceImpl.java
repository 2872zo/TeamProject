package com.phoenix.mvc.service.sns.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.TimeLine;
import com.phoenix.mvc.service.sns.SnsDao;
import com.phoenix.mvc.service.sns.SnsService;

@Service("snsServiceImpl")
public class SnsServiceImpl implements SnsService {

	@Autowired
	@Qualifier("snsDaoImpl")
	private SnsDao snsDao;

	@Value("${webDriverId}")
	private String WEB_DRIVER_ID;

	@Value("${webDriverPath}")
	private String WEB_DRIVER_PATH;

	private WebDriver driver;
	private WebElement webElement;
	private WebDriverWait wait;
	private String url;

	public SnsServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	public Account fbLogIn(Account account) {
		return snsDao.fbLogIn(account);

	}

	@Override
	public Account igLogIn(Account account) throws InterruptedException {
		return snsDao.igLogIn(account);

	}

	@Override
	public Map<String, Object> getFaceBookTimeLineList(Search search) throws InterruptedException {
		return snsDao.getFaceBookTimeLineList(search);

	}

	/*
	 * public TimeLine writeFb(Account account) {
	 * 
	 * //크롬연결~ driver = this.headlessConnection();
	 * 
	 * //페북 로그인 this.fbLogIn(account);
	 * 
	 * webElement = driver.findElement(By.name("xhpc_message"));
	 * webElement.sendKeys(search.getSearchKeyword()); webElement.submit();
	 * 
	 * 
	 * TimeLine timeLine = new TimeLine();
	 * 
	 * timeLine.setPost(search.getSearchKeyword());
	 * timeLine.setPassword(search.getFbPw()); timeLine.setPostId(search.getFbId());
	 * 
	 * 
	 * return timeLine;
	 * 
	 * }
	 */

	@Override
	public Map<String, Object> getInstaTimeLineList(Search search) throws InterruptedException {
		return snsDao.getInstaTimeLineList(search);

	}

	@Override
	public TimeLine writeFb(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getSnsAccount(Search search) {

		return snsDao.getSnsAccount(search.getUserNo());
	}

}
