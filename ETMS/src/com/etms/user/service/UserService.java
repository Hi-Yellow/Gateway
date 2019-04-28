package com.etms.user.service;

import com.etms.core.service.BaseService;
import com.etms.user.pojo.User;

public interface UserService  extends BaseService<User> {
	

	public User login(User user);	

	public int findUserName(String userName);
	
	public String getStatusCode(String userName);

	public int register(String userName, String userPsw, String code);

	public int resetUserPsw(String userName, String userPsw, String code);

	public int updatePswByUserName(User user, String oldUserPsw, String newUserPsw);

}

