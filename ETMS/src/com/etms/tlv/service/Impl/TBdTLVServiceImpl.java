package com.etms.tlv.service.Impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.terminalCommand.MyThread.CommandThread;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;
import com.etms.tlv.pojo.TBdTLV;
import com.etms.tlv.service.TBdTLVService;


@Service("TBdTLVService")
public class TBdTLVServiceImpl extends BaseServiceImpl<TBdTLV> implements TBdTLVService{

	@Value("${WAITING_TIME}")
	private String WAITING_TIME;
	
		@Override
		public int insert(TBdTLV tBdTLV) {
			int count = 0;
			try{
				count = tBdTLVMapper.insert(tBdTLV);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return count;
		}
		
		@Override
		public int update(TBdTLV tBdTLV,TBdTerminalCommand tBdTerminalCommand) {
			int count1 = 0;
			int count2 = 0;
			count1 = tBdTLVMapper.update(tBdTLV);
			count2 = tBdTerminalCommandMapper.insert(tBdTerminalCommand);
			int ID = tBdTerminalCommandMapper.selectId();
			if(count2 > 0){
				CommandThread th = new CommandThread();
				th.setID(ID);
				th.setWaiting_time(Integer.parseInt(WAITING_TIME));
				th.settBdTerminalCommandMapper(tBdTerminalCommandMapper);
				Thread t = new Thread(th);
				t.start();
			}
			return count1;
		}
		
		
		@Override
		public int deleteList(String[] pks){
			int count = 0;
			try {
				count = tBdTLVMapper.deleteList(pks);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return count;
		}
		
		@Override
		public TBdTLV selectByCode(String terminalCode) {
			return tBdTLVMapper.selectByCode(terminalCode);
		}
}
