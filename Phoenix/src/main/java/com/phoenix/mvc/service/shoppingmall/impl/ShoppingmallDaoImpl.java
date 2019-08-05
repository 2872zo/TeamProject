package com.phoenix.mvc.service.shoppingmall.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.apache.ibatis.session.SqlSession;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.service.domain.Account;
import com.phoenix.mvc.service.domain.Product;
import com.phoenix.mvc.service.domain.Purchase;
import com.phoenix.mvc.service.domain.ShoppingmallSearch;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.shoppingmall.ShoppingmallDao;

@Repository("shoppingmallDaoImpl")
public class ShoppingmallDaoImpl implements ShoppingmallDao
{
	
	@Value("${webDriverId}")
	private String WEB_DRIVER_ID;
	
	@Value("${webDriverPath}")
	private String WEB_DRIVER_PATH;
	
	@Value("${tmonLoginURL}")
	private String tmonLoginURL;
	
	@Value("${tmonMyOrderlistURL}")
	private String tmonMyOrderlistURL;
	
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
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
		
			if(driver.findElements(By.className("related_keyword")).size()!=0) //연관검색어 없는 경우가 있다.
			{
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
				
				if(search.getSearchTotal()!=null) {
					
					search.setSearchTotal(search.getSearchTotal().replaceAll(",", ""));
				}
					
				if(items.size()==Integer.parseInt(search.getSearchTotal()))
					break;
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
	
	@Override //account 계정 다 가져오긔
	public List<Account> getShoppingmallAccount(int userNo) {
		
		return sqlSession.selectList("getMailAccount", userNo);
	}
	
	@Override 
	public Map<String, Object> getTmonPurchaseList(ShoppingmallSearch search, Account account) {
		
		WebDriver driver = this.connectToSelenium(); //드라이버연결
		this.tmonLogin(driver, account);//로그인
		driver.get(tmonMyOrderlistURL); //내가 구매한 상품목록으로 이동
		
		WebElement webElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.className("all"))); //1년
		webElement.click();
		
		////////////////////////////////////////////////////////////////ajax통신 기다린다////////////////
		WebDriverWait wait = new WebDriverWait(driver, 5000);
	    wait.until(new ExpectedCondition<Boolean>() {

	        public Boolean apply(WebDriver wdriver) {
	            return ((JavascriptExecutor) driver).executeScript("return jQuery.active == 0").equals(true);
	        }

	    });
	    
	    Boolean isJqueryUsed = (Boolean) ((JavascriptExecutor) driver)
	            .executeScript("return (typeof(jQuery) != 'undefined')");
	    if (isJqueryUsed) {
	        while (true) {
	            // JavaScript test to verify jQuery is active or not
	            Boolean ajaxIsComplete = (Boolean) (((JavascriptExecutor) driver)
	                    .executeScript("return jQuery.active == 0"));
	            if (ajaxIsComplete)
	                break;
	            try {
	                Thread.sleep(100);
	            } catch (InterruptedException e) {
	            }
	        }
	    }
	    
