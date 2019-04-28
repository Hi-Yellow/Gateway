package com.etms.terminalConfigure.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;
import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.terminalConfigure.pojo.TBdTerminalConfigure;
import com.etms.terminalConfigure.service.TBdTerminalConfigureService;


@Service("tBdTerminalConfigureService")
public class TBdTerminalConfigureServiceImpl extends BaseServiceImpl<TBdTerminalConfigure> implements TBdTerminalConfigureService{

	@Override
	public int insert(TBdTerminalConfigure tBdTerminalConfigure) throws Exception {
		int i = tBdTerminalConfigureMapper.insert(tBdTerminalConfigure);// TODO Auto-generated method stub
	return i;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		int deleteList = tBdTerminalConfigureMapper.deleteList(pks);
		return deleteList;
	}

	@Override
	public List<TBdTerminalConfigure> selectIDAndAlias() {
		return tBdTerminalConfigureMapper.selectIDAndAlias();
	}

	
}
