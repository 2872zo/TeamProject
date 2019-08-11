package com.phoenix.mvc.service.explore.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Blog;
import com.phoenix.mvc.service.domain.CafeExplore;
import com.phoenix.mvc.service.domain.Image;
import com.phoenix.mvc.service.domain.WebExplore;
import com.phoenix.mvc.service.explore.ExploreDao;
import com.phoenix.mvc.service.explore.ExploreService;

@Service("exploreServiceImpl")
public class ExploreServiceImpl implements ExploreService{
	
	@Autowired
	@Qualifier("exploreDaoImpl")
	private ExploreDao exploreDao;
	
	
	public ExploreServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	

	@Override
	public Map getUnifiedExploreList(Search search) throws Exception {
		// TODO Auto-generated method stub
		Map returnMap = new HashMap();
		
		Map blogMap = this.getBlogExploreList(search);
		Map cafeMap = this.getCafeExploreList(search);
		Map webMap = this.getWebsiteExploreList(search);
		
		returnMap.put("blogList", blogMap.get("blogList"));
		returnMap.put("cafeList", cafeMap.get("cafeList"));
		returnMap.put("webList", webMap.get("webList"));
		
		return returnMap;
	}
	

	@Override
	public Map getBlogExploreList(Search search) throws Exception {
		// TODO Auto-generated method stub
		
		List<Blog> blogList = new ArrayList<Blog>(); //어떻게 담을까?? ->담
		Map naverMap = new HashMap();
		Map daumMap = new HashMap();
		int totalCount = 0; //->담
		Map returnMap = new HashMap();
		
		//append는 할수있는데 . 내가 여기서 정렬을 해줘야하는거 아닌가??????
		//일단 append 한다음에 list의 a에 따라서 정렬을 해줄 수 있는 method를 찾아보기

		if(search.isEngineAll()) //전체엔진
		{
			naverMap = exploreDao.getNaverBlogExploreList(search);
			daumMap = exploreDao.getDaumBlogExploreList(search);
			
			blogList.addAll((List<Blog>)naverMap.get("blogList"));
			blogList.addAll((List<Blog>)daumMap.get("blogList"));
			totalCount += (int)naverMap.get("totalCount");
			totalCount += (int)daumMap.get("totalCount");
		}
		else//엔진부분선택
		{
			if(search.isEngineDaum()) //다음엔진선택됐으면
			{
				daumMap = exploreDao.getDaumBlogExploreList(search);
				
				blogList.addAll((List<Blog>)daumMap.get("blogList"));
				totalCount += (int)daumMap.get("totalCount");
			}

			if(search.isEngineNaver()) //네이버엔진선택됐으면
			{
				naverMap = exploreDao.getNaverBlogExploreList(search);
				
				blogList.addAll((List<Blog>)naverMap.get("blogList"));
				totalCount += (int)naverMap.get("totalCount");
			}
		}
		
		//그다음 몇개의 엔진 들어있는지 판별해서 정렬? 아니면 add하자마자 각각정렬할지.
		//정확도순 :?? 시간순은 정렬가능할 듯
		returnMap.put("totalCount", totalCount);
		returnMap.put("blogList", blogList);
		
		System.out.println("서비스에서"+totalCount);
		
		return returnMap;
	}

	@Override
	public Map getCafeExploreList(Search search) throws Exception{
		
		
		List<CafeExplore> cafeList = new ArrayList<CafeExplore>(); //어떻게 담을까??
		Map naverMap = new HashMap();
		Map daumMap = new HashMap();
		Map phoenixMap = new HashMap();
		int totalCount = 0; //->담
		Map returnMap = new HashMap();
		
		//append는 할수있는데 . 내가 여기서 정렬을 해줘야하는거 아닌가??????
		//일단 append 한다음에 list의 a에 따라서 정렬을 해줄 수 있는 method를 찾아보기
		
		
		if(search.isEngineAll()) //전체엔진
		{
			naverMap = exploreDao.getNaverCafeExploreList(search);
			daumMap = exploreDao.getDaumCafeExploreList(search);
			phoenixMap = exploreDao.getPhoenixCafeExploreList(search);
			
			cafeList.addAll((List<CafeExplore>) naverMap.get("cafeList"));
			cafeList.addAll((List<CafeExplore>)daumMap.get("cafeList"));
			cafeList.addAll((List<CafeExplore>)phoenixMap.get("cafeList"));
			totalCount += (int)naverMap.get("totalCount");
			totalCount += (int)daumMap.get("totalCount");
			totalCount += (int)phoenixMap.get("totalCount");
			
		}
		else//엔진부분선택
		{
			if(search.isEngineDaum()) //다음엔진선택됐으면
			{
				daumMap = exploreDao.getDaumCafeExploreList(search);
				
				cafeList.addAll((List<CafeExplore>)daumMap.get("cafeList"));
				totalCount += (int)daumMap.get("totalCount");
			}

			if(search.isEngineNaver()) //네이버엔진선택됐으면
			{
				naverMap = exploreDao.getNaverCafeExploreList(search);
				
				cafeList.addAll((List<CafeExplore>)naverMap.get("cafeList"));
				totalCount += (int)naverMap.get("totalCount");
			}
			if(search.isEnginePhoenix())
			{
				phoenixMap = exploreDao.getPhoenixCafeExploreList(search);
				
				cafeList.addAll((List<CafeExplore>)phoenixMap.get("cafeList"));
				totalCount += (int)phoenixMap.get("totalCount");
			}
		}
		
		
		returnMap.put("cafeList", cafeList);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}

