package com.at.apcss.am.apc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.apc.mapper.ApcEvrmntStngMapper;
import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.user.vo.ComUserVO;

@Service("apcEvrmntStngService")
public class ApcEvrmntStngServiceImpl implements ApcEvrmntStngService{

	@Autowired
	private ApcEvrmntStngMapper apcEvrmntStngMapper;

	@Override
	public ApcEvrmntStngVO selectApcInfo(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {
		return apcEvrmntStngMapper.selectApcInfo(apcEvrmntStngVO);
	}

	@Override
	public List<ComUserVO> selectApcUserList(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {
		return apcEvrmntStngMapper.selectApcUserList(apcEvrmntStngVO);
	}

}
