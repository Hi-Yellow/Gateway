package com.etms.rs485.mapper;

import java.util.List;

import com.etms.core.mapper.BaseMapper;
import com.etms.rs485.pojo.TBdRS485;

public interface TBdRS485Mapper extends BaseMapper<TBdRS485>{

	
	int insert(String terminalCode, int portID);

	int deleteLarger(String terminalCode, int portID);

	int count(String terminalCode);

	List<TBdRS485> selectByCode(String terminalCode);
	
	TBdRS485 selectByCodeAndID(String terminalCode,int portID);

}
