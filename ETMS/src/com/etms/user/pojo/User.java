package com.etms.user.pojo;

import java.io.Serializable;

import com.etms.role.pojo.Role;

public class User implements Serializable{
	
	private static final long serialVersionUID = -4468409048090540695L;
	
    private Integer id;

    private String userName;

    private String userPsw;

    private String realName;

    private Role role;
    
    private Integer flag;

    private String memo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPsw() {
        return userPsw;
    }

    public void setUserPsw(String userPsw) {
        this.userPsw = userPsw == null ? null : userPsw.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
    
    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }
    
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", userPsw=" + userPsw + ", realPame=" + realName
				+ ", role=" + role + ", flag=" + flag + ", memo=" + memo + "]";
	}

	public User(){
    	
    }
	
	
}