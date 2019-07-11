package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafePostDao;
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.domain.Post;

@Service
public class CafePostServiceImpl implements CafePostService {
	@Autowired
	@Qualifier("cafePostDaoImpl")
	private CafePostDao cafePostDao;

	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDaoImpl cafeManageDaoImpl;

	public CafePostServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public Map<String, Object> getPostListBySearch(Search search) {
		Map<String, Object> map = new HashMap<String, Object>();

//		map.put("boardList", cafeManageDaoImpl.getBoardList(search.getCafeURL()) );
		map.put("postList", cafePostDao.getPostListBySearch(search));
		map.put("postTotalCount", cafePostDao.searchTotalCount(search));

		return map;
	}

	@Override
	public Map<String, Object> getPostListByBoard(Search search) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("postList", cafePostDao.getPostListByBoard(search));
		map.put("postTotalCount", cafePostDao.postTotalCount(search));

		return map;
	}

	@Override
	public boolean addPost(Post post) {
		return cafePostDao.addPost(post);
	}

	@Override
	public Post getPost(int postNo) {
		return cafePostDao.getPost(postNo);
	}

	@Override
	public boolean updatePost(Post post) {
		return cafePostDao.updatePost(post);
	}

	@Override
	public boolean deletePost(int postNo) {
		return cafePostDao.deletePost(postNo);
	}
}
