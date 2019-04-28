package com.etms.terminalCommand.MyThread;

import com.etms.terminalCommand.mapper.TBdTerminalCommandMapper;

public class CommandThread implements Runnable {
	
	private	TBdTerminalCommandMapper tBdTerminalCommandMapper;
	private Integer ID = 0;
	private Integer waiting_time;
	
	@Override
	public void run() {
		try {
			System.out.println("线程已开启，ID："+ID);
			Thread.sleep(waiting_time);
			int count1 = tBdTerminalCommandMapper.selectByIdAndResultType(ID);
			if(count1 > 0){
				tBdTerminalCommandMapper.updateResultType(ID);
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void setID(int ID) {
		this.ID = ID;
	}

	public void settBdTerminalCommandMapper(TBdTerminalCommandMapper tBdTerminalCommandMapper) {
		this.tBdTerminalCommandMapper = tBdTerminalCommandMapper;
	}

	public void setWaiting_time(Integer waiting_time) {
		this.waiting_time = waiting_time;
	}
	
}