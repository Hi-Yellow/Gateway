package com.etms.netPort.pojo;

public class TBdNetPort {

	private String terminalCode;
	
	private Integer portID;
	
	private String portName;
	
	private String ipAddress;
	
	private String gateway;
	
	private String netmask;

	public TBdNetPort(){
		
	}

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

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getGateway() {
		return gateway;
	}

	public void setGateway(String gateway) {
		this.gateway = gateway;
	}

	public String getNetmask() {
		return netmask;
	}

	public void setNetmask(String netmask) {
		this.netmask = netmask;
	}

	
}
