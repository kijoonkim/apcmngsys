package com.at.apcss.am.tot.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;


import com.at.apcss.am.clcln.vo.ClclnRsltDtlVO;
import com.at.apcss.am.dscd.vo.DscdCrtrVO;
import com.at.apcss.am.tot.vo.TotCrtrVO;
import com.at.apcss.am.tot.vo.TotRsltVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.util.ComUtil;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.at.apcss.am.tot.vo.TotMngVO;
import com.at.apcss.am.tot.mapper.TotMngMapper;
import com.at.apcss.am.tot.service.TotMngService;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import org.springframework.util.StringUtils;

/**
 * @Class Name : SortFcltServiceImpl.java
 * @Description : 선별설비정보 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 박승진
 * @since 2024.09.03
 * @version 1.0
 * @param <totMngVO>
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.03  박승진        최초 생성
 * </pre>
 */
@Service("totMngService")
public class TotMngServiceImpl extends BaseServiceImpl implements TotMngService {

	@Autowired
	private TotMngMapper totMngMapper;

	@Override
	public TotCrtrVO selectCrtr(TotCrtrVO totCrtrVO) throws Exception {
		return totMngMapper.selectCrtr(totCrtrVO);
	}

	@Override
	public TotCrtrVO selectCrtr(String apcCd, String totCrtrType, String crtrCd) throws Exception {
		TotCrtrVO param = new TotCrtrVO();
		param.setApcCd(apcCd);
		param.setTotCrtrType(totCrtrType);
		param.setCrtrCd(crtrCd);

		return selectCrtr(param);
	}

	@Override
	public List<TotCrtrVO> selectCrtrList(TotCrtrVO totCrtrVO) throws Exception {
		return totMngMapper.selectCrtrList(totCrtrVO);
	}

	@Override
	public List<TotCrtrVO> selectCrtrDtlList(TotCrtrVO totCrtrVO) throws Exception {
		return totMngMapper.selectCrtrDtlList(totCrtrVO);
	}

	@Override
	public HashMap<String, Object> insertCrtr(TotMngVO totMngVO) throws Exception {

		String apcCd = totMngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		List<TotCrtrVO> crtrList = totMngVO.getCrtrList();

		if (crtrList == null || crtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준저장");
		}

		String sysUserId = totMngVO.getSysLastChgUserId();
		String sysPrgrmId = totMngVO.getSysLastChgPrgrmId();

		for ( TotCrtrVO crtr : crtrList ) {

			// validation check
			if (!StringUtils.hasText(crtr.getTotCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "집계기준유형");
			}

			if (!StringUtils.hasText(crtr.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
			}

			if (!StringUtils.hasText(crtr.getCrtrIndctNm())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준표시명");
			}

			crtr.setApcCd(apcCd);

			// 데이터 확인
			TotCrtrVO crtrInfo = selectCrtr(crtr);

			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				crtr.setNeedsInsert(true);
			} else {
				crtr.setNeedsInsert(false);
			}
		}

		for ( TotCrtrVO crtr : crtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);

			if (crtr.isNeedsInsert()) {
				totMngMapper.insertCrtr(crtr);
			} else {
				totMngMapper.updateCrtr(crtr);
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteCrtr(TotMngVO totMngVO) throws Exception {

		String apcCd = totMngVO.getApcCd();

		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		List<TotCrtrVO> crtrList = totMngVO.getCrtrList();

		if (crtrList == null || crtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준삭제");
		}

		String sysUserId = totMngVO.getSysLastChgUserId();
		String sysPrgrmId = totMngVO.getSysLastChgPrgrmId();

		for ( TotCrtrVO crtr : crtrList ) {

			// validation check
			if (!StringUtils.hasText(crtr.getTotCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "집계기준유형");
			}
			if (!StringUtils.hasText(crtr.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
			}

			crtr.setApcCd(apcCd);

			// 데이터 확인
			TotCrtrVO crtrInfo = totMngMapper.selectCrtr(crtr);
			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET, "등록");
			}
		}

		for ( TotCrtrVO crtr : crtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);

			List<TotCrtrVO> dtlList = totMngMapper.selectCrtrDtlList(crtr);

			for ( TotCrtrVO dtl : dtlList ) {
				dtl.setSysFrstInptUserId(sysUserId);
				dtl.setSysFrstInptPrgrmId(sysPrgrmId);
				dtl.setSysLastChgUserId(sysUserId);
				dtl.setSysLastChgPrgrmId(sysPrgrmId);

				totMngMapper.deleteCrtrDtl(dtl);
			}

			totMngMapper.deleteCrtr(crtr);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertCrtrDtl(TotMngVO totMngVO) throws Exception {

		String apcCd = totMngVO.getApcCd();
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String totCrtrType = totMngVO.getTotCrtrType();
		if (!StringUtils.hasLength(totCrtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "집계기준유형");
		}

		String crtrCd = totMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}

		// header 가 없으면 등록 안됨
		// 데이터 확인
		TotCrtrVO crtrInfo = selectCrtr(apcCd, totCrtrType, crtrCd);
		if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "집계기준");
		}

