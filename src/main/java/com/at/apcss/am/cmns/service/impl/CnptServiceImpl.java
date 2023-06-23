package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.CnptMapper;
import com.at.apcss.am.cmns.service.CnptService;
import com.at.apcss.am.cmns.vo.CnptVO;

/**
 * @Class Name : CnptServiceImpl.java
 * @Description : 거래처정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("cnptService")
public class CnptServiceImpl implements CnptService {
	
	@Autowired
	private CnptMapper cnptMapper;
	
	@Override
	public CnptVO selectCnpt(CnptVO cnptVO) throws Exception {
		
		CnptVO resultVO = cnptMapper.selectCnpt(cnptVO);
		
		return resultVO;
	}

	@Override
	public List<CnptVO> selectCnptList(CnptVO cnptVO) throws Exception {
		
		List<CnptVO> resultList = cnptMapper.selectCnptList(cnptVO);
		
		return resultList;
	}

	@Override
	public int insertCnpt(CnptVO cnptVO) throws Exception {
		
		int insertedCnt = cnptMapper.insertCnpt(cnptVO);
		
		return insertedCnt;
	}

	@Override
	public int updateCnpt(CnptVO cnptVO) throws Exception {

		int updatedCnt = cnptMapper.updateCnpt(cnptVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteCnpt(CnptVO cnptVO) throws Exception {

		int deletedCnt = cnptMapper.deleteCnpt(cnptVO);
		
		return deletedCnt;
	}

}
