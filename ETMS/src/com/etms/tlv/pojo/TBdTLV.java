package com.etms.tlv.pojo;

public class TBdTLV {
	
	private String terminalCode;
	
	private Integer terminalTypeID;
	
	private String typeName;
	
	private Integer upgradeID;

	private String upgradeVersion;
	
	private String uri;
	
	private String downloadUsername;
	
	private String downloadPassword;

	private Integer upgradeType;
	
	private String upgradeContent;
	

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

	public Integer getUpgradeID() {
		return upgradeID;
	}

	public void setUpgradeID(Integer upgradeID) {
		this.upgradeID = upgradeID;
	}
	public String getUpgradeVersion() {
		return upgradeVersion;
	}

	public void setUpgradeVersion(String upgradeVersion) {
		this.upgradeVersion = upgradeVersion;
	}

	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getDownloadUsername() {
		return downloadUsername;
	}

	public void setDownloadUsername(String downloadUsername) {
		this.downloadUsername = downloadUsername;
	}

	public String getDownloadPassword() {
		return downloadPassword;
	}

	public void setDownloadPassword(String downloadPassword) {
		this.downloadPassword = downloadPassword;
	}
	
	public Integer getUpgradeType() {
		return upgradeType;
	}
	public void setUpgradeType(Integer upgradeType) {
		this.upgradeType = upgradeType;
	}

	public String getUpgradeContent() {
		return upgradeContent;
	}

	public void setUpgradeContent(String upgradeContent) {
		this.upgradeContent = upgradeContent;
	}
	
	public TBdTLV(){
		
	}
}
