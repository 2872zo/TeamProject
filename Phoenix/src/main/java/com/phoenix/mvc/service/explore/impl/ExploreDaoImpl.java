package com.phoenix.mvc.service.explore.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
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
	public List<Blog> getDaumBlogExploreList(Search search) {
		
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
		List<Blog> blogList = new ArrayList<Blog>();
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("documents");
		
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i); 
				
				Blog blog = new Blog();
				//blog 값set하고
				blog.setBlogName(item.get("blogname").toString());
				blog.setDateTime(item.get("datetime").toString());
				blog.setThumbnail(item.get("thumbnail").toString());
				blog.setContents(item.get("contents").toString());
				blog.setTitle(item.get("title").toString());
				blog.setResultLink(item.get("url").toString());
				
				blogList.add(blog);
			}
		
		}
		return blogList;// meta data는 어떻게 할건지?? 총 검색결과 등등.. Search에 넣을건가??
	}

	@Override
	public List<Blog> getNaverBlogExploreList(Search search) {
		
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
		
		List<Blog> blogList = new ArrayList<Blog>();
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("items");
		
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i); 
				
				Blog blog = new Blog();
				//blog 값set하고
				blog.setBlogName(item.get("bloggername").toString());//0
				blog.setDateTime(item.get("postdate").toString());//0
				blog.setContents(item.get("description").toString());//0
				blog.setTitle(item.get("title").toString());//0
				blog.setResultLink(item.get("link").toString());//0
				blog.setBlogLink(item.get("bloggerlink").toString());//0
				
				blogList.add(blog);
			}
		}
		
		
		//System.out.println(blogList.size());
		//if(blogList==null)
			//System.out.println("널임");
		return blogList;// meta data는 어떻게 할건지?? 총 검색결과 등등.. Search에 넣을건가??
	}
	
	
	@Override
	public List<CafeExplore> getDaumCafeExploreList(Search search) {
		
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
		List<CafeExplore> cafeList = new ArrayList<CafeExplore>();
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("documents");
		
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i); 
				
				CafeExplore cafe = new CafeExplore();
				cafe.setTitle(item.get("title").toString());
				cafe.setContents(item.get("contents").toString());
				cafe.setResultLink(item.get("url").toString());
				cafe.setThumbnail(item.get("thumbnail").toString());
				cafe.setCafeName(item.get("cafename").toString());
				cafe.setDateTime(item.get("datetime").toString());
				
				cafeList.add(cafe);
			}
		}
		
		
		return cafeList;
	}

	@Override
	public List<CafeExplore> getNaverCafeExploreList(Search search) {
		
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
		
		List<CafeExplore> cafeList = new ArrayList<CafeExplore>();
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("items");
		
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
				
				cafeList.add(cafeExplore);
			}
		}
		
		return cafeList;
	}

	@Override
	public List<CafeExplore> getPhoenixCafeExploreList(Search search) {
		
		List<CafeExplore> cafeList = new ArrayList<CafeExplore>();
		
		//설정해줄것 searchCondition , // 얘네는 controller에서 다 세팅되어있음 -키워드, currentPage, pageSize;
		search.setSearchCondition("0"); //글+카페
		
		
		List<Post> postResult = cafePostDao.getPostListBySearch(search);
		
		if(postResult!=null) //검색 결과가 없을때
		{	
			for(int i=0; i<postResult.size();i++)
			{
				CafeExplore cafeExplore = new CafeExplore(); //나는 영혼이 없다 왜 ? 영혼이 없으니까ㅁ니ㅏㅇ럼;다지
				cafeExplore.setTitle(postResult.get(i).getPostTitle());
				cafeExplore.setResultLink("http://localhost:8080/cafe/"+postResult.get(i).getCafeURL()+"/getPost/"+postResult.get(i).getPostNo());//설정해주세여
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
				cafeExplore.setCafeLink("http://localhost:8080/cafe/"+postResult.get(i).getCafeURL());
				
				cafeList.add(cafeExplore);
			}
		}
		return cafeList;
	}
	
	@Override
	public List<WebExplore> getDaumWebExploreList(Search search) {
		
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
		List<WebExplore> webList = new ArrayList<WebExplore>();
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("documents");
		
		if(items!=null) //검색 결과가 없을때
		{
			for(int i=0; i<items.size(); i++)
			{
				Map item = (Map)items.get(i); 
				
				WebExplore web = new WebExplore();
				web.setTitle(item.get("title").toString());
				web.setContents(item.get("contents").toString());
				web.setResultLink(item.get("url").toString());
				web.setDateTime(item.get("datetime").toString());
				
				webList.add(web);
			}
		}
		
		
		return webList;
	}

	@Override
	public List<WebExplore> getNaverWebExploreList(Search search) {
			
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
		
		List<WebExplore> webList = new ArrayList<WebExplore>();
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("items");
		
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
		
		return webList;
	}
	
	@Override
	public List<Image> getDaumImageExploreList(Search search) {
	
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
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("documents");
		
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
		
				imageList.add(image);
			}
		}
		
		
		return imageList;
	}

	@Override
	public List<Image> getNaverImageExploreList(Search search) {
		
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
		
		List<Image> imageList = new ArrayList<Image>();
		
		JSONObject jsonObject = (JSONObject) JSONValue.parse(jsonResult.toString());
		List items = (List) jsonObject.get("items");
		
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
				
				imageList.add(image);
			}
		}
		
		return imageList;
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

}
