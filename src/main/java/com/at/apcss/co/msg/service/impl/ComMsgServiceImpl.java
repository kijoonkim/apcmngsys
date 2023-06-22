package com.at.apcss.co.msg.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.at.apcss.co.msg.service.ComMsgService;
import com.at.apcss.co.msg.vo.ComMsgVO;

@Service("comMsgService")
public class ComMsgServiceImpl implements ComMsgService{

	@Override
	public List<ComMsgVO> selectComMsgList(ComMsgVO comMsgVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ComMsgVO selectComMsg(ComMsgVO comMsgVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ComMsgVO selectComMsg(String msgKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertComMsg(ComMsgVO comMsgVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComMsg(ComMsgVO comMsgVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComMsg(ComMsgVO comMsgVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
