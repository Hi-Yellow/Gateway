package com.etms.terminalConfigure.mapper;

import java.util.List;

import com.etms.core.mapper.BaseMapper;
import com.etms.terminalConfigure.pojo.TBdTerminalConfigure;

public interface TBdTerminalConfigureMapper extends BaseMapper<TBdTerminalConfigure>{

	List<TBdTerminalConfigure> selectIDAndAlias();
    
}