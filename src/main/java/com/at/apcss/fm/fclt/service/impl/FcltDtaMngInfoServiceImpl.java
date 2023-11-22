package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltDtaMngInfoMapper;
import com.at.apcss.fm.fclt.service.FcltDtaMngInfoService;
import com.at.apcss.fm.fclt.vo.FcltDtaMngInfoVO;


/**
 * @Class Name : FcltDtaMngInfoServiceImpl.java
 * @Description : 스마트데이터화 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltDtaMngInfoService")
public class FcltDtaMngInfoServiceImpl extends BaseServiceImpl implements FcltDtaMngInfoService{

	@Autowired
	private FcltDtaMngInfoMapper fcltDtaMngInfoMapper;

	@Override
	public FcltDtaMngInfoVO selectFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception {

		FcltDtaMngInfoVO resultVO = fcltDtaMngInfoMapper.selectFcltDtaMngInfo(fcltDtaMngInfoVO);

		return resultVO;
	}

	@Override
	public FcltDtaMngInfoVO selectFcltDtaMngInfo(String msgKey) throws Exception {

		FcltDtaMngInfoVO fcltDtaMngInfoVO = new FcltDtaMngInfoVO();
		fcltDtaMngInfoVO.setMsgKey(msgKey);

		FcltDtaMngInfoVO resultVO = fcltDtaMngInfoMapper.selectFcltDtaMngInfo(fcltDtaMngInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltDtaMngInfoVO> selectFcltDtaMngInfoList(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception {

		List<FcltDtaMngInfoVO> resultList = fcltDtaMngInfoMapper.selectFcltDtaMngInfoList(fcltDtaMngInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltDtaMngInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception {

		int insertedCnt = fcltDtaMngInfoMapper.insertFcltDtaMngInfo(fcltDtaMngInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception {

		int updatedCnt = fcltDtaMngInfoMapper.updateFcltDtaMngInfo(fcltDtaMngInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception {

		int deletedCnt = fcltDtaMngInfoMapper.deleteFcltDtaMngInfo(fcltDtaMngInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltDtaMngInfoList(List<FcltDtaMngInfoVO> fcltDtaMngInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltDtaMngInfoVO fcltDtaMngInfoVO : fcltDtaMngInfoList ) {
			deletedCnt += fcltDtaMngInfoMapper.deleteFcltDtaMngInfo(fcltDtaMngInfoVO);
		}

		return deletedCnt;
	}

}
