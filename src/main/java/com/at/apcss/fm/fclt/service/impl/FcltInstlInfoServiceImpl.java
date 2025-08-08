package com.at.apcss.fm.fclt.service.impl;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import com.at.apcss.co.apc.service.ApcInfoService;
import com.at.apcss.co.apc.vo.ApcInfoVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.fm.fclt.service.ApcSurveyMngService;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltInstlInfoMapper;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltInstlInfoService;
import com.at.apcss.fm.fclt.vo.FcltInstlInfoVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;

import egovframework.let.utl.fcc.service.EgovDateUtil;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;


/**
 * @Class Name : FcltInstlInfoServiceImpl.java
 * @Description : 시설설치보완 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltInstlInfoService")
public class FcltInstlInfoServiceImpl extends BaseServiceImpl implements FcltInstlInfoService{

	@Autowired
	private FcltInstlInfoMapper fcltInstlInfoMapper;

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Resource(name="apcInfoService")
	private ApcInfoService apcInfoService;

	@Resource(name="apcSurveyMngService")
	private ApcSurveyMngService apcSurveyMngService;

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

		return resultList;
	}


	@Override
	public int insertFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {


		int insertedCnt = fcltInstlInfoMapper.insertFcltInstlInfo(fcltInstlInfoVO);

		String prgrsYn = fcltInstlInfoVO.getPrgrsYn() == null ? "N" : fcltInstlInfoVO.getPrgrsYn();
		if(insertedCnt == 1 && prgrsYn.equals("Y")) {
			//진척도 변경
			FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
			fcltPrgrsVO.setApcCd(fcltInstlInfoVO.getApcCd());
			//현재년도 구하기 진척도 조회를 위해 추가
			/*Calendar aCalendar = Calendar.getInstance();
			int year = aCalendar.get(Calendar.YEAR);
			fcltPrgrsVO.setCrtrYr(Integer.toString(year));*/

			fcltPrgrsVO.setCrtrYr(fcltInstlInfoVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltInstlInfoVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltInstlInfoVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltInstlInfoVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltInstlInfoVO.getSysLastChgPrgrmId());

			fcltPrgrsVO.setPrgrsSel("2");
			//임시저장
			String tmprStrgYn = fcltInstlInfoVO.getTmprStrgYn() == null ? "N" : fcltInstlInfoVO.getTmprStrgYn();
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

	@Override
	public List<FcltInstlInfoVO> selectFcltInstlInfoRawDataList(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		List<FcltInstlInfoVO> resultList = fcltInstlInfoMapper.selectFcltInstlInfoRawDataList(fcltInstlInfoVO);

		return resultList;
	}

	@Override
	public int updateFcltInstlInfoPrgrs(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		int updatedCnt = fcltInstlInfoMapper.updateFcltInstlInfoPrgrs(fcltInstlInfoVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> insertFcltInstlSplmnt(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		HashMap<String, Object> rtnObj = null;

		String crtrYr = fcltInstlInfoVO.getCrtrYr();
		if (!StringUtils.hasText(crtrYr)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준연도");
		}

		String apcCd = fcltInstlInfoVO.getApcCd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		ApcInfoVO apcParamVO = new ApcInfoVO();
		apcParamVO.setApcCd(apcCd);
		ApcInfoVO apcInfoVO = apcInfoService.selectApcInfo(apcParamVO);
		if (apcInfoVO == null
				|| !StringUtils.hasText(apcInfoVO.getApcCd())
				|| !ComConstants.CON_NONE.equals(apcInfoVO.getDelYn())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC등록정보");
		}

		rtnObj = apcSurveyMngService.insertCheckApcSurvey(fcltInstlInfoVO.getCrtrYr());
		if (rtnObj != null) {
			return rtnObj;
		}

		if ( 0 == insertFcltInstlInfo(fcltInstlInfoVO)){
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "시설설치보완 등록"))); // E0003	{0} 시 오류가 발생하였습니다.
		}

		return null;
	}
}
