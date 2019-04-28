package com.etms.commandType.service.Impl;


import org.springframework.stereotype.Service;

import com.etms.commandType.pojo.TBdCommandType;
import com.etms.commandType.service.TBdCommandTypeService;
import com.etms.core.service.Impl.BaseServiceImpl;

@Service("TBdCommandTypeService")
public class TBdCommandTypeServiceImpl extends BaseServiceImpl<TBdCommandType> implements TBdCommandTypeService{

	@Override
	public int insert(TBdCommandType tBdCommandType) throws Exception {
		int i = tBdCommandTypeMapper.insert(tBdCommandType);// TODO Auto-generated method stub
	return i;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		int deleteList = tBdCommandTypeMapper.deleteList(pks);
		return deleteList;
	}
}
