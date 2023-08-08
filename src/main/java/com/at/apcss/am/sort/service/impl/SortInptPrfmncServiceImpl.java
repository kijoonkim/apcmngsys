package com.at.apcss.am.sort.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.sort.mapper.SortInptPrfmncMapper;
import com.at.apcss.am.sort.service.SortInptPrfmncService;
import com.at.apcss.am.sort.vo.SortInptPrfmncVO;

/**
 * @Class Name : SortInptPrfmncServiceImpl.java
 * @Description : 선별투입실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("sortInptPrfmncService")
public class SortInptPrfmncServiceImpl implements SortInptPrfmncService {

	@Autowired
	private SortInptPrfmncMapper sortInptPrfmncMapper;
	
	@Override
	public SortInptPrfmncVO selectSortInptPrfmnc(SortInptPrfmncVO sortInptPrfmncVO) throws Exception {
		
		SortInptPrfmncVO resultVO = sortInptPrfmncMapper.selectSortInptPrfmnc(sortInptPrfmncVO);
		
		return resultVO;
	}

	@Override
	public List<SortInptPrfmncVO> selectSortInptPrfmncList(SortInptPrfmncVO sortInptPrfmncVO) throws Exception {
		
		List<SortInptPrfmncVO> resultList = sortInptPrfmncMapper.selectSortInptPrfmncList(sortInptPrfmncVO);
		
		return resultList;
	}

	@Override
	public HashMap<String, Object> insertSortInptPrfmnc(SortInptPrfmncVO sortInptPrfmncVO) throws Exception {
		
		int insertedCnt = sortInptPrfmncMapper.insertSortInptPrfmnc(sortInptPrfmncVO);
		
		return null;
	}

	@Override
	public HashMap<String, Object> insertSortInptPrfmncList(List<SortInptPrfmncVO> sortInptPrfmncList) throws Exception {

		for ( SortInptPrfmncVO sortInptPrfmncVO : sortInptPrfmncList ) {
			sortInptPrfmncMapper.insertSortInptPrfmnc(sortInptPrfmncVO);
		}
		
		return null;
	}
	
	@Override
	public HashMap<String, Object> updateSortInptPrfmnc(SortInptPrfmncVO sortInptPrfmncVO) throws Exception {
		
		int updatedCnt = sortInptPrfmncMapper.updateSortInptPrfmnc(sortInptPrfmncVO);
		
		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortInptPrfmnc(SortInptPrfmncVO sortInptPrfmncVO) throws Exception {
		
		int deletedCnt = sortInptPrfmncMapper.deleteSortInptPrfmnc(sortInptPrfmncVO);
		
		return null;
	}



}
