package com.at.apcss.am.clcln.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.clcln.mapper.ClclnCrtrMapper;
import com.at.apcss.am.clcln.service.ClclnCrtrService;
import com.at.apcss.am.clcln.vo.ClclnCrtrVO;
import com.at.apcss.am.clcln.vo.ClclnMngVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : ClclnCrtrServiceImpl.java
 * @Description : 정산기준 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2024.09.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.21  신정철        최초 생성
 * </pre>
 */
@Service("clclnCrtrService")
public class ClclnCrtrServiceImpl extends BaseServiceImpl implements ClclnCrtrService {

	@Autowired
	private ClclnCrtrMapper clclnCrtrMapper;

	@Override
	public ClclnCrtrVO selectClclnCrtr(ClclnCrtrVO clclnCrtrVO) throws Exception {
		ClclnCrtrVO resutVO = clclnCrtrMapper.selectClclnCrtr(clclnCrtrVO);
		return resutVO;
	}

	@Override
	public ClclnCrtrVO selectClclnCrtr(String apcCd, String clclnCrtrType, String crtrCd) throws Exception {
		
		ClclnCrtrVO param = new ClclnCrtrVO();
		
		param.setApcCd(apcCd);
		param.setClclnCrtrType(clclnCrtrType);
		param.setCrtrCd(crtrCd);
		
		ClclnCrtrVO resutVO = clclnCrtrMapper.selectClclnCrtr(param);
		return resutVO;
	}

	
	@Override
	public List<ClclnCrtrVO> selectClclnCrtrList(ClclnCrtrVO clclnCrtrVO) throws Exception {
		List<ClclnCrtrVO> resutList = clclnCrtrMapper.selectClclnCrtrList(clclnCrtrVO);
		return resutList;
	}

	@Override
	public ClclnCrtrVO selectClclnCrtrDtl(ClclnCrtrVO clclnCrtrVO) throws Exception {
		ClclnCrtrVO resutVO = clclnCrtrMapper.selectClclnCrtrDtl(clclnCrtrVO);
		return resutVO;
	}

	@Override
	public List<ClclnCrtrVO> selectClclnCrtrDtlList(ClclnCrtrVO clclnCrtrVO) throws Exception {
		List<ClclnCrtrVO> resutList = clclnCrtrMapper.selectClclnCrtrDtlList(clclnCrtrVO);
		return resutList;
	}


