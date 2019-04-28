package com.etms.netPort.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.netPort.mapper.TBdNetPortMapper;
import com.etms.netPort.pojo.TBdNetPort;
import com.etms.netPort.service.TBdNetPortService;
import com.etms.terminalCommand.MyThread.MyRunnable;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;
@Service("tBdNetPortService")
public class TBdNetPortServiceImpl extends BaseServiceImpl<TBdNetPort> implements TBdNetPortService{

	
	@Value("${WAITING_TIME}")
	private String WAITING_TIME;
	
	@Override
	public List<TBdNetPort> selectByCode(String terminalCode) {
	
		return tBdNetPortMapper.selectByCode(terminalCode);
	}

	@Override
	public int update(TBdNetPort tBdNetPort, TBdTerminalCommand tBdTerminalCommand) {
		int count1 = 0;
		int count2 = 0;
		//通过传入的tBdNetPort从数据库中读取tBdNetPortSave暂存到内存中，当修改tBdNetPort失败后，进行回滚操作，将tBdNetPortSave重新存储到数据库。
		TBdNetPort tBdNetPortSave = tBdNetPortMapper.selectByCodeAndID(tBdNetPort.getTerminalCode(), tBdNetPort.getPortID());
		count1 = tBdNetPortMapper.update(tBdNetPort);
		count2 = tBdTerminalCommandMapper.insert(tBdTerminalCommand);
		int ID = tBdTerminalCommandMapper.selectId();
		if(count2 > 0){
			//SendMessage.sendMessage(Integer.parseInt(DEST_PORT),DEST_IP,""+ID);
			MyRunnable<TBdNetPort,TBdNetPortMapper> th = new MyRunnable<TBdNetPort,TBdNetPortMapper>();
			th.setID(ID);
			th.setWaiting_time(Integer.parseInt(WAITING_TIME));
			th.setEntity(tBdNetPortSave);
			th.setMapper(tBdNetPortMapper);
			th.settBdTerminalCommandMapper(tBdTerminalCommandMapper);
			Thread t = new Thread(th);
			t.start();
		}
		return count1;
	}

	@Override
	public TBdNetPort selectByCodeAndID(String terminalCode, int portID) {
		return tBdNetPortMapper.selectByCodeAndID(terminalCode, portID);
	}

}
