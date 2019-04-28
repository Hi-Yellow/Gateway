package com.etms.rs232.action;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etms.core.action.BaseAction;
import com.etms.rs232.service.Impl.TBdRS232ServiceImpl;
import com.etms.rs232.pojo.TBdRS232;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;

@Controller
@RequestMapping("/tBdRS232")
public class TBdRS232Action extends BaseAction{
	
	@Resource
	private TBdRS232ServiceImpl tBdRS232Service;
	
	@RequestMapping("/selectByCode")
	@ResponseBody
	public Object selectByCode(String terminalCode){
		return tBdRS232Service.selectByCode(terminalCode);
	}
	
	@RequestMapping("/selectByCodeAndID")
	@ResponseBody
	public Object selectByCodeAndID(String terminalCode,int portID){
		return tBdRS232Service.selectByCodeAndID(terminalCode,portID);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int update(TBdRS232 tBdRS232,HttpSession session){
		int count = 0;
		StringBuffer sb = new StringBuffer();
		sb.append(tBdRS232.getPortName()+";$");
		sb.append(tBdRS232.getBaudRate()+";$");
		sb.append(tBdRS232.getStopBit()+";$");
		sb.append(tBdRS232.getCheckBit()+";$");
		sb.append(tBdRS232.getDataBit());
		TBdTerminalCommand tBdTerminalCommand=new TBdTerminalCommand();
		tBdTerminalCommand.setPortConfigureInfo(sb.toString());//…Ë÷√∂Àø⁄≈‰÷√œÍ«È
		tBdTerminalCommand.setExecuter((String)session.getAttribute("userName"));
		tBdTerminalCommand.setTerminalCode(tBdRS232.getTerminalCode());
		tBdTerminalCommand.setCommandCode("0900");
		tBdTerminalCommand.setCommandText("B"+tBdRS232.getPortID());
		tBdTerminalCommand.setExecuteTime(new Timestamp(System.currentTimeMillis()));
		tBdTerminalCommand.setOperateType(1);
		tBdTerminalCommand.setResultType(254);
		try {
			count = tBdRS232Service.update(tBdRS232,tBdTerminalCommand);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
}
