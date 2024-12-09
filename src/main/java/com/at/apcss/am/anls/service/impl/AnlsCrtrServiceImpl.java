package com.at.apcss.am.anls.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.anls.mapper.AnlsCrtrMapper;
import com.at.apcss.am.anls.service.AnlsCrtrService;
import com.at.apcss.am.anls.vo.AnlsCrtrVO;
import com.at.apcss.am.anls.vo.AnlsMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

@Service("anlsCrtrService")
public class AnlsCrtrServiceImpl extends BaseServiceImpl implements AnlsCrtrService {

	@Autowired
	private AnlsCrtrMapper anlsCrtrMapper;

	
	@Override
	public AnlsCrtrVO selectAnlsCrtr(AnlsCrtrVO anlsCrtrVO) throws Exception {
		AnlsCrtrVO resultVO = anlsCrtrMapper.selectAnlsCrtr(anlsCrtrVO);
		
		return resultVO;
	}
	
	@Override
	public AnlsCrtrVO selectAnlsCrtr(String apcCd, String anlsCrtrType, String crtrCd) throws Exception {

		AnlsCrtrVO anlsCrtrVO = new AnlsCrtrVO();
		anlsCrtrVO.setApcCd(apcCd);
		anlsCrtrVO.setAnlsCrtrType(anlsCrtrType);
		anlsCrtrVO.setCrtrCd(crtrCd);
		
		AnlsCrtrVO resultVO = selectAnlsCrtr(anlsCrtrVO);
		
		return resultVO;
	}
	
	@Override
	public List<AnlsCrtrVO> selectAnlsCrtrList(AnlsCrtrVO anlsCrtrVO) throws Exception {
		
		List<AnlsCrtrVO> resultList = anlsCrtrMapper.selectAnlsCrtrList(anlsCrtrVO);
		
		return resultList;
	}

	@Override
	public AnlsCrtrVO selectAnlsCrtrDtl(AnlsCrtrVO anlsCrtrVO) throws Exception {
		AnlsCrtrVO resultVO = anlsCrtrMapper.selectAnlsCrtrDtl(anlsCrtrVO);
		
		return resultVO;
	}

	@Override
	public List<AnlsCrtrVO> selectAnlsCrtrDtlList(AnlsCrtrVO anlsCrtrVO) throws Exception {
		
		List<AnlsCrtrVO> resultList = anlsCrtrMapper.selectAnlsCrtrDtlList(anlsCrtrVO);
		
		return resultList;
	}

