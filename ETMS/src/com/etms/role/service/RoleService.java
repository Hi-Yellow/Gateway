package com.etms.role.service;

import java.util.List;

import com.etms.core.service.BaseService;
import com.etms.role.pojo.Role;

public interface RoleService extends BaseService<Role> {

	public List<Role> getRoleNameAndID();
	
}
