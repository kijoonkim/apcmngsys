package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.FcltLwtpStrgMchnInfoMapper;
import com.at.apcss.fm.fclt.service.FcltLwtpStrgMchnInfoService;
import com.at.apcss.fm.fclt.vo.FcltLwtpStrgMchnInfoVO;


/**
 * @Class Name : FcltLwtpStrgMchnInfoServiceImpl.java
 * @Description : 공통메시지 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltLwtpStrgMchnInfoService")
public class FcltLwtpStrgMchnInfoServiceImpl implements FcltLwtpStrgMchnInfoService{

	@Autowired
	private FcltLwtpStrgMchnInfoMapper fcltLwtpStrgMchnInfoMapper;

	@Override
	public FcltLwtpStrgMchnInfoVO selectFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception {

		FcltLwtpStrgMchnInfoVO resultVO = fcltLwtpStrgMchnInfoMapper.selectFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);

		return resultVO;
	}

	@Override
	public FcltLwtpStrgMchnInfoVO selectFcltLwtpStrgMchnInfo(String msgKey) throws Exception {

		FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO = new FcltLwtpStrgMchnInfoVO();
		fcltLwtpStrgMchnInfoVO.setMsgKey(msgKey);

		FcltLwtpStrgMchnInfoVO resultVO = fcltLwtpStrgMchnInfoMapper.selectFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltLwtpStrgMchnInfoVO> selectFcltLwtpStrgMchnInfoList(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception {

		List<FcltLwtpStrgMchnInfoVO> resultList = fcltLwtpStrgMchnInfoMapper.selectFcltLwtpStrgMchnInfoList(fcltLwtpStrgMchnInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltLwtpStrgMchnInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception {

		int insertedCnt = fcltLwtpStrgMchnInfoMapper.insertFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception {

		int updatedCnt = fcltLwtpStrgMchnInfoMapper.updateFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception {

		int deletedCnt = fcltLwtpStrgMchnInfoMapper.deleteFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltLwtpStrgMchnInfoList(List<FcltLwtpStrgMchnInfoVO> fcltLwtpStrgMchnInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO : fcltLwtpStrgMchnInfoList ) {
			deletedCnt += fcltLwtpStrgMchnInfoMapper.deleteFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);
		}

		return deletedCnt;
	}

}
