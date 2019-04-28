package com.etms.terminalCommand.MyThread;

import com.etms.core.mapper.BaseMapper;
import com.etms.terminalCommand.mapper.TBdTerminalCommandMapper;

public class MyRunnable<T, M> implements Runnable {
	
	private T entity; //为了传递参数
	private M mapper;  //为了操作数据库
	private	TBdTerminalCommandMapper tBdTerminalCommandMapper;
	private Integer ID = 0;
	private Integer waiting_time;
	
	@Override
	public void run() {
		try {
			System.out.println("线程已开启，ID："+ID);
			Thread.sleep(waiting_time);
			int count1 = tBdTerminalCommandMapper.selectByIdAndResultType(ID);
			int count2 = tBdTerminalCommandMapper.selectNotSuccess(ID);
			if(count1 > 0){
				tBdTerminalCommandMapper.updateResultType(ID); //如果过完waiting_time，count1>0,说明为等待操作，硬件没进行操作，将其置为执行超时。
			}
			if(count2 > 0){
				((BaseMapper<T>) mapper).update(entity);//如果count>0,说明没有操作成功，进行回滚操作。
			}
			
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void setID(int ID) {
		this.ID = ID;
	}

	public void setMapper(M mapper) {
		this.mapper = mapper;
	}
	
	public void setEntity(T entity) {
		this.entity = entity;
	}

	public void settBdTerminalCommandMapper(TBdTerminalCommandMapper tBdTerminalCommandMapper) {
		this.tBdTerminalCommandMapper = tBdTerminalCommandMapper;
	}

	public void setWaiting_time(Integer waiting_time) {
		this.waiting_time = waiting_time;
	}
	
	
	
	
}
