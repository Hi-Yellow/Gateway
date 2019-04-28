package com.etms.user.mapper;

import com.etms.core.mapper.BaseMapper;
import com.etms.user.pojo.User;

public interface UserMapper extends BaseMapper<User>{
	
	User login(User user);
	
	int findUserName(String userName);

	String selectUserPswByUserName(String userName);
	
	int updateUserPswByUserName(String userName, String userPsw);
	
}