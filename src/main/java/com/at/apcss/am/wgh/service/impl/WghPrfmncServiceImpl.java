package com.at.apcss.am.wgh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.wgh.mapper.WghPrfmncMapper;
import com.at.apcss.am.wgh.service.WghPrfmncService;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;

/**
 * @Class Name : WghPrfmncServiceImpl.java
 * @Description : 원물계량 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("wghPrfmncService")
public class WghPrfmncServiceImpl implements WghPrfmncService {

	@Autowired
	private WghPrfmncMapper wghPrfmncMapper;
	
	@Override
	public WghPrfmncVO selectWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception {

		WghPrfmncVO resultVO = wghPrfmncMapper.selectWghPrfmnc(wghPrfmncVO);
		
		return resultVO;
	}

	@Override
	public List<WghPrfmncVO> selectWghPrfmncList(WghPrfmncVO wghPrfmncVO) throws Exception {

		List<WghPrfmncVO> resultList = wghPrfmncMapper.selectWghPrfmncList(wghPrfmncVO);
		
		return resultList;
	}

	@Override
	public int insertWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception {

		int insertedCnt = wghPrfmncMapper.insertWghPrfmnc(wghPrfmncVO);
		
		return insertedCnt;
	}

	@Override
	public int updateWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception {

		int updatedCnt = wghPrfmncMapper.updateWghPrfmnc(wghPrfmncVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteWghPrfmnc(WghPrfmncVO wghPrfmncVO) throws Exception {

		int deletedCnt = wghPrfmncMapper.deleteWghPrfmnc(wghPrfmncVO);
		
		return deletedCnt;
	}
}
