package com.at.apcss.am.apc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.apc.mapper.ApcEvrmntStngMapper;
import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;

@Service("comApcService")
public class ApcEvrmntStngServiceImpl implements ApcEvrmntStngService{

	@Autowired
	private ApcEvrmntStngMapper apcEvrmntStngMapper;

	@Override
	public ApcEvrmntStngVO selectApcInfo(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {
		return apcEvrmntStngMapper.selectApcInfo(apcEvrmntStngVO);
	}

}
