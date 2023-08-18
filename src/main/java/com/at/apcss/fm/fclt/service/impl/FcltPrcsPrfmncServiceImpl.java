package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.FcltPrcsPrfmncMapper;
import com.at.apcss.fm.fclt.service.FcltPrcsPrfmncService;
import com.at.apcss.fm.fclt.vo.FcltPrcsPrfmncVO;


/**
 * @Class Name : FcltPrcsPrfmncServiceImpl.java
 * @Description : 산지유통품목처리실적 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 정연두
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
@Service("fcltPrcsPrfmncService")
public class FcltPrcsPrfmncServiceImpl implements FcltPrcsPrfmncService{

	@Autowired
	private FcltPrcsPrfmncMapper fcltPrcsPrfmncMapper;

	@Override
	public FcltPrcsPrfmncVO selectFcltPrcsPrfmnc(FcltPrcsPrfmncVO fcltPrcsPrfmncVO) throws Exception {

		FcltPrcsPrfmncVO resultVO = fcltPrcsPrfmncMapper.selectFcltPrcsPrfmnc(fcltPrcsPrfmncVO);

		return resultVO;
	}

	@Override
	public FcltPrcsPrfmncVO selectFcltPrcsPrfmnc(String msgKey) throws Exception {

		FcltPrcsPrfmncVO fcltPrcsPrfmncVO = new FcltPrcsPrfmncVO();

		FcltPrcsPrfmncVO resultVO = fcltPrcsPrfmncMapper.selectFcltPrcsPrfmnc(fcltPrcsPrfmncVO);

		return resultVO;
	}

	@Override
	public List<FcltPrcsPrfmncVO> selectFcltPrcsPrfmncList(FcltPrcsPrfmncVO fcltPrcsPrfmncVO) throws Exception {

		List<FcltPrcsPrfmncVO> resultList = fcltPrcsPrfmncMapper.selectFcltPrcsPrfmncList(fcltPrcsPrfmncVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltPrcsPrfmncVO msg : resultList ) {
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltPrcsPrfmnc(FcltPrcsPrfmncVO fcltPrcsPrfmncVO) throws Exception {

		int insertedCnt = fcltPrcsPrfmncMapper.insertFcltPrcsPrfmnc(fcltPrcsPrfmncVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltPrcsPrfmnc(FcltPrcsPrfmncVO fcltPrcsPrfmncVO) throws Exception {

		int updatedCnt = fcltPrcsPrfmncMapper.updateFcltPrcsPrfmnc(fcltPrcsPrfmncVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltPrcsPrfmnc(FcltPrcsPrfmncVO fcltPrcsPrfmncVO) throws Exception {

		int deletedCnt = fcltPrcsPrfmncMapper.deleteFcltPrcsPrfmnc(fcltPrcsPrfmncVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltPrcsPrfmncList(List<FcltPrcsPrfmncVO> fcltPrcsPrfmncList) throws Exception {

		int deletedCnt = 0;

		for ( FcltPrcsPrfmncVO fcltPrcsPrfmncVO : fcltPrcsPrfmncList ) {
			deletedCnt += fcltPrcsPrfmncMapper.deleteFcltPrcsPrfmnc(fcltPrcsPrfmncVO);
		}

		return deletedCnt;
	}

}
