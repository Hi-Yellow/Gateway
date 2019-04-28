package com.etms.can.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.etms.can.mapper.TBdCANMapper;
import com.etms.can.pojo.TBdCAN;
import com.etms.can.service.TBdCANService;
import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.terminalCommand.MyThread.MyRunnable;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;

@Service("tBdCANService")
public class TBdCANServiceImpl extends BaseServiceImpl<TBdCAN> implements TBdCANService{

	@Value("${WAITING_TIME}")
	private String WAITING_TIME;
	
	@Override
	public List<TBdCAN> selectByCode(String terminalCode) {
	
		return tBdCANMapper.selectByCode(terminalCode);
	}

	@Override
	public TBdCAN selectByCodeAndID(String terminalCode,int portID){
		return tBdCANMapper.selectByCodeAndID(terminalCode,portID);
	}
	@Override
	public int update(TBdCAN tBdCAN, TBdTerminalCommand tBdTerminalCommand) {
		int count1 = 0;
		int count2 = 0;
		TBdCAN tBdCANSave = tBdCANMapper.selectByCodeAndID(tBdCAN.getTerminalCode(), tBdCAN.getPortID());
		count1 = tBdCANMapper.update(tBdCAN);
		count2 = tBdTerminalCommandMapper.insert(tBdTerminalCommand);
		int ID = tBdTerminalCommandMapper.selectId();
		if(count2 > 0){
			//SendMessage.sendMessage(Integer.parseInt(DEST_PORT),DEST_IP,""+ID);
			MyRunnable<TBdCAN,TBdCANMapper> th = new MyRunnable<TBdCAN,TBdCANMapper>();
			th.setID(ID);
			th.setWaiting_time(Integer.parseInt(WAITING_TIME));
			th.setEntity(tBdCANSave);
			th.setMapper(tBdCANMapper);
			th.settBdTerminalCommandMapper(tBdTerminalCommandMapper);
			Thread t = new Thread(th);
			t.start();
		}
		return count1;
	}
}
