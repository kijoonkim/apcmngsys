package com.at.apcss.am.stat.service.impl;

import com.at.apcss.am.stat.mapper.StatMngMapper;
import com.at.apcss.am.stat.service.StatMngService;
import com.at.apcss.am.stat.vo.StatCrtrVO;
import com.at.apcss.am.stat.vo.StatMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : StatMngServiceImpl.java
 * @Description : 통계관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 박승진
 * @since 2024.09.03
 * @version 1.0
 * @param
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.03  박승진        최초 생성
 * </pre>
 */
@Service("statMngService")
public class StatMngServiceImpl extends BaseServiceImpl implements StatMngService {

	@Autowired
	private StatMngMapper statMngMapper;

	@Override
	public List<StatCrtrVO> selectStatCrtrDtlInUseList(StatCrtrVO statCrtrVO) throws Exception {
		return statMngMapper.selectStatCrtrDtlInUseList(statCrtrVO);
	}

	@Override
	public StatCrtrVO selectCrtr(StatCrtrVO statCrtrVO) throws Exception {
		return statMngMapper.selectCrtr(statCrtrVO);
	}

	@Override
	public StatCrtrVO selectCrtr(String apcCd, String statsCrtrType, String crtrCd) throws Exception {
		StatCrtrVO param = new StatCrtrVO();
		param.setApcCd(apcCd);
		param.setStatsCrtrType(statsCrtrType);
		param.setCrtrCd(crtrCd);
		return selectCrtr(param);
	}

	@Override
	public List<StatCrtrVO> selectCrtrList(StatCrtrVO statCrtrVO) throws Exception {
		return statMngMapper.selectCrtrList(statCrtrVO);
	}

	@Override
	public List<StatCrtrVO> selectCrtrDtlList(StatCrtrVO statCrtrVO) throws Exception {
		return statMngMapper.selectCrtrDtlList(statCrtrVO);
	}

	@Override
	public HashMap<String, Object> insertCrtr(StatMngVO statMngVO) throws Exception {
		String apcCd = statMngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		List<StatCrtrVO> crtrList = statMngVO.getCrtrList();

		if (crtrList == null || crtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준저장");
		}

		String sysUserId = statMngVO.getSysLastChgUserId();
		String sysPrgrmId = statMngVO.getSysLastChgPrgrmId();

		for ( StatCrtrVO crtr : crtrList ) {

			// validation check
			if (!StringUtils.hasText(crtr.getStatsCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "통계기준유형");
			}

			if (!StringUtils.hasText(crtr.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
			}

			if (!StringUtils.hasText(crtr.getCrtrIndctNm())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준표시명");
			}

			crtr.setApcCd(apcCd);

			// 데이터 확인
			StatCrtrVO crtrInfo = selectCrtr(crtr);

			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				crtr.setNeedsInsert(true);
			} else {
				crtr.setNeedsInsert(false);
			}
		}

		for ( StatCrtrVO crtr : crtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);

			if (crtr.isNeedsInsert()) {
				statMngMapper.insertCrtr(crtr);
			} else {
				statMngMapper.updateCrtr(crtr);
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteCrtr(StatMngVO statMngVO) throws Exception {
		String apcCd = statMngVO.getApcCd();

		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		List<StatCrtrVO> crtrList = statMngVO.getCrtrList();

		if (crtrList == null || crtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준삭제");
		}

		String sysUserId = statMngVO.getSysLastChgUserId();
		String sysPrgrmId = statMngVO.getSysLastChgPrgrmId();

		for ( StatCrtrVO crtr : crtrList ) {

			// validation check
			if (!StringUtils.hasText(crtr.getStatsCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "통계기준유형");
			}
			if (!StringUtils.hasText(crtr.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
			}

			crtr.setApcCd(apcCd);

			// 데이터 확인
			StatCrtrVO crtrInfo = selectCrtr(crtr);
			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET, "등록");
			}
		}

		for ( StatCrtrVO crtr : crtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);

			List<StatCrtrVO> dtlList = statMngMapper.selectCrtrDtlList(crtr);

			for ( StatCrtrVO dtl : dtlList ) {
				dtl.setSysFrstInptUserId(sysUserId);
				dtl.setSysFrstInptPrgrmId(sysPrgrmId);
				dtl.setSysLastChgUserId(sysUserId);
				dtl.setSysLastChgPrgrmId(sysPrgrmId);

				statMngMapper.deleteCrtrDtl(dtl);
			}

			statMngMapper.deleteCrtr(crtr);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertCrtrDtl(StatMngVO statMngVO) throws Exception {

		String apcCd = statMngVO.getApcCd();
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String crtrType = statMngVO.getStatsCrtrType();
		if (!StringUtils.hasLength(crtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "통계기준유형");
		}

		String crtrCd = statMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}

		// header 가 없으면 등록 안됨
		// 데이터 확인
		StatCrtrVO crtrInfo = selectCrtr(apcCd, crtrType, crtrCd);
		if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "집계기준");
		}

		int dtlSn = crtrInfo.getMaxDtlSn();
		List<StatCrtrVO> crtrDtlList = statMngVO.getCrtrDtlList();

		if (crtrDtlList == null || crtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "저장");
		}

		String sysUserId = statMngVO.getSysLastChgUserId();
		String sysPrgrmId = statMngVO.getSysLastChgPrgrmId();

		for ( StatCrtrVO dtl : crtrDtlList ) {

			// validation check
			if (!crtrType.equals(dtl.getStatsCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "집계기준유형||등록유형");
			}

			if (!crtrCd.equals(dtl.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "기준코드||등록코드");
			}

			if (!StringUtils.hasText(dtl.getDtlIndctNm())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상세표시명");
			}

			if (!StringUtils.hasText(dtl.getDtlCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상세코드");
			}

			dtl.setApcCd(apcCd);

			// 데이터 확인
			StatCrtrVO dtlInfo = statMngMapper.selectCrtrDtl(dtl);

			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				dtl.setNeedsInsert(true);
				dtlSn++;
				dtl.setDtlSn(dtlSn);
			} else {
				dtl.setNeedsInsert(false);
			}
		}

		for ( StatCrtrVO dtl : crtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);

			if (dtl.isNeedsInsert()) {
				statMngMapper.insertCrtrDtl(dtl);
			} else {
				statMngMapper.updateCrtrDtl(dtl);
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteCrtrDtl(StatMngVO statMngVO) throws Exception {
		String apcCd = statMngVO.getApcCd();
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String crtrType = statMngVO.getStatsCrtrType();
		if (!StringUtils.hasLength(crtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준유형");
		}

		String crtrCd = statMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}

		List<StatCrtrVO> crtrDtlList = statMngVO.getCrtrDtlList();

		if (crtrDtlList == null || crtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
		}

		String sysUserId = statMngVO.getSysLastChgUserId();
		String sysPrgrmId = statMngVO.getSysLastChgPrgrmId();

		for ( StatCrtrVO dtl : crtrDtlList ) {

			// validation check
			if (!crtrType.equals(dtl.getStatsCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "기준유형||등록유형");
			}

			if (!crtrCd.equals(dtl.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "기준코드||등록코드");
			}

			if (dtl.getDtlSn() < 1) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상세일련번호");
			}

			dtl.setApcCd(apcCd);

			// 데이터 확인
			StatCrtrVO dtlInfo = statMngMapper.selectCrtrDtl(dtl);

			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
			}
		}

		for ( StatCrtrVO dtl : crtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);

			statMngMapper.deleteCrtrDtl(dtl);
		}

		return null;
	}
}
