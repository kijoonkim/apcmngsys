package com.at.apcss.am.apc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.apc.mapper.ApcInfoMapper;
import com.at.apcss.am.apc.service.ApcInfoService;
import com.at.apcss.am.apc.vo.ApcInfoVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

@Service("apcInfoService")
public class ApcInfoServiceImpl extends BaseServiceImpl implements ApcInfoService{

	@Autowired
	private ApcInfoMapper apcInfoMapper;

	@Override
	public ApcInfoVO selectApcInfo(ApcInfoVO apcInfoVO) throws Exception {
		
		ApcInfoVO resultVO = apcInfoMapper.selectApcInfo(apcInfoVO);
		
		return resultVO;
	}

	@Override
	public List<ApcInfoVO> selectApcInfoList(ApcInfoVO apcInfoVO) throws Exception {

		List<ApcInfoVO> resultList = apcInfoMapper.selectApcInfoList(apcInfoVO);
		
		return resultList;
	}


}
