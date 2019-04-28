package com.etms.terminalType.action;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.core.action.BaseAction;
import com.etms.terminalType.service.TBdTerminalTypeService;

@Controller
@RequestMapping("/tBdTerminalType")
public class TBdTerminalTypeAction extends BaseAction{
	
	@Resource
	private TBdTerminalTypeService tBdTerminalTypeService;
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public Object selectAll() {
		return tBdTerminalTypeService.selectAll();
	}
	
	
}
