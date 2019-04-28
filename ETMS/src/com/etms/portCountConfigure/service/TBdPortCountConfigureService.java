package com.etms.portCountConfigure.service;

import com.etms.core.service.BaseService;
import com.etms.portCountConfigure.pojo.TBdPortCountConfigure;

public interface TBdPortCountConfigureService extends BaseService<TBdPortCountConfigure>{
	
	int insert(TBdPortCountConfigure tBdPortCountConfigure);
	
	int update(TBdPortCountConfigure tBdPortCountConfigure);
}
