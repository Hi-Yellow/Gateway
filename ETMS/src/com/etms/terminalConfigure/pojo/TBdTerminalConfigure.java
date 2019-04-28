package com.etms.terminalConfigure.pojo;

public class TBdTerminalConfigure {
    
	private Integer id;

    private String configureAlias;

    private String parameterSet;

    private Integer parameterLength;

    private String applicationCode;

    private Integer heartBeat;

    private Integer dataTimeOut;

    private Integer dataSendCount;

    private Integer messageTimeOut;

    private Integer messageSendCount;

    private Integer sleepTime;

    private String pppNumber;

    private String pppUser;

    private String pppPsw;

    private String mdmsAddress;

    private Integer mdmsTcp;

    private Integer mdmsUdp;

    private String dnsAddress;

    private String m2mNumber;

    private String applicationAddress;

    private Integer applicationPort;

    private String applicationNumber;

    private String uimPsw;

    private Integer portSpeed;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getConfigureAlias() {
        return configureAlias;
    }

    public void setConfigureAlias(String configureAlias) {
        this.configureAlias = configureAlias == null ? null : configureAlias.trim();
    }

    public String getParameterSet() {
        return parameterSet;
    }

    public void setParameterSet(String parameterSet) {
        this.parameterSet = parameterSet == null ? null : parameterSet.trim();
    }

    public Integer getParameterLength() {
        return parameterLength;
    }

    public void setParameterLength(Integer parameterLength) {
        this.parameterLength = parameterLength;
    }

    public String getApplicationCode() {
        return applicationCode;
    }

    public void setApplicationCode(String applicationCode) {
        this.applicationCode = applicationCode == null ? null : applicationCode.trim();
    }

    public Integer getHeartBeat() {
        return heartBeat;
    }

    public void setHeartBeat(Integer heartBeat) {
        this.heartBeat = heartBeat;
    }

    public Integer getDataTimeOut() {
        return dataTimeOut;
    }

    public void setDataTimeOut(Integer dataTimeOut) {
        this.dataTimeOut = dataTimeOut;
    }

    public Integer getDataSendCount() {
        return dataSendCount;
    }

    public void setDataSendCount(Integer dataSendCount) {
        this.dataSendCount = dataSendCount;
    }

    public Integer getMessageTimeOut() {
        return messageTimeOut;
    }

    public void setMessageTimeOut(Integer messageTimeOut) {
        this.messageTimeOut = messageTimeOut;
    }

    public Integer getMessageSendCount() {
        return messageSendCount;
    }

    public void setMessageSendCount(Integer messageSendCount) {
        this.messageSendCount = messageSendCount;
    }

    public Integer getSleepTime() {
        return sleepTime;
    }

    public void setSleepTime(Integer sleepTime) {
        this.sleepTime = sleepTime;
    }

    public String getPppNumber() {
        return pppNumber;
    }

    public void setPppNumber(String pppNumber) {
        this.pppNumber = pppNumber == null ? null : pppNumber.trim();
    }

    public String getPppUser() {
        return pppUser;
    }

    public void setPppUser(String pppUser) {
        this.pppUser = pppUser == null ? null : pppUser.trim();
    }

    public String getPppPsw() {
        return pppPsw;
    }

    public void setPppPsw(String pppPsw) {
        this.pppPsw = pppPsw == null ? null : pppPsw.trim();
    }

    public String getMdmsAddress() {
        return mdmsAddress;
    }

    public void setMdmsAddress(String mdmsAddress) {
        this.mdmsAddress = mdmsAddress == null ? null : mdmsAddress.trim();
    }

    public Integer getMdmsTcp() {
        return mdmsTcp;
    }

    public void setMdmsTcp(Integer mdmsTcp) {
        this.mdmsTcp = mdmsTcp;
    }

    public Integer getMdmsUdp() {
        return mdmsUdp;
    }

    public void setMdmsudp(Integer mdmsUdp) {
        this.mdmsUdp = mdmsUdp;
    }

    public String getDnsAddress() {
        return dnsAddress;
    }

    public void setDnsAddress(String dnsAddress) {
        this.dnsAddress = dnsAddress == null ? null : dnsAddress.trim();
    }

    public String getM2mNumber() {
        return m2mNumber;
    }

    public void setM2mNumber(String m2mNumber) {
        this.m2mNumber = m2mNumber == null ? null : m2mNumber.trim();
    }

    public String getApplicationAddress() {
        return applicationAddress;
    }

    public void setApplicationAddress(String applicationAddress) {
        this.applicationAddress = applicationAddress == null ? null : applicationAddress.trim();
    }

    public Integer getApplicationPort() {
        return applicationPort;
    }

    public void setApplicationPort(Integer applicationPort) {
        this.applicationPort = applicationPort;
    }

    public String getApplicationNumber() {
        return applicationNumber;
    }

    public void setApplicationNumber(String applicationNumber) {
        this.applicationNumber = applicationNumber == null ? null : applicationNumber.trim();
    }

    public String getUimPsw() {
        return uimPsw;
    }

    public void setUimpsw(String uimPsw) {
        this.uimPsw = uimPsw == null ? null : uimPsw.trim();
    }

    public Integer getPortSpeed() {
        return portSpeed;
    }

    public void setPortSpeed(Integer portSpeed) {
        this.portSpeed = portSpeed;
    }
    
    public TBdTerminalConfigure(){
    	
    }
}