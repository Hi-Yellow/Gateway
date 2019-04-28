package com.etms.rs232.mapper;

import java.util.List;

import com.etms.core.mapper.BaseMapper;
import com.etms.rs232.pojo.TBdRS232;

public interface TBdRS232Mapper extends BaseMapper<TBdRS232> {

	
	int insert(String terminalCode, int portID);

	int deleteLarger(String terminalCode, int portID);

	int count(String terminalCode);

	List<TBdRS232> selectByCode(String terminalCode);
	
	TBdRS232 selectByCodeAndID(String terminalCode,int portID);

}
