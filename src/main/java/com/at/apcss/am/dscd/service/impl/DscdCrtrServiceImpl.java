package com.at.apcss.am.dscd.service.impl;

import com.at.apcss.am.clcln.mapper.ClclnCrtrMapper;
import com.at.apcss.am.clcln.service.ClclnCrtrService;
import com.at.apcss.am.clcln.vo.ClclnCrtrVO;
import com.at.apcss.am.clcln.vo.ClclnMngVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.dscd.mapper.DscdCrtrMapper;
import com.at.apcss.am.dscd.service.DscdCrtrService;
import com.at.apcss.am.dscd.vo.DscdCrtrVO;
import com.at.apcss.am.dscd.vo.DscdMngVO;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : DscdCrtrServiceImpl.java
 * @Description : 폐기기준 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("dscdCrtrService")
public class DscdCrtrServiceImpl extends BaseServiceImpl implements DscdCrtrService {

	@Autowired
	private DscdCrtrMapper dscdCrtrMapper;

	@Override
	public DscdCrtrVO selectDscdCrtr(DscdCrtrVO dscdCrtrVO) throws Exception {
		return dscdCrtrMapper.selectDscdCrtr(dscdCrtrVO);
	}

	@Override
	public DscdCrtrVO selectDscdCrtr(String apcCd, String dscdCrtrType, String crtrCd) throws Exception {
		DscdCrtrVO param = new DscdCrtrVO();
		param.setApcCd(apcCd);
		param.setDscdCrtrType(dscdCrtrType);
		param.setCrtrCd(crtrCd);
		return dscdCrtrMapper.selectDscdCrtr(param);
	}

	@Override
	public List<DscdCrtrVO> selectDscdCrtrList(DscdCrtrVO dscdCrtrVO) throws Exception {
		return dscdCrtrMapper.selectDscdCrtrList(dscdCrtrVO);
	}

	@Override
	public DscdCrtrVO selectDscdCrtrDtl(DscdCrtrVO dscdCrtrVO) throws Exception {
		return dscdCrtrMapper.selectDscdCrtrDtl(dscdCrtrVO);
	}

	@Override
	public List<DscdCrtrVO> selectDscdCrtrDtlList(DscdCrtrVO dscdCrtrVO) throws Exception {
		return dscdCrtrMapper.selectDscdCrtrDtlList(dscdCrtrVO);
	}

	@Override
	public List<DscdCrtrVO> selectCrtrDtlListInUse(DscdCrtrVO dscdCrtrVO) throws Exception {
		return dscdCrtrMapper.selectDscdCrtrDtlList(dscdCrtrVO);
	}

	@Override
	public HashMap<String, Object> insertDscdCrtr(DscdMngVO dscdMngVO) throws Exception {

		String apcCd = dscdMngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		List<DscdCrtrVO> dscdCrtrList = dscdMngVO.getDscdCrtrList();

		if (dscdCrtrList == null || dscdCrtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준저장");
		}

		String sysUserId = dscdMngVO.getSysLastChgUserId();
		String sysPrgrmId = dscdMngVO.getSysLastChgPrgrmId();

		for ( DscdCrtrVO crtr : dscdCrtrList ) {

			// validation check
			if (!StringUtils.hasText(crtr.getDscdCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "폐기기준유형");
			}
			if (!StringUtils.hasText(crtr.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
			}
			if (!StringUtils.hasText(crtr.getCrtrIndctNm())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준표시명");
			}

			crtr.setApcCd(apcCd);

			// 데이터 확인
			DscdCrtrVO crtrInfo = selectDscdCrtr(crtr);

			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				crtr.setNeedsInsert(true);
			} else {
				crtr.setNeedsInsert(false);
			}
		}

		for ( DscdCrtrVO crtr : dscdCrtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);

			if (crtr.isNeedsInsert()) {
				dscdCrtrMapper.insertDscdCrtr(crtr);
			} else {
				dscdCrtrMapper.updateDscdCrtr(crtr);
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteDscdCrtr(DscdMngVO dscdMngVO) throws Exception {
		String apcCd = dscdMngVO.getApcCd();

		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		List<DscdCrtrVO> dscdCrtrList = dscdMngVO.getDscdCrtrList();

		if (dscdCrtrList == null || dscdCrtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준삭제");
		}

		String sysUserId = dscdMngVO.getSysLastChgUserId();
		String sysPrgrmId = dscdMngVO.getSysLastChgPrgrmId();

		for ( DscdCrtrVO crtr : dscdCrtrList ) {

			// validation check
			if (!StringUtils.hasText(crtr.getDscdCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "폐기기준유형");
			}
			if (!StringUtils.hasText(crtr.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
			}

			crtr.setApcCd(apcCd);

			// 데이터 확인
			DscdCrtrVO crtrInfo = selectDscdCrtr(crtr);
			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET, "등록");
			}
		}

		for ( DscdCrtrVO crtr : dscdCrtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);

			List<DscdCrtrVO> dtlList = dscdCrtrMapper.selectDscdCrtrDtlList(crtr);

			for ( DscdCrtrVO dtl : dtlList ) {
				dtl.setSysFrstInptUserId(sysUserId);
				dtl.setSysFrstInptPrgrmId(sysPrgrmId);
				dtl.setSysLastChgUserId(sysUserId);
				dtl.setSysLastChgPrgrmId(sysPrgrmId);

				dscdCrtrMapper.deleteDscdCrtrDtl(dtl);
			}

			dscdCrtrMapper.deleteDscdCrtr(crtr);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertDscdCrtrDtl(DscdMngVO dscdMngVO) throws Exception {

		String apcCd = dscdMngVO.getApcCd();
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String dscdCrtrType = dscdMngVO.getDscdCrtrType();
		if (!StringUtils.hasLength(dscdCrtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "폐기기준유형");
		}

		String crtrCd = dscdMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}

		// header 가 없으면 등록 안됨
		// 데이터 확인
		DscdCrtrVO crtrInfo = selectDscdCrtr(apcCd, dscdCrtrType, crtrCd);
		if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "폐기기준");
		}

