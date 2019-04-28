package com.etms.rs485.action;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etms.core.action.BaseAction;
import com.etms.rs485.pojo.TBdRS485;
import com.etms.rs485.service.Impl.TBdRS485ServiceImpl;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;

@Controller
@RequestMapping("/tBdRS485")
public class TBdRS485Action extends BaseAction{

	@Resource
	private TBdRS485ServiceImpl tBdRS485Service;
	
	
	@RequestMapping("/selectByCode")
	@ResponseBody
	public Object selectByCode(String terminalCode){
		return tBdRS485Service.selectByCode(terminalCode);
	}
	
	@RequestMapping("/selectByCodeAndID")
	@ResponseBody
	public Object selectByCodeAndID(String terminalCode,int portID){
		return tBdRS485Service.selectByCodeAndID(terminalCode,portID);
	}
	@RequestMapping("/update")
	@ResponseBody
	public int update(TBdRS485 tBdRS485,HttpSession session){
		int count = 0;
		StringBuffer sb = new StringBuffer();
		sb.append(tBdRS485.getPortName()+";$");
		sb.append(tBdRS485.getBaudRate()+";$");
		sb.append(tBdRS485.getStopBit()+";$");
		sb.append(tBdRS485.getCheckBit()+";$");
		sb.append(tBdRS485.getDataBit());
		TBdTerminalCommand tBdTerminalCommand=new TBdTerminalCommand();
		tBdTerminalCommand.setPortConfigureInfo(sb.toString());
		tBdTerminalCommand.setExecuter((String)session.getAttribute("userName"));
		tBdTerminalCommand.setTerminalCode(tBdRS485.getTerminalCode());
		tBdTerminalCommand.setCommandCode("0900");
		tBdTerminalCommand.setCommandText("A"+tBdRS485.getPortID());
		tBdTerminalCommand.setExecuteTime(new Timestamp(System.currentTimeMillis()));
		tBdTerminalCommand.setOperateType(1);
		tBdTerminalCommand.setResultType(254);
		try {
			count = tBdRS485Service.update(tBdRS485,tBdTerminalCommand);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
}
