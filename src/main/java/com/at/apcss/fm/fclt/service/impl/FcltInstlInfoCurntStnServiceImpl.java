package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltInstlInfoCurntStnMapper;
import com.at.apcss.fm.fclt.service.FcltInstlInfoCurntStnService;
import com.at.apcss.fm.fclt.vo.FcltInstlInfoCurntStnVO;


/**
 * @Class Name : FcltInstlInfoCurntStnServiceImpl.java
 * @Description : 시설설치보완 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltInstlInfoCurntStnService")
public class FcltInstlInfoCurntStnServiceImpl extends BaseServiceImpl implements FcltInstlInfoCurntStnService{

	@Autowired
	private FcltInstlInfoCurntStnMapper fcltInstlInfoCurntStnMapper;

	@Override
	public FcltInstlInfoCurntStnVO selectFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO) throws Exception {

		FcltInstlInfoCurntStnVO resultVO = fcltInstlInfoCurntStnMapper.selectFcltInstlInfoCurntStn(fcltInstlInfoCurntStnVO);

		return resultVO;
	}

	@Override
	public FcltInstlInfoCurntStnVO selectFcltInstlInfoCurntStn(String msgKey) throws Exception {

		FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO = new FcltInstlInfoCurntStnVO();
		fcltInstlInfoCurntStnVO.setMsgKey(msgKey);

		FcltInstlInfoCurntStnVO resultVO = fcltInstlInfoCurntStnMapper.selectFcltInstlInfoCurntStn(fcltInstlInfoCurntStnVO);

		return resultVO;
	}

	@Override
	public List<FcltInstlInfoCurntStnVO> selectFcltInstlInfoCurntStnList(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO) throws Exception {

		List<FcltInstlInfoCurntStnVO> resultList = fcltInstlInfoCurntStnMapper.selectFcltInstlInfoCurntStnList(fcltInstlInfoCurntStnVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltInstlInfoCurntStnVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO) throws Exception {

		int insertedCnt = fcltInstlInfoCurntStnMapper.insertFcltInstlInfoCurntStn(fcltInstlInfoCurntStnVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO) throws Exception {

		int updatedCnt = fcltInstlInfoCurntStnMapper.updateFcltInstlInfoCurntStn(fcltInstlInfoCurntStnVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO) throws Exception {

		int deletedCnt = fcltInstlInfoCurntStnMapper.deleteFcltInstlInfoCurntStn(fcltInstlInfoCurntStnVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltInstlInfoCurntStnList(List<FcltInstlInfoCurntStnVO> fcltInstlInfoCurntStnList) throws Exception {

		int deletedCnt = 0;

		for ( FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO : fcltInstlInfoCurntStnList ) {
			deletedCnt += fcltInstlInfoCurntStnMapper.deleteFcltInstlInfoCurntStn(fcltInstlInfoCurntStnVO);
		}

		return deletedCnt;
	}

}
