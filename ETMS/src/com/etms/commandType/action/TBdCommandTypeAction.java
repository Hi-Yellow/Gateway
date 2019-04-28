package com.etms.commandType.action;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etms.commandType.pojo.TBdCommandType;
import com.etms.commandType.service.TBdCommandTypeService;
import com.etms.core.action.BaseAction;
import com.etms.core.page.Page;


@Controller
@RequestMapping("/tBdCommandType")
public class TBdCommandTypeAction extends BaseAction{

	@Resource
	private TBdCommandTypeService tBdCommandTypeService;
		
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<TBdCommandType> page, TBdCommandType tBdCommandType) {
		page.setParamEntity(tBdCommandType);  
		Page<TBdCommandType> pageRes = tBdCommandTypeService.selectPageUseDyc(page);
		return pageRes.getPageMap();
	}
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public Object selectAll() {
		return tBdCommandTypeService.selectAll();
	}
		
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(TBdCommandType tBdterminalType) {
		int count = 0;
		try {
			count = tBdCommandTypeService.insert(tBdterminalType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
		
	@RequestMapping("/update")
	@ResponseBody
	public int update(TBdCommandType tBdterminalType) {
		int count = 0;
		try {
			count = tBdCommandTypeService.update(tBdterminalType);
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
			count = tBdCommandTypeService.deleteList(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
		
}
