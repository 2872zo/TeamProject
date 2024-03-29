package com.phoenix.mvc.service.explore.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.ws.Response;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafePostDao;
import com.phoenix.mvc.service.domain.Blog;
import com.phoenix.mvc.service.domain.CafeExplore;
import com.phoenix.mvc.service.domain.Image;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.WebExplore;
import com.phoenix.mvc.service.explore.ExploreDao;

@Repository("exploreDaoImpl")
public class ExploreDaoImpl implements ExploreDao{
	
	@Autowired
	@Qualifier("cafePostDaoImpl")
	private CafePostDao cafePostDao;
	
	
	public ExploreDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public Map getDaumBlogExploreList(Search search) {
		
		List<Blog> blogList = new ArrayList<Blog>();
		Map map = new HashMap();
		int totalCount = 0;
		boolean isEnd = false;
		
		//search 설정 
		//1.정렬기준 설정 
		if(search.getOrderState()==0)
			search.setOrderStateSort("accuracy");//정확도
		else
			search.setOrderStateSort("recency");
		//2.검색엔진설정
		search.setSearchEngine(0);
		//3.검색Theme 설정
		search.setSearchThemeSort("blog");
		
		String jsonResult= this.APISearch(search); // API 통신
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("documents");
		Map meta = (Map) jsonObject.get("meta");
		
		if(meta != null)
		{
			if(meta.get("total_count")!=null)
			{
				totalCount += ((Long)meta.get("total_count")).intValue();
				System.out.println("다음 토탈카운트 : "+totalCount);
			}
			if(meta.get("is_end")!=null)
			{
				isEnd = (boolean) meta.get("is_end");
			}
		}
		
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i); 
				
				Blog blog = new Blog();
				//blog 값set하고
				blog.setBlogName(item.get("blogname").toString());
				blog.setDateTime(item.get("datetime").toString().split("T")[0]);
				blog.setThumbnail(item.get("thumbnail").toString());
				blog.setContents(item.get("contents").toString());
				blog.setTitle(item.get("title").toString());
				blog.setResultLink(item.get("url").toString());
				blog.setEngineFrom("daum");
				
