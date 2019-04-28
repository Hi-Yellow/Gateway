package com.etms.role.action;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.core.action.BaseAction;
import com.etms.core.page.Page;
import com.etms.role.pojo.Role;
import com.etms.role.service.RoleService;


@Controller
@RequestMapping("/saRole")
public class RoleAction extends BaseAction{
	
	@Resource
	private RoleService roleService;
	
	@RequestMapping(value="/getRoleNameAndID",method=RequestMethod.POST)
	@ResponseBody
	public Object getRoleName() {
		return roleService.getRoleNameAndID();
	}
	
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<Role> page, Role role) {
		page.setParamEntity(role);  
		Page<Role> pageRes = roleService.selectPageUseDyc(page);
		return pageRes.getPageMap();
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(Role role) {
		int count = 0;
		try {
			count = roleService.insert(role);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int update(Role role) {
		int count = 0;
		try {
			count = roleService.update(role);
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
			count = roleService.deleteList(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}