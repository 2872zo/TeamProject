package com.phoenix.mvc.web.sns;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.BrowserType;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.phoenix.mvc.service.domain.FaceBook;

public class FacebookWriteTest {

	public static void main(String[] args) throws InterruptedException, IOException {
		FacebookWriteTest selTest = new FacebookWriteTest();
		//selTest.login();
		// selTest.write();
		// selTest.update();
		//selTest.timeLine();
	}

	private WebDriver driver;
	private WebElement webElement;

	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	// 크롬위치 public static final String
	// WEB_DRIVER_PATH="C:/z.utility/chromedriver.exe";
	public static final String WEB_DRIVER_PATH = "C:/Users/wlsgm/OneDrive/바탕 화면/java/chromedriver.exe";

	private String base_url;

	public FacebookWriteTest() {
		super();
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		Map<String, Object> prefs = new HashMap<String, Object>();
		prefs.put("profile.default_content_setting_values.notifications", 2);
		ChromeOptions options = new ChromeOptions();
		options.setExperimentalOption("prefs", prefs);
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver(options);

		base_url = "https://ko-kr.facebook.com";

	}

	public void login() throws InterruptedException {

		driver.get(base_url);

		webElement = driver.findElement(By.id("email"));
		String face_id = "wlsgml1416@naver.com";
		webElement.sendKeys(face_id);

		webElement = driver.findElement(By.id("pass"));
		String face_pw = "011!wlslgogo";
		webElement.sendKeys(face_pw);

		webElement = driver.findElement(By.id("loginbutton"));
		webElement.submit();

	}

	public void write() {

		webElement = driver.findElement(By.name("xhpc_message"));
		String face_text = "new text";
		webElement.sendKeys(face_text);
		webElement.submit();
	}

	public void update() {
		driver.findElement(By.cssSelector("[data-testid='left_nav_item_김진희']")).click();
		WebDriverWait wait = new WebDriverWait(driver, 10);
		wait.until(
				ExpectedConditions.invisibilityOfElementLocated(By.className("_6a uiPopover _5pbi _cmw _b1e _1wbl")));
		driver.findElement(By.className("_6a uiPopover _5pbi _cmw _b1e _1wbl")).click();

		// driver.findElement(By.cssSelector("[data-feed-option-name='FeedEditOption']")).click();
		// driver.findElement(By.xpath("//*[@id=\"u_1w_0\"]/div/ul/li[6]")).click();

	}

	public void timeLine() throws IOException, InterruptedException {

		JavascriptExecutor jse = (JavascriptExecutor) driver;
		WebDriverWait wait = new WebDriverWait(driver, 20);

		WebElement feed = driver.findElement(By.cssSelector("div[role='feed']")); // 피드 전체
		List<WebElement> each = feed.findElements(By.cssSelector("div[class='_5pcr userContentWrapper']"));// 각자피드
		// List<WebElement> post =
		// each.findElements(By.cssSelector("[data-testid='post_message']")); // 포스트
		// List<WebElement> regDate = each.findElements(By.xpath("//span[@class='fsm fwn
		// fcg']")); // 작성일
		List<WebElement> postId = feed.findElements(By.xpath("//h5[@class='_7tae _14f3 _14f5 _5pbw _5vra']")); // 작성자.id
		// List<WebElement> likeCount =
		// each.findElements(By.cssSelector("[data-testid='UFI2ReactionsCount/sentenceWithSocialContext']"));좋아요수
		// List<WebElement> dimg = driver.findElements(By.xpath("//a[@class='_5dec _xcx
		// _487t']")); // 이미지 맨 처음
		List<WebElement> img = feed.findElements(By.xpath("//a[@class='_5dec _xcx']")); // 이미지
		List<WebElement> sImg = feed.findElements(By.xpath("//a[@class='_4-eo _2t9n']"));// 이미지
		// List<WebElement> post = driver.findElements(By.xpath("//div[@class='_1dwg
		// _1w_m _q7o']"));// 포스트 수
		
		jse.executeScript("scroll(0,1000)");
		wait.until(ExpectedConditions.visibilityOfAllElements(feed));
		System.out.println("포스트 개수 알려줘!" + postId.size());
		
		

		for (int i = 0; i < postId.size(); i++) {// 포스트내용,작성자아이디,작성일,좋아요수,이미지
				
			FaceBook faceBook = new FaceBook();
				
				faceBook.setPost(each.get(i).findElement(By.cssSelector("[data-testid='post_message']")).getText());
				faceBook.setPostId(each.get(i).findElement(By.xpath("//h5[@class='_7tae _14f3 _14f5 _5pbw _5vra']")).getText());
				faceBook.setRegDate(each.get(i).findElement(By.xpath("//span[@class='fsm fwn fcg']")).getText());
				faceBook.setLikeCount(each.get(i).findElement(By.cssSelector("[data-testid='UFI2ReactionsCount/sentenceWithSocialContext']"))
						.getText());
				
				
				wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector("a[class='_4-eo _2t9n _50z9']")));
				wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.xpath("//a[@class='_5dec _xcx']")));
				
				if (each.get(i).findElements(By.cssSelector("a[class='_4-eo _2t9n _50z9']")).size()!=0) {//이미지태그 두개중 첫번째
					faceBook.setThumbnail(each.get(i).findElement(By.cssSelector("a[class='_4-eo _2t9n _50z9']")).getAttribute("data-ploi"));
					faceBook.setLink(each.get(i).findElement(By.cssSelector("a[class='_4-eo _2t9n _50z9']")).getAttribute("href"));

				} else if (each.get(i).findElements(By.xpath("//a[@class='_5dec _xcx']")).size()!=0) {//이미지태그 두개중 두번째
					faceBook.setThumbnail( each.get(i).findElement(By.xpath("//a[@class='_5dec _xcx']")).getAttribute("data-ploi"));

				}
				System.out.println(faceBook);
				
				if(faceBook != null) {
					System.out.println(i+"번 성공!");
					jse.executeScript("scroll(0,1300)");
					wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector("[data-testid='UFI2ReactionsCount/sentenceWithSocialContext']")));
				}
			

			
		}

	}

}
