package com.at.apcss.am.spmt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.spmt.mapper.SpmtTrsprtMapper;
import com.at.apcss.am.spmt.service.SpmtTrsprtService;
import com.at.apcss.am.spmt.vo.SpmtTrsprtVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

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
	public int deleteSpmtTrsprt(SpmtTrsprtVO spmtTrsprtVO) throws Exception {
		return spmtTrsprtMapper.deleteSpmtTrsprt(spmtTrsprtVO);
	}

	@Override
	public HashMap<String, Object> multiSpmtTrsprt(List<SpmtTrsprtVO> spmtTrsprtList) throws Exception {
		// TODO Auto-generated method stub

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
}
