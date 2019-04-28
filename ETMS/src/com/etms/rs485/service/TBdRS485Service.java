package com.etms.rs485.service;

import java.util.List;

import com.etms.rs485.pojo.TBdRS485;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;

public interface TBdRS485Service {

	public List<TBdRS485> selectByCode(String terminalCode);
	
	public TBdRS485 selectByCodeAndID(String terminalCode,int portID);
	
	public int update(TBdRS485 tBdRS485,TBdTerminalCommand tBdTerminalCommand);
}
