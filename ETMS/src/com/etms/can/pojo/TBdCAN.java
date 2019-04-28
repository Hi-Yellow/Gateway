package com.etms.can.pojo;

public class TBdCAN {

	private String terminalCode;
	
	private Integer portID;
	
	private String portName;
	
	private Integer baudRate;

	
	public String getTerminalCode() {
		return terminalCode;
	}

	public void setTerminalCode(String terminalCode) {
		this.terminalCode = terminalCode;
	}

	public Integer getPortID() {
		return portID;
	}

	public void setPortID(Integer portID) {
		this.portID = portID;
	}

	public String getPortName() {
		return portName;
	}

	public void setPortName(String portName) {
		this.portName = portName;
	}

	public Integer getBaudRate() {
		return baudRate;
	}

	public void setBaudRate(Integer baudRate) {
		this.baudRate = baudRate;
	}

	public TBdCAN(){
		
	}
}
