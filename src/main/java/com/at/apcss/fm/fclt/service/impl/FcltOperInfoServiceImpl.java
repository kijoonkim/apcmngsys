package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.FcltOperInfoMapper;
import com.at.apcss.fm.fclt.service.FcltOperInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperInfoVO;


/**
 * @Class Name : FcltOperInfoServiceImpl.java
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
@Service("fcltOperInfoService")
public class FcltOperInfoServiceImpl implements FcltOperInfoService{

	@Autowired
	private FcltOperInfoMapper fcltOperInfoMapper;

	@Override
	public FcltOperInfoVO selectFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception {

		FcltOperInfoVO resultVO = fcltOperInfoMapper.selectFcltOperInfo(fcltOperInfoVO);

		return resultVO;
	}

	@Override
	public FcltOperInfoVO selectFcltOperInfo(String msgKey) throws Exception {

		FcltOperInfoVO fcltOperInfoVO = new FcltOperInfoVO();
		fcltOperInfoVO.setMsgKey(msgKey);

		FcltOperInfoVO resultVO = fcltOperInfoMapper.selectFcltOperInfo(fcltOperInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltOperInfoVO> selectFcltOperInfoList(FcltOperInfoVO fcltOperInfoVO) throws Exception {

		List<FcltOperInfoVO> resultList = fcltOperInfoMapper.selectFcltOperInfoList(fcltOperInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltOperInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception {

		int insertedCnt = fcltOperInfoMapper.insertFcltOperInfo(fcltOperInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception {

		int updatedCnt = fcltOperInfoMapper.updateFcltOperInfo(fcltOperInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception {

		int deletedCnt = fcltOperInfoMapper.deleteFcltOperInfo(fcltOperInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltOperInfoList(List<FcltOperInfoVO> fcltOperInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltOperInfoVO fcltOperInfoVO : fcltOperInfoList ) {
			deletedCnt += fcltOperInfoMapper.deleteFcltOperInfo(fcltOperInfoVO);
		}

		return deletedCnt;
	}

}
