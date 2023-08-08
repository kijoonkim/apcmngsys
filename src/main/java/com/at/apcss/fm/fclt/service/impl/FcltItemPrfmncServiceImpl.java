package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.FcltItemPrfmncMapper;
import com.at.apcss.fm.fclt.service.FcltItemPrfmncService;
import com.at.apcss.fm.fclt.vo.FcltItemPrfmncVO;


/**
 * @Class Name : FcltItemPrfmncServiceImpl.java
 * @Description : 산지유통품목처리실적에 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltItemPrfmncService")
public class FcltItemPrfmncServiceImpl implements FcltItemPrfmncService{

	@Autowired
	private FcltItemPrfmncMapper fcltItemPrfmncMapper;

	@Override
	public FcltItemPrfmncVO selectFcltItemPrfmnc(FcltItemPrfmncVO fcltItemPrfmncVO) throws Exception {

		FcltItemPrfmncVO resultVO = fcltItemPrfmncMapper.selectFcltItemPrfmnc(fcltItemPrfmncVO);

		return resultVO;
	}

	@Override
	public FcltItemPrfmncVO selectFcltItemPrfmnc(String msgKey) throws Exception {

		FcltItemPrfmncVO fcltItemPrfmncVO = new FcltItemPrfmncVO();
		fcltItemPrfmncVO.setMsgKey(msgKey);

		FcltItemPrfmncVO resultVO = fcltItemPrfmncMapper.selectFcltItemPrfmnc(fcltItemPrfmncVO);

		return resultVO;
	}

	@Override
	public List<FcltItemPrfmncVO> selectFcltItemPrfmncList(FcltItemPrfmncVO fcltItemPrfmncVO) throws Exception {

		List<FcltItemPrfmncVO> resultList = fcltItemPrfmncMapper.selectFcltItemPrfmncList(fcltItemPrfmncVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltItemPrfmncVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltItemPrfmnc(FcltItemPrfmncVO fcltItemPrfmncVO) throws Exception {

		int insertedCnt = fcltItemPrfmncMapper.insertFcltItemPrfmnc(fcltItemPrfmncVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltItemPrfmnc(FcltItemPrfmncVO fcltItemPrfmncVO) throws Exception {

		int updatedCnt = fcltItemPrfmncMapper.updateFcltItemPrfmnc(fcltItemPrfmncVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltItemPrfmnc(FcltItemPrfmncVO fcltItemPrfmncVO) throws Exception {

		int deletedCnt = fcltItemPrfmncMapper.deleteFcltItemPrfmnc(fcltItemPrfmncVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltItemPrfmncList(List<FcltItemPrfmncVO> fcltItemPrfmncList) throws Exception {

		int deletedCnt = 0;

		for ( FcltItemPrfmncVO fcltItemPrfmncVO : fcltItemPrfmncList ) {
			deletedCnt += fcltItemPrfmncMapper.deleteFcltItemPrfmnc(fcltItemPrfmncVO);
		}

		return deletedCnt;
	}

}
