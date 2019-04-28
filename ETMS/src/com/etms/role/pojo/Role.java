package com.etms.role.pojo;

import java.io.Serializable;

public class Role implements Serializable{
	
	private static final long serialVersionUID = -4468409048090540695L;
	
    private Integer id;

    private String roleName;

    private String roleDiscription;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRolediscription() {
        return roleDiscription;
    }

    public void setRolediscription(String roleDiscription) {
        this.roleDiscription = roleDiscription == null ? null : roleDiscription.trim();
    }
    
	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + ", roleDiscription=" + roleDiscription + "]";
	}

	public Role(){
    	
    }
	public Role(String roleName){
		
		this.roleName=roleName;
	}
	
	
}