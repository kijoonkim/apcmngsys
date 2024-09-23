package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltPrcsNtslInfoMapper;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltPrcsNtslInfoService;
import com.at.apcss.fm.fclt.vo.FcltPrcsNtslInfoVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;


/**
 * @Class Name : FcltPrcsNtslInfoServiceImpl.java
 * @Description : 산지유통판매처 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltPrcsNtslInfoService")
public class FcltPrcsNtslInfoServiceImpl extends BaseServiceImpl implements FcltPrcsNtslInfoService{

	@Autowired
	private FcltPrcsNtslInfoMapper fcltPrcsNtslInfoMapper;

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltPrcsNtslInfoVO selectFcltPrcsNtslInfo(FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO) throws Exception {

		FcltPrcsNtslInfoVO resultVO = fcltPrcsNtslInfoMapper.selectFcltPrcsNtslInfo(fcltPrcsNtslInfoVO);

		return resultVO;
	}

	@Override
	public FcltPrcsNtslInfoVO selectFcltPrcsNtslInfo(String msgKey) throws Exception {

		FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO = new FcltPrcsNtslInfoVO();
		fcltPrcsNtslInfoVO.setMsgKey(msgKey);

		FcltPrcsNtslInfoVO resultVO = fcltPrcsNtslInfoMapper.selectFcltPrcsNtslInfo(fcltPrcsNtslInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltPrcsNtslInfoVO> selectFcltPrcsNtslInfoList(FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO) throws Exception {

		List<FcltPrcsNtslInfoVO> resultList = fcltPrcsNtslInfoMapper.selectFcltPrcsNtslInfoList(fcltPrcsNtslInfoVO);
		return resultList;
	}


	@Override
	public int insertFcltPrcsNtslInfo(FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO) throws Exception {

		int insertedCnt = fcltPrcsNtslInfoMapper.insertFcltPrcsNtslInfo(fcltPrcsNtslInfoVO);

		String prgrsYn = fcltPrcsNtslInfoVO.getPrgrsYn() == null ? "N" : fcltPrcsNtslInfoVO.getPrgrsYn();

		if(insertedCnt == 1 && prgrsYn.equals("Y")) {
			//진척도 변경
			FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
			fcltPrgrsVO.setApcCd(fcltPrcsNtslInfoVO.getApcCd());
			fcltPrgrsVO.setCrtrYr(fcltPrcsNtslInfoVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltPrcsNtslInfoVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltPrcsNtslInfoVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltPrcsNtslInfoVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltPrcsNtslInfoVO.getSysLastChgPrgrmId());

			fcltPrgrsVO.setPrgrsSel("14");
			//임시저장
			String tmprStrgYn = fcltPrcsNtslInfoVO.getTmprStrgYn() == null ? "N" : fcltPrcsNtslInfoVO.getTmprStrgYn();
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
	public int updateFcltPrcsNtslInfo(FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO) throws Exception {

		int updatedCnt = fcltPrcsNtslInfoMapper.updateFcltPrcsNtslInfo(fcltPrcsNtslInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltPrcsNtslInfo(FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO) throws Exception {

		int deletedCnt = fcltPrcsNtslInfoMapper.deleteFcltPrcsNtslInfo(fcltPrcsNtslInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltPrcsNtslInfoList(List<FcltPrcsNtslInfoVO> fcltPrcsNtslInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO : fcltPrcsNtslInfoList ) {
			deletedCnt += fcltPrcsNtslInfoMapper.deleteFcltPrcsNtslInfo(fcltPrcsNtslInfoVO);
		}

		return deletedCnt;
	}

	@Override
	public List<FcltPrcsNtslInfoVO> selectFcltPrcsNtslInfoRawDataList(FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO) throws Exception {

		List<FcltPrcsNtslInfoVO> resultList = fcltPrcsNtslInfoMapper.selectFcltPrcsNtslInfoRawDataList(fcltPrcsNtslInfoVO);
		return resultList;
	}

}
