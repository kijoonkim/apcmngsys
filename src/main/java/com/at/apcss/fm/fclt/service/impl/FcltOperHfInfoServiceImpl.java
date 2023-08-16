package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.fclt.mapper.FcltOperHfInfoMapper;
import com.at.apcss.fm.fclt.service.FcltOperHfInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperHfInfoVO;


/**
 * @Class Name : FcltOperHfInfoServiceImpl.java
 * @Description : 시설고용인력 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltOperHfInfoService")
public class FcltOperHfInfoServiceImpl implements FcltOperHfInfoService{

	@Autowired
	private FcltOperHfInfoMapper fcltOperHfInfoMapper;

	@Override
	public FcltOperHfInfoVO selectFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO) throws Exception {

		FcltOperHfInfoVO resultVO = fcltOperHfInfoMapper.selectFcltOperHfInfo(fcltOperHfInfoVO);

		return resultVO;
	}

	@Override
	public FcltOperHfInfoVO selectFcltOperHfInfo(String msgKey) throws Exception {

		FcltOperHfInfoVO fcltOperHfInfoVO = new FcltOperHfInfoVO();
		fcltOperHfInfoVO.setMsgKey(msgKey);

		FcltOperHfInfoVO resultVO = fcltOperHfInfoMapper.selectFcltOperHfInfo(fcltOperHfInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltOperHfInfoVO> selectFcltOperHfInfoList(FcltOperHfInfoVO fcltOperHfInfoVO) throws Exception {

		List<FcltOperHfInfoVO> resultList = fcltOperHfInfoMapper.selectFcltOperHfInfoList(fcltOperHfInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltOperHfInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO) throws Exception {

		int insertedCnt = fcltOperHfInfoMapper.insertFcltOperHfInfo(fcltOperHfInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO) throws Exception {

		int updatedCnt = fcltOperHfInfoMapper.updateFcltOperHfInfo(fcltOperHfInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO) throws Exception {

		int deletedCnt = fcltOperHfInfoMapper.deleteFcltOperHfInfo(fcltOperHfInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltOperHfInfoList(List<FcltOperHfInfoVO> fcltOperHfInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltOperHfInfoVO fcltOperHfInfoVO : fcltOperHfInfoList ) {
			deletedCnt += fcltOperHfInfoMapper.deleteFcltOperHfInfo(fcltOperHfInfoVO);
		}

		return deletedCnt;
	}

}
