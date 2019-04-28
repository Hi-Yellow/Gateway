package com.etms.terminalLoginInfo.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.core.action.BaseAction;
import com.etms.core.page.Page;
import com.etms.terminalLoginInfo.pojo.TBdTerminalLoginInfo;
import com.etms.terminalLoginInfo.service.TBdTerminalLoginInfoService;
@Controller
@RequestMapping("/tBdTerminalLoginInfo")
public class TBdTerminalLoginInfoAction extends BaseAction{

	@Resource
	private TBdTerminalLoginInfoService tBdTerminalLoginInfoService;
	
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<TBdTerminalLoginInfo> page, TBdTerminalLoginInfo tBdTerminalLoginInfo) {
		page.setParamEntity(tBdTerminalLoginInfo);  
		Page<TBdTerminalLoginInfo> pageRes = tBdTerminalLoginInfoService.selectPageUseDyc(page);
		return pageRes.getPageMap();
	}
	
}
