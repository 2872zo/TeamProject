package com.phoenix.mvc.service.explore.impl;

import java.util.ArrayList;
import java.util.List;

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
	public List getUnifiedExploreList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}
	

	@Override
	public List<Blog> getBlogExploreList(Search search) {
		// TODO Auto-generated method stub
		
		List<Blog> blogList = new ArrayList<Blog>(); //어떻게 담을까??
		
		//append는 할수있는데 . 내가 여기서 정렬을 해줘야하는거 아닌가??????
		//일단 append 한다음에 list의 a에 따라서 정렬을 해줄 수 있는 method를 찾아보기
		
		
		if(search.isEngineAll()) //전체엔진
		{
			blogList.addAll(exploreDao.getNaverBlogExploreList(search));
			blogList.addAll(exploreDao.getDaumBlogExploreList(search));
		}
		else//엔진부분선택
		{
			if(search.isEngineDaum()) //다음엔진선택됐으면
			{
				blogList.addAll(exploreDao.getDaumBlogExploreList(search));
			}

			if(search.isEngineNaver()) //네이버엔진선택됐으면
			{
				blogList.addAll(exploreDao.getNaverBlogExploreList(search));
			}
		}
		
		//그다음 몇개의 엔진 들어있는지 판별해서 정렬? 아니면 add하자마자 각각정렬할지.
		//정확도순 :?? 시간순은 정렬가능할 듯
		
		return blogList;
	}

	@Override
	public List<CafeExplore> getCafeExploreList(Search search) {
		
		
		List<CafeExplore> cafeList = new ArrayList<CafeExplore>(); //어떻게 담을까??
		
		//append는 할수있는데 . 내가 여기서 정렬을 해줘야하는거 아닌가??????
		//일단 append 한다음에 list의 a에 따라서 정렬을 해줄 수 있는 method를 찾아보기
		
		
		if(search.isEngineAll()) //전체엔진
		{
			cafeList.addAll(exploreDao.getNaverCafeExploreList(search));
			cafeList.addAll(exploreDao.getDaumCafeExploreList(search));
			cafeList.addAll(exploreDao.getPhoenixCafeExploreList(search));
		}
		else//엔진부분선택
		{
			if(search.isEngineDaum()) //다음엔진선택됐으면
			{
				cafeList.addAll(exploreDao.getDaumCafeExploreList(search));
			}

			if(search.isEngineNaver()) //네이버엔진선택됐으면
			{
				cafeList.addAll(exploreDao.getNaverCafeExploreList(search));
			}
			if(search.isEnginePhoenix())
			{
				cafeList.addAll(exploreDao.getPhoenixCafeExploreList(search));
			}
		}
		
		
		return cafeList;
	}

	@Override
	public List<WebExplore> getWebsiteExploreList(Search search) {
		
		List<WebExplore> webList = new ArrayList<WebExplore>(); //어떻게 담을까??
		
		//append는 할수있는데 . 내가 여기서 정렬을 해줘야하는거 아닌가??????
		//일단 append 한다음에 list의 a에 따라서 정렬을 해줄 수 있는 method를 찾아보기
		
		
		if(search.isEngineAll()) //전체엔진
		{
			webList.addAll(exploreDao.getNaverWebExploreList(search));
			webList.addAll(exploreDao.getDaumWebExploreList(search));
		}
		else//엔진부분선택
		{
			if(search.isEngineDaum()) //다음엔진선택됐으면
			{
				webList.addAll(exploreDao.getDaumWebExploreList(search));
			}

			if(search.isEngineNaver()) //네이버엔진선택됐으면
			{
				webList.addAll(exploreDao.getNaverWebExploreList(search));
			}
		}
		
		
		return webList;
	}
	

	@Override
	public List<Image> getImageExploreList(Search search) {
		
		List<Image> imageList = new ArrayList<Image>(); //어떻게 담을까??
		
		//append는 할수있는데 . 내가 여기서 정렬을 해줘야하는거 아닌가??????
		//일단 append 한다음에 list의 a에 따라서 정렬을 해줄 수 있는 method를 찾아보기

		if(search.isEngineAll()) //전체엔진
		{
			imageList.addAll(exploreDao.getDaumImageExploreList(search));
			imageList.addAll(exploreDao.getNaverImageExploreList(search) );
		}
		else//엔진부분선택
		{
			if(search.isEngineDaum()) //다음엔진선택됐으면
			{
				imageList.addAll(exploreDao.getDaumImageExploreList(search));
			}

			if(search.isEngineNaver()) //네이버엔진선택됐으면
			{
				imageList.addAll(exploreDao.getNaverImageExploreList(search));
			}
		}
		
		
		return imageList;
	}


	@Override
	public List getInfiniteImageList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