	@Override
	public Map getWebsiteExploreList(Search search) throws Exception{
		
		List<WebExplore> webList = new ArrayList<WebExplore>(); //어떻게 담을까??
		Map naverMap = new HashMap();
		Map daumMap = new HashMap();
		int totalCount = 0; //->담
		Map returnMap = new HashMap();
		
		//append는 할수있는데 . 내가 여기서 정렬을 해줘야하는거 아닌가??????
		//일단 append 한다음에 list의 a에 따라서 정렬을 해줄 수 있는 method를 찾아보기
		
		
		if(search.isEngineAll()) //전체엔진
		{
			naverMap = exploreDao.getNaverWebExploreList(search);
			webList.addAll((List<WebExplore>) naverMap.get("webList"));
			totalCount+= (int) naverMap.get("totalCount");
			
			
			if(search.getCurrentPage()<=50) {
				
				daumMap = exploreDao.getDaumWebExploreList(search);
				webList.addAll((List<WebExplore>) daumMap.get("webList"));
				totalCount+=(int)daumMap.get("totalCount");
			}
			
		}
		else//엔진부분선택
		{
			if(search.isEngineDaum()&& search.getCurrentPage()<=50) //다음엔진선택됐으면
			{
				daumMap = exploreDao.getDaumWebExploreList(search);
				webList.addAll((List<WebExplore>) daumMap.get("webList"));
				totalCount+=(int)daumMap.get("totalCount");
			}

			if(search.isEngineNaver()) //네이버엔진선택됐으면
			{
				naverMap = exploreDao.getNaverWebExploreList(search);
				webList.addAll((List<WebExplore>) naverMap.get("webList"));
				totalCount+= (int) naverMap.get("totalCount");
			}
		}
		
		returnMap.put("webList", webList);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}
	

	@Override
	public Map getImageExploreList(Search search) throws Exception{
		
		List<Image> imageList = new ArrayList<Image>(); //어떻게 담을까??
		Map naverMap = new HashMap();
		Map daumMap = new HashMap();
		int totalCount = 0; //->담
		Map returnMap = new HashMap();
		
		//append는 할수있는데 . 내가 여기서 정렬을 해줘야하는거 아닌가??????
		//일단 append 한다음에 list의 a에 따라서 정렬을 해줄 수 있는 method를 찾아보기

		if(search.isEngineAll()) //전체엔진
		{
			if(search.getCurrentPage()<=50) {
				daumMap = exploreDao.getDaumImageExploreList(search);
				imageList.addAll((List<Image>)daumMap.get("imageList"));
				totalCount += (int)daumMap.get("totalCount");
			}
			naverMap = exploreDao.getNaverImageExploreList(search);
			imageList.addAll((List<Image>)naverMap.get("imageList"));
			totalCount += (int)naverMap.get("totalCount");
			
		}
		else//엔진부분선택
		{
			if(search.isEngineDaum() && search.getCurrentPage()<=50) //다음엔진선택됐으면
			{
				daumMap = exploreDao.getDaumImageExploreList(search);
				imageList.addAll((List<Image>)daumMap.get("imageList"));
				totalCount += (int)daumMap.get("totalCount");
			}

			if(search.isEngineNaver()) //네이버엔진선택됐으면
			{
				naverMap = exploreDao.getNaverImageExploreList(search);
				imageList.addAll((List<Image>)naverMap.get("imageList"));
				totalCount += (int)naverMap.get("totalCount");
			}
		}
		
		returnMap.put("imageList", imageList);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}


	
}
