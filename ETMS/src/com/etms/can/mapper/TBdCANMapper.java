package com.etms.can.mapper;

import java.util.List;

import com.etms.can.pojo.TBdCAN;
import com.etms.core.mapper.BaseMapper;

public interface TBdCANMapper extends BaseMapper<TBdCAN>{
	
	int insert(String terminalCode,int portID);

	int count(String terminalCode);

	int deleteLarger(String terminalCode, int portID);

	List<TBdCAN> selectByCode(String terminalCode);
	
	TBdCAN selectByCodeAndID(String terminalCode, int portID);
}
