package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltGdsMchnInfoMapper;
import com.at.apcss.fm.fclt.service.FcltGdsMchnInfoService;
import com.at.apcss.fm.fclt.vo.FcltGdsMchnInfoVO;


/**
 * @Class Name : FcltGdsMchnInfoServiceImpl.java
 * @Description : 상품화설비현황 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltGdsMchnInfoService")
public class FcltGdsMchnInfoServiceImpl extends BaseServiceImpl implements FcltGdsMchnInfoService{

	@Autowired
	private FcltGdsMchnInfoMapper fcltGdsMchnInfoMapper;

	@Override
	public FcltGdsMchnInfoVO selectFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO) throws Exception {

		FcltGdsMchnInfoVO resultVO = fcltGdsMchnInfoMapper.selectFcltGdsMchnInfo(fcltGdsMchnInfoVO);

		return resultVO;
	}

	@Override
	public FcltGdsMchnInfoVO selectFcltGdsMchnInfo(String msgKey) throws Exception {

		FcltGdsMchnInfoVO fcltGdsMchnInfoVO = new FcltGdsMchnInfoVO();
		fcltGdsMchnInfoVO.setMsgKey(msgKey);

		FcltGdsMchnInfoVO resultVO = fcltGdsMchnInfoMapper.selectFcltGdsMchnInfo(fcltGdsMchnInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltGdsMchnInfoVO> selectFcltGdsMchnInfoList(FcltGdsMchnInfoVO fcltGdsMchnInfoVO) throws Exception {

		List<FcltGdsMchnInfoVO> resultList = fcltGdsMchnInfoMapper.selectFcltGdsMchnInfoList(fcltGdsMchnInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltGdsMchnInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO) throws Exception {

		int insertedCnt = fcltGdsMchnInfoMapper.insertFcltGdsMchnInfo(fcltGdsMchnInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO) throws Exception {

		int updatedCnt = fcltGdsMchnInfoMapper.updateFcltGdsMchnInfo(fcltGdsMchnInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO) throws Exception {

		int deletedCnt = fcltGdsMchnInfoMapper.deleteFcltGdsMchnInfo(fcltGdsMchnInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltGdsMchnInfoList(List<FcltGdsMchnInfoVO> fcltGdsMchnInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltGdsMchnInfoVO fcltGdsMchnInfoVO : fcltGdsMchnInfoList ) {
			deletedCnt += fcltGdsMchnInfoMapper.deleteFcltGdsMchnInfo(fcltGdsMchnInfoVO);
		}

		return deletedCnt;
	}

}
