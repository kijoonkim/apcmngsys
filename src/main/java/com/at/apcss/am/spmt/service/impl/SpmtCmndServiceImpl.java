package com.at.apcss.am.spmt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.spmt.mapper.SpmtCmndMapper;
import com.at.apcss.am.spmt.service.SpmtCmndService;
import com.at.apcss.am.spmt.vo.SpmtCmndVO;

/**
 * @Class Name : SpmtCmndServiceImpl.java
 * @Description : 출고지시 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Service("spmtCmndService")
public class SpmtCmndServiceImpl implements SpmtCmndService {

	@Autowired
	private SpmtCmndMapper spmtCmndMapper;
	
	@Override
	public SpmtCmndVO selectSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception {

		SpmtCmndVO resultVO = spmtCmndMapper.selectSpmtCmnd(spmtCmndVO);
		
		return resultVO;
	}

	@Override
	public List<SpmtCmndVO> selectSpmtCmndList(SpmtCmndVO spmtCmndVO) throws Exception {

		List<SpmtCmndVO> resultList = spmtCmndMapper.selectSpmtCmndList(spmtCmndVO);
		
		return resultList;
	}

	public List<OrdrVO> selectSpmtCmndTrgList(OrdrVO ordrVO) throws Exception {

		List<OrdrVO> resultList = spmtCmndMapper.selectSpmtCmndTrgList(ordrVO);

		return resultList;
	}

	@Override
	public int insertSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception {

		int insertedCnt = spmtCmndMapper.insertSpmtCmnd(spmtCmndVO);
		
		return insertedCnt;
	}

	@Override
	public int updateSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception {

		int updatedCnt = spmtCmndMapper.updateSpmtCmnd(spmtCmndVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception {

		int deletedCnt = spmtCmndMapper.deleteSpmtCmnd(spmtCmndVO);
		
		return deletedCnt;
	}
}
