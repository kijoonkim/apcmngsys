package com.at.apcss.co.pms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.pms.mapper.DvlpPrgrsMngMapper;
import com.at.apcss.co.pms.service.DvlpPrgrsMngService;
import com.at.apcss.co.pms.vo.DfctMngVO;
import com.at.apcss.co.pms.vo.DfctVO;
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
			int updatedCnt = dvlpPrgrsMngMapper.updateDvlpPrgrsMng(dvlpPrgrsMngVO);
			updateDvlpStts(dvlpPrgrsMngVO);
		return updatedCnt;
	}

	@Override
	public int updateDvlpStts(DvlpPrgrsMngVO dvlpPrgrsMngVO) throws Exception {
		return dvlpPrgrsMngMapper.updateDvlpStts(dvlpPrgrsMngVO);
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

	@Override
	public int multiDfctList(List<DfctMngVO> dfctMngList) throws Exception {
		int cnt =0;
		for (DfctMngVO dfctMngVO : dfctMngList) {
			if(ComConstants.ROW_STS_INSERT.equals(dfctMngVO.getRowSts())) {
				cnt += insertDfctMng(dfctMngVO);

			}
			if(ComConstants.ROW_STS_UPDATE.equals(dfctMngVO.getRowSts())) {
				cnt += updateDfctMng(dfctMngVO);
			}
			DvlpPrgrsMngVO dvlpPrgrsMngVO = new DvlpPrgrsMngVO();
			dvlpPrgrsMngVO.setPrgrmId(dfctMngVO.getPrgrmId());
			dvlpPrgrsMngVO.setSysLastChgPrgrmId(dfctMngVO.getSysLastChgPrgrmId());
			dvlpPrgrsMngVO.setSysLastChgUserId(dfctMngVO.getSysLastChgUserId());
			updateDvlpStts(dvlpPrgrsMngVO);
		}

		return cnt;
	}

	@Override
	public List<DfctVO> selectDfct(DfctVO dfctVO) throws Exception {
		return dvlpPrgrsMngMapper.selectDfct(dfctVO);
	}

}
