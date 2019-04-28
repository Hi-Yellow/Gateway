package com.etms.role.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;
import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.role.pojo.Role;
import com.etms.role.service.RoleService;

@Service("roleService")
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService{
	
	
	@Override
	public List<Role> getRoleNameAndID() {
		return roleMapper.selectRoleNameAndID();
	}
	
}