				blogList.add(blog);
			}
		
		}
		
		map.put("blogList", blogList);
		map.put("totalCount", totalCount);
		map.put("daumIsEnd", isEnd);
		
		return map;// meta data는 어떻게 할건지?? 총 검색결과 등등.. Search에 넣을건가??
	}

	@Override
	public Map getNaverBlogExploreList(Search search) throws Exception {
		
		List<Blog> blogList = new ArrayList<Blog>();
		Map map = new HashMap();
		int totalCount =0;
		
		//search 설정 
		//1.정렬기준 설정 
		if(search.getOrderState()==0)//정확도
			search.setOrderStateSort("sim");
		else
			search.setOrderStateSort("date");
		//2.검색엔진설정
		search.setSearchEngine(1);
		//3.검색Theme 설정
		search.setSearchThemeSort("blog");			
		String jsonResult= this.APISearch(search); // API 실행
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("items");
		if(jsonObject.get("total")!=null) {
			totalCount += ((Long)jsonObject.get("total")).intValue();
			
		}
		
		
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i); 
				
				Blog blog = new Blog();
				//blog 값set하고
				blog.setBlogName(item.get("bloggername").toString());//0
				blog.setDateTime(this.dateFormatting(item.get("postdate").toString()));//0
				blog.setContents(item.get("description").toString());//0
				blog.setTitle(item.get("title").toString());//0
				blog.setResultLink(item.get("link").toString());//0
				blog.setBlogLink(item.get("bloggerlink").toString());//0
				blog.setEngineFrom("naver");
				
				blogList.add(blog);
			}
		}
		
		map.put("totalCount", totalCount);
		map.put("blogList", blogList);
		
		//System.out.println(blogList.size());
		//if(blogList==null)
			//System.out.println("널임");
		return map;// meta data는 어떻게 할건지?? 총 검색결과 등등.. Search에 넣을건가??
	}
	
	
	@Override
	public Map getDaumCafeExploreList(Search search) throws Exception {
		
		List<CafeExplore> cafeList = new ArrayList<CafeExplore>();
		Map map = new HashMap();
		int totalCount =0;
		boolean isEnd = false;
		
		//search 설정 
		//1.정렬기준 설정 
		if(search.getOrderState()==0)
			search.setOrderStateSort("accuracy");//정확도
		else
			search.setOrderStateSort("recency");
		//2.검색엔진설정
		search.setSearchEngine(0);
		//3.검색Theme 설정
		search.setSearchThemeSort("cafe");
		
		String jsonResult= this.APISearch(search); // API 통신
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("documents");
		Map meta = (Map) jsonObject.get("meta");
		
		
		if(meta!=null)
		{
			if(meta.get("total_count")!=null)
			{
				totalCount += ((Long)meta.get("total_count")).intValue();
				System.out.println("다음 토탈카운트 : "+totalCount);
			}
			if(meta.get("is_end")!=null)
			{
				isEnd = (boolean) meta.get("is_end");
			}
		}
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i); 
				
				CafeExplore cafeExplore = new CafeExplore();
				cafeExplore.setTitle(item.get("title").toString());
				cafeExplore.setContents(item.get("contents").toString());
				cafeExplore.setResultLink(item.get("url").toString());
				cafeExplore.setThumbnail(item.get("thumbnail").toString());
				cafeExplore.setCafeName(item.get("cafename").toString());
				cafeExplore.setDateTime(this.dateFormatting(item.get("datetime").toString()));
				cafeExplore.setEngineFrom("daum");
				
				cafeList.add(cafeExplore);
			}
		}
		
		map.put("cafeList", cafeList);
		map.put("totalCount", totalCount);
		map.put("isEnd", isEnd);
		
		return map;
	}

	@Override
	public Map getNaverCafeExploreList(Search search) {
		
		
		List<CafeExplore> cafeList = new ArrayList<CafeExplore>();
		Map map = new HashMap();
		int totalCount =0;
		
		//search 설정 
		//1.정렬기준 설정 
		if(search.getOrderState()==0)//정확도
			search.setOrderStateSort("sim");
		else
			search.setOrderStateSort("date");
		//2.검색엔진설정
		search.setSearchEngine(1);
		//3.검색Theme 설정
		search.setSearchThemeSort("cafearticle");
				
		String jsonResult= this.APISearch(search); // API 실행
			
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("items");
		if(jsonObject.get("total")!=null) {
			totalCount += ((Long)jsonObject.get("total")).intValue();
			
		}
		
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i);
				
				CafeExplore cafeExplore = new CafeExplore();
				cafeExplore.setTitle(item.get("title").toString());
				cafeExplore.setResultLink(item.get("link").toString());
				cafeExplore.setContents(item.get("description").toString());
				cafeExplore.setCafeName(item.get("cafename").toString());
				cafeExplore.setCafeLink(item.get("cafeurl").toString());
				cafeExplore.setEngineFrom("naver");
				
				cafeList.add(cafeExplore);
			}
		}
		
		map.put("cafeList", cafeList);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public Map getPhoenixCafeExploreList(Search search) {
		
		List<CafeExplore> cafeList = new ArrayList<CafeExplore>();
		Map map = new HashMap();
		int totalCount =0;
		
		//설정해줄것 searchCondition , // 얘네는 controller에서 다 세팅되어있음 -키워드, currentPage, pageSize;
		search.setSearchCondition("0"); //글+카페
		
		
		List<Post> postResult = cafePostDao.getPostListBySearch(search);
		
		if(postResult!=null) //검색 결과가 있을때 없으면
		{	
			for(int i=0; i<postResult.size();i++)
			{
				CafeExplore cafeExplore = new CafeExplore(); //나는 영혼이 없다 왜 ? 영혼이 없으니까ㅁ니ㅏㅇ럼;다지
				cafeExplore.setTitle(postResult.get(i).getPostTitle());
				cafeExplore.setResultLink("http://172.20.10.3:8080/cafe/"+postResult.get(i).getCafeURL()+"/getPost/"+postResult.get(i).getPostNo());//설정해주세여
				if(postResult.get(i).getPostContent()!=null && postResult.get(i).getPostContent().length()<50) //자르려는 길이보다 작을때
				{
					cafeExplore.setContents(postResult.get(i).getPostContent().substring(0,postResult.get(i).getPostContent().length()-1));
				}
				else if(postResult.get(i).getPostContent()!=null)//클때
				{
					cafeExplore.setContents(postResult.get(i).getPostContent().substring(0, 49)); //검색어가 포함된지점 x
				}
				else // null 일때.. 하.
				{
					cafeExplore.setContents("");//내용 없음.
				}
				cafeExplore.setCafeName(postResult.get(i).getCafeName()) ;
				//cafeExplore.setThumbnail(postResult.get(i));//음 썸네일없네
				cafeExplore.setDateTime(postResult.get(i).getRegDate());
				cafeExplore.setCafeLink("http://172.20.10.3:8080/cafe/"+postResult.get(i).getCafeURL());
				cafeExplore.setEngineFrom("phoenix");
				
				cafeList.add(cafeExplore);
			}
		}
		
		map.put("cafeList", cafeList);
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	@Override
	public Map getDaumWebExploreList(Search search) throws Exception {
		
		List<WebExplore> webList = new ArrayList<WebExplore>();
		Map map = new HashMap();
		int totalCount =0;
		boolean isEnd = false;
		//search 설정 
		//1.정렬기준 설정 
		if(search.getOrderState()==0)
			search.setOrderStateSort("accuracy");//정확도
		else
			search.setOrderStateSort("recency");
		//2.검색엔진설정
		search.setSearchEngine(0);
		//3.검색Theme 설정
		search.setSearchThemeSort("web");
		
		String jsonResult= this.APISearch(search); // API 통신
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("documents");
		Map meta = (Map) jsonObject.get("meta");
		
		if(meta!=null)
		{
			if(meta.get("total_count")!=null)
			{
				totalCount += ((Long)meta.get("total_count")).intValue();
				System.out.println("다음 토탈카운트 : "+totalCount);
			}
			if(meta.get("is_end")!=null)
			{
				isEnd = (boolean) meta.get("is_end");
			}
		}
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i); 
				
				WebExplore web = new WebExplore();
				web.setTitle(item.get("title").toString());
				web.setContents(item.get("contents").toString());
				web.setResultLink(item.get("url").toString());
				web.setDateTime(this.dateFormatting(item.get("datetime").toString()));
				web.setEngineFrom("daum");
				
				webList.add(web);
			}
		}
		
		map.put("webList", webList);
		map.put("totalCount", totalCount);
		map.put("isEnd", isEnd);
		
		return map;
	}

	@Override
	public Map getNaverWebExploreList(Search search) {
			
		List<WebExplore> webList = new ArrayList<WebExplore>();
		Map map = new HashMap();
		int totalCount =0;
		
		
		//search 설정 
		//1.정렬기준 설정 
		if(search.getOrderState()==0)//정확도
			search.setOrderStateSort("sim");
		else
			search.setOrderStateSort("date");
		//2.검색엔진설정
		search.setSearchEngine(1);
		//3.검색Theme 설정
		search.setSearchThemeSort("webkr");
				
		String jsonResult= this.APISearch(search); // API 실행
			
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("items");
		
		if(jsonObject.get("total")!=null) {
			totalCount += ((Long)jsonObject.get("total")).intValue();
			
		}
		
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i);
				
				WebExplore webExplore = new WebExplore();
				webExplore.setTitle(item.get("title").toString());
				webExplore.setResultLink(item.get("link").toString());
				webExplore.setContents(item.get("description").toString());
				
				webList.add(webExplore);
			}
		}
		
		map.put("webList", webList);
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	@Override
	public Map getDaumImageExploreList(Search search) {
	
		Map returnMap = new HashMap();
		int totalCount =0;
		boolean isEnd =false; 
		//search 설정 
		//1.정렬기준 설정 
		if(search.getOrderState()==0)
			search.setOrderStateSort("accuracy");//정확도
		else
			search.setOrderStateSort("recency");
		//2.검색엔진설정
		search.setSearchEngine(0);
		//3.검색Theme 설정
		search.setSearchThemeSort("image");
		
		String jsonResult= this.APISearch(search); // API 통신
		List<Image> imageList = new ArrayList<Image>();
		
		System.out.println("jsonResult in Daum DAO : "+jsonResult);
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("documents");
		Map meta = (Map) jsonObject.get("meta");
		
		if(meta!=null)
		{
			if(meta.get("total_count")!=null)
			{
				totalCount += ((Long)meta.get("total_count")).intValue();
				System.out.println("다음 토탈카운트 : "+totalCount);
			}
			if(meta.get("is_end")!=null)
			{
				isEnd = (boolean) meta.get("is_end"); 
			}
		}
		
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i); 
				
				Image image = new Image();
				image.setCollection(item.get("collection").toString());
				image.setThumbnail(item.get("thumbnail_url").toString());
				image.setImage(item.get("image_url").toString());
				image.setSizeWidth(item.get("width").toString());
				image.setSizeHeight(item.get("height").toString());
				image.setSiteName(item.get("display_sitename").toString());
				image.setDateTime(item.get("datetime").toString());
				image.setResultLink(item.get("doc_url").toString());
				image.setEngineFrom("daum");
		
				imageList.add(image);
			}
		}
		
		returnMap.put("imageList", imageList);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}

	@Override
	public Map getNaverImageExploreList(Search search) {
		
		List<Image> imageList = new ArrayList<Image>();
		Map returnMap = new HashMap();
		int totalCount =0;
		//search 설정 
		//1.정렬기준 설정 
		if(search.getOrderState()==0)//정확도
			search.setOrderStateSort("sim");
		else
			search.setOrderStateSort("date");
		//2.검색엔진설정
		search.setSearchEngine(1);
		//3.검색Theme 설정
		search.setSearchThemeSort("image");
				
		String jsonResult= this.APISearch(search); // API 실행

		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("items");
		if(jsonObject.get("total")!=null) {
			totalCount += ((Long)jsonObject.get("total")).intValue();	
		}
		
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i);
				
				Image image = new Image();
				image.setTitle(item.get("title").toString());
				image.setResultLink(item.get("link").toString());
				image.setThumbnail(item.get("thumbnail").toString());
				image.setSizeHeight(item.get("sizeheight").toString());
				image.setSizeWidth(item.get("sizewidth").toString());
				image.setEngineFrom("naver");
				
				imageList.add(image);
			}
		}
		
		returnMap.put("imageList", imageList);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}

	
	
	//API통신통신
	public String APISearch(Search search)
	{
		
		String jsonResult="";
	
    	int display = search.getPageSize(); // 검색 결과 출력건수 기본건수 10~1000                             다음 1-50
        int start = search.getCurrentPage(); // 검색 시작 위치, 최대 1000까지 //1~1000            다음 1-50
        String sort = search.getOrderStateSort(); // 정렬옵션 sim 유사도  date 날짜순                          다음 accuracy  recency
        String filter =search.getFilter(); //사이즈필터옵션 all,large,medium,small
        
        
        String apiURL = "";
		
		try {
            
        	String query = URLEncoder.encode(search.getSearchKeyword(), "UTF-8"); //검색을 원하는 문자열
         
            /////////////////////////////////////////////////////////////////////////////////////
           
            if(search.getSearchEngine()==0) { //다음이면 그리고 찾는 정보가 < 이하이면 -> 여기다가말고 api호출할때..
            	apiURL = "https://dapi.kakao.com/v2/search/"+search.getSearchThemeSort()+"?query="+query+"&page="+start+"&size="+display+"&sort="+sort;
            }
            else if(search.getSearchEngine()==1) {//네이버면
            	apiURL = "https://openapi.naver.com/v1/search/"+search.getSearchThemeSort()+"?query="+query+"&display="+display+"&start="+start;
            	
            	if(!search.getSearchThemeSort().equals("webkr")) //웹문서 검색이 아니면
            	{
            		apiURL+="&sort="+sort; //정렬기준적용
            	}
            	if(search.getSearchThemeSort().equals("image")) //이미지검색이라면
            	{
            		apiURL+="&filter="+filter;
            	}
            }
           
            ////////////////////////////////////////////////////////////////////////////////
            
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            
            con.setRequestMethod("GET");
            
            ///////////////////////////////////////////////////////////////////////////////////////
           
            if(search.getSearchEngine()==0) { //다음이면
            	con.setRequestProperty("Authorization", "KakaoAK a370aa8999b7c93934f3390be60c08f9");
            }
            else if(search.getSearchEngine()==1)   {//네이버면
            	con.setRequestProperty("X-Naver-Client-Id", "MNqlPv1vqgMTvmHCrAo0");
                con.setRequestProperty("X-Naver-Client-Secret", "NLDCEUM5oR");
            }
            
            ////////////////////////////////////////////////////////////////////////////////////////
           
            int responseCode = con.getResponseCode();
            BufferedReader br = null;
           
            if(responseCode==200) { // 정상 호출 
                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
            }
            
            String inputLine = "";
            StringBuffer response = new StringBuffer();
            
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
           
            jsonResult = response.toString();
       
        } catch (Exception e) {
            System.out.println(e);
        }
	
		return jsonResult;
		
	}//end Method
	
	public String dateFormatting(String naverDate) throws Exception
	{
		Date date = new SimpleDateFormat("yyyyMMdd").parse(naverDate);
		
		String formattedDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
		
		return formattedDate;
	}

}
