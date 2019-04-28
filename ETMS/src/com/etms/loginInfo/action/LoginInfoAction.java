package com.etms.loginInfo.action;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.core.action.BaseAction;
import com.etms.core.page.Page;
import com.etms.loginInfo.pojo.LoginInfo;
import com.etms.loginInfo.service.LoginInfoService;


@Controller
@RequestMapping("/loginInfo")
public class LoginInfoAction extends BaseAction{
	
	@Resource
	private LoginInfoService loginInfoService;
	
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<LoginInfo> page, LoginInfo loginInfo,String time) {
		page.setParamEntity(loginInfo);   //参数查询
		page.setTemp(time);  //其它查询条件
		Page<LoginInfo> pageRes = loginInfoService.selectPageUseDyc(page);
		return pageRes.getPageMap();
	}
	
	
}
