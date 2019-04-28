package com.etms.terminalCommand.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.core.action.BaseAction;
import com.etms.core.page.Page;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;
import com.etms.terminalCommand.service.Impl.TBdTerminalCommandServiceImpl;



@Controller
@RequestMapping("/tBdTerminalCommand")
public class TBdTerminalCommandAction extends BaseAction{
	
	@Resource
	private TBdTerminalCommandServiceImpl tBdTerminalCommandService;
	
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<TBdTerminalCommand> page, TBdTerminalCommand tBdTerminalCommand) {
		page.setParamEntity(tBdTerminalCommand);  
		Page<TBdTerminalCommand> pageRes = tBdTerminalCommandService.selectPageUseDyc(page);
		return pageRes.getPageMap();
	}
	
	@RequestMapping("/selectExecutePageUseDyc")
	@ResponseBody
	public Object selectExecutePageUseDyc(Page<TBdTerminalCommand> page, TBdTerminalCommand tBdTerminalCommand) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd%");
		page.setTemp(df.format(new Date()));
		page.setParamEntity(tBdTerminalCommand);  
		Page<TBdTerminalCommand> pageRes = tBdTerminalCommandService.selectPageUseDyc(page);
		return pageRes.getPageMap();
	}
	
	
	@RequestMapping("/execute")
	@ResponseBody
	public int execute(TBdTerminalCommand tBdTerminalCommand,HttpSession session) {
		tBdTerminalCommand.setExecuter(session.getAttribute("userName").toString());
		try {
			return tBdTerminalCommandService.insert(tBdTerminalCommand);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
}
