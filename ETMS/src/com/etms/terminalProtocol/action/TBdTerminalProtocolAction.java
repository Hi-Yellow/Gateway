package com.etms.terminalProtocol.action;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.core.action.BaseAction;
import com.etms.terminalProtocol.service.TBdTerminalProtocolService;

@Controller
@RequestMapping("/tBdTerminalProtocol")
public class TBdTerminalProtocolAction extends BaseAction{
	
	@Resource
	private TBdTerminalProtocolService tBdTerminalProtocolService;
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public Object selectAll() {
		return tBdTerminalProtocolService.selectAll();
	}
	
}
