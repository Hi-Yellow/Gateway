package com.etms.terminalConfigure.service;

import java.util.List;

import com.etms.core.service.BaseService;
import com.etms.terminalConfigure.pojo.TBdTerminalConfigure;

public interface TBdTerminalConfigureService extends BaseService<TBdTerminalConfigure>{

	List<TBdTerminalConfigure> selectIDAndAlias();
}
