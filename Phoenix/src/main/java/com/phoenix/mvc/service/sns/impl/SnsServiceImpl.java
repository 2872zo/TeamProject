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
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.TimeLine;
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

	private String url;

	public SnsServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public Map<String, Object> getFaceBookTimeLineList(Search search) {
		
		try {

			//크롬세팅
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
			
			//팝업옵션해제
			Map<String, Object> prefs = new HashMap<String, Object>();
			prefs.put("profile.default_content_setting_values.notifications", 2);
			ChromeOptions options = new ChromeOptions();
			options.setExperimentalOption("prefs", prefs);
			options.addArguments("headless");//창안켜줭~
			options.setCapability("ignoreProtectedModeSettings", true);
			driver = new ChromeDriver(options);

			
			url = "https://ko-kr.facebook.com";
			
			//페이스북접속
			driver.get(url);

			//로그인
			webElement = driver.findElement(By.id("email"));
			webElement.sendKeys(search.getFbId());

			webElement = driver.findElement(By.id("pass"));
			webElement.sendKeys(search.getFbPw());

			webElement = driver.findElement(By.id("loginbutton"));
			webElement.submit();
		

		
		//////////////////////////////////////////////////////////////
		List <TimeLine> list = new ArrayList<TimeLine>();
		
		WebElement end = driver.findElement(By.id("pageFooter"));

			//System.out.println("===="+k+"번째 스크롤====");
		if(search.getCurrentPage()==0) {
		
			((JavascriptExecutor)driver).executeScript("window.scrollTo(0,document.body.scrollHeight)");
			WebDriverWait wait = new WebDriverWait(driver, 300);
			wait.until(ExpectedConditions.invisibilityOf(end));
		}
		
		WebElement feed = driver.findElement(By.cssSelector("div[role='feed']")); // 피드 전체
		List<WebElement> each = feed.findElements(By.cssSelector("div[class='_5pcr userContentWrapper']"));// 각자피드
		
		if(search.getCurrentPage()!=0) {
			for( int k = each.size(); k<search.getCurrentPage(); k++) {
				((JavascriptExecutor)driver).executeScript("window.scrollTo(0,document.body.scrollHeight)");
				WebDriverWait wait = new WebDriverWait(driver, 300);
				wait.until(ExpectedConditions.invisibilityOf(end));
				
			}
		}
		
			
			System.out.println(" 페이스북 포스트수 : " + each.size()); // 포스트 수
			
			int count=0;
			
				for (int i = 0; i < each.size(); i++) {
					
					TimeLine newTimeLine = new TimeLine();
					List<String> img1List = new ArrayList<String>();
					List<String> img1LinkList = new ArrayList<String>();
					List<String> img2List = new ArrayList<String>();
					List<String> img2LinkList = new ArrayList<String>();
					List<String> img3List = new ArrayList<String>();
					List<String> img3LinkList = new ArrayList<String>();
					List<String> img4List = new ArrayList<String>();
					List<String> img4LinkList = new ArrayList<String>();
					List<String> videoList  = new ArrayList<String>();
					List<String> videoLinkList = new ArrayList<String>();
					
					newTimeLine.setPostSize(each.size());
		
					System.out.println(i + " 번째 포스트 "); // 포스트 수
					List<WebElement> postId = each.get(i).findElements(By.cssSelector("h5[class='_7tae _14f3 _14f5 _5pbw _5vra']"));
					
					if(postId.size() != 0) {//일반작성아이디
						System.out.println("작성자ID "+ (each.get(i).findElement(By.cssSelector("h5[class='_7tae _14f3 _14f5 _5pbw _5vra']")).getText()));
						newTimeLine.setPostId(each.get(i).findElement(By.cssSelector("h5[class='_7tae _14f3 _14f5 _5pbw _5vra']")).getText());
					}
					
					List<WebElement> reactionId = each.get(i).findElements(By.cssSelector("h6[class='_7tae _14f3 _14f5 _5pbw _5vra']"));
					
					if(reactionId.size() != 0) {//공유한경우의아이디
						System.out.println("작성자ID "+ (each.get(i).findElement(By.cssSelector("h6[class='_7tae _14f3 _14f5 _5pbw _5vra']")).getText()));
						newTimeLine.setPostId(each.get(i).findElement(By.cssSelector("h6[class='_7tae _14f3 _14f5 _5pbw _5vra']")).getText());
					}
					
					List<WebElement> post = each.get(i).findElements(By.cssSelector("[data-testid='post_message']"));
					
					if(post.size()!=0) {//포스트가 없는경우도 존재
						System.out.println("내용 " + (each.get(i).findElement(By.cssSelector("[data-testid='post_message']")).getText()));
						newTimeLine.setPost(each.get(i).findElement(By.cssSelector("[data-testid='post_message']")).getText());
						
						List<WebElement> morePost = ( each.get(i).findElement(By.cssSelector("[data-testid='post_message']") ).findElements(By.className("see_more_link")));
						WebElement commonPost = each.get(i).findElement(By.cssSelector("[data-testid='post_message']") );
					
						if(post.size()!=0 && morePost.size()!=0) {//더보기 경우
						
							WebElement seeMore=commonPost.findElement(By.className("see_more_link"));
							JavascriptExecutor jse=(JavascriptExecutor)driver;
							jse.executeScript("arguments[0].click();",seeMore);
							
							newTimeLine.setPost(commonPost.getText());
							
							System.out.println(commonPost.getText());
							
		
						}
							
					}
					
			
					System.out.println("작성일 " + (each.get(i).findElement(By.cssSelector("span[class='fsm fwn fcg']")).getText()));
					newTimeLine.setRegDate(each.get(i).findElement(By.cssSelector("span[class='fsm fwn fcg']")).getText());
					List<WebElement> likeCount = each.get(i).findElements(By.cssSelector("[data-testid='UFI2ReactionsCount/sentenceWithSocialContext']"));
					
					if (likeCount.size() != 0) {
						//System.out.println("좋아요 있음!");
						System.out.println("좋아요수 " + (each.get(i).findElement(By.cssSelector("[data-testid='UFI2ReactionsCount/sentenceWithSocialContext']")).getText()));
						newTimeLine.setLikeCount(each.get(i).findElement(By.cssSelector("[data-testid='UFI2ReactionsCount/sentenceWithSocialContext']")).getText());
					}
					System.out.println("--------------------------" + i);
		
					WebElement common = each.get(i).findElement(By.className("_3x-2"));
		
					List<WebElement> video = common.findElements(By.tagName("video"));
					System.out.println("해당피드동영상 : " + video.size());
					newTimeLine.setVideo1Size(video.size());
					List<WebElement> videoImg = common.findElements(By.className("img"));
		
					List<WebElement> img1 = common.findElements(By.cssSelector("a[class='_4-eo _2t9n _50z9']"));
					System.out.println("해당피드사진1: " + img1.size());
					newTimeLine.setImg1Size(img1.size());
		
					List<WebElement> img2 = common.findElements(By.cssSelector("a[class='_5dec _xcx']"));
					System.out.println("해당피드사진2: " + img2.size());
					newTimeLine.setImg2Size(img2.size());
		
					List<WebElement> img3 = common.findElements(By.cssSelector("a[class='_5dec _xcx _487t']"));
					System.out.println("해당피드사진3: " + img3.size());
					newTimeLine.setImg3Size(img3.size());
					
					List<WebElement> img4 = common.findElements(By.cssSelector("a[class='_4-eo _2t9n']"));
					System.out.println("해당피드사진4: " + img4.size());
					newTimeLine.setImg4Size(img4.size());
					
					
					
						if (newTimeLine.getVideo1Size() != 0) {
							System.out.println("동영상");
							
							
							for (int j = count; j < newTimeLine.getVideo1Size(); j++) {
								System.out.println(j + " 동영상 내부 for문");

								Actions action = new Actions(driver);
								WebElement right = video.get(j);
								action.contextClick(right).perform();
								
								WebElement page = driver.findElement(By.id("globalContainer"));//페이지바닥
								List<WebElement> linkWrap = page.findElements(By.className("_54nf"));//비디오용공동바닥	
								
								if(linkWrap.size() != 0) {//클릭안되는 영상도 존재함
								List<WebElement> link = linkWrap.get(j).findElements(By.className("_54nh"));
								WebElement videoLink = link.get(3).findElement(By.className("_xd6"));
								//System.out.println(videoLink.getAttribute("value"));
								
								
								
								videoList.add(videoImg.get(j).getAttribute("src"));
								videoLinkList.add(videoLink.getAttribute("value"));
								newTimeLine.setVideoList(videoList);
								newTimeLine.setVideoLinkList(videoLinkList);
								count += newTimeLine.getVideo1Size();
								}
							
							}
							
							
							System.out.println("--------------------------");
			
						} else if (newTimeLine.getImg1Size() != 0 || newTimeLine.getImg2Size() != 0 || newTimeLine.getImg3Size() != 0 || newTimeLine.getImg4Size() != 0) {
							System.out.println("1");
							for (int j = 0; j < newTimeLine.getImg1Size(); j++) {
								System.out.println(j + " 이미지1 내부 for문");
								//System.out.println(img1.get(j).getAttribute("data-ploi"));
								//System.out.println(img1.get(j).getAttribute("href"));
								img1List.add(img1.get(j).getAttribute("data-ploi"));
								img1LinkList.add(img1.get(j).getAttribute("href"));
								newTimeLine.setImg1List(img1List);
								newTimeLine.setImg1LinkList(img1LinkList);
							}
							System.out.println("2");
							for (int j = 0; j < newTimeLine.getImg2Size(); j++) {
								System.out.println(j + " 이미지2 내부 for문");
								//System.out.println(img2.get(j).getAttribute("data-ploi"));
								//System.out.println(img2.get(j).getAttribute("href"));
								img2List.add(img2.get(j).getAttribute("data-ploi"));
								img2LinkList.add(img2.get(j).getAttribute("href"));
								newTimeLine.setImg1List(img2List);
								newTimeLine.setImg1LinkList(img2LinkList);
							}
							System.out.println("3");
							for (int j = 0; j < newTimeLine.getImg3Size(); j++) {
								System.out.println(j + " 이미지3 내부 for문");
								//System.out.println(img3.get(j).getAttribute("data-ploi"));
								//System.out.println(img3.get(j).getAttribute("href"));
								img3List.add(img3.get(j).getAttribute("data-ploi"));
								img3LinkList.add(img3.get(j).getAttribute("href"));
								newTimeLine.setImg1List(img3List);
								newTimeLine.setImg1LinkList(img3LinkList);
			
							}
							System.out.println("4");
							for (int j = 0; j < newTimeLine.getImg4Size(); j++) {
								System.out.println(j + " 이미지4 내부 for문");
								//System.out.println(img4.get(j).getAttribute("data-ploi"));
								//System.out.println(img4.get(j).getAttribute("href"));
								img4List.add(img4.get(j).getAttribute("data-ploi"));
								img4LinkList.add(img4.get(j).getAttribute("href"));
								newTimeLine.setImg1List(img4List);
								newTimeLine.setImg1LinkList(img4LinkList);
			
							}
							System.out.println("--------------------------");
			
						}else if((newTimeLine.getVideo1Size() != 0) && (newTimeLine.getImg1Size() != 0 || newTimeLine.getImg2Size() != 0 || newTimeLine.getImg3Size() != 0 ||newTimeLine.getImg4Size() != 0) ) {
							for (int j = count; j < newTimeLine.getVideo1Size(); j++) {
								System.out.println(j + " 동영상+이미지 내부 for문");
								
								Actions action = new Actions(driver);
								WebElement right = video.get(j);
								action.contextClick(right).perform();
								
								WebElement page = driver.findElement(By.id("globalContainer"));//페이지바닥
								List<WebElement> linkWrap = page.findElements(By.className("_54nf"));//비디오용공동바닥	
								List<WebElement> link = linkWrap.get(j).findElements(By.className("_54nh"));
								WebElement videoLink = link.get(3).findElement(By.className("_xd6"));
								//System.out.println(videoLink.getAttribute("value"));
								
								//videoList.add(video.get(j).getAttribute("src"));
								videoList.add(videoImg.get(j).getAttribute("src"));
								videoLinkList.add(videoLink.getAttribute("value"));
								newTimeLine.setVideoList(videoList);
								newTimeLine.setVideoLinkList(videoLinkList);
							}

								for (int j = 0; j < newTimeLine.getImg1Size(); j++) {
									System.out.println(j + " 이미지1 내부 for문");
									//System.out.println(img1.get(j).getAttribute("data-ploi"));
									//System.out.println(img1.get(j).getAttribute("href"));
									img1List.add(img1.get(j).getAttribute("data-ploi"));
									img1LinkList.add(img1.get(j).getAttribute("href"));
									newTimeLine.setImg1List(img1List);
									newTimeLine.setImg1LinkList(img1LinkList);
								}
								System.out.println("2");
								for (int j = 0; j < newTimeLine.getImg2Size(); j++) {
									System.out.println(j + " 이미지2 내부 for문");
									//System.out.println(img2.get(j).getAttribute("data-ploi"));
									//System.out.println(img2.get(j).getAttribute("href"));
									img2List.add(img2.get(j).getAttribute("data-ploi"));
									img2LinkList.add(img2.get(j).getAttribute("href"));
									newTimeLine.setImg1List(img2List);
									newTimeLine.setImg1LinkList(img2LinkList);
								}
								System.out.println("3");
								for (int j = 0; j < newTimeLine.getImg3Size(); j++) {
									System.out.println(j + " 이미지3 내부 for문");
									//System.out.println(img3.get(j).getAttribute("data-ploi"));
									//System.out.println(img3.get(j).getAttribute("href"));
									img3List.add(img3.get(j).getAttribute("data-ploi"));
									img3LinkList.add(img3.get(j).getAttribute("href"));
									newTimeLine.setImg1List(img3List);
									newTimeLine.setImg1LinkList(img3LinkList);
				
								}
								System.out.println("4");
								for (int j = 0; j < newTimeLine.getImg4Size(); j++) {
									System.out.println(j + " 이미지4 내부 for문");
									//System.out.println(img4.get(j).getAttribute("data-ploi"));
									//System.out.println(img4.get(j).getAttribute("href"));
									img4List.add(img4.get(j).getAttribute("data-ploi"));
									img4LinkList.add(img4.get(j).getAttribute("href"));
									newTimeLine.setImg1List(img4List);
									newTimeLine.setImg1LinkList(img4LinkList);
				
								}
							
							System.out.println("--------------------------");
						}//마지막if
						
						
						list.add(i, newTimeLine);
						System.out.println("i"+i);
						System.out.println("list값 궁금해욤 "+list);
						
					}//for문
				
		search.setSubject(100);//페이스북100	
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("timeLine",list);
		map.put("count", each.size());
		map.put("search", search);
		

		return map;
		}finally {
			//driver.close();
		}
	


	}
	
	private WebDriver headlessConnection(){
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		//팝업옵션해제
		Map<String, Object> prefs = new HashMap<String, Object>();
		prefs.put("profile.default_content_setting_values.notifications", 2);
		ChromeOptions options = new ChromeOptions();
		options.setExperimentalOption("prefs", prefs);
		options.setCapability("ignoreProtectedModeSettings", true);
		options.addArguments("headless");//창안켜줭~
		WebDriver driver = new ChromeDriver(options);
		WebDriverWait wait = new WebDriverWait(driver, 10);
		
		return driver;
	}
	
	private WebDriver connection(){
		
		//크롬세팅
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
				
		//팝업옵션해제
		Map<String, Object> prefs = new HashMap<String, Object>();
		prefs.put("profile.default_content_setting_values.notifications", 2);
		ChromeOptions options = new ChromeOptions();
		options.setExperimentalOption("prefs", prefs);
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver(options);
		
		
		return driver;
	}
	
	private WebElement fbLogIn(Search search){
		
		url = "https://ko-kr.facebook.com";
		
		//페이스북접속
		driver.get(url);

		//로그인
		webElement = driver.findElement(By.id("email"));
		webElement.sendKeys(search.getFbId());

		webElement = driver.findElement(By.id("pass"));
		webElement.sendKeys(search.getFbPw());

		webElement = driver.findElement(By.id("loginbutton"));
		webElement.submit();
		
		return webElement;
	}
	
	public TimeLine writeFb(Search search) {
		
		//크롬연결~
		WebDriver driver = this.connection();
				
		//페북 로그인
		this.fbLogIn(search);
		
		webElement = driver.findElement(By.name("xhpc_message"));
		webElement.sendKeys(search.getSearchKeyword());
		webElement.submit();
		
		
		TimeLine timeLine = new TimeLine();

		timeLine.setPost(search.getSearchKeyword());
		timeLine.setPassword(search.getFbPw());
		timeLine.setPostId(search.getFbId());
		
		
		return timeLine;
		
	}
}
