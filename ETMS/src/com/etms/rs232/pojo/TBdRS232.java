package com.etms.rs232.pojo;

public class TBdRS232 {

	private String terminalCode;
	
	private Integer portID;
	
	private String portName;
	
	private Integer baudRate;
	
	private Integer stopBit;
	
	private String checkBit;
	
	private Integer dataBit;

	
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

	public Integer getStopBit() {
		return stopBit;
	}

	public void setStopBit(Integer stopBit) {
		this.stopBit = stopBit;
	}

	public String getCheckBit() {
		return checkBit;
	}

	public void setCheckBit(String checkBit) {
		this.checkBit = checkBit;
	}

	public Integer getDataBit() {
		return dataBit;
	}

	public void setDataBit(Integer dataBit) {
		this.dataBit = dataBit;
	}


	public TBdRS232(){
		
	}

	
}

