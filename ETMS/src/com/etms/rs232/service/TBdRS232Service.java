package com.etms.rs232.service;

import java.util.List;

import com.etms.core.service.BaseService;
import com.etms.rs232.pojo.TBdRS232;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;

public interface TBdRS232Service extends BaseService<TBdRS232>{
	
	public List<TBdRS232> selectByCode(String tcodeRS232);
	
	public TBdRS232 selectByCodeAndID(String tcodeRS232,int portID);
	
	public int update(TBdRS232 tBdRS232,TBdTerminalCommand tBdTerminalCommand);
}
