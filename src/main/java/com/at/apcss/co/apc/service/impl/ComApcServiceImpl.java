package com.at.apcss.co.apc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.apc.mapper.ComApcMapper;
import com.at.apcss.co.apc.service.ComApcService;
import com.at.apcss.co.apc.vo.ComApcVO;

@Service("comApcService")
public class ComApcServiceImpl implements ComApcService{

	@Autowired
	private ComApcMapper comApcMapper;

	@Override
	public ComApcVO selectApcInfo(ComApcVO comApcVO) throws Exception {
		return comApcMapper.selectApcInfo(comApcVO);
	}

}
