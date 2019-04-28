package com.etms.terminal.action;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.core.action.BaseAction;
import com.etms.core.page.Page;
import com.etms.terminal.pojo.TBdTerminal;
import com.etms.terminal.service.TBdTerminalService;

@Controller
@RequestMapping("/tBdTerminal")
public class TBdTerminalAction extends BaseAction{

	@Resource
	private TBdTerminalService tBdTerminalService;
	
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<TBdTerminal> page, TBdTerminal tBdTerminal) {
		page.setParamEntity(tBdTerminal);  
		Page<TBdTerminal> pageRes = tBdTerminalService.selectPageUseDyc(page);
		return pageRes.getPageMap();
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(TBdTerminal TBdTerminal) {
		int count = 0;
		try {
			count = tBdTerminalService.insert(TBdTerminal);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public Object selectAll() {
		return tBdTerminalService.selectAll();
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int update(TBdTerminal TBdTerminal) {
		int count = 0;
		try {
			count = tBdTerminalService.update(TBdTerminal);
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
			count = tBdTerminalService.deleteList(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
}