	    /////////////////////////////////////////////////////////////////////////////////////////////
	    
	    
		//본격적으로 가져오기(테이블)
		List<Purchase> purchaseList = new ArrayList<Purchase>();
		Map returnMap = new HashMap();
		WebElement myOrderTable = driver.findElement(By.xpath("//*[@id=\"buy_list\"]/div[2]/table")); // 테이블 절대경로
		WebElement tableHead = myOrderTable.findElement(By.tagName("thead"));
		WebElement tableBody = myOrderTable.findElement(By.tagName("tbody"));
		List<WebElement> col = tableHead.findElements(By.tagName("th")); // 이렇게 찾으면 되는거 아닌가?
		List<WebElement> row = tableBody.findElements(By.tagName("tr"));
		
		
		System.out.println("구매내역있음");
		//한 컬럼에  th/th/td/td 가지고있음.
		System.out.println(row.size());
		for(int i=1; i<=row.size(); i+=2) //i+=2만큼 홀수만 돈다.
		{
			System.out.println("i : "+i);
			Purchase purchase = new Purchase();
			
			webElement = tableBody.findElement(By.xpath("//*[@id=\"buy_list\"]/div[2]/table/tbody/tr["+i+"]"));
			
			WebElement dealInfoTH = webElement.findElement(By.className("deal_info"));
			WebElement sumUpOverTH =webElement.findElement(By.cssSelector(".sum_up"));
			WebElement expireOverTD = webElement.findElement(By.cssSelector(".expiry"));
			WebElement manageOverTD = webElement.findElement(By.cssSelector(".manage"));
			
			String orderDate = dealInfoTH.findElement(By.className("dt")).getText();
			purchase.setOrderDate(orderDate); // orderDate설정
			String orderTime = dealInfoTH.findElement(By.className("date_num")).findElement(By.tagName("i")).getText();
			purchase.setOrderTime(orderTime);
			String orderNumber = dealInfoTH.findElement(By.className("buy_num")).findElement(By.tagName("strong")).getText();
			purchase.setOrderNumber(Integer.parseInt(orderNumber));
			String totalPrice = dealInfoTH.findElement(By.className("won")).findElement(By.tagName("em")).getText();
			purchase.setTotalPrice(totalPrice);
			String imageSrc = sumUpOverTH.findElement(By.tagName("img")).getAttribute("src");
			purchase.setImageSrc(imageSrc);
			String originPageLink = sumUpOverTH.findElement(By.tagName("h4")).findElement(By.tagName("a")).getAttribute("href");
			purchase.setOriginPageLink(originPageLink);
			String productName = sumUpOverTH.findElement(By.tagName("h4")).getText();
			purchase.setProductName(productName);
			String productDetail = sumUpOverTH.findElement(By.className("detail")).getText();
			purchase.setProductDetail(productDetail); 
			
			//productDetail.indexOf("구매수량");
			//System.out.println("구매수량"+productDetail.charAt(productDetail.indexOf("구매수량")+4));
			purchase.setQuantity(Integer.parseInt(productDetail.charAt(productDetail.indexOf("구매수량")+4)+"")); // 구매수량나온애
			
			
		
			if( dealInfoTH.findElements(By.className("delivery")).size()!=0 ) //배송비 <>있냐 없냐?일단 test
			{
				String deliveryPrice = dealInfoTH.findElement(By.className("delivery")).findElement(By.tagName("span")).getText();
				purchase.setDeliveryPrice(deliveryPrice);
			}
			else//없으면
			{
				// 쿠팡 같은경우 배송하지 않고 실물로 사용하는 티켓이라서 배송 x 
			}
			
			if(expireOverTD.findElements(By.className("delivery_condition")).size()!=0)// 있으면
			{
				String orderState = expireOverTD.findElement(By.className("delivery_condition")).findElement(By.tagName("strong")).getText();
				purchase.setOrderState(orderState);
			}
			else // 없으면
			{
				String orderState = expireOverTD.findElement(By.className("p_cfm")).getText();
				purchase.setOrderState(orderState); // 꼭 확인해 주세요~~ 어쩌꾸
			}
			
			purchase.setPurchaseFrom("tmon");
			//System.out.println(sumUpOverTH.findElements(By.className("add_date_info")).size());
			purchaseList.add(purchase);// purchaseList.size하면 몇개 샀는지 알수있음.
			//System.out.println(purchase);
			
		}
		
		
		returnMap.put("purchaseList", purchaseList);
		
		return returnMap;
	}
	
	
	private void tmonSearchProduct(WebDriver driver, ShoppingmallSearch search) //티몬상품검색
	{
		driver.get("http://search.tmon.co.kr/search/?keyword="+search.getSearchKeyword()+"&thr=ts");
	}
	
	private void tmonLogin(WebDriver driver, Account account)//티몬 로그인
	{
		//브라우저에 url주소창에 치고 request받은거랑 같음
		driver.get(tmonLoginURL);
		//11번가 iframe 안씀
		
		WebElement webElement = driver.findElement(By.id("userid"));
		String id11st = account.getAccountId();
		webElement.sendKeys(id11st);
		
		webElement = driver.findElement(By.id("pwd"));
		String password11st = account.getAccountPw();
		webElement.sendKeys(password11st);
		
		webElement = driver.findElement(By.className("btn_login"));
		webElement.click();
		
		try {
			Thread.sleep(2000); //왜기달림 로그인 되는 시간 보다, orderList 가는 시간이 더 빠르면 안된다고 생각함 그래서 해줌.
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	private WebDriver connectToSelenium() //셀레니움 크롬 드라이버 연결
	{
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);
		wait = new WebDriverWait(driver, 10);
		driver.manage().timeouts().implicitlyWait(1,TimeUnit.SECONDS);
		return driver;
	}

	

	
	
}
