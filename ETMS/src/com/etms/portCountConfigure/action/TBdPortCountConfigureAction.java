package com.etms.portCountConfigure.action;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.core.action.BaseAction;
import com.etms.core.page.Page;
import com.etms.portCountConfigure.pojo.TBdPortCountConfigure;
import com.etms.portCountConfigure.service.TBdPortCountConfigureService;

@Controller
@RequestMapping("/tBdPortCountConfigure")
public class TBdPortCountConfigureAction extends BaseAction{

	@Resource
	private TBdPortCountConfigureService tBdPortCountConfigureService;
	
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<TBdPortCountConfigure> page, TBdPortCountConfigure tBdPortCountConfigure) {
		page.setParamEntity(tBdPortCountConfigure);  
		Page<TBdPortCountConfigure> pageRes = tBdPortCountConfigureService.selectPageUseDyc(page);
		return pageRes.getPageMap();
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(TBdPortCountConfigure tBdPortCountConfigure) {
		int count = 0;
		try{
			count = tBdPortCountConfigureService.insert(tBdPortCountConfigure);
		} catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int update(TBdPortCountConfigure tBdPortCountConfigure) {
		int count = 0;
		try {
			count = tBdPortCountConfigureService.update(tBdPortCountConfigure);
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
			count = tBdPortCountConfigureService.deleteList(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	

	
	/*@RequestMapping("/getIpAddress")
	@ResponseBody
	public int getIpAddress(TBdPortCountConfigure tBdPortCountConfigure,HttpServletRequest request){
		String ip = IpAddressUtil.getIpAddr(request);
		tBdPortCountConfigure.setIpAddress(ip);
		try {
			return tBdPortCountConfigureService.insert(tBdPortCountConfigure);
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}*/
}
