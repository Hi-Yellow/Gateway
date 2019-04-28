package com.etms.tlv.service;

import com.etms.core.service.BaseService;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;
import com.etms.tlv.pojo.TBdTLV;

public interface TBdTLVService extends BaseService<TBdTLV>{
	
	int update(TBdTLV tBdTLV,TBdTerminalCommand tBdTerminalCommand);
	
	TBdTLV selectByCode(String terminalCode);
}
