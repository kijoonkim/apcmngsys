package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltAtmtcMchnInfoMapper;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltAtmtcMchnInfoService;
import com.at.apcss.fm.fclt.vo.FcltAtmtcMchnInfoVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;
import com.at.apcss.fm.fclt.vo.FcltSortMchnOperInfoVO;


/**
 * @Class Name : FcltAtmtcMchnInfoServiceImpl.java
 * @Description : 스마트자동화 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltAtmtcMchnInfoService")
public class FcltAtmtcMchnInfoServiceImpl extends BaseServiceImpl implements FcltAtmtcMchnInfoService{

	@Autowired
	private FcltAtmtcMchnInfoMapper fcltAtmtcMchnInfoMapper;

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltAtmtcMchnInfoVO selectFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO) throws Exception {

		FcltAtmtcMchnInfoVO resultVO = fcltAtmtcMchnInfoMapper.selectFcltAtmtcMchnInfo(fcltAtmtcMchnInfoVO);

		return resultVO;
	}

	@Override
	public FcltAtmtcMchnInfoVO selectFcltAtmtcMchnInfo(String msgKey) throws Exception {

		FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO = new FcltAtmtcMchnInfoVO();
		fcltAtmtcMchnInfoVO.setMsgKey(msgKey);

		FcltAtmtcMchnInfoVO resultVO = fcltAtmtcMchnInfoMapper.selectFcltAtmtcMchnInfo(fcltAtmtcMchnInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltAtmtcMchnInfoVO> selectFcltAtmtcMchnInfoList(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO) throws Exception {

		List<FcltAtmtcMchnInfoVO> resultList = fcltAtmtcMchnInfoMapper.selectFcltAtmtcMchnInfoList(fcltAtmtcMchnInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltAtmtcMchnInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}

	@Override
	public int multiSaveFcltAtmtcMchnInfo(List<FcltAtmtcMchnInfoVO> fcltAtmtcMchnInfoVOList) throws Exception {
		int saveCnt = 0;
		String prgrsYn = "";
		FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
		for (FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO : fcltAtmtcMchnInfoVOList) {
			saveCnt += fcltAtmtcMchnInfoMapper.insertFcltAtmtcMchnInfo(fcltAtmtcMchnInfoVO);
			prgrsYn = fcltAtmtcMchnInfoVO.getPrgrsYn();
			//진척도 변경
			fcltPrgrsVO.setApcCd(fcltAtmtcMchnInfoVO.getApcCd());
			fcltPrgrsVO.setCrtrYr(fcltAtmtcMchnInfoVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltAtmtcMchnInfoVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltAtmtcMchnInfoVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltAtmtcMchnInfoVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltAtmtcMchnInfoVO.getSysLastChgPrgrmId());
			String tmprStrgYn = fcltAtmtcMchnInfoVO.getTmprStrgYn();
			if(tmprStrgYn.equals("Y")) {
				fcltPrgrsVO.setPrgrs9("T");
			}else {
				fcltPrgrsVO.setPrgrs9("Y");
			}
		}

		if(saveCnt == fcltAtmtcMchnInfoVOList.size() && prgrsYn.equals("Y")) {
			fcltPrgrsMapper.insertFcltPrgrs(fcltPrgrsVO);
		}

		return saveCnt;
	}


	@Override
	public int insertFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO) throws Exception {

		int insertedCnt = fcltAtmtcMchnInfoMapper.insertFcltAtmtcMchnInfo(fcltAtmtcMchnInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO) throws Exception {

		int updatedCnt = fcltAtmtcMchnInfoMapper.updateFcltAtmtcMchnInfo(fcltAtmtcMchnInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO) throws Exception {

		int deletedCnt = fcltAtmtcMchnInfoMapper.deleteFcltAtmtcMchnInfo(fcltAtmtcMchnInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltAtmtcMchnInfoList(List<FcltAtmtcMchnInfoVO> fcltAtmtcMchnInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO : fcltAtmtcMchnInfoList ) {
			deletedCnt += fcltAtmtcMchnInfoMapper.deleteFcltAtmtcMchnInfo(fcltAtmtcMchnInfoVO);
		}

		return deletedCnt;
	}

}
