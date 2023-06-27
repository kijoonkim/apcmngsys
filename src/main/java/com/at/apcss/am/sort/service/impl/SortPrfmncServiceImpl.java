package com.at.apcss.am.sort.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.sort.mapper.SortPrfmncMapper;
import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.SortPrfmncVO;

/**
 * @Class Name : SortPrfmncServiceImpl.java
 * @Description : 선별실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("sortPrfmncService")
public class SortPrfmncServiceImpl implements SortPrfmncService {

	@Autowired
	private SortPrfmncMapper sortPrfmncMapper;
	
	@Override
	public SortPrfmncVO selectSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		SortPrfmncVO resultVO = sortPrfmncMapper.selectSortPrfmnc(sortPrfmncVO);
		
		return resultVO;
	}

	@Override
	public List<SortPrfmncVO> selectSortPrfmncList(SortPrfmncVO sortPrfmncVO) throws Exception {

		List<SortPrfmncVO> resultList = sortPrfmncMapper.selectSortPrfmncList(sortPrfmncVO);
		
		return resultList;
	}

	@Override
	public int insertSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		int insertedCnt = sortPrfmncMapper.insertSortPrfmnc(sortPrfmncVO);
		
		return insertedCnt;
	}

	@Override
	public int updateSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		int updatedCnt = sortPrfmncMapper.updateSortPrfmnc(sortPrfmncVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		int deletedCnt = sortPrfmncMapper.deleteSortPrfmnc(sortPrfmncVO);
		
		return deletedCnt;
	}

}
