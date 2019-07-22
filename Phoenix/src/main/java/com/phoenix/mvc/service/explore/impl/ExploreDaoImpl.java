package com.phoenix.mvc.service.explore.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.ws.Response;

import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Blog;
import com.phoenix.mvc.service.explore.ExploreDao;

@Repository("exploreDaoImpl")
public class ExploreDaoImpl implements ExploreDao{
	
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
		
		String jsonResult= this.APISearch(search); // API 통신
		List<Blog> blogList = new ArrayList<Blog>();
		
		for(int i=0; i<search.getPageSize(); i++)
		{
			Blog blog = new Blog();
			//blog 값set하고
			blogList.add(blog);
		}
		
		//jsonResult가지고 도메인으로 셋팅
		
		return null;//List<Blog> return
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
		String jsonResult= this.APISearch(search); // 넘겨주고 
		
		
		return null;
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
