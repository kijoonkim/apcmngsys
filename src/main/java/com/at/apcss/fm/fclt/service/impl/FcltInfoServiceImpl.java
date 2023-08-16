package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.FcltInfoMapper;
import com.at.apcss.fm.fclt.service.FcltInfoService;
import com.at.apcss.fm.fclt.vo.FcltInfoVO;


/**
 * @Class Name : FcltInfoServiceImpl.java
 * @Description : 시설현황 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltInfoService")
public class FcltInfoServiceImpl implements FcltInfoService{

	@Autowired
	private FcltInfoMapper fcltInfoMapper;

	@Override
	public FcltInfoVO selectFcltInfo(FcltInfoVO fcltInfoVO) throws Exception {

		FcltInfoVO resultVO = fcltInfoMapper.selectFcltInfo(fcltInfoVO);

		return resultVO;
	}

	@Override
	public FcltInfoVO selectFcltInfo(String msgKey) throws Exception {

		FcltInfoVO fcltInfoVO = new FcltInfoVO();
		fcltInfoVO.setMsgKey(msgKey);

		FcltInfoVO resultVO = fcltInfoMapper.selectFcltInfo(fcltInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltInfoVO> selectFcltInfoList(FcltInfoVO fcltInfoVO) throws Exception {

		List<FcltInfoVO> resultList = fcltInfoMapper.selectFcltInfoList(fcltInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltInfo(FcltInfoVO fcltInfoVO) throws Exception {

		int insertedCnt = fcltInfoMapper.insertFcltInfo(fcltInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltInfo(FcltInfoVO fcltInfoVO) throws Exception {

		int updatedCnt = fcltInfoMapper.updateFcltInfo(fcltInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltInfo(FcltInfoVO fcltInfoVO) throws Exception {

		int deletedCnt = fcltInfoMapper.deleteFcltInfo(fcltInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltInfoList(List<FcltInfoVO> fcltInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltInfoVO fcltInfoVO : fcltInfoList ) {
			deletedCnt += fcltInfoMapper.deleteFcltInfo(fcltInfoVO);
		}

		return deletedCnt;
	}

}
