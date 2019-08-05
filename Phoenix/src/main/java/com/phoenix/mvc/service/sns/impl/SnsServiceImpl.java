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
	

	private WebDriver headlessConnection(){
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		//팝업옵션해제
		Map<String, Object> prefs = new HashMap<String, Object>();
		prefs.put("profile.default_content_setting_values.notifications", 2);
		ChromeOptions options = new ChromeOptions();
		options.setExperimentalOption("prefs", prefs);
		options.setCapability("ignoreProtectedModeSettings", true);
		//options.addArguments("headless");//창안켜줭~
		driver = new ChromeDriver(options);
		wait = new WebDriverWait(driver, 10);
		
		return driver;
	}
	
	
	public Account fbLogIn(Account account){
		
		
		driver = this.headlessConnection();
		
		url = "https://ko-kr.facebook.com";
		
		//페이스북접속
		driver.get(url);

		//로그인
		webElement = driver.findElement(By.id("email"));
		webElement.sendKeys(account.getAccountId());

		webElement = driver.findElement(By.id("pass"));
		webElement.sendKeys(account.getAccountPw());

		webElement = driver.findElement(By.id("loginbutton"));
		webElement.submit();
		
		//로그인 성공인지 실패인지 찾기
		//WebElement login = driver.findElement(By.id("login_link")); 
		WebElement feed = driver.findElement(By.cssSelector("div[role='feed']"));
		
		if(feed.isEnabled()) {
			System.out.println("페이스북 로그인 성공");
			account.setAccountDomain("faceBook");
			return snsDao.addSnsAccount(account);
			
		}else {
			System.out.println("페이스북 로그인 실패");
			return null;
			
		}
		

		
	}
	
	@Override
	public Account igLogIn(Account account) {
		
		driver = this.headlessConnection();
		
		url = "https://www.instagram.com/accounts/login/?hl=ko&source=auth_switcher";
		
		//인스타그램접속
		driver.get(url);

		//로그인
		List<WebElement> input = driver.findElements(By.tagName("input"));
		webElement = input.get(0);
		webElement.sendKeys(account.getAccountId());

		webElement = driver.findElement(By.name("password"));
		webElement.sendKeys(account.getAccountPw());

		webElement = driver.findElement(By.xpath("//*[@id='react-root']/section/main/div/article/div/div[1]/div/form/div[6]/button"));
		webElement.submit();

		
		
		return null;
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
			//options.addArguments("headless");//창안켜줭~
			options.setCapability("ignoreProtectedModeSettings", true);
			driver = new ChromeDriver(options);
			wait = new WebDriverWait(driver, 40);

			
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
		
		//WebElement end = driver.findElement(By.id("pageFooter"));
		WebElement feed = driver.findElement(By.cssSelector("div[role='feed']")); // 피드 전체
		List<WebElement> checkSize = feed.findElements(By.cssSelector("div[class='_5pcr userContentWrapper']"));
		
		
		int eachSize = checkSize.size();
		int value = search.getCurrentPage();
		
		System.out.println(eachSize+" each 사이즈 임");
		System.out.println(value+" value 값");

		WebElement webElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[role='feed']"))); 
		List<WebElement> check = webElement.findElements(By.cssSelector("div[class='_5pcr userContentWrapper']"));	
		
		if(value==0) {
			
			while(eachSize<=6) {
				
				((JavascriptExecutor)driver).executeScript("window.scrollBy(0,100)");
				
				check= feed.findElements(By.cssSelector("div[class='_5pcr userContentWrapper']"));
				System.out.println("1while문 안에 사이즈 체크 "+ check.size());
				
				if(check.size()>=5) {
					break;
				}
				
			}
		}else {
			
			while(eachSize<value+6) {//조건은 후하게주세욤..
				System.out.println("currentpage존재하니까 그만큼 while문 반복해줭");
				
				((JavascriptExecutor)driver).executeScript("window.scrollBy(0,300)");
	
				check= feed.findElements(By.cssSelector("div[class='_5pcr userContentWrapper']"));
				System.out.println("2while문 안에 사이즈 체크 "+ check.size());
				
				if(check.size()>=value+5) {//스크롤하면 이제 5개씩가져옴!
					break;
				}
			}
		}
		
		
		
		
		//List<WebElement> each = feed.findElements(By.cssSelector("div[class='_5pcr userContentWrapper']"));
		
		
		search.setCurrentPage(check.size());
		System.out.println("search값 세팅 "+search.getCurrentPage());
		
		System.out.println(" 페이스북 포스트수 : " +check.size()); // 포스트 수
			
			int count=0;
			
				for (int i = value; i < check.size(); i++) {
					
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
					
				
		
					System.out.println(i + " 번째 포스트 "); // 포스트 수
					List<WebElement> postId = check.get(i).findElements(By.cssSelector("h5[class='_7tae _14f3 _14f5 _5pbw _5vra']"));
					
					if(postId.size() != 0) {//일반작성아이디
						wait.until(ExpectedConditions.textToBePresentInElement(check.get(i).findElement(By.cssSelector("h5[class='_7tae _14f3 _14f5 _5pbw _5vra']")), ""));
						System.out.println("작성자ID "+ (check.get(i).findElement(By.cssSelector("h5[class='_7tae _14f3 _14f5 _5pbw _5vra']")).getText()));
						newTimeLine.setPostId(check.get(i).findElement(By.cssSelector("h5[class='_7tae _14f3 _14f5 _5pbw _5vra']")).getText());
					}
					
					
					List<WebElement> reactionId = check.get(i).findElements(By.cssSelector("h6[class='_7tae _14f3 _14f5 _5pbw _5vra']"));
					
					if(reactionId.size() != 0) {//공유한경우의아이디
						wait.until(ExpectedConditions.textToBePresentInElement(check.get(i).findElement(By.cssSelector("h6[class='_7tae _14f3 _14f5 _5pbw _5vra']")), ""));
						System.out.println("작성자ID "+ (check.get(i).findElement(By.cssSelector("h6[class='_7tae _14f3 _14f5 _5pbw _5vra']")).getText()));
						newTimeLine.setPostId(check.get(i).findElement(By.cssSelector("h6[class='_7tae _14f3 _14f5 _5pbw _5vra']")).getText());
					}
					
					List<WebElement> post = check.get(i).findElements(By.cssSelector("[data-testid='post_message']"));
					
					if(post.size()!=0) {//포스트가 없는경우도 존재
						wait.until(ExpectedConditions.textToBePresentInElement(check.get(i).findElement(By.cssSelector("[data-testid='post_message']")), ""));
						System.out.println("내용 " + (check.get(i).findElement(By.cssSelector("[data-testid='post_message']")).getText()));
						newTimeLine.setPost(check.get(i).findElement(By.cssSelector("[data-testid='post_message']")).getText());
						
						List<WebElement> morePost = ( check.get(i).findElement(By.cssSelector("[data-testid='post_message']") ).findElements(By.className("see_more_link")));
						WebElement commonPost = check.get(i).findElement(By.cssSelector("[data-testid='post_message']") );
					
						if(post.size()!=0 && morePost.size()!=0) {//더보기 경우
						
							WebElement seeMore=commonPost.findElement(By.className("see_more_link"));
							JavascriptExecutor jse=(JavascriptExecutor)driver;
							jse.executeScript("arguments[0].click();",seeMore);
							
							newTimeLine.setPost(commonPost.getText());
							
							System.out.println(commonPost.getText());
							
		
						}
						
						
						if(newTimeLine.getPost() == null) {
							newTimeLine.setPost(" ");
						}else if(newTimeLine.getPost()!= null) {
							newTimeLine.getPost().replaceAll(newTimeLine.getPostId(), "");
							newTimeLine.getPost().replaceAll("  ", "");
						}
							
					}
					
					wait.until(ExpectedConditions.textToBePresentInElement(check.get(i).findElement(By.cssSelector("span[class='fsm fwn fcg']")), ""));
					System.out.println("작성일 " + (check.get(i).findElement(By.cssSelector("span[class='fsm fwn fcg']")).getText()));
					newTimeLine.setRegDate(check.get(i).findElement(By.cssSelector("span[class='fsm fwn fcg']")).getText());
					
					List<WebElement> likeCount = check.get(i).findElements(By.cssSelector("[data-testid='UFI2ReactionsCount/sentenceWithSocialContext']"));
					newTimeLine.setLikeCount("0");
					if (likeCount.size() != 0) {
						wait.until(ExpectedConditions.textToBePresentInElement(check.get(i).findElement(By.cssSelector("[data-testid='UFI2ReactionsCount/sentenceWithSocialContext']")),""));
						System.out.println("좋아요수 " + (check.get(i).findElement(By.cssSelector("[data-testid='UFI2ReactionsCount/sentenceWithSocialContext']")).getText()));
						newTimeLine.setLikeCount(check.get(i).findElement(By.cssSelector("[data-testid='UFI2ReactionsCount/sentenceWithSocialContext']")).getText());
					}
					System.out.println("--------------------------" + i);
		
					WebElement common = check.get(i).findElement(By.className("_3x-2"));
		
					List<WebElement> video = common.findElements(By.tagName("video"));
					System.out.println("해당피드동영상 : " + video.size());
					newTimeLine.setVideo1Size(video.size());
					List<WebElement> videoImg = common.findElements(By.tagName("img"));
		
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
						
						list.add(newTimeLine);
						System.out.println("list값 궁금해욤 "+list);
						
						
					}//for문
				
				
		search.setFace(100);//페이스북100	
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		map.put("timeLine",list);
		map.put("search", search);
		

		return map;
		
		}finally {
			driver.close();
			driver.quit();
		}
	


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
	public Map<String, Object> getInstaTimeLineList(Search search) {
		
		try {
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		//옵션설정
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		//options.addArguments("headless");//창안켜줭~
		driver = new ChromeDriver(options);
		
		//로그인
		url = "https://www.instagram.com/accounts/login/?hl=ko&source=auth_switcher";
		driver.get(url);
		
		List<WebElement> input = driver.findElements(By.tagName("input"));

		webElement = input.get(0);
		webElement.sendKeys(search.getIgId());

		webElement = driver.findElement(By.name("password"));
		webElement.sendKeys(search.getIgPw());

		webElement = driver.findElement(By.xpath("//*[@id='react-root']/section/main/div/article/div/div[1]/div/form/div[6]/button"));
		webElement.submit();
		
		WebDriverWait wait = new WebDriverWait(driver, 20);
		wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("/html/body/div[3]/div/div/div[3]/button[2]")));
		driver.findElement(By.xpath("/html/body/div[3]/div/div/div[3]/button[2]")).click(); // 알람 나중에 하기

		///////////////////////////////////////////////////
		List <TimeLine> list = new ArrayList<TimeLine>();
		
		WebElement feed = driver.findElement(By.cssSelector("div[class='cGcGK']")); // 피드 전체
		List<WebElement> articleSize = driver.findElements(By.tagName("article")); //각각 아티클
		
		int eachSize = articleSize.size();
		int value = search.getPageSize();
		int size = 0;
		int status = search.getStatus();
		System.out.println(eachSize+" each 사이즈 임");
		System.out.println(value+" value 값");
		
		
		WebElement webElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div[class='cGcGK']")));
		List<WebElement> article = webElement.findElements(By.tagName("article"));
		
		if(value!=0) {
			search.setStatus(status+1);
			System.out.println(search.getStatus()+" status 값 증가하는거 확인");
			
			while(eachSize<value+4) {//조건은 후하게주세욤..
				System.out.println("pagesize존재하니까 그만큼 while문 반복해줭");
				
				((JavascriptExecutor)driver).executeScript("window.scrollBy(0,400)");
	
				article= feed.findElements(By.tagName("article"));
				System.out.println("3while문 안에 사이즈 체크 "+ article.size());
				size++;
				System.out.println("size값은?" +size);
				if(size>=value*3*search.getStatus()) {//아휴...ㅅㅂ
					break;
				}
			}
			
		}
		search.setPageSize(article.size());
		
		System.out.println("search값 세팅 "+search.getPageSize());
		
		System.out.println(" 인스타 포스트수 : " +article.size()); // 포스트 수
		
		
		for (int i = search.getStatus(); i < article.size(); i++) {
			System.out.println("================================"+i);
			
			TimeLine newTimeLine = new TimeLine();
			List<String> img1List = new ArrayList<String>();
			List<String> videoList  = new ArrayList<String>();
			
			WebElement instaId = article.get(i).findElement(By.className("BrX75"));
			newTimeLine.setPostId(instaId.getText().trim());
			System.out.println("인스타id: "+instaId.getText());
			
			List<WebElement> likeCountSize = article.get(i).findElements(By.className("Nm9Fw"));
			newTimeLine.setLikeCount("0");
			if(likeCountSize.size()!= 0) {//좋아요 수가 있다면
				
				WebElement likeCount = article.get(i).findElement(By.className("Nm9Fw"));
				newTimeLine.setLikeCount(likeCount.getText().replaceAll("[^0-9]", ""));
				System.out.println("좋아요 수 : "+ likeCount.getText());
			}
			
			List<WebElement> viewCountSize = article.get(i).findElements(By.cssSelector("div[class='HbPOm _9Ytll']"));
			if(viewCountSize.size()!=0) {
				
				WebElement viewCount = article.get(i).findElement(By.cssSelector("div[class='HbPOm _9Ytll']"));
				newTimeLine.setLikeCount(viewCount.getText().replaceAll("[^0-9]", ""));
				System.out.println("조회 수 : "+ viewCount.getText());
				
			}
			WebElement regDate = article.get(i).findElement(By.tagName("time"));
			newTimeLine.setRegDate(regDate.getText());
			System.out.println("작성시간 : "+regDate.getText());
			
			List<WebElement> postSize = article.get(i).findElements(By.cssSelector("div[class='C7I1f X7jCj' ]"));
			
				if(postSize.size()!=0) {//포스트 없는 경우도 있음
					
					WebElement post = article.get(i).findElement(By.cssSelector("div[class='C7I1f X7jCj' ]"));
					newTimeLine.setPost(post.getText());
					System.out.println("포스트 내용 : "+post.getText());
			
					
					List<WebElement> morePost =  (article.get(i).findElement(By.cssSelector("div[class='C7I1f X7jCj' ]")).findElements(By.className("sXUSN")));
					WebElement commonPost =  article.get(i).findElement(By.cssSelector("div[class='C7I1f X7jCj' ]"));
						
						if(postSize.size()!=0 && morePost.size()!=0) {//더보기 경우
							
							WebElement seeMore=commonPost.findElement(By.className("sXUSN"));
							JavascriptExecutor jse=(JavascriptExecutor)driver;
							jse.executeScript("arguments[0].click();",seeMore);
							
							newTimeLine.setPost(commonPost.getText());
							System.out.println("더보기 있는 포스트 내용 : "+commonPost.getText());
							

						}
						
						
					if(newTimeLine.getPost() == null) {
						newTimeLine.setPost(" ");
					}else if(newTimeLine.getPost()!= null) {
						newTimeLine.getPost().replaceAll(newTimeLine.getPostId(), "");
						newTimeLine.getPost().replaceAll("  ", "");
					}
				}
			
			
			
			
			List<WebElement> common = article.get(i).findElements(By.className("_-1_m6"));
			
			if(common.size()!=0) {
				
				System.out.println("버튼의 개수 "+common.size());
				for(int j = 0;j<(common.size()-1);j++) {//사진개수-1를 다 가져오기 위해 버튼 클릭 용
					System.out.println("j "+j);
					WebElement middle =	article.get(i).findElement(By.className("_97aPb "));	
					WebElement last = middle.findElement(By.cssSelector("div[class='tN4sQ zRsZI']"));
					
					WebElement click = last.findElement(By.cssSelector("button[class='  _6CZji']"));
					JavascriptExecutor jse=(JavascriptExecutor)driver;
					jse.executeScript("arguments[0].click();",click);
				}
			}
				
				List<WebElement> img = article.get(i).findElements(By.className("FFVAD"));
				List<WebElement> video = article.get(i).findElements(By.className("tWeCl"));
				
			if(img.size() !=0) {
				System.out.println("해당피드 이미지 사이즈 "+img.size());
				for(int j = 0; j< img.size(); j++) {
					wait.until(ExpectedConditions.attributeContains(img.get(j), "src", "https"));
					img1List.add(img.get(j).getAttribute("src"));
					System.out.println("이미지 : "+img.get(j).getAttribute("src"));
					newTimeLine.setImg1List(img1List);
					
				}
			}
				
			else if(video.size()!=0) {
				System.out.println("해당피드 동영상 사이즈 "+video.size());
				for(int j = 0; j< video.size(); j++) {	
					wait.until(ExpectedConditions.attributeContains(video.get(j), "src", "https"));
					videoList.add(video.get(j).getAttribute("src"));
					System.out.println("동영상 : "+ video.get(j).getAttribute("src"));
					newTimeLine.setVideoList(videoList);
					
				}
			}
			else if(img.size() !=0 && video.size()!=0) {
				System.out.println("해당피드 이미지 사이즈 "+img.size()+"해당피드 동영상 사이즈 "+video.size());
				
				for(int j = 0; j< img.size(); j++) {
					img1List.add(img.get(j).getAttribute("src"));
					System.out.println("이미지 : "+img.get(j).getAttribute("src"));
					newTimeLine.setImg1List(img1List);
				}
				
				for(int j = 0; j< video.size(); j++) {	
					videoList.add(video.get(j).getAttribute("src"));
					System.out.println("동영상 : "+ video.get(j).getAttribute("src"));
					newTimeLine.setVideoList(videoList);
				}
				
			}
	
			System.out.println("================================");
		
			list.add(newTimeLine);
			System.out.println("list값 궁금해욤 "+list);
			
		}//for문
		search.setInsta(200);//인스타그램 200
		System.out.println("마지막으로 status 확인 "+search.getStatus());
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		map.put("timeLine",list);
		map.put("search", search);
		

		return map;
		}finally {
			driver.close();
			driver.quit();
		}
	
		
		
	}


	@Override
	public TimeLine writeFb(Search search) {
		// TODO Auto-generated method stub
		return null;
	}





}
