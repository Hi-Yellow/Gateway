package com.etms.terminalCommand.service.Impl;

import java.sql.Timestamp;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.terminalCommand.MyThread.CommandThread;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;
import com.etms.terminalCommand.service.TBdTerminalCommandService;

@Service("TBdTerminalCommandService")
public class TBdTerminalCommandServiceImpl extends BaseServiceImpl<TBdTerminalCommand> implements TBdTerminalCommandService{
	
	@Value("${DEST_IP}")
	private String DEST_IP;
	@Value("${DEST_PORT}")
	private String DEST_PORT;
	@Value("${WAITING_TIME}")
	private String WAITING_TIME;
	
	
	@Override
	public int insert(TBdTerminalCommand tBdTerminalCommand) {
		int count = 0;
		tBdTerminalCommand.setOperateType(1);
		tBdTerminalCommand.setResultType(254);
		System.out.println(tBdTerminalCommand.getOperateType());
		tBdTerminalCommand.setExecuteTime(new Timestamp(System.currentTimeMillis()));
		try {
			count = tBdTerminalCommandMapper.insert(tBdTerminalCommand);
			int ID = tBdTerminalCommandMapper.selectId();
			if(count > 0){
				//SendMessage.sendMessage(Integer.parseInt(DEST_PORT),DEST_IP,""+ID);
				CommandThread th = new CommandThread();//�·���ͨ������߳�
				th.setID(ID);
				th.setWaiting_time(Integer.parseInt(WAITING_TIME));
				th.settBdTerminalCommandMapper(tBdTerminalCommandMapper);
				Thread t = new Thread(th);
				t.start();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	

}