	@Override
	public List<ClclnCrtrVO> selectCrtrDtlListInUse(ClclnCrtrVO clclnCrtrVO) throws Exception {
		List<ClclnCrtrVO> resutList = clclnCrtrMapper.selectCrtrDtlListInUse(clclnCrtrVO);
		return resutList;
	}
	
	
	@Override
	public HashMap<String, Object> insertClclnCrtr(ClclnMngVO clclnMngVO) throws Exception {
		
		String apcCd = clclnMngVO.getApcCd();
		
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		List<ClclnCrtrVO> clclnCrtrList = clclnMngVO.getClclnCrtrList(); 
		
		if (clclnCrtrList == null || clclnCrtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준저장");
		}
		
		String sysUserId = clclnMngVO.getSysLastChgUserId();
		String sysPrgrmId = clclnMngVO.getSysLastChgPrgrmId();
		
		for ( ClclnCrtrVO crtr : clclnCrtrList ) {
			
			// validation check
			if (!StringUtils.hasText(crtr.getClclnCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산기준유형");
			}
			if (!StringUtils.hasText(crtr.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
			}
			if (!StringUtils.hasText(crtr.getCrtrIndctNm())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준표시명");
			}
			
			crtr.setApcCd(apcCd);
			
			// 데이터 확인
			ClclnCrtrVO crtrInfo = selectClclnCrtr(crtr);
			
			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				crtr.setNeedsInsert(true);
			} else {
				crtr.setNeedsInsert(false);
			}			
		}
		
		for ( ClclnCrtrVO crtr : clclnCrtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);
			
			if (crtr.isNeedsInsert()) {
				clclnCrtrMapper.insertClclnCrtr(crtr);
			} else {
				clclnCrtrMapper.updateClclnCrtr(crtr);
			}
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> deleteClclnCrtr(ClclnMngVO clclnMngVO) throws Exception {

		String apcCd = clclnMngVO.getApcCd();
		
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		List<ClclnCrtrVO> clclnCrtrList = clclnMngVO.getClclnCrtrList(); 
		
		if (clclnCrtrList == null || clclnCrtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준삭제");
		}
		
		String sysUserId = clclnMngVO.getSysLastChgUserId();
		String sysPrgrmId = clclnMngVO.getSysLastChgPrgrmId();
		
		for ( ClclnCrtrVO crtr : clclnCrtrList ) {
			
			// validation check
			if (!StringUtils.hasText(crtr.getClclnCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산기준유형");
			}
			if (!StringUtils.hasText(crtr.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
			}
			
			crtr.setApcCd(apcCd);
			
			// 데이터 확인
			ClclnCrtrVO crtrInfo = selectClclnCrtr(crtr);
			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET, "등록");
			}
		}
		
		for ( ClclnCrtrVO crtr : clclnCrtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);
			
			List<ClclnCrtrVO> dtlList = clclnCrtrMapper.selectCrtrDtlList(crtr);
			
			for ( ClclnCrtrVO dtl : dtlList ) {
				dtl.setSysFrstInptUserId(sysUserId);
				dtl.setSysFrstInptPrgrmId(sysPrgrmId);
				dtl.setSysLastChgUserId(sysUserId);
				dtl.setSysLastChgPrgrmId(sysPrgrmId);
				
				clclnCrtrMapper.deleteClclnCrtrDtl(dtl);
			}
			
			clclnCrtrMapper.deleteClclnCrtr(crtr);
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> insertClclnCrtrDtl(ClclnMngVO clclnMngVO) throws Exception {

		String apcCd = clclnMngVO.getApcCd();
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		String clclnCrtrType = clclnMngVO.getClclnCrtrType();
		if (!StringUtils.hasLength(clclnCrtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산기준유형");
		}
		
		String crtrCd = clclnMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}
		
		// header 가 없으면 등록 안됨
		// 데이터 확인
		ClclnCrtrVO crtrInfo = selectClclnCrtr(apcCd, clclnCrtrType, crtrCd);
		if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산기준");
		}
		
		int dtlSn = crtrInfo.getMaxDtlSn();
		String clclnDtlType = crtrInfo.getClclnDtlType();
		
		List<ClclnCrtrVO> clclnCrtrDtlList = clclnMngVO.getClclnCrtrDtlList(); 
		
		if (clclnCrtrDtlList == null || clclnCrtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "저장");
		}
		
		String sysUserId = clclnMngVO.getSysLastChgUserId();
		String sysPrgrmId = clclnMngVO.getSysLastChgPrgrmId();
		
		for ( ClclnCrtrVO dtl : clclnCrtrDtlList ) {
			
			// validation check
			if (!clclnCrtrType.equals(dtl.getClclnCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "정산기준유형||등록유형");
			}
			if (!crtrCd.equals(dtl.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "기준코드||등록코드");
			}
			
			if (!StringUtils.hasText(dtl.getDtlIndctNm())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상세표시명");
			}
			
			if (!StringUtils.hasText(dtl.getDtlCd())) {
				if (!AmConstants.CON_CLCLN_DTL_TYPE_SN.equals(clclnDtlType)) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상세코드");
				}
			}
			
			dtl.setApcCd(apcCd);
			
			// 데이터 확인
			ClclnCrtrVO dtlInfo = selectClclnCrtrDtl(dtl);
			
			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				
				dtl.setNeedsInsert(true);
				dtlSn++;
				dtl.setDtlSn(dtlSn);
				
				if (	!StringUtils.hasText(dtl.getDtlCd())
						&& AmConstants.CON_CLCLN_DTL_TYPE_SN.equals(clclnDtlType)) {
					// 코드발번 (
					String dtlCd = ComUtil.lPad(Integer.toString(dtlSn), 4, '0');
					dtl.setDtlCd(dtlCd);
				}
			} else {
				dtl.setNeedsInsert(false);
			}			
		}
		
		for ( ClclnCrtrVO dtl : clclnCrtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);
			
			if (dtl.isNeedsInsert()) {
				clclnCrtrMapper.insertClclnCrtrDtl(dtl);
			} else {
				clclnCrtrMapper.updateClclnCrtrDtl(dtl);
			}
		}
		
		return null;
		
		
	}

	@Override
	public HashMap<String, Object> deleteClclnCrtrDtl(ClclnMngVO clclnMngVO) throws Exception {

		String apcCd = clclnMngVO.getApcCd();
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		String clclnCrtrType = clclnMngVO.getClclnCrtrType();
		if (!StringUtils.hasLength(clclnCrtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산기준유형");
		}
		
		String crtrCd = clclnMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}
				
		List<ClclnCrtrVO> clclnCrtrDtlList = clclnMngVO.getClclnCrtrDtlList(); 
		
		if (clclnCrtrDtlList == null || clclnCrtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
		}
		
		String sysUserId = clclnMngVO.getSysLastChgUserId();
		String sysPrgrmId = clclnMngVO.getSysLastChgPrgrmId();
		
		for ( ClclnCrtrVO dtl : clclnCrtrDtlList ) {
			
			// validation check
			if (!clclnCrtrType.equals(dtl.getClclnCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "정산기준유형||등록유형");
			}
			if (!crtrCd.equals(dtl.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "기준코드||등록코드");
			}
			
			if (dtl.getDtlSn() < 1) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상세일련번호");
			}
			
			dtl.setApcCd(apcCd);
			
			// 데이터 확인
			ClclnCrtrVO dtlInfo = selectClclnCrtrDtl(dtl);
			
			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
			}			
		}
		
		for ( ClclnCrtrVO dtl : clclnCrtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);
			
			clclnCrtrMapper.deleteClclnCrtrDtl(dtl);
		}
		
		return null;
	}


}
