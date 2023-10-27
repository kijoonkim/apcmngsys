package com.at.apcss.am.clcln.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.clcln.mapper.ClclnPrfmncMapper;
import com.at.apcss.am.clcln.service.ClclnPrfmncService;
import com.at.apcss.am.clcln.vo.ClclnPrfmncVO;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : ClclnPrfmncServiceImpl.java
 * @Description : 정산실적 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
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
@Service("clclnPrfmncService")
public class ClclnPrfmncServiceImpl extends BaseServiceImpl implements ClclnPrfmncService {

	@Autowired
	private ClclnPrfmncMapper clclnPrfmncMapper;
	
	@Resource(name="cmnsValidationService")
	private CmnsValidationService cmnsValidationService;
	
	@Override
	public ClclnPrfmncVO selectClclnPrfmnc(ClclnPrfmncVO clclnPrfmncVO) throws Exception {
		
		ClclnPrfmncVO rtnVO = clclnPrfmncMapper.selectClclnPrfmnc(clclnPrfmncVO);
		
		return rtnVO;
	}

	@Override
	public List<ClclnPrfmncVO> selectClclnPrfmncList(ClclnPrfmncVO clclnPrfmncVO) throws Exception {
		
		List<ClclnPrfmncVO> rtnList = clclnPrfmncMapper.selectClclnPrfmncList(clclnPrfmncVO);
		
		return rtnList;
	}

	@Override
	public HashMap<String, Object> insertClclnPrfmnc(ClclnPrfmncVO clclnPrfmncVO) throws Exception {

		return null;
	}
	

	@Override
	public HashMap<String, Object> insertClclnPrfmncCrt(ClclnPrfmncVO clclnPrfmncVO) throws Exception {
		
		// validation check
		String apcCd = clclnPrfmncVO.getApcCd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		String clclnYmd = clclnPrfmncVO.getClclnYmd();
		if (!StringUtils.hasText(clclnYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산일자");
		}

		// 마감확인
		String ddlnYn = cmnsValidationService.selectChkDdlnYn(apcCd, clclnYmd);
		if (!ComConstants.CON_NONE.equals(ddlnYn)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "정산일자");
		}
		
		clclnPrfmncMapper.insertSpClclnPrfmncCrt(clclnPrfmncVO);
		
		if (StringUtils.hasText(clclnPrfmncVO.getRtnCd())) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(clclnPrfmncVO.getRtnCd(), clclnPrfmncVO.getRtnMsg()))); 
		}
		
		return null;
	}
	
	@Override
	public HashMap<String, Object> updateClclnPrfmnc(ClclnPrfmncVO clclnPrfmncVO) throws Exception {
		
		// validation check
		String apcCd = clclnPrfmncVO.getApcCd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		String clclnYmd = clclnPrfmncVO.getClclnYmd();
		if (!StringUtils.hasText(clclnYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산일자");
		}

		// 마감확인
		String ddlnYn = cmnsValidationService.selectChkDdlnYn(apcCd, clclnYmd);
		if (!ComConstants.CON_NONE.equals(ddlnYn)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "정산일자");
		}
		
		clclnPrfmncMapper.updateClclnPrfmnc(clclnPrfmncVO);
		
		return null;
	}
	

	@Override
	public HashMap<String, Object> updateClclnPrfmncList(List<ClclnPrfmncVO> clclnPrfmncList) throws Exception {
		
		HashMap<String, Object> rtnObj = new HashMap<>();
		
		for ( ClclnPrfmncVO clclnPrfmncVO : clclnPrfmncList ) {
			rtnObj = updateClclnPrfmnc(clclnPrfmncVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}
		
		return null;
	}
	
	@Override
	public HashMap<String, Object> deleteClclnPrfmnc(ClclnPrfmncVO clclnPrfmncVO) throws Exception {
		
		// validation check
		String apcCd = clclnPrfmncVO.getApcCd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		String clclnYmd = clclnPrfmncVO.getClclnYmd();
		if (!StringUtils.hasText(clclnYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산일자");
		}

		// 마감확인
		String ddlnYn = cmnsValidationService.selectChkDdlnYn(apcCd, clclnYmd);
		if (!ComConstants.CON_NONE.equals(ddlnYn)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "정산실적");
		}
		
		clclnPrfmncMapper.updateClclnPrfmncForDelY(clclnPrfmncVO);
		
		return null;
	}

	@Override
	public HashMap<String, Object> deleteClclnPrfmncList(List<ClclnPrfmncVO> clclnPrfmncList) throws Exception {
		
		HashMap<String, Object> rtnObj = new HashMap<>();
		
		for ( ClclnPrfmncVO clclnPrfmncVO : clclnPrfmncList ) {
			rtnObj = deleteClclnPrfmnc(clclnPrfmncVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}
		
		return null;
	}


}
