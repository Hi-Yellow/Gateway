package com.etms.can.action;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etms.can.pojo.TBdCAN;
import com.etms.can.service.Impl.TBdCANServiceImpl;
import com.etms.core.action.BaseAction;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;

@Controller
@RequestMapping("/tBdCAN")
public class TBdCANAction extends BaseAction{

	@Resource
	private TBdCANServiceImpl tBdCANService;
	
	@RequestMapping("/selectByCode")
	@ResponseBody
	public Object selectByCode(String terminalCode){
		return tBdCANService.selectByCode(terminalCode);
	}
	
	@RequestMapping("/selectByCodeAndID")
	@ResponseBody
	public Object selectByCodeAndID(String terminalCode,int portID){
		return tBdCANService.selectByCodeAndID(terminalCode,portID);
	}
	@RequestMapping("/update")
	@ResponseBody
	public int update(TBdCAN tBdCAN,HttpSession session){
		int count = 0;
		StringBuffer sb = new StringBuffer();
		sb.append(tBdCAN.getPortName()+";$");
		sb.append(tBdCAN.getBaudRate());
		TBdTerminalCommand tBdTerminalCommand=new TBdTerminalCommand();
		tBdTerminalCommand.setPortConfigureInfo(sb.toString());
		tBdTerminalCommand.setExecuter((String)session.getAttribute("userName"));
		tBdTerminalCommand.setTerminalCode(tBdCAN.getTerminalCode());
		tBdTerminalCommand.setCommandCode("0900");
		tBdTerminalCommand.setCommandText("D"+tBdCAN.getPortID());
		tBdTerminalCommand.setExecuteTime(new Timestamp(System.currentTimeMillis()));
		tBdTerminalCommand.setOperateType(1);
		tBdTerminalCommand.setResultType(254);
		try {
			count = tBdCANService.update(tBdCAN,tBdTerminalCommand);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
}
