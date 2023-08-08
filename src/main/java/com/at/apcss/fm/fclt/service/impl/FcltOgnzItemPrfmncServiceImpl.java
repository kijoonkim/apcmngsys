package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.FcltOgnzItemPrfmncMapper;
import com.at.apcss.fm.fclt.service.FcltOgnzItemPrfmncService;
import com.at.apcss.fm.fclt.vo.FcltOgnzItemPrfmncVO;


/**
 * @Class Name : FcltOgnzItemPrfmncServiceImpl.java
 * @Description : 유통품목처리실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltOgnzItemPrfmncService")
public class FcltOgnzItemPrfmncServiceImpl implements FcltOgnzItemPrfmncService{

	@Autowired
	private FcltOgnzItemPrfmncMapper fcltOgnzItemPrfmncMapper;

	@Override
	public FcltOgnzItemPrfmncVO selectFcltOgnzItemPrfmnc(FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO) throws Exception {

		FcltOgnzItemPrfmncVO resultVO = fcltOgnzItemPrfmncMapper.selectFcltOgnzItemPrfmnc(fcltOgnzItemPrfmncVO);

		return resultVO;
	}

	@Override
	public FcltOgnzItemPrfmncVO selectFcltOgnzItemPrfmnc(String msgKey) throws Exception {

		FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO = new FcltOgnzItemPrfmncVO();
		fcltOgnzItemPrfmncVO.setMsgKey(msgKey);

		FcltOgnzItemPrfmncVO resultVO = fcltOgnzItemPrfmncMapper.selectFcltOgnzItemPrfmnc(fcltOgnzItemPrfmncVO);

		return resultVO;
	}

	@Override
	public List<FcltOgnzItemPrfmncVO> selectFcltOgnzItemPrfmncList(FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO) throws Exception {

		List<FcltOgnzItemPrfmncVO> resultList = fcltOgnzItemPrfmncMapper.selectFcltOgnzItemPrfmncList(fcltOgnzItemPrfmncVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltOgnzItemPrfmncVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltOgnzItemPrfmnc(FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO) throws Exception {

		int insertedCnt = fcltOgnzItemPrfmncMapper.insertFcltOgnzItemPrfmnc(fcltOgnzItemPrfmncVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltOgnzItemPrfmnc(FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO) throws Exception {

		int updatedCnt = fcltOgnzItemPrfmncMapper.updateFcltOgnzItemPrfmnc(fcltOgnzItemPrfmncVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltOgnzItemPrfmnc(FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO) throws Exception {

		int deletedCnt = fcltOgnzItemPrfmncMapper.deleteFcltOgnzItemPrfmnc(fcltOgnzItemPrfmncVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltOgnzItemPrfmncList(List<FcltOgnzItemPrfmncVO> fcltOgnzItemPrfmncList) throws Exception {

		int deletedCnt = 0;

		for ( FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO : fcltOgnzItemPrfmncList ) {
			deletedCnt += fcltOgnzItemPrfmncMapper.deleteFcltOgnzItemPrfmnc(fcltOgnzItemPrfmncVO);
		}

		return deletedCnt;
	}

}
