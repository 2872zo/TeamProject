package com.phoenix.mvc.service.explore.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Blog;
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
	public List getCafeExploreList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getUnifiedExploreList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getImageExploreList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getWebsiteExploreList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getInfiniteImageList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
