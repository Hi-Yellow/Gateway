package com.etms.loginInfo.service.Impl;

import java.sql.Timestamp;
import org.springframework.stereotype.Service;
import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.loginInfo.pojo.LoginInfo;
import com.etms.loginInfo.service.LoginInfoService;
import com.etms.user.pojo.User;

@Service("loginInfoService")
public class LoginInfoServiceImpl extends BaseServiceImpl<LoginInfo> implements LoginInfoService {

	@Override
	public int loginInfo(User user_result) {
		
		LoginInfo loginInfo = new LoginInfo();
		
		loginInfo.setUserName(user_result.getUserName());
		loginInfo.setRealName(user_result.getRealName());
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		loginInfo.setLoginTime(timestamp);
		return loginInfoMapper.insert(loginInfo);
	}

	@Override
	public int logout(User user_result) {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.setUserName(user_result.getUserName());
		loginInfo.setRealName(user_result.getRealName());
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		loginInfo.setLogoutTime(timestamp);
		return loginInfoMapper.update(loginInfo);
	}

	
}
