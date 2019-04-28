package com.etms.tlv.action;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.core.action.BaseAction;
import com.etms.core.page.Page;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;
import com.etms.tlv.pojo.TBdTLV;
import com.etms.tlv.service.TBdTLVService;



@Controller
@RequestMapping("/tBdTLV")
public class TBdTLVAction extends BaseAction{

	@Resource
	private TBdTLVService tBdTLVService;
	
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<TBdTLV> page, TBdTLV tBdTLV) {
		page.setParamEntity(tBdTLV);  
		Page<TBdTLV> pageRes = tBdTLVService.selectPageUseDyc(page);
		return pageRes.getPageMap();
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(TBdTLV tBdTLV) {
		int count = 0;
		try{
			count = tBdTLVService.insert(tBdTLV);
		} catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int update(TBdTLV tBdTLV,HttpSession session) {
		int count = 0;
		StringBuffer sb = new StringBuffer();
		sb.append(tBdTLV.getUpgradeID()+";$");
		sb.append(tBdTLV.getUpgradeVersion()+";$");
		sb.append(tBdTLV.getUri()+";$");
		sb.append(tBdTLV.getDownloadUsername()+";$");
		sb.append(tBdTLV.getDownloadPassword());
		TBdTerminalCommand tBdTerminalCommand=new TBdTerminalCommand();
		tBdTerminalCommand.setExecuter((String)session.getAttribute("userName"));
		tBdTerminalCommand.setTerminalCode(tBdTLV.getTerminalCode());
		tBdTerminalCommand.setCommandCode("0B0B");
		tBdTerminalCommand.setPortConfigureInfo(sb.toString());
		tBdTerminalCommand.setExecuteTime(new Timestamp(System.currentTimeMillis()));
		tBdTerminalCommand.setOperateType(1);
		tBdTerminalCommand.setResultType(254);
		try {
			count = tBdTLVService.update(tBdTLV,tBdTerminalCommand);
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
			count = tBdTLVService.deleteList(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}