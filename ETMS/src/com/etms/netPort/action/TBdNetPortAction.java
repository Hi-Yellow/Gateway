package com.etms.netPort.action;

import com.etms.core.action.BaseAction;
import java.sql.Timestamp;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.netPort.pojo.TBdNetPort;
import com.etms.netPort.service.Impl.TBdNetPortServiceImpl;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;

@Controller
@RequestMapping("/tBdNetPort")
public class TBdNetPortAction extends BaseAction{

	@Resource
	private TBdNetPortServiceImpl tBdNetPortService;
	
	@RequestMapping("/selectByCode")
	@ResponseBody
	public Object selectByCode(String terminalCode){
		return tBdNetPortService.selectByCode(terminalCode);
	}
	
	@RequestMapping("/selectByCodeAndID")
	@ResponseBody
	public Object selectByCodeAndID(String terminalCode,int portID){
		return tBdNetPortService.selectByCodeAndID(terminalCode,portID);
	}
	@RequestMapping("/update")
	@ResponseBody
	public int update(TBdNetPort tBdNetPort,HttpSession session){
		int count = 0;
		StringBuffer sb = new StringBuffer();
		sb.append(tBdNetPort.getPortName()+";$");
		sb.append(tBdNetPort.getIpAddress()+";$");
		sb.append(tBdNetPort.getGateway()+";$");
		sb.append(tBdNetPort.getNetmask());
		TBdTerminalCommand tBdTerminalCommand=new TBdTerminalCommand();
		tBdTerminalCommand.setPortConfigureInfo(sb.toString());//…Ë÷√∂Àø⁄≈‰÷√œÍ«È
		tBdTerminalCommand.setExecuter((String)session.getAttribute("userName"));
		tBdTerminalCommand.setTerminalCode(tBdNetPort.getTerminalCode());
		tBdTerminalCommand.setCommandCode("0900");
		tBdTerminalCommand.setCommandText("C"+tBdNetPort.getPortID());
		tBdTerminalCommand.setExecuteTime(new Timestamp(System.currentTimeMillis()));
		tBdTerminalCommand.setOperateType(1);
		tBdTerminalCommand.setResultType(254);
		try {
			count = tBdNetPortService.update(tBdNetPort,tBdTerminalCommand);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
}

