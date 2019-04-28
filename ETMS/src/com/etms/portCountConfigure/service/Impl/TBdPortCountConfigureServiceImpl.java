package com.etms.portCountConfigure.service.Impl;

import org.springframework.stereotype.Service;
import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.portCountConfigure.pojo.TBdPortCountConfigure;
import com.etms.portCountConfigure.service.TBdPortCountConfigureService;

@Service("TBdPortCountConfigureService")
public class TBdPortCountConfigureServiceImpl extends BaseServiceImpl<TBdPortCountConfigure> implements TBdPortCountConfigureService{
	
	
	@Override
	public int insert(TBdPortCountConfigure tBdPortCountConfigure) {
		int count = 0;
		if(tBdPortCountConfigure.getCancount()==null)
			tBdPortCountConfigure.setCancount(0);
		if(tBdPortCountConfigure.getNetworkPortCount()==null)
			tBdPortCountConfigure.setNetworkPortCount(0);
		if(tBdPortCountConfigure.getRs232Count()==null)
			tBdPortCountConfigure.setRs232Count(0);
		if(tBdPortCountConfigure.getRs485Count()==null)
			tBdPortCountConfigure.setRs485Count(0);
		
		int canCount = tBdPortCountConfigure.getCancount();
		int networkPortCount = tBdPortCountConfigure.getNetworkPortCount();
		int rs232Count = tBdPortCountConfigure.getRs232Count();
		int rs485Count = tBdPortCountConfigure.getRs485Count();
		
		try {
			for(int i=1;i<=canCount;i++){
				tBdCANMapper.insert(tBdPortCountConfigure.getTerminalCode(), i);
			}
			for(int i=1;i<=networkPortCount;i++){
				tBdNetPortMapper.insert(tBdPortCountConfigure.getTerminalCode(), i);
			}
			for(int i=1;i<=rs232Count;i++){
				tBdRS232Mapper.insert(tBdPortCountConfigure.getTerminalCode(), i);
			}
			for(int i=1;i<=rs485Count;i++){
				tBdRS485Mapper.insert(tBdPortCountConfigure.getTerminalCode(), i);
			}
			count = tBdPortCountConfigureMapper.insert(tBdPortCountConfigure);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@Override
	public int update(TBdPortCountConfigure tBdPortCountConfigure){
		int count = 0;
		if(tBdPortCountConfigure.getCancount()==null)
			tBdPortCountConfigure.setCancount(0);
		if(tBdPortCountConfigure.getNetworkPortCount()==null)
			tBdPortCountConfigure.setNetworkPortCount(0);
		if(tBdPortCountConfigure.getRs232Count()==null)
			tBdPortCountConfigure.setRs232Count(0);
		if(tBdPortCountConfigure.getRs485Count()==null)
			tBdPortCountConfigure.setRs485Count(0);
		
		int canCount = tBdPortCountConfigure.getCancount();
		int networkPortCount = tBdPortCountConfigure.getNetworkPortCount();
		int rs232Count = tBdPortCountConfigure.getRs232Count();
		int rs485Count = tBdPortCountConfigure.getRs485Count();
		
		int canCountDB = tBdCANMapper.count(tBdPortCountConfigure.getTerminalCode());
		int networkPortCountDB = tBdNetPortMapper.count(tBdPortCountConfigure.getTerminalCode());
		int rs232CountDB = tBdRS232Mapper.count(tBdPortCountConfigure.getTerminalCode());
		int rs485CountDB = tBdRS485Mapper.count(tBdPortCountConfigure.getTerminalCode());
		try {
			if(canCount<canCountDB){
				tBdCANMapper.deleteLarger(tBdPortCountConfigure.getTerminalCode(),canCount);
			}
			else if(canCount>canCountDB){
				for(int i=canCountDB+1;i<=canCount;i++){
					tBdCANMapper.insert(tBdPortCountConfigure.getTerminalCode(), i);
				}	
			}
				
			if(networkPortCount<networkPortCountDB){
				tBdNetPortMapper.deleteLarger(tBdPortCountConfigure.getTerminalCode(),networkPortCount);
			}
			else if(networkPortCount>networkPortCountDB){
				for(int i=networkPortCountDB+1;i<=networkPortCount;i++){
					tBdNetPortMapper.insert(tBdPortCountConfigure.getTerminalCode(), i);
				}
			}
	
			if(rs232Count<rs232CountDB){
				tBdRS232Mapper.deleteLarger(tBdPortCountConfigure.getTerminalCode(),rs232Count);
			}
			else if(rs232Count>rs232CountDB){
				for(int i=rs232CountDB+1;i<=rs232Count;i++){
					tBdRS232Mapper.insert(tBdPortCountConfigure.getTerminalCode(), i);
				}
			}
				
			if(rs485Count<rs485CountDB){
				tBdRS485Mapper.deleteLarger(tBdPortCountConfigure.getTerminalCode(),rs485Count);
			}
			else if(rs485Count>rs485CountDB){
				for(int i=rs485CountDB+1;i<=rs485Count;i++){
					tBdRS485Mapper.insert(tBdPortCountConfigure.getTerminalCode(), i);
				}
			}	
			count = tBdPortCountConfigureMapper.update(tBdPortCountConfigure);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@Override
	public int deleteList(String[] pks){
		int count = 0;
		try {
			tBdCANMapper.deleteList(pks);
			tBdNetPortMapper.deleteList(pks);
			tBdRS232Mapper.deleteList(pks);
			tBdRS485Mapper.deleteList(pks);
			count = tBdPortCountConfigureMapper.deleteList(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
