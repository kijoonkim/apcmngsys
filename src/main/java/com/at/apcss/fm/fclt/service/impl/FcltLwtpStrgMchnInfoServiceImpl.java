package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltLwtpStrgMchnInfoMapper;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltLwtpStrgMchnInfoService;
import com.at.apcss.fm.fclt.vo.FcltLwtpStrgMchnInfoVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;


/**
 * @Class Name : FcltLwtpStrgMchnInfoServiceImpl.java
 * @Description : 저온저장고운영 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltLwtpStrgMchnInfoService")
public class FcltLwtpStrgMchnInfoServiceImpl extends BaseServiceImpl implements FcltLwtpStrgMchnInfoService{

	@Autowired
	private FcltLwtpStrgMchnInfoMapper fcltLwtpStrgMchnInfoMapper;

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltLwtpStrgMchnInfoVO selectFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception {

		FcltLwtpStrgMchnInfoVO resultVO = fcltLwtpStrgMchnInfoMapper.selectFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);

		return resultVO;
	}

	@Override
	public FcltLwtpStrgMchnInfoVO selectFcltLwtpStrgMchnInfo(String msgKey) throws Exception {

		FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO = new FcltLwtpStrgMchnInfoVO();
		fcltLwtpStrgMchnInfoVO.setMsgKey(msgKey);

		FcltLwtpStrgMchnInfoVO resultVO = fcltLwtpStrgMchnInfoMapper.selectFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltLwtpStrgMchnInfoVO> selectFcltLwtpStrgMchnInfoList(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception {

		List<FcltLwtpStrgMchnInfoVO> resultList = fcltLwtpStrgMchnInfoMapper.selectFcltLwtpStrgMchnInfoList(fcltLwtpStrgMchnInfoVO);
		return resultList;
	}


	@Override
	public int insertFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception {

		int insertedCnt = fcltLwtpStrgMchnInfoMapper.insertFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);
		int insertedCnt1 = fcltLwtpStrgMchnInfoMapper.insertFcltLwtpStrgMchnInfoPeriod(fcltLwtpStrgMchnInfoVO);
		String prgrsYn = fcltLwtpStrgMchnInfoVO.getPrgrsYn() == null ? "N" : fcltLwtpStrgMchnInfoVO.getPrgrsYn();

		if(insertedCnt == 1 && prgrsYn.equals("Y")) {
			//진척도 변경
			FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
			fcltPrgrsVO.setApcCd(fcltLwtpStrgMchnInfoVO.getApcCd());
			fcltPrgrsVO.setCrtrYr(fcltLwtpStrgMchnInfoVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltLwtpStrgMchnInfoVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltLwtpStrgMchnInfoVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltLwtpStrgMchnInfoVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltLwtpStrgMchnInfoVO.getSysLastChgPrgrmId());

			fcltPrgrsVO.setPrgrsSel("7");
			//임시저장
			String tmprStrgYn = fcltLwtpStrgMchnInfoVO.getTmprStrgYn() == null ? "N" : fcltLwtpStrgMchnInfoVO.getTmprStrgYn();
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
	public int updateFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception {

		int updatedCnt = fcltLwtpStrgMchnInfoMapper.updateFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception {

		int deletedCnt = fcltLwtpStrgMchnInfoMapper.deleteFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltLwtpStrgMchnInfoList(List<FcltLwtpStrgMchnInfoVO> fcltLwtpStrgMchnInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO : fcltLwtpStrgMchnInfoList ) {
			deletedCnt += fcltLwtpStrgMchnInfoMapper.deleteFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);
		}

		return deletedCnt;
	}

	@Override
	public List<FcltLwtpStrgMchnInfoVO> selectFcltLwtpStrgMchnInfoRawDataList(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception {

		List<FcltLwtpStrgMchnInfoVO> resultList = fcltLwtpStrgMchnInfoMapper.selectFcltLwtpStrgMchnInfoRawDataList(fcltLwtpStrgMchnInfoVO);
		return resultList;
	}

}
