package com.etms.rs232.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.rs232.mapper.TBdRS232Mapper;
import com.etms.rs232.pojo.TBdRS232;
import com.etms.rs232.service.TBdRS232Service;
import com.etms.terminalCommand.MyThread.MyRunnable;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;

@Service("tBdR232Service")
public class TBdRS232ServiceImpl extends BaseServiceImpl<TBdRS232> implements TBdRS232Service{

	@Value("${WAITING_TIME}")
	private String WAITING_TIME;
	
	@Override
	public List<TBdRS232> selectByCode(String terminalCode) {
		return tBdRS232Mapper.selectByCode(terminalCode);
	}
	
	@Override
	public int update(TBdRS232 tBdRS232, TBdTerminalCommand tBdTerminalCommand) {
		int count1 = 0;
		int count2 = 0;
		TBdRS232 tBdRS232Save = tBdRS232Mapper.selectByCodeAndID(tBdRS232.getTerminalCode(), tBdRS232.getPortID());
		count1 = tBdRS232Mapper.update(tBdRS232);
		count2 = tBdTerminalCommandMapper.insert(tBdTerminalCommand);
		int ID = tBdTerminalCommandMapper.selectId();
		if(count2 > 0){
			//SendMessage.sendMessage(Integer.parseInt(DEST_PORT),DEST_IP,""+ID);
			MyRunnable<TBdRS232,TBdRS232Mapper> th = new MyRunnable<TBdRS232,TBdRS232Mapper>();
			th.setID(ID);
			th.setWaiting_time(Integer.parseInt(WAITING_TIME));
			th.setEntity(tBdRS232Save);
			th.setMapper(tBdRS232Mapper);
			th.settBdTerminalCommandMapper(tBdTerminalCommandMapper);
			Thread t = new Thread(th);
			t.start();
		}
		return count1;
	}

	@Override
	public TBdRS232 selectByCodeAndID(String terminalCode, int portID) {
		return tBdRS232Mapper.selectByCodeAndID(terminalCode, portID);
	}

}
