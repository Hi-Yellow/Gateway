package com.etms.netPort.mapper;

import java.util.List;
import com.etms.core.mapper.BaseMapper;
import com.etms.netPort.pojo.TBdNetPort;

public interface TBdNetPortMapper extends BaseMapper<TBdNetPort> {

	int insert(String terminalCode,int portID);

	int count(String terminalCode);

	int deleteLarger(String terminalCode, int portID);																							
	
	List<TBdNetPort> selectByCode(String terminalCode);
	
	TBdNetPort selectByCodeAndID(String terminalCode,int portID);
}
