package com.phoenix.mvc.service.cafe.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafePostDao;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.Reply;

@Repository
public class CafePostDaoImpl implements CafePostDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public CafePostDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public List<Post> getPostListBySearch(Search search) {
		return sqlSession.selectList("CafePostMapper.getPostListBySearch", search);
	}
	
	@Override
	public List<Post> getPostListByBoard(Search search) {
		return sqlSession.selectList("CafePostMapper.getPostListByBoard",search);
	}

	@Override
	public int postTotalCount(Search search) {
		return sqlSession.selectOne("CafePostMapper.postTotalCount", search);
	}

	@Override
	public int searchTotalCount(Search search) {
		return sqlSession.selectOne("CafePostMapper.searchTotalCount", search);
	}

	@Override
	public List<Post> getPostListByNotice(Search search) {
		return sqlSession.selectList("CafePostMapper.getPostListByNotice", search);
	}

	@Override
	public boolean addPost(Post post) {
		return (sqlSession.insert("CafePostMapper.addPost", post) == 1 ? true : false);
	}

	@Override
	public Post getPost(int postNo) {
		return sqlSession.selectOne("CafePostMapper.getPost", postNo);
	}

	@Override
	public boolean updatePost(Post post) {
		return (sqlSession.insert("CafePostMapper.updatePost", post) == 1? true : false);
	}

	@Override
	public boolean deletePost(int postNo) {
		return (sqlSession.insert("CafePostMapper.deletePost", postNo) == 1? true : false);
	}
	
	@Override
	public boolean deletePostList(String postNoList) {
		return (sqlSession.insert("CafePostMapper.deletePostList", postNoList) != 0? true : false);
	}

	@Override
	public boolean addReply(Reply reply) {
		return (sqlSession.insert("CafePostMapper.addReply", reply) == 1? true : false);
	}
	
	@Override
	public boolean addReReply(Reply reply) {
		return (sqlSession.insert("CafePostMapper.addReReply", reply) == 1? true: false);
	}
	
	@Override
	public List<Reply> getReplyList(Search search) {
		return sqlSession.selectList("CafePostMapper.getReplyList", search);
	}

	@Override
	public int replyTotalCount(Search search) {
		return sqlSession.selectOne("CafePostMapper.replyTotalCount", search);
	}
	
	@Override
	public boolean updateReply(Reply reply) {
		return (sqlSession.insert("CafePostMapper.updateReply", reply) == 1? true : false);
	}

	@Override
	public boolean deleteReply(int replyNo) {
		return (sqlSession.insert("CafePostMapper.deleteReply", replyNo) == 1? true : false);
	}

	@Override
	public Reply getReply(int replyNo) {
		return sqlSession.selectOne("CafePostMapper.getReply", replyNo);
	}

	@Override
	public List<Post> getMyPostList(int userNo) {
		return sqlSession.selectList("CafePostMapper.getMyPostList", userNo);
	}

	@Override
	public boolean movePost(Map map) {
		return (sqlSession.update("CafePostMapper.movePost", map) != 0 ? true: false);
	}

	@Override
	public boolean addLike(Search search) {
		return (sqlSession.update("CafePostMapper.addLike", search) == 1 ? true: false);
	}

	@Override
	public int eventValidationCheck(Search search) {
		return sqlSession.selectOne("CafePostMapper.eventValidationCheck", search);
	}

	@Override
	public List<Post> getNoticePostList(Search search) {
		return sqlSession.selectList("CafePostMapper.getNoticePostList", search);
	}

	@Override
	public boolean updateNoticeOrder(List<Post> postList) {
		return (sqlSession.update("CafePostMapper.updateNoticePost", postList) != 0 ? true : false);
	}

	@Override
	public List<Post> getAllNoticePost(Search search) {
		return sqlSession.selectList("CafePostMapper.getAllNoticePost", search);
	}

	@Override
	public List<Post> getPostListByMember(Search search) {
		return sqlSession.selectList("CafePostMapper.getPostListByMember", search);
	}

	@Override
	public int memberPostTotalCount(Search search) {
		return sqlSession.selectOne("CafePostMapper.memberPostTotalCount", search);
	}

	@Override
	public List<Post> getBestPostList(int boardNo) {
		return sqlSession.selectList("CafePostMapper.getBestPostList", boardNo);
	}

	@Override
	public Board getBoard(int boardNo) {
		return sqlSession.selectOne("BoardMapper.getBoard", boardNo);
	}

	@Override
	public Board getBoardByPostNo(int postNo) {
		return sqlSession.selectOne("BoardMapper.getBoardByPostNo", postNo);
	}
}
