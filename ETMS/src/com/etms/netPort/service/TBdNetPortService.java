package com.etms.netPort.service;

import java.util.List;
import com.etms.core.service.BaseService;
import com.etms.netPort.pojo.TBdNetPort;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;

public interface TBdNetPortService extends BaseService<TBdNetPort>{

	public List<TBdNetPort> selectByCode(String terminalCode);
	
	public TBdNetPort selectByCodeAndID(String terminalCode,int portID);
	
	public int update(TBdNetPort tBdNetPort,TBdTerminalCommand tBdTerminalCommand);
}
