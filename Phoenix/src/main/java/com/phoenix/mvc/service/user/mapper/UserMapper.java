package com.phoenix.mvc.service.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.phoenix.mvc.service.domain.User;


@Mapper
public interface UserMapper {
	public List<User> getUserList();
	
	public User getUser(String userId);
}
