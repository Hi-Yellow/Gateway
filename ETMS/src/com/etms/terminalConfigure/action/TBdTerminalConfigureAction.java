package com.etms.terminalConfigure.action;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.core.action.BaseAction;
import com.etms.core.page.Page;
import com.etms.terminalConfigure.pojo.TBdTerminalConfigure;
import com.etms.terminalConfigure.service.TBdTerminalConfigureService;


@Controller
@RequestMapping("/tBdTerminalConfigure")
public class TBdTerminalConfigureAction extends BaseAction{

	@Resource
	private TBdTerminalConfigureService tBdTerminalConfigureService;
	
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<TBdTerminalConfigure> page, TBdTerminalConfigure tBdterminalConfigure) {
		page.setParamEntity(tBdterminalConfigure);  
		Page<TBdTerminalConfigure> pageRes = tBdTerminalConfigureService.selectPageUseDyc(page);
		return pageRes.getPageMap();
	}
	
	@RequestMapping("/selectIDAndAlias")
	@ResponseBody
	public Object selectIDAndAlias() {
		return tBdTerminalConfigureService.selectIDAndAlias();
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(TBdTerminalConfigure tBdterminalConfigure) {
		int count = 0;
		try {
			count = tBdTerminalConfigureService.insert(tBdterminalConfigure);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int update(TBdTerminalConfigure tBdterminalConfigure) {
		int count = 0;
		try {
			count = tBdTerminalConfigureService.update(tBdterminalConfigure);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@RequestMapping("/deleteList")
	@ResponseBody
	public int deleteList(String[] pks) {
		int count = 0;
		try {
			count = tBdTerminalConfigureService.deleteList(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
}

