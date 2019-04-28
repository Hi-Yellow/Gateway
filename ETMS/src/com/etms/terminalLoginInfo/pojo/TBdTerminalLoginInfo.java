package com.etms.terminalLoginInfo.pojo;

import java.sql.Timestamp;

public class TBdTerminalLoginInfo {

	private Integer id;
	
	private String terminalCode;
	
	private Timestamp loginTime;
	
	private Timestamp logoutTime;
	
	private Integer terminalTypeID;
	
	private String typeName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTerminalCode() {
		return terminalCode;
	}

	public void setTerminalCode(String terminalCode) {
		this.terminalCode = terminalCode;
	}
	
	public Integer getTerminalTypeID() {
		return terminalTypeID;
	}

	public void setTerminalTypeID(Integer terminalTypeID) {
		this.terminalTypeID = terminalTypeID;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Timestamp getLoginTime() {
		return loginTime;
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
	
	public TBdTerminalLoginInfo(){
		
	}
}
