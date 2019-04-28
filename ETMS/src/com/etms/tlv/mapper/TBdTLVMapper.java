package com.etms.tlv.mapper;

import com.etms.core.mapper.BaseMapper;
import com.etms.tlv.pojo.TBdTLV;

public interface TBdTLVMapper extends BaseMapper<TBdTLV>{

	TBdTLV selectByCode(String terminalCode);

}
