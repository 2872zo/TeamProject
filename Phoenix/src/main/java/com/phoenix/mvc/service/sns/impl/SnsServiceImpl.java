package com.phoenix.mvc.service.sns.impl;

import java.util.HashMap;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.service.domain.FaceBook;
import com.phoenix.mvc.service.sns.SnsDao;
import com.phoenix.mvc.service.sns.SnsService;

@Service("snsServiceImpl")
public class SnsServiceImpl implements SnsService {
	
	@Autowired
	@Qualifier("snsDaoImpl")
	private SnsDao snsDao;
	
	private WebDriver driver;
	private WebElement webElement;

	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	// public static final String WEB_DRIVER_PATH="C:/z.utility/chromedriver.exe";
	public static final String WEB_DRIVER_PATH = "C:/Users/wlsgm/OneDrive/바탕 화면/java/chromedriver.exe";

	private String base_url;

	public SnsServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public Map<String, Object> getFaceBookTimeLineList(FaceBook faceBook) {
		
	
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

			Map<String, Object> prefs = new HashMap<String, Object>();
			prefs.put("profile.default_content_setting_values.notifications", 2);
			ChromeOptions options = new ChromeOptions();
			options.setExperimentalOption("prefs", prefs);
			options.setCapability("ignoreProtectedModeSettings", true);
			driver = new ChromeDriver(options);

			base_url = "https://ko-kr.facebook.com";

			driver.get(base_url);

			webElement = driver.findElement(By.id("email"));
			String face_id = "wlsgml1416@naver.com";
			webElement.sendKeys(face_id);

			webElement = driver.findElement(By.id("pass"));
			String face_pw = "011!wlslgogo";
			webElement.sendKeys(face_pw);

			webElement = driver.findElement(By.id("loginbutton"));
			webElement.submit();

		
		
		
		return null;
	}
}
