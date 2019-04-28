package com.etms.portCountConfigure.pojo;

import java.io.Serializable;

public class TBdPortCountConfigure implements Serializable{

	private static final long serialVersionUID = -5102497447583089057L;
	
    private Integer id;
   
	private String terminalCode;
	
	private Integer terminalTypeID;
	
	private String typeName;

    private Integer rs485Count;
    
    private Integer rs232Count;
    
	private Integer networkPortCount;
    
	private Integer cancount;
    
    private Integer terminalConfigureID;
    
    private String configureAlias;


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

	public Integer getNetworkPortCount() {
		return networkPortCount;
	}

	public void setNetworkPortCount(Integer networkPortCount) {
		this.networkPortCount = networkPortCount;
	}

	public TBdPortCountConfigure(){
		
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

	public Integer getRs485Count() {
		return rs485Count;
	}

	public void setRs485Count(Integer rs485Count) {
		this.rs485Count = rs485Count;
	}

	public Integer getRs232Count() {
		return rs232Count;
	}

	public void setRs232Count(Integer rs232Count) {
		this.rs232Count = rs232Count;
	}

	public Integer getCancount() {
		return cancount;
	}

	public void setCancount(Integer cancount) {
		this.cancount = cancount;
	}

	public Integer getTerminalConfigureID() {
		return terminalConfigureID;
	}

	public void setTerminalConfigureID(Integer terminalConfigureID) {
		this.terminalConfigureID = terminalConfigureID;
	}

	public String getConfigureAlias() {
		return configureAlias;
	}

	public void setConfigureAlias(String configureAlias) {
		this.configureAlias = configureAlias;
	}

	
}
