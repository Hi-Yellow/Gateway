package com.etms.loginInfo.service;

import com.etms.core.service.BaseService;
import com.etms.loginInfo.pojo.LoginInfo;
import com.etms.user.pojo.User;

public interface LoginInfoService extends BaseService<LoginInfo>{
	
	int loginInfo(User user_result);
	
	int logout(User user_result);
}
