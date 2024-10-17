package com.at.apcss.am.clcln.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.clcln.mapper.ClclnRsltMapper;
import com.at.apcss.am.clcln.service.ClclnRsltService;
import com.at.apcss.am.clcln.vo.ClclnMngVO;
import com.at.apcss.am.clcln.vo.ClclnRsltDtlVO;
import com.at.apcss.am.clcln.vo.ClclnRsltVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : ClclnRsltServiceImpl.java
 * @Description : 정산실적 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.10.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 * </pre>
 */
@Service("clclnRsltService")
public class ClclnRsltServiceImpl extends BaseServiceImpl implements ClclnRsltService {

	@Autowired
	private ClclnRsltMapper clclnRsltMapper;

	@Override
	public List<ClclnRsltVO> selectClclnRsltList(ClclnRsltVO clclnRsltVO) throws Exception {
		List<ClclnRsltVO> resutList = clclnRsltMapper.selectClclnRsltList(clclnRsltVO);
		return resutList;
	}

	@Override
	public HashMap<String, Object> updateClclnRslt(ClclnMngVO clclnMngVO) throws Exception {
		
		String apcCd = clclnMngVO.getApcCd();
		
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		List<ClclnRsltVO> clclnRsltList = clclnMngVO.getClclnRsltList();
		
		if (clclnRsltList == null || clclnRsltList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "저장");
		}
		
		String sysUserId = clclnMngVO.getSysLastChgUserId();
		String sysPrgrmId = clclnMngVO.getSysLastChgPrgrmId();
		
		
		List<ClclnRsltDtlVO> rsltDtlVOList = new ArrayList<>();
		
		for ( ClclnRsltVO rslt : clclnRsltList ) {
			
			String clclnYr = rslt.getClclnYr();
			int clclnSn = rslt.getClclnSn();
			String prdcrCd = rslt.getPrdcrCd();
			
			// validation check
			if (!StringUtils.hasText(clclnYr)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산연도");
			}
			
			if (clclnSn <= 0) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산차수");
			}
			
			if (!StringUtils.hasText(prdcrCd)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "생산자");
			}
			
			List<ClclnRsltDtlVO> clclnRsltDtlList = rslt.getClclnRsltDtlList();
			
			if (clclnRsltDtlList == null || clclnRsltDtlList.isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "저장");
			}
			
			for ( ClclnRsltDtlVO dtl : clclnRsltDtlList ) {
				
				if (!StringUtils.hasText(dtl.getClclnCrtrType())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산기준유형");
				}
				if (!StringUtils.hasText(dtl.getCrtrCd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
				}
				
				ClclnRsltDtlVO rsltDtlVO = new ClclnRsltDtlVO();
				BeanUtils.copyProperties(dtl, rsltDtlVO);
				
				rsltDtlVO.setApcCd(apcCd);
				rsltDtlVO.setClclnYr(clclnYr);
				rsltDtlVO.setClclnSn(clclnSn);
				rsltDtlVO.setPrdcrCd(prdcrCd);
				rsltDtlVO.setSysFrstInptUserId(sysUserId);
				rsltDtlVO.setSysFrstInptPrgrmId(sysPrgrmId);
				rsltDtlVO.setSysLastChgUserId(sysUserId);
				rsltDtlVO.setSysLastChgPrgrmId(sysPrgrmId);
				
				// 생성된 정산실적 key 조회
				ClclnRsltDtlVO rsltInfo = clclnRsltMapper.selectClclnRsltSn(rsltDtlVO);
				if (rsltInfo == null || rsltInfo.getRsltSn() <= 0) {
					rsltDtlVO.setNeedsInsert(true);
				} else {
					rsltDtlVO.setRsltSn(rsltInfo.getRsltSn());
				}
				
				rsltDtlVOList.add(rsltDtlVO);
			}
		}
		
		for ( ClclnRsltDtlVO dtl : rsltDtlVOList ) {
			if (dtl.isNeedsInsert()) {
				clclnRsltMapper.insertClclnRslt(dtl);
			} else {
				clclnRsltMapper.updateClclnRsltElmt(dtl);
			}
		}
		
		
		return null;
	}

	@Override
	public HashMap<String, Object> insertClclnRsltReg(ClclnMngVO clclnMngVO) throws Exception {

		String apcCd = clclnMngVO.getApcCd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		String clclnYr = clclnMngVO.getClclnYr();
		int clclnSn = clclnMngVO.getClclnSn();
		
		// validation check
		if (!StringUtils.hasText(clclnYr)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산연도");
		}
		
		if (clclnSn < 1) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산차수");
		}
		
		String sysUserId = clclnMngVO.getSysLastChgUserId();
		String sysPrgrmId = clclnMngVO.getSysLastChgPrgrmId();
		
		ClclnRsltDtlVO paramVO = new ClclnRsltDtlVO();
		
		paramVO.setApcCd(apcCd);
		paramVO.setClclnYr(clclnYr);
		paramVO.setClclnSn(clclnSn);

		paramVO.setSysFrstInptUserId(sysUserId);
		paramVO.setSysFrstInptPrgrmId(sysPrgrmId);
		paramVO.setSysLastChgUserId(sysUserId);
		paramVO.setSysLastChgPrgrmId(sysPrgrmId);
		
		clclnRsltMapper.insertSpClclnRsltReg(paramVO);
		
		if (StringUtils.hasText(paramVO.getRtnCd())) {
			throw new EgovBizException(
					getMessageForMap(
							ComUtil.getResultMap(
									paramVO.getRtnCd(),
									paramVO.getRtnMsg()
								)
						)
				); 
		}
		
		
		return null;
	}


}
