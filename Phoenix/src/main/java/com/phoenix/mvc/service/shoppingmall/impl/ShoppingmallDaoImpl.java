package com.phoenix.mvc.service.shoppingmall.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.service.domain.Product;
import com.phoenix.mvc.service.domain.ShoppingmallSearch;
import com.phoenix.mvc.service.shoppingmall.ShoppingmallDao;

@Repository("shoppingmallDaoImpl")
public class ShoppingmallDaoImpl implements ShoppingmallDao
{
	
	@Value("${webDriverId}")
	private String WEB_DRIVER_ID;
	
	@Value("${webDriverPath}")
	private String WEB_DRIVER_PATH;
	
	private WebDriverWait wait;
	
	//각자의 dao를 만들어 service단에서는 셀레니움을 쓰는지 모르게한다.
	//dao안에 일반method를 만들어서 부른다. 
	public ShoppingmallDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public Map<String, Object> getTmonProductList(ShoppingmallSearch search) {

		WebDriver driver = this.connectToSelenium(); //드라이버연결
		this.tmonSearchProduct(driver, search); //쇼핑몰 검색
		
		ArrayList<String> keywordList = new ArrayList<String>(); //연관검색어
		ArrayList<String> keywordLinkList = new ArrayList<String>(); //연관검색어 링크
		Map returnMap = new HashMap(); //return할 맵
		List<Product> productList = new ArrayList<Product>();
		
		
		if(search.getDetectedItemCount()==0) // 처음이면 연관검색어도 크롤링
		{
			WebElement webElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.id("search_app")));
			webElement = webElement.findElement(By.className("ct_wrap")).findElement(By.className("result_info"));
			webElement = webElement.findElement(By.tagName("strong")).findElement(By.className("cnt"));
			search.setSearchTotal(webElement.getText()); //total검색 개수
		
			webElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.className("related_keyword")));
			
			List<WebElement> relatedKeyword = webElement.findElements(By.tagName("dd"));
			for(int i=0; i<relatedKeyword.size(); i++)
			{
				keywordList.add(relatedKeyword.get(i).getText()); //연관검색어 저장
				//System.out.println(relatedKeyword.get(i).getText());
				keywordLinkList.add(relatedKeyword.get(i).findElement(By.tagName("a")).getAttribute("href")); //연관검색어링크 저장
				//System.out.println(relatedKeyword.get(i).findElement(By.tagName("a")).getAttribute("href"));
			}
			
			search.setRelativeKeyword(keywordList);
			search.setRelativeKeywordLink(keywordLinkList);
		}
		
		
		WebElement webElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.className("infinite-scroll-component "))); //찾을때까지 기달기달
		List<WebElement> items = webElement.findElements(By.className("item"));
		
		if(items.size()<=search.getDetectedItemCount()) //나온 item이 이미 출력된개수보다 작거나 같으면 스크롤한다.
		{
			while(items.size()<search.getDetectedItemCount()+24) //
			{
				JavascriptExecutor jse = (JavascriptExecutor)driver;
				jse.executeScript("window.scrollBy(0,250)"); //250px 다운
				
				items = webElement.findElements(By.className("item"));
				System.out.println(items.size());
			}
			
		}
		
		for(int i=search.getDetectedItemCount(); i< search.getDetectedItemCount()+24; i++) // item은 큰틀
		{
			Product product = new Product();
			webElement = items.get(i);
			product.setDetailPageLink(webElement.findElement(By.tagName("a")).getAttribute("href")); //상세보기링크
			

			product.setProductImage(webElement.findElement(By.className("thumb")).getAttribute("style").split("\"")[1]);//이미지
			WebElement dealInfo = webElement.findElement(By.className("deal_info"));
			product.setProductName(dealInfo.findElement(By.className("title")).getText());//상품이름
			
			product.setPrice(dealInfo.findElement(By.className("sale")).findElement(By.className("num")).getText());//상품가격
			//product.setDelivery(dealInfo.findElement(By.className("deliver")).getText()); //배송정보
			
			if(dealInfo.findElements(By.className("average")).size()!=0) //평균배송일이 있을때.
			{
				product.setAverageDeliveryDate(dealInfo.findElement(By.className("average")).getText()); //평균배송일
			}
			
			if(dealInfo.findElement(By.className("user_point")).findElements(By.className("review_average")).size()!=0) //리뷰평균점수
			{
				product.setReviewAverage(dealInfo.findElement(By.className("user_point")).findElement(By.className("review_average")).getText());
			}
			if(dealInfo.findElement(By.className("user_point")).findElements(By.className("review_count")).size()!=0) //리뷰개수몇개??
			{
				product.setReviewCount(dealInfo.findElement(By.className("user_point")).findElement(By.className("review_count")).findElement(By.tagName("i")).getText()); 
			}
			if(dealInfo.findElement(By.className("user_point")).findElements(By.className("buy_count")).size()!=0) //구매몇개??
			{
				product.setBuyCount(dealInfo.findElement(By.className("user_point")).findElement(By.className("buy_count")).findElement(By.tagName("i")).getText());
			}
			
			productList.add(product);
		}
		
		search.setDetectedItemCount(search.getDetectedItemCount()+productList.size()); //== 검색된 class="item" 의 개수 다음번에 오면 이개수+1부터 찾기시작. 

		returnMap.put("productList", productList);
		returnMap.put("search", search);
		
		driver.quit(); // 종료시켜준다. driver를 살려두는게 아니라 종료하고 다시열고 종료하고 다시여는 기준으로 한다. session에 저장할까? 흠.. 
		
		return returnMap;
	}
	
	
	private void tmonSearchProduct(WebDriver driver, ShoppingmallSearch search) //티몬검색
	{
		driver.get("http://search.tmon.co.kr/search/?keyword="+search.getSearchKeyword()+"&thr=ts");
	}
	
	private WebDriver connectToSelenium() //셀레니움 크롬 드라이버 연결
	{
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);
		//driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		wait = new WebDriverWait(driver, 10);
		
		return driver;
	}
	
}
