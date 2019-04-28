package com.etms.role.mapper;

import java.util.List;

import com.etms.core.mapper.BaseMapper;
import com.etms.role.pojo.Role;

public interface RoleMapper extends BaseMapper<Role>{
	
    List<Role> selectRoleNameAndID();

}