package com.etms.terminal.pojo;

public class TBdTerminal {
    private Integer id;

    private String terminalCode;

    private Integer terminalTypeId;

    private String mdn;

    private String loginPsw;

    private String kpcrc;

    private String uimPsw;

    private String esn;

    private String meId;

    private String imsi;

    private String uimId;

    private String bsId;

    private Integer terminalStatusId;

    private Integer terminalProtocolId;

    private String manuFacturingUnit;

    private String terminalModel;

    private String softwareVersion;
    
    private String hardwareVersion;

	private Integer restartCount;

    private Integer loginCount;

    private String registerTime;

    private String loginTime;

    private Integer rssi;

    private String typeName;

    private String statusName;

    private String protocolName;

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
        this.terminalCode = terminalCode == null ? null : terminalCode.trim();
    }

    public Integer getTerminalTypeId() {
        return terminalTypeId;
    }

    public void setTerminalTypeId(Integer terminalTypeId) {
        this.terminalTypeId = terminalTypeId;
    }

    public String getMdn() {
        return mdn;
    }

    public void setMdn(String mdn) {
        this.mdn = mdn == null ? null : mdn.trim();
    }

    public String getLoginPsw() {
        return loginPsw;
    }

    public void setLoginPsw(String loginPsw) {
        this.loginPsw = loginPsw == null ? null : loginPsw.trim();
    }

    public String getKpcrc() {
        return kpcrc;
    }

    public void setKpcrc(String kpcrc) {
        this.kpcrc = kpcrc == null ? null : kpcrc.trim();
    }

    public String getUimPsw() {
        return uimPsw;
    }

    public void setUimPsw(String uimPsw) {
        this.uimPsw = uimPsw == null ? null : uimPsw.trim();
    }

    public String getEsn() {
        return esn;
    }

    public void setEsn(String esn) {
        this.esn = esn == null ? null : esn.trim();
    }

    public String getMeId() {
        return meId;
    }

    public void setMeId(String meId) {
        this.meId = meId == null ? null : meId.trim();
    }

    public String getImsi() {
        return imsi;
    }

    public void setImsi(String imsi) {
        this.imsi = imsi == null ? null : imsi.trim();
    }

    public String getUimId() {
        return uimId;
    }

    public void setUimId(String uimId) {
        this.uimId = uimId == null ? null : uimId.trim();
    }

    public String getBsId() {
        return bsId;
    }

    public void setBsId(String bsId) {
        this.bsId = bsId == null ? null : bsId.trim();
    }

    public Integer getTerminalstatusId() {
        return terminalStatusId;
    }

    public void setTerminalstatusId(Integer terminalStatusId) {
        this.terminalStatusId = terminalStatusId;
    }

    public Integer getTerminalProtocolId() {
        return terminalProtocolId;
    }

    public void setTerminalProtocolId(Integer terminalProtocolId) {
        this.terminalProtocolId = terminalProtocolId;
    }

    public String getManuFacturingUnit() {
        return manuFacturingUnit;
    }

    public void setManuFacturingUnit(String manuFacturingUnit) {
        this.manuFacturingUnit = manuFacturingUnit == null ? null : manuFacturingUnit.trim();
    }

    public String getTerminalModel() {
        return terminalModel;
    }

    public void setTerminalModel(String terminalModel) {
        this.terminalModel = terminalModel == null ? null : terminalModel.trim();
    }

    public String getSoftwareVersion() {
        return softwareVersion;
    }

    public void setSoftwareVersion(String softwareVersion) {
        this.softwareVersion = softwareVersion == null ? null : softwareVersion.trim();
    }

    public String getHardwareVersion() {
		return hardwareVersion;
	}

	public void setHardwareVersion(String hardwareVersion) {
		this.hardwareVersion = hardwareVersion;
	}
    public Integer getRestartCount() {
        return restartCount;
    }

    public void setRestartCount(Integer restartCount) {
        this.restartCount = restartCount;
    }

    public Integer getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }

    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime == null ? null : registerTime.trim();
    }

    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime == null ? null : loginTime.trim();
    }

    public Integer getRssi() {
        return rssi;
    }

    public void setRssi(Integer rssi) {
        this.rssi = rssi;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName == null ? null : statusName.trim();
    }

    public String getProtocolName() {
        return protocolName;
    }

    public void setProtocolName(String protocolName) {
        this.protocolName = protocolName == null ? null : protocolName.trim();
    }
    
    public TBdTerminal(){
    	
    }
}