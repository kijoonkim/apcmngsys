package com.at.apcss.am.spmt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.spmt.mapper.SpmtTrsprtMapper;
import com.at.apcss.am.spmt.service.SpmtTrsprtService;
import com.at.apcss.am.spmt.vo.SpmtTrsprtVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

@Service("spmtTrsprtService")
public class SpmtTrsprtServiceImpl extends BaseServiceImpl implements SpmtTrsprtService{

	@Autowired
	private SpmtTrsprtMapper spmtTrsprtMapper;

	@Override
	public SpmtTrsprtVO selectSpmtTrsprt(SpmtTrsprtVO spmtTrsprtVO) throws Exception {
		return spmtTrsprtMapper.selectSpmtTrsprt(spmtTrsprtVO);
	}

	@Override
	public List<SpmtTrsprtVO> selectSpmtTrsprtList(SpmtTrsprtVO spmtTrsprtVO) throws Exception {
		return spmtTrsprtMapper.selectSpmtTrsprtList(spmtTrsprtVO);
	}

	@Override
	public int insertSpmtTrsprt(SpmtTrsprtVO spmtTrsprtVO) throws Exception {
		return spmtTrsprtMapper.insertSpmtTrsprt(spmtTrsprtVO);
	}

	@Override
	public int updateSpmtTrsprt(SpmtTrsprtVO spmtTrsprtVO) throws Exception {
		return spmtTrsprtMapper.updateSpmtTrsprt(spmtTrsprtVO);
	}

	@Override
	public HashMap<String, Object> deleteSpmtTrsprt(SpmtTrsprtVO spmtTrsprtVO) throws Exception {

		String errMsg = spmtTrsprtDelible(spmtTrsprtVO);

		if(errMsg == null) {
			if(0 == spmtTrsprtMapper.deleteSpmtTrsprt(spmtTrsprtVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
			}
		}else {
			return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, errMsg); // E0000	{0}
		}

		return null;

	}

	@Override
	public HashMap<String, Object> multiSpmtTrsprt(List<SpmtTrsprtVO> spmtTrsprtList) throws Exception {

		List<SpmtTrsprtVO> insertList = new ArrayList<>();
		List<SpmtTrsprtVO> updateList = new ArrayList<>();

		for (SpmtTrsprtVO rgnTrsprtCstVO : spmtTrsprtList) {
			SpmtTrsprtVO vo = new SpmtTrsprtVO();
			BeanUtils.copyProperties(rgnTrsprtCstVO, vo);

			if (ComConstants.ROW_STS_INSERT.equals(rgnTrsprtCstVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(rgnTrsprtCstVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		for (SpmtTrsprtVO rgnTrsprtCstVO : insertList) {
			spmtTrsprtMapper.insertSpmtTrsprt(rgnTrsprtCstVO);
		}

		for (SpmtTrsprtVO rgnTrsprtCstVO : updateList) {
			spmtTrsprtMapper.updateSpmtTrsprt(rgnTrsprtCstVO);
		}
		return null;
	}

	@Override
	public String spmtTrsprtDelible(SpmtTrsprtVO spmtTrsprtVO) throws Exception {
		List<SpmtTrsprtVO> resultList = spmtTrsprtMapper.spmtTrsprtDelible(spmtTrsprtVO);

		if(resultList.size() > 0) {
			String delible = "해당 운송사는 ";
			for (int i = 0; i < resultList.size(); i++) {
				if(i == 0) {
					delible += resultList.get(i).getDelible();
				}else {
					delible += ", "+resultList.get(i).getDelible();
				}
			}
			delible += "이/가 존재 합니다.";

			return delible;
		}

		return null;
	}

	@Override
	public int updateTrsprtCo(SpmtTrsprtVO spmtTrsprtVO) throws Exception {
		spmtTrsprtMapper.updateTrsprtCo(spmtTrsprtVO);
		return 0;
	}

	@Override
	public HashMap<String, Object> updateTrsprtCoList(List<SpmtTrsprtVO> spmtTrsprtList) throws Exception {
		for (SpmtTrsprtVO spmtTrsprtVO : spmtTrsprtList) {
			updateTrsprtCo(spmtTrsprtVO);
		}
		return null;
	}
}
