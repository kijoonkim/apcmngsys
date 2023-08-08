package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.FcltLwtpStrgMchnOperInfoMapper;
import com.at.apcss.fm.fclt.service.FcltLwtpStrgMchnOperInfoService;
import com.at.apcss.fm.fclt.vo.FcltLwtpStrgMchnOperInfoVO;


/**
 * @Class Name : FcltLwtpStrgMchnOperInfoServiceImpl.java
 * @Description : 저온저장고운영기간의 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Service("fcltLwtpStrgMchnOperInfoService")
public class FcltLwtpStrgMchnOperInfoServiceImpl implements FcltLwtpStrgMchnOperInfoService{

	@Autowired
	private FcltLwtpStrgMchnOperInfoMapper fcltLwtpStrgMchnOperInfoMapper;

	@Override
	public FcltLwtpStrgMchnOperInfoVO selectFcltLwtpStrgMchnOperInfo(FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO) throws Exception {

		FcltLwtpStrgMchnOperInfoVO resultVO = fcltLwtpStrgMchnOperInfoMapper.selectFcltLwtpStrgMchnOperInfo(fcltLwtpStrgMchnOperInfoVO);

		return resultVO;
	}

	@Override
	public FcltLwtpStrgMchnOperInfoVO selectFcltLwtpStrgMchnOperInfo(String msgKey) throws Exception {

		FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO = new FcltLwtpStrgMchnOperInfoVO();
		fcltLwtpStrgMchnOperInfoVO.setMsgKey(msgKey);

		FcltLwtpStrgMchnOperInfoVO resultVO = fcltLwtpStrgMchnOperInfoMapper.selectFcltLwtpStrgMchnOperInfo(fcltLwtpStrgMchnOperInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltLwtpStrgMchnOperInfoVO> selectFcltLwtpStrgMchnOperInfoList(FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO) throws Exception {

		List<FcltLwtpStrgMchnOperInfoVO> resultList = fcltLwtpStrgMchnOperInfoMapper.selectFcltLwtpStrgMchnOperInfoList(fcltLwtpStrgMchnOperInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltLwtpStrgMchnOperInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltLwtpStrgMchnOperInfo(FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO) throws Exception {

		int insertedCnt = fcltLwtpStrgMchnOperInfoMapper.insertFcltLwtpStrgMchnOperInfo(fcltLwtpStrgMchnOperInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltLwtpStrgMchnOperInfo(FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO) throws Exception {

		int updatedCnt = fcltLwtpStrgMchnOperInfoMapper.updateFcltLwtpStrgMchnOperInfo(fcltLwtpStrgMchnOperInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltLwtpStrgMchnOperInfo(FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO) throws Exception {

		int deletedCnt = fcltLwtpStrgMchnOperInfoMapper.deleteFcltLwtpStrgMchnOperInfo(fcltLwtpStrgMchnOperInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltLwtpStrgMchnOperInfoList(List<FcltLwtpStrgMchnOperInfoVO> fcltLwtpStrgMchnOperInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO : fcltLwtpStrgMchnOperInfoList ) {
			deletedCnt += fcltLwtpStrgMchnOperInfoMapper.deleteFcltLwtpStrgMchnOperInfo(fcltLwtpStrgMchnOperInfoVO);
		}

		return deletedCnt;
	}

}
