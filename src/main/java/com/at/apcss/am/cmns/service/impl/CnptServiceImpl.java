package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.CnptMapper;
import com.at.apcss.am.cmns.service.CnptService;
import com.at.apcss.am.cmns.vo.CnptVO;
import com.at.apcss.am.cmns.vo.LgszMrktVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

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
public class CnptServiceImpl extends BaseServiceImpl implements CnptService {
	
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
	public HashMap<String, Object> insertCnptList(List<CnptVO> cnptList) throws Exception {
		
		if (cnptList == null || cnptList.isEmpty()) {
			ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등록대상");	// W0005	{0}이/가 없습니다.
		}
		
		for ( CnptVO cnptVO : cnptList ) {
			cnptMapper.insertCnpt(cnptVO);
		}
		
		return null;
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

	@Override
	public List<LgszMrktVO> selectLgszMrktList(LgszMrktVO lgszMrktVO) throws Exception {

		List<LgszMrktVO> resultList = cnptMapper.selectLgszMrktList(lgszMrktVO);

		return resultList;
	}

	@Override
	public int updateLgszMrkt(LgszMrktVO lgszMrktVO) throws Exception {

		int updatedCnt = cnptMapper.updateLgszMrkt(lgszMrktVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> insertLgszMrktList(List<LgszMrktVO> lgszMrktList) throws Exception {
		
		if (lgszMrktList == null || lgszMrktList.isEmpty()) {
			ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등록대상");	// W0005	{0}이/가 없습니다.
		}
		
		for ( LgszMrktVO lgszMrktVO : lgszMrktList ) {
			cnptMapper.insertLgszMrkt(lgszMrktVO);
		}
		
		return null;
	}
	
}
