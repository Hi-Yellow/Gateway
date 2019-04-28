package com.etms.rs485.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.rs485.mapper.TBdRS485Mapper;
import com.etms.rs485.pojo.TBdRS485;
import com.etms.rs485.service.TBdRS485Service;
import com.etms.terminalCommand.MyThread.MyRunnable;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;
@Service("tBdRS485Service")
public class TBdRS485ServiceImpl extends BaseServiceImpl<TBdRS485> implements TBdRS485Service{

	@Value("${WAITING_TIME}")
	private String WAITING_TIME;
	
	@Override
	public List<TBdRS485> selectByCode(String terminalCode) {
		return tBdRS485Mapper.selectByCode(terminalCode);
	}
	
	@Override
	public int update(TBdRS485 tBdRS485, TBdTerminalCommand tBdTerminalCommand) {
		int count1 = 0;
		int count2 = 0;
		TBdRS485 tBdRS485Save = tBdRS485Mapper.selectByCodeAndID(tBdRS485.getTerminalCode(), tBdRS485.getPortID());
		count1 = tBdRS485Mapper.update(tBdRS485);
		count2 = tBdTerminalCommandMapper.insert(tBdTerminalCommand);
		int ID = tBdTerminalCommandMapper.selectId();
		if(count2 > 0){
			//SendMessage.sendMessage(Integer.parseInt(DEST_PORT),DEST_IP,""+ID);
			MyRunnable<TBdRS485,TBdRS485Mapper> th = new MyRunnable<TBdRS485,TBdRS485Mapper>();
			th.setID(ID);
			th.setWaiting_time(Integer.parseInt(WAITING_TIME));
			th.setEntity(tBdRS485Save);
			th.setMapper(tBdRS485Mapper);
			th.settBdTerminalCommandMapper(tBdTerminalCommandMapper);
			Thread t = new Thread(th);
			t.start();
		}
		return count1;
	}

	@Override
	public TBdRS485 selectByCodeAndID(String terminalCode, int portID) {
		return tBdRS485Mapper.selectByCodeAndID(terminalCode, portID);
	}

}

