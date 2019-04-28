package com.etms.can.service;

import java.util.List;

import com.etms.can.pojo.TBdCAN;
import com.etms.core.service.BaseService;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;

public interface TBdCANService extends BaseService<TBdCAN>{

	public List<TBdCAN> selectByCode(String terminalCode);
	
	public TBdCAN selectByCodeAndID(String terminalCode,int portID);
	
	public int update(TBdCAN tBdCAN,TBdTerminalCommand tBdTerminalCommand);
}
