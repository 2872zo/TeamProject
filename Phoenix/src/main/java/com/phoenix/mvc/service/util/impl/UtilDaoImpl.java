package com.phoenix.mvc.service.util.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.service.util.UtilDao;

@Repository
public class UtilDaoImpl implements UtilDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public UtilDaoImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}

	@Override
	public boolean validationCheck(Map<String, String> map) {
		return ((int)sqlSession.selectOne("UtilMapper.validationCheck", map) == 0 ? true : false);
	}

}
