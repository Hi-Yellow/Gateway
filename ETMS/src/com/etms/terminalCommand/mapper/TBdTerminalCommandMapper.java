package com.etms.terminalCommand.mapper;

import com.etms.core.mapper.BaseMapper;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;

public interface TBdTerminalCommandMapper extends BaseMapper<TBdTerminalCommand>{

	public Integer selectByIdAndResultType(Integer ID);

	public Integer selectId();

	public Integer updateResultType(Integer ID);
    
	public Integer selectNotSuccess(Integer ID);
    
}