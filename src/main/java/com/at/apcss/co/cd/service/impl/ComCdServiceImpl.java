package com.at.apcss.co.cd.service.impl;

import java.util.ArrayList;
import java.util.List;

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
	public ComCdVO selectComCd(ComCdVO comCdVO) throws Exception {

		return comCdMapper.selectComCd(comCdVO);
	}

	@Override
	public List<ComCdVO> selectComCdList(ComCdVO comCdVO) throws Exception {

		List<ComCdVO> resultList = new ArrayList<>();
		resultList = comCdMapper.selectComCdList(comCdVO);
		return resultList;
	}

	@Override
	public List<ComCdVO> selectComCdDtlList(ComCdVO comCdVO) throws Exception {

		List<ComCdVO> resultList = new ArrayList<>();
		resultList = comCdMapper.selectComCdDtlList(comCdVO);
		return resultList;
	}

	@Override
	public int insertComCd(ComCdVO comCdVO) throws Exception {
		return comCdMapper.insertComCd(comCdVO);
	}

	@Override
	public int updateComCd(ComCdVO comCdVO) throws Exception {
		return comCdMapper.updateComCd(comCdVO);
	}

	@Override
	public int deleteComCd(ComCdVO comCdVO) throws Exception {
		return comCdMapper.deleteComCd(comCdVO);
	}

	@Override
	public int insertComCdDtl(ComCdVO comCdVO) throws Exception {
		return comCdMapper.insertComCdDtl(comCdVO);
	}

	@Override
	public int updateComCdDtl(ComCdVO comCdVO) throws Exception {
		return comCdMapper.updateComCdDtl(comCdVO);
	}

	@Override
	public int deleteComCdDtl(ComCdVO comCdVO) throws Exception {
		return comCdMapper.deleteComCdDtl(comCdVO);
	}

	@Override
	public List<ComCdVO> selectComBoCdDtlList(ComCdVO comCdVO) throws Exception {
		List<ComCdVO> resultList = new ArrayList<>();
		resultList = comCdMapper.selectComBoCdDtlList(comCdVO);
		return resultList;
	}

	@Override
	public ComCdVO selectComCdDtl(ComCdVO comCdVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int duplicateCheckCdId(ComCdVO comCdVO) throws Exception {
		return comCdMapper.duplicateCheckCdId(comCdVO);
	}

	@Override
	public int duplicateCheckCdIdDtl(ComCdVO comCdVO) throws Exception {
		return comCdMapper.duplicateCheckCdIdDtl(comCdVO);
	}

	@Override
	public int updateComCdDtlDelYn(ComCdVO comCdVO) {
		return comCdMapper.updateComCdDtlDelYn(comCdVO);
	}

	@Override
	public int comCdDtlDelYnAll(ComCdVO comCdVO) {
		return comCdMapper.comCdDtlDelYnAll(comCdVO);
	}


}