		int dtlSn = crtrInfo.getMaxDtlSn();
		List<TotCrtrVO> crtrDtlList = totMngVO.getCrtrDtlList();

		if (crtrDtlList == null || crtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "저장");
		}

		String sysUserId = totMngVO.getSysLastChgUserId();
		String sysPrgrmId = totMngVO.getSysLastChgPrgrmId();

		for ( TotCrtrVO dtl : crtrDtlList ) {

			// validation check
			if (!totCrtrType.equals(dtl.getTotCrtrType())) {
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
			TotCrtrVO dtlInfo = totMngMapper.selectCrtrDtl(dtl);

			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				dtl.setNeedsInsert(true);
				dtlSn++;
				dtl.setDtlSn(dtlSn);
			} else {
				dtl.setNeedsInsert(false);
			}
		}

		for ( TotCrtrVO dtl : crtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);

			if (dtl.isNeedsInsert()) {
				totMngMapper.insertCrtrDtl(dtl);
			} else {
				totMngMapper.updateCrtrDtl(dtl);
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteCrtrDtl(TotMngVO totMngVO) throws Exception {

		String apcCd = totMngVO.getApcCd();
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String totCrtrType = totMngVO.getTotCrtrType();
		if (!StringUtils.hasLength(totCrtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준유형");
		}

		String crtrCd = totMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}

		List<TotCrtrVO> crtrDtlList = totMngVO.getCrtrDtlList();

		if (crtrDtlList == null || crtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
		}

		String sysUserId = totMngVO.getSysLastChgUserId();
		String sysPrgrmId = totMngVO.getSysLastChgPrgrmId();

		for ( TotCrtrVO dtl : crtrDtlList ) {

			// validation check
			if (!totCrtrType.equals(dtl.getTotCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "집계기준유형||등록유형");
			}

			if (!crtrCd.equals(dtl.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "기준코드||등록코드");
			}

			if (dtl.getDtlSn() < 1) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상세일련번호");
			}

			dtl.setApcCd(apcCd);

			// 데이터 확인
			TotCrtrVO dtlInfo = totMngMapper.selectCrtrDtl(dtl);

			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
			}
		}

		for ( TotCrtrVO dtl : crtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);

			totMngMapper.deleteCrtrDtl(dtl);
		}

		return null;
	}

	@Override
	public List<TotRsltVO> selectTotRsltTermList(TotRsltVO totRsltVO) throws Exception {

		List<TotRsltVO> resultList = new ArrayList<>();
		TotRsltVO lastestRsltInfo = totMngMapper.selectLatestTotRsltMst(totRsltVO);

		if (lastestRsltInfo != null && StringUtils.hasText(lastestRsltInfo.getTotYmd()) && lastestRsltInfo.getTotSn() > 0) {
			totRsltVO.setTotYmd(lastestRsltInfo.getTotYmd());
			totRsltVO.setTotSn(lastestRsltInfo.getTotSn());
		} else {
			totRsltVO.setTotYmd(totRsltVO.getCrtrYmd());
		}

		return totMngMapper.selectTotRsltTermList(totRsltVO);
	}

	@Override
	public List<TotRsltVO> selectTotRawMtrWrhsList(TotRsltVO totRsltVO) throws Exception {
		List<TotRsltVO> resultList = new ArrayList<>();
		TotRsltVO lastestRsltInfo = totMngMapper.selectLatestTotRsltMst(totRsltVO);

		if (lastestRsltInfo != null && StringUtils.hasText(lastestRsltInfo.getTotYmd()) && lastestRsltInfo.getTotSn() > 0) {
			totRsltVO.setTotYmd(lastestRsltInfo.getTotYmd());
			totRsltVO.setTotSn(lastestRsltInfo.getTotSn());

			resultList = totMngMapper.selectTotRawMtrWrhsList(totRsltVO);
		}

		return resultList;
	}

	@Override
	public List<TotRsltVO> selectTotSortPrfmncList(TotRsltVO totRsltVO) throws Exception {
		List<TotRsltVO> resultList = new ArrayList<>();
		TotRsltVO lastestRsltInfo = totMngMapper.selectLatestTotRsltMst(totRsltVO);

		if (lastestRsltInfo != null && StringUtils.hasText(lastestRsltInfo.getTotYmd()) && lastestRsltInfo.getTotSn() > 0) {
			totRsltVO.setTotYmd(lastestRsltInfo.getTotYmd());
			totRsltVO.setTotSn(lastestRsltInfo.getTotSn());

			resultList = totMngMapper.selectTotSortPrfmncList(totRsltVO);
		}

		return resultList;
	}

	@Override
	public List<TotRsltVO> selectTotPckgPrfmncList(TotRsltVO totRsltVO) throws Exception {
		List<TotRsltVO> resultList = new ArrayList<>();
		TotRsltVO lastestRsltInfo = totMngMapper.selectLatestTotRsltMst(totRsltVO);

		if (lastestRsltInfo != null && StringUtils.hasText(lastestRsltInfo.getTotYmd()) && lastestRsltInfo.getTotSn() > 0) {
			totRsltVO.setTotYmd(lastestRsltInfo.getTotYmd());
			totRsltVO.setTotSn(lastestRsltInfo.getTotSn());

			resultList = totMngMapper.selectTotPckgPrfmncList(totRsltVO);
		}

		return resultList;
	}

	@Override
	public List<TotRsltVO> selectTotSpmtPrfmncList(TotRsltVO totRsltVO) throws Exception {
		List<TotRsltVO> resultList = new ArrayList<>();
		TotRsltVO lastestRsltInfo = totMngMapper.selectLatestTotRsltMst(totRsltVO);

		if (lastestRsltInfo != null && StringUtils.hasText(lastestRsltInfo.getTotYmd()) && lastestRsltInfo.getTotSn() > 0) {
			totRsltVO.setTotYmd(lastestRsltInfo.getTotYmd());
			totRsltVO.setTotSn(lastestRsltInfo.getTotSn());

			resultList = totMngMapper.selectTotSpmtPrfmncList(totRsltVO);
		}

		return resultList;
	}

	@Override
	public List<TotRsltVO> selectTotRawMtrInvntrList(TotRsltVO totRsltVO) throws Exception {
		List<TotRsltVO> resultList = new ArrayList<>();
		TotRsltVO lastestRsltInfo = totMngMapper.selectLatestTotRsltMst(totRsltVO);

		if (lastestRsltInfo != null && StringUtils.hasText(lastestRsltInfo.getTotYmd()) && lastestRsltInfo.getTotSn() > 0) {
			totRsltVO.setTotYmd(lastestRsltInfo.getTotYmd());
			totRsltVO.setTotSn(lastestRsltInfo.getTotSn());

			resultList = totMngMapper.selectTotRawMtrInvntrList(totRsltVO);
		}

		return resultList;
	}

	@Override
	public List<TotRsltVO> selectTotSortInvntrList(TotRsltVO totRsltVO) throws Exception {
		List<TotRsltVO> resultList = new ArrayList<>();
		TotRsltVO lastestRsltInfo = totMngMapper.selectLatestTotRsltMst(totRsltVO);

		if (lastestRsltInfo != null && StringUtils.hasText(lastestRsltInfo.getTotYmd()) && lastestRsltInfo.getTotSn() > 0) {
			totRsltVO.setTotYmd(lastestRsltInfo.getTotYmd());
			totRsltVO.setTotSn(lastestRsltInfo.getTotSn());

			resultList = totMngMapper.selectTotSortInvntrList(totRsltVO);
		}

		return resultList;
	}

	@Override
	public List<TotRsltVO> selectTotGdsInvntrList(TotRsltVO totRsltVO) throws Exception {
		List<TotRsltVO> resultList = new ArrayList<>();
		TotRsltVO lastestRsltInfo = totMngMapper.selectLatestTotRsltMst(totRsltVO);

		if (lastestRsltInfo != null && StringUtils.hasText(lastestRsltInfo.getTotYmd()) && lastestRsltInfo.getTotSn() > 0) {
			totRsltVO.setTotYmd(lastestRsltInfo.getTotYmd());
			totRsltVO.setTotSn(lastestRsltInfo.getTotSn());

			resultList = totMngMapper.selectTotGdsInvntrList(totRsltVO);
		}

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertTotRsltCrt(TotRsltVO totRsltVO) throws Exception {

		if (!StringUtils.hasText(totRsltVO.getApcCd())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		// validation check
		if (!StringUtils.hasText(totRsltVO.getCrtrYmd())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준일자");
		}

		if (!StringUtils.hasText(totRsltVO.getTotCrtrType())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "집계유형");
		}

		if (!StringUtils.hasText(totRsltVO.getTermKndCd())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기간구분");
		}

		totMngMapper.insertSptotRsltCrt(totRsltVO);

		if (StringUtils.hasText(totRsltVO.getRtnCd())) {
			throw new EgovBizException(
					getMessageForMap(
							ComUtil.getResultMap(
									totRsltVO.getRtnCd(),
									totRsltVO.getRtnMsg()
							)
					)
			);
		}

		return null;
	}


	@Override
	public List<TotMngVO> selectTotCrtrInfoList(TotMngVO totMngVO) throws Exception {
		List<TotMngVO> result = totMngMapper.selectTotMngInfoList(totMngVO);
		return result;
	}

	@Override
	public List<TotMngVO> selectTotCrtrInfoDtlList(TotMngVO totMngVO) throws Exception {
		List<TotMngVO> result = totMngMapper.selectTotMngInfoDtlList(totMngVO);
		return result;
	}

	@Override
	public int insertTotCrtrInfo(TotMngVO totMngVO) throws Exception {
		// TODO Auto-generated method stub
		String status = totMngVO.getGubun();
		int result = 0;
		if(status.equals("insert")) {
			result = totMngMapper.insertTotMngInfo(totMngVO);
		}else if(status.equals("update")) {
			result = totMngMapper.updateTotMngInfo(totMngVO);
		}
		return result;

	}

	@Override
	public int insertTotCrtrDtlInfo(List<TotMngVO> TotMngVOList) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		TotMngVOList.forEach(item->{
		String status = item.getGubun();
			if(status.equals("insert")) {
				totMngMapper.insertTotMngDtlInfo(item);
			}else if(status.equals("update")) {
				totMngMapper.updateTotMngDtlInfo(item);
			}
		});
		return result;
	}

	@Override
	public int deleteTotCrtrInfo(TotMngVO totMngVO) throws Exception {

		int result = totMngMapper.deleteTotMngInfo(totMngVO);
		result = totMngMapper.deleteTotMngDtlInfo(totMngVO);

		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectSpmtPrfmncTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectSpmtPrfmncTotInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectGdsInvntrTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectGdsInvntrTotInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectPckgPrfmncTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectPckgPrfmncTotInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectRawMtrInvntrTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectRawMtrInvntrTotInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectRawMtrWrhsTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectRawMtrWrhsTotInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectSortInvntrTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		return null;
	}

	@Override
	public List<HashMap<String, Object>> selectSortPrfmncTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		return null;
	}

	@Override
	public List<HashMap<String, Object>> selectItemClsSortPrfmncAnls(TotRsltVO totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectItemClsSortPrfmncAnls(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectSortPrfmncAnls(TotRsltVO totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectSortPrfmncAnls(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectPrdctnVol(HashMap<String, Object> param) throws Exception {
		return totMngMapper.selectPrdctnVol(param);
	}

	@Override
	public List<HashMap<String, Object>> selectAnlsList(HashMap<String, Object> param) throws Exception {
		return totMngMapper.selectAnlsList(param);
	}
}