		int dtlSn = crtrInfo.getMaxDtlSn();
		List<DscdCrtrVO> dscdCrtrDtlList = dscdMngVO.getDscdCrtrDtlList();

		if (dscdCrtrDtlList == null || dscdCrtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "저장");
		}

		String sysUserId = dscdMngVO.getSysLastChgUserId();
		String sysPrgrmId = dscdMngVO.getSysLastChgPrgrmId();

		for ( DscdCrtrVO dtl : dscdCrtrDtlList ) {

			// validation check
			if (!dscdCrtrType.equals(dtl.getDscdCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "폐기기준유형||등록유형");
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
			DscdCrtrVO dtlInfo = selectDscdCrtrDtl(dtl);

			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				dtl.setNeedsInsert(true);
				dtlSn++;
				dtl.setDtlSn(dtlSn);
			} else {
				dtl.setNeedsInsert(false);
			}
		}

		for ( DscdCrtrVO dtl : dscdCrtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);

			if (dtl.isNeedsInsert()) {
				dscdCrtrMapper.insertDscdCrtrDtl(dtl);
			} else {
				dscdCrtrMapper.updateDscdCrtrDtl(dtl);
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteDscdCrtrDtl(DscdMngVO dscdMngVO) throws Exception {

		String apcCd = dscdMngVO.getApcCd();
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String dscdCrtrType = dscdMngVO.getDscdCrtrType();
		if (!StringUtils.hasLength(dscdCrtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "폐기기준유형");
		}

		String crtrCd = dscdMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}

		List<DscdCrtrVO> dscdCrtrDtlList = dscdMngVO.getDscdCrtrDtlList();

		if (dscdCrtrDtlList == null || dscdCrtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
		}

		String sysUserId = dscdMngVO.getSysLastChgUserId();
		String sysPrgrmId = dscdMngVO.getSysLastChgPrgrmId();

		for ( DscdCrtrVO dtl : dscdCrtrDtlList ) {

			// validation check
			if (!dscdCrtrType.equals(dtl.getDscdCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "폐기기준유형||등록유형");
			}
			if (!crtrCd.equals(dtl.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "기준코드||등록코드");
			}

			if (dtl.getDtlSn() < 1) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상세일련번호");
			}

			dtl.setApcCd(apcCd);

			// 데이터 확인
			DscdCrtrVO dtlInfo = selectDscdCrtrDtl(dtl);

			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
			}
		}

		for ( DscdCrtrVO dtl : dscdCrtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);

			dscdCrtrMapper.deleteDscdCrtrDtl(dtl);
		}

		return null;
	}

    @Override
    public List<DscdCrtrVO> selectDscdPrfmncList(DscdCrtrVO dscdCrtrVO) throws Exception {
        List<DscdCrtrVO> resultList = dscdCrtrMapper.selectDscdPrfmncList(dscdCrtrVO);

        return resultList;
    }

    @Override
    public HashMap<String, Object> deleteDscdPrfmncList(DscdCrtrVO dscdCrtrVO) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();

        // 삭제 작업 실행
        int result = dscdCrtrMapper.deleteDscdPrfmncList(dscdCrtrVO);
        if (result == 0) {
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다.")));
        }

        return resultMap;
    }
}
