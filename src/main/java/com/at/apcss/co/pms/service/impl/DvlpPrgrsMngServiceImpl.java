package com.at.apcss.co.pms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.pms.mapper.DvlpPrgrsMngMapper;
import com.at.apcss.co.pms.service.DvlpPrgrsMngService;
import com.at.apcss.co.pms.vo.DfctMngVO;
import com.at.apcss.co.pms.vo.DvlpPrgrsMngVO;

@Service("dvlpPrgrsMngService")
public class DvlpPrgrsMngServiceImpl implements DvlpPrgrsMngService {

	@Autowired
	private DvlpPrgrsMngMapper dvlpPrgrsMngMapper;

	@Override
	public List<DvlpPrgrsMngVO> selectDvlpPrgrsMngList(DvlpPrgrsMngVO dvlpPrgrsMngVO) throws Exception {
		return dvlpPrgrsMngMapper.selectDvlpPrgrsMngList(dvlpPrgrsMngVO);
	}

	@Override
	public int updateDvlpPrgrsMng(DvlpPrgrsMngVO dvlpPrgrsMngVO) throws Exception {
		return dvlpPrgrsMngMapper.updateDvlpPrgrsMng(dvlpPrgrsMngVO);
	}

	@Override
	public List<DfctMngVO> selectDfctMngList(DfctMngVO dfctMngVO) throws Exception {
		return dvlpPrgrsMngMapper.selectDfctMngList(dfctMngVO);
	}

	@Override
	public int insertDfctMng(DfctMngVO dfctMngVO) throws Exception {
		return dvlpPrgrsMngMapper.insertDfctMng(dfctMngVO);
	}

	@Override
	public int updateDfctMng(DfctMngVO dfctMngVO) throws Exception {
		return dvlpPrgrsMngMapper.updateDfctMng(dfctMngVO);
	}

	@Override
	public int deleteDfctMng(DfctMngVO dfctMngVO) throws Exception {
		return dvlpPrgrsMngMapper.deleteDfctMng(dfctMngVO);
	}

}
