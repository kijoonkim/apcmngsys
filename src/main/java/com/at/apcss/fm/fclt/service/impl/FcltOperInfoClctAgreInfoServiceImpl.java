package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.FcltOperInfoClctAgreInfoMapper;
import com.at.apcss.fm.fclt.service.FcltOperInfoClctAgreInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperInfoClctAgreInfoVO;


/**
 * @Class Name : FcltOperInfoClctAgreInfoServiceImpl.java
 * @Description : 개인정보이용동의 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltOperInfoClctAgreInfoService")
public class FcltOperInfoClctAgreInfoServiceImpl implements FcltOperInfoClctAgreInfoService{

	@Autowired
	private FcltOperInfoClctAgreInfoMapper fcltOperInfoClctAgreInfoMapper;

	@Override
	public FcltOperInfoClctAgreInfoVO selectFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO) throws Exception {

		FcltOperInfoClctAgreInfoVO resultVO = fcltOperInfoClctAgreInfoMapper.selectFcltOperInfoClctAgreInfo(fcltOperInfoClctAgreInfoVO);

		return resultVO;
	}

	@Override
	public FcltOperInfoClctAgreInfoVO selectFcltOperInfoClctAgreInfo(String msgKey) throws Exception {

		FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO = new FcltOperInfoClctAgreInfoVO();
		fcltOperInfoClctAgreInfoVO.setMsgKey(msgKey);

		FcltOperInfoClctAgreInfoVO resultVO = fcltOperInfoClctAgreInfoMapper.selectFcltOperInfoClctAgreInfo(fcltOperInfoClctAgreInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltOperInfoClctAgreInfoVO> selectFcltOperInfoClctAgreInfoList(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO) throws Exception {

		List<FcltOperInfoClctAgreInfoVO> resultList = fcltOperInfoClctAgreInfoMapper.selectFcltOperInfoClctAgreInfoList(fcltOperInfoClctAgreInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		System.out.println(resultList);
		System.out.println(resultList.toString());
		for (FcltOperInfoClctAgreInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO) throws Exception {
		System.out.println("==========insertFcltOperInfoClctAgreInfo start=============");
		int insertedCnt = fcltOperInfoClctAgreInfoMapper.insertFcltOperInfoClctAgreInfo(fcltOperInfoClctAgreInfoVO);
		System.out.println("==========insertFcltOperInfoClctAgreInfo end=============");
		return insertedCnt;
	}

	@Override
	public int updateFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO) throws Exception {

		int updatedCnt = fcltOperInfoClctAgreInfoMapper.updateFcltOperInfoClctAgreInfo(fcltOperInfoClctAgreInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO) throws Exception {

		int deletedCnt = fcltOperInfoClctAgreInfoMapper.deleteFcltOperInfoClctAgreInfo(fcltOperInfoClctAgreInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltOperInfoClctAgreInfoList(List<FcltOperInfoClctAgreInfoVO> fcltOperInfoClctAgreInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO : fcltOperInfoClctAgreInfoList ) {
			deletedCnt += fcltOperInfoClctAgreInfoMapper.deleteFcltOperInfoClctAgreInfo(fcltOperInfoClctAgreInfoVO);
		}

		return deletedCnt;
	}

}
