package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.mapper.FcltUnityMngInfoMapper;
import com.at.apcss.fm.fclt.service.FcltUnityMngInfoService;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;
import com.at.apcss.fm.fclt.vo.FcltUnityMngInfoVO;


/**
 * @Class Name : FcltUnityMngInfoServiceImpl.java
 * @Description : 통합관리시스템 서비스를 정의하기 위한 서비스 구현 클래스
 * @author
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

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

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
		return resultList;
	}


	@Override
	public int insertFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception {

		int insertedCnt = fcltUnityMngInfoMapper.insertFcltUnityMngInfo(fcltUnityMngInfoVO);

		String prgrsYn = fcltUnityMngInfoVO.getPrgrsYn() == null ? "N" : fcltUnityMngInfoVO.getPrgrsYn();
		if(insertedCnt == 1 && prgrsYn.equals("Y")) {
			//진척도 변경
			FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
			fcltPrgrsVO.setApcCd(fcltUnityMngInfoVO.getApcCd());
			fcltPrgrsVO.setCrtrYr(fcltUnityMngInfoVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltUnityMngInfoVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltUnityMngInfoVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltUnityMngInfoVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltUnityMngInfoVO.getSysLastChgPrgrmId());
			fcltPrgrsVO.setPrgrsSel("11");
			//임시저장
			String tmprStrgYn = fcltUnityMngInfoVO.getTmprStrgYn() == null ? "N" : fcltUnityMngInfoVO.getTmprStrgYn();
			if(tmprStrgYn.equals("Y")) {
				fcltPrgrsVO.setPrgrsVal("T");
			}else {
				fcltPrgrsVO.setPrgrsVal("Y");
			}
			fcltPrgrsMapper.insertFcltPrgrs(fcltPrgrsVO);
		}
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

	@Override
	public List<FcltUnityMngInfoVO> selectFcltUnityMngInfoRawDataList(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception {

		List<FcltUnityMngInfoVO> resultList = fcltUnityMngInfoMapper.selectFcltUnityMngInfoRawDataList(fcltUnityMngInfoVO);
		return resultList;
	}

}
