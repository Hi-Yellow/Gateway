package com.etms.loginInfo.pojo;

import java.io.Serializable;
import java.sql.Timestamp;


public class LoginInfo implements Serializable{
	
	private static final long serialVersionUID = 5577019582191285647L;
	
    private Integer id;

    private String userName;
    
    private String realName;

	private Timestamp loginTime;

    private Timestamp logoutTime;

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Timestamp getLoginTime() {
        return loginTime;
    }
    
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

    
    public void setLoginTime(Timestamp loginTime) {
        this.loginTime = loginTime;
    }
    
    public Timestamp getLogoutTime() {
		return logoutTime;
	}

	public void setLogoutTime(Timestamp logoutTime) {
		this.logoutTime = logoutTime;
	}
	
	
	@Override
	public String toString() {
		return "LoginInfo [id=" + id + ", userName=" + userName + ", realName=" + realName + ", loginTime=" + loginTime
				+ ", logoutTime=" + logoutTime + "]";
	}

	public LoginInfo(){
    	
    }
}