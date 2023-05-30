package com.at.apcss.co.cd.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.mapper.ComCdMapper;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;

@Service("comCdService")
public class ComCdServiceImpl implements ComCdService {

	@Autowired
	private ComCdMapper comCdMapper;

	@Override
	public ArrayList<ComCdVO> selectComCd(ComCdVO comCdVO) throws Exception {

		return comCdMapper.selectComCd(comCdVO);
	}


}
