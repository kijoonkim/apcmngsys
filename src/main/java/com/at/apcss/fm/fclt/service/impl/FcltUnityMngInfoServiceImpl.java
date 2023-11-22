package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltUnityMngInfoMapper;
import com.at.apcss.fm.fclt.service.FcltUnityMngInfoService;
import com.at.apcss.fm.fclt.vo.FcltUnityMngInfoVO;


/**
 * @Class Name : FcltUnityMngInfoServiceImpl.java
 * @Description : 통합관리시스템 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltUnityMngInfoService")
public class FcltUnityMngInfoServiceImpl extends BaseServiceImpl implements FcltUnityMngInfoService{

	@Autowired
	private FcltUnityMngInfoMapper fcltUnityMngInfoMapper;

	@Override
	public FcltUnityMngInfoVO selectFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception {

		FcltUnityMngInfoVO resultVO = fcltUnityMngInfoMapper.selectFcltUnityMngInfo(fcltUnityMngInfoVO);

		return resultVO;
	}

	@Override
	public FcltUnityMngInfoVO selectFcltUnityMngInfo(String msgKey) throws Exception {

		FcltUnityMngInfoVO fcltUnityMngInfoVO = new FcltUnityMngInfoVO();
		fcltUnityMngInfoVO.setMsgKey(msgKey);

		FcltUnityMngInfoVO resultVO = fcltUnityMngInfoMapper.selectFcltUnityMngInfo(fcltUnityMngInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltUnityMngInfoVO> selectFcltUnityMngInfoList(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception {

		List<FcltUnityMngInfoVO> resultList = fcltUnityMngInfoMapper.selectFcltUnityMngInfoList(fcltUnityMngInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltUnityMngInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception {

		int insertedCnt = fcltUnityMngInfoMapper.insertFcltUnityMngInfo(fcltUnityMngInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception {

		int updatedCnt = fcltUnityMngInfoMapper.updateFcltUnityMngInfo(fcltUnityMngInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception {

		int deletedCnt = fcltUnityMngInfoMapper.deleteFcltUnityMngInfo(fcltUnityMngInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltUnityMngInfoList(List<FcltUnityMngInfoVO> fcltUnityMngInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltUnityMngInfoVO fcltUnityMngInfoVO : fcltUnityMngInfoList ) {
			deletedCnt += fcltUnityMngInfoMapper.deleteFcltUnityMngInfo(fcltUnityMngInfoVO);
		}

		return deletedCnt;
	}

}
