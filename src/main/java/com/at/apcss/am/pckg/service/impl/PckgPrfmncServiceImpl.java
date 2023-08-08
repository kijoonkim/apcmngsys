package com.at.apcss.am.pckg.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.pckg.mapper.PckgPrfmncMapper;
import com.at.apcss.am.pckg.service.PckgPrfmncService;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : PckgPrfmncServiceImpl.java
 * @Description : 포장실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("pckgPrfmncService")
public class PckgPrfmncServiceImpl extends BaseServiceImpl implements PckgPrfmncService {

	@Autowired
	private PckgPrfmncMapper pckgPrfmncMapper;
	
	@Override
	public PckgPrfmncVO selectPckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception {

		PckgPrfmncVO resultVO = pckgPrfmncMapper.selectPckgPrfmnc(pckgPrfmncVO);
		
		return resultVO;
	}

	@Override
	public List<PckgPrfmncVO> selectPckgPrfmncList(PckgPrfmncVO pckgPrfmncVO) throws Exception {

		List<PckgPrfmncVO> resultList = pckgPrfmncMapper.selectPckgPrfmncList(pckgPrfmncVO);
		
		return resultList;
	}

	@Override
	public HashMap<String, Object> insertPckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception {

		int insertedCnt = pckgPrfmncMapper.insertPckgPrfmnc(pckgPrfmncVO);
		
		return null;
	}


	@Override
	public HashMap<String, Object> insertPckgPrfmncList(List<PckgPrfmncVO> pckgPrfmncList) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public HashMap<String, Object> updatePckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception {

		int updatedCnt = pckgPrfmncMapper.updatePckgPrfmnc(pckgPrfmncVO);
		
		return null;
	}

	@Override
	public HashMap<String, Object> deletePckgPrfmnc(PckgPrfmncVO pckgPrfmncVO) throws Exception {

		int deletedCnt = pckgPrfmncMapper.deletePckgPrfmnc(pckgPrfmncVO);
		
		return null;
	}

}
