package com.at.apcss.am.spmt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.spmt.mapper.SpmtTrsprtMapper;
import com.at.apcss.am.spmt.service.SpmtTrsprtService;
import com.at.apcss.am.spmt.vo.SpmtTrsprtVO;

@Service("spmtTrsprtService")
public class SpmtTrsprtServiceImpl implements SpmtTrsprtService{

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
}
