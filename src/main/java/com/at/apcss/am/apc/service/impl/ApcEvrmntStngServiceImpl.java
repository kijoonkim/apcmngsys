package com.at.apcss.am.apc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.apc.mapper.ApcEvrmntStngMapper;
import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.user.vo.ComUserVO;

@Service("apcEvrmntStngService")
public class ApcEvrmntStngServiceImpl implements ApcEvrmntStngService{

	@Autowired
	private ApcEvrmntStngMapper apcEvrmntStngMapper;

	@Override
	public ApcEvrmntStngVO selectApcInfo(ComUserVO comUserVO) throws Exception {
		return apcEvrmntStngMapper.selectApcInfo(comUserVO);
	}
	
	@Override
	public List<ApcEvrmntStngVO> selectApcDsctnList(ApcEvrmntStngVO ApcEvrmntStngVO) throws Exception {
		return apcEvrmntStngMapper.selectApcDsctnList(ApcEvrmntStngVO);
	}

	@Override
	public List<ComUserVO> selectApcUserList(ComUserVO comUserVO) throws Exception {
		return apcEvrmntStngMapper.selectApcUserList(comUserVO);
	}

	@Override
	public List<ComUserVO> selectRsrcList(ComCdVO comCdVO) throws Exception {
		return apcEvrmntStngMapper.selectRsrcList(comCdVO);
	}

	@Override
	public ApcEvrmntStngVO selectUserAprvReg(ComUserVO comUserVO) throws Exception {
		return null;
	}

}
