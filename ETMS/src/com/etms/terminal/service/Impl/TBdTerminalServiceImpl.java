package com.etms.terminal.service.Impl;


import org.springframework.stereotype.Service;
import com.etms.core.service.Impl.BaseServiceImpl;
import com.etms.terminal.pojo.TBdTerminal;
import com.etms.terminal.service.TBdTerminalService;


@Service("tBdTerminalService")
public class TBdTerminalServiceImpl extends BaseServiceImpl<TBdTerminal> implements TBdTerminalService {
		
		@Override
		public int insert(TBdTerminal TBdTerminal) throws Exception {
			int i = tBdTerminalMapper.insert(TBdTerminal);
			// TODO Auto-generated method stub
		return i;
		}

		@Override
		public int deleteList(String[] pks) throws Exception {
			int deleteList = tBdTerminalMapper.deleteList(pks);
			return deleteList;
		}
}