	@Override
	public HashMap<String, Object> insertAnlsCrtr(AnlsMngVO anlsMngVO) throws Exception {
		
		String apcCd = anlsMngVO.getApcCd();
		
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		List<AnlsCrtrVO> crtrList = anlsMngVO.getAnlsCrtrList(); 
		
		if (crtrList == null || crtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준저장");
		}
		
		String sysUserId = anlsMngVO.getSysLastChgUserId();
		String sysPrgrmId = anlsMngVO.getSysLastChgPrgrmId();
		
		for ( AnlsCrtrVO crtr : crtrList ) {
			
			// validation check
			if (!StringUtils.hasText(crtr.getAnlsCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "분석기준유형");
			}
			if (!StringUtils.hasText(crtr.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
			}
			if (!StringUtils.hasText(crtr.getCrtrIndctNm())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준표시명");
			}
			
			crtr.setApcCd(apcCd);
			
			// 데이터 확인
			AnlsCrtrVO crtrInfo = selectAnlsCrtr(crtr);
			
			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				crtr.setNeedsInsert(true);
			} else {
				crtr.setNeedsInsert(false);
			}			
		}
		
		for ( AnlsCrtrVO crtr : crtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);
			
			if (crtr.isNeedsInsert()) {
				anlsCrtrMapper.insertAnlsCrtr(crtr);
			} else {
				anlsCrtrMapper.updateAnlsCrtr(crtr);
			}
		}
		return null;
	}

	@Override
	public HashMap<String, Object> deleteAnlsCrtr(AnlsMngVO anlsMngVO) throws Exception {
		
		String apcCd = anlsMngVO.getApcCd();
		
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		List<AnlsCrtrVO> crtrList = anlsMngVO.getAnlsCrtrList(); 
		
		if (crtrList == null || crtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준삭제");
		}
		
		String sysUserId = anlsMngVO.getSysLastChgUserId();
		String sysPrgrmId = anlsMngVO.getSysLastChgPrgrmId();
		
		for ( AnlsCrtrVO crtr : crtrList ) {
			
			// validation check
			if (!StringUtils.hasText(crtr.getAnlsCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "분석기준유형");
			}
			if (!StringUtils.hasText(crtr.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
			}
			
			crtr.setApcCd(apcCd);
			
			// 데이터 확인
			AnlsCrtrVO crtrInfo = selectAnlsCrtr(crtr);
			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET, "등록");
			}
		}
		
		for ( AnlsCrtrVO crtr : crtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);
			
			List<AnlsCrtrVO> dtlList = anlsCrtrMapper.selectCrtrDtlList(crtr);
			
			for ( AnlsCrtrVO dtl : dtlList ) {
				dtl.setSysFrstInptUserId(sysUserId);
				dtl.setSysFrstInptPrgrmId(sysPrgrmId);
				dtl.setSysLastChgUserId(sysUserId);
				dtl.setSysLastChgPrgrmId(sysPrgrmId);
				
				anlsCrtrMapper.deleteAnlsCrtrDtl(dtl);
			}
			
			anlsCrtrMapper.deleteAnlsCrtr(crtr);
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> insertAnlsCrtrDtl(AnlsMngVO anlsMngVO) throws Exception {

		String apcCd = anlsMngVO.getApcCd();
		
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		String anlsCrtrType = anlsMngVO.getAnlsCrtrType();
		if (!StringUtils.hasLength(anlsCrtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "분석기준유형");
		}
		
		String crtrCd = anlsMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}
		
		// header 가 없으면 등록 안됨
		// 데이터 확인
		AnlsCrtrVO crtrInfo = selectAnlsCrtr(apcCd, anlsCrtrType, crtrCd);
		if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "분석기준");
		}
		
		int dtlSn = crtrInfo.getMaxDtlSn();
		
		
		List<AnlsCrtrVO> crtrDtlList = anlsMngVO.getAnlsCrtrDtlList(); 
		
		if (crtrDtlList == null || crtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "저장");
		}
		
		String sysUserId = anlsMngVO.getSysLastChgUserId();
		String sysPrgrmId = anlsMngVO.getSysLastChgPrgrmId();
		
		for ( AnlsCrtrVO dtl : crtrDtlList ) {
			
			// validation check
			if (!anlsCrtrType.equals(dtl.getAnlsCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "분석기준유형||등록유형");
			}
			if (!crtrCd.equals(dtl.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "기준코드||등록코드");
			}
			if (!StringUtils.hasText(dtl.getDtlCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상세코드");
			}			
			
			dtl.setApcCd(apcCd);
			
			// 데이터 확인
			AnlsCrtrVO dtlInfo = selectAnlsCrtrDtl(dtl);
			
			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				dtl.setNeedsInsert(true);
				dtlSn++;
				dtl.setDtlSn(dtlSn);
			} else {
				dtl.setNeedsInsert(false);
			}			
		}
		
		for ( AnlsCrtrVO dtl : crtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);
			
			if (dtl.isNeedsInsert()) {
				anlsCrtrMapper.insertAnlsCrtrDtl(dtl);
			} else {
				anlsCrtrMapper.updateAnlsCrtrDtl(dtl);
			}
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> deleteAnlsCrtrDtl(AnlsMngVO anlsMngVO) throws Exception {
		
		String apcCd = anlsMngVO.getApcCd();
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		String anlsCrtrType = anlsMngVO.getAnlsCrtrType();
		if (!StringUtils.hasLength(anlsCrtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "분석기준유형");
		}
		
		String crtrCd = anlsMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}
				
		List<AnlsCrtrVO> crtrDtlList = anlsMngVO.getAnlsCrtrDtlList(); 
		
		if (crtrDtlList == null || crtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
		}
		
		String sysUserId = anlsMngVO.getSysLastChgUserId();
		String sysPrgrmId = anlsMngVO.getSysLastChgPrgrmId();
		
		for ( AnlsCrtrVO dtl : crtrDtlList ) {
			
			// validation check
			if (!anlsCrtrType.equals(dtl.getAnlsCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "분석기준유형||등록유형");
			}
			if (!crtrCd.equals(dtl.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "기준코드||등록코드");
			}
			if (dtl.getDtlSn() < 1) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상세일련번호");
			}
			
			dtl.setApcCd(apcCd);
			
			// 데이터 확인
			AnlsCrtrVO dtlInfo = selectAnlsCrtrDtl(dtl);
			
			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
			}			
		}
		
		for ( AnlsCrtrVO dtl : crtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);
			
			anlsCrtrMapper.deleteAnlsCrtrDtl(dtl);
		}
		
		return null;
	}





}
