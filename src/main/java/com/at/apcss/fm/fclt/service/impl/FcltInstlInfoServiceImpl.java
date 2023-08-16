package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.FcltInstlInfoMapper;
import com.at.apcss.fm.fclt.service.FcltInstlInfoService;
import com.at.apcss.fm.fclt.vo.FcltInstlInfoVO;


/**
 * @Class Name : FcltInstlInfoServiceImpl.java
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
@Service("fcltInstlInfoService")
public class FcltInstlInfoServiceImpl implements FcltInstlInfoService{

	@Autowired
	private FcltInstlInfoMapper fcltInstlInfoMapper;

	@Override
	public FcltInstlInfoVO selectFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		FcltInstlInfoVO resultVO = fcltInstlInfoMapper.selectFcltInstlInfo(fcltInstlInfoVO);

		return resultVO;
	}

	@Override
	public FcltInstlInfoVO selectFcltInstlInfo(String msgKey) throws Exception {

		FcltInstlInfoVO fcltInstlInfoVO = new FcltInstlInfoVO();
		fcltInstlInfoVO.setMsgKey(msgKey);

		FcltInstlInfoVO resultVO = fcltInstlInfoMapper.selectFcltInstlInfo(fcltInstlInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltInstlInfoVO> selectFcltInstlInfoList(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		List<FcltInstlInfoVO> resultList = fcltInstlInfoMapper.selectFcltInstlInfoList(fcltInstlInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltInstlInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		int insertedCnt = fcltInstlInfoMapper.insertFcltInstlInfo(fcltInstlInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		int updatedCnt = fcltInstlInfoMapper.updateFcltInstlInfo(fcltInstlInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		int deletedCnt = fcltInstlInfoMapper.deleteFcltInstlInfo(fcltInstlInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltInstlInfoList(List<FcltInstlInfoVO> fcltInstlInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltInstlInfoVO fcltInstlInfoVO : fcltInstlInfoList ) {
			deletedCnt += fcltInstlInfoMapper.deleteFcltInstlInfo(fcltInstlInfoVO);
		}

		return deletedCnt;
	}

}
