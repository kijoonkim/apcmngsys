package com.at.apcss.am.shpgot.service.impl;

import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.shpgot.mapper.ShpgotMngMapper;
import com.at.apcss.am.shpgot.service.ShpgotMngService;
import com.at.apcss.am.shpgot.vo.ShpgotCrtrVO;
import com.at.apcss.am.shpgot.vo.ShpgotMngVO;
import com.at.apcss.am.shpgot.vo.ShpgotRsltVO;
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
 * @Class Name : ShpgotMngServiceImpl.java
 * @Description : 반품관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("shpgotMngService")
public class ShpgotMngServiceImpl extends BaseServiceImpl implements ShpgotMngService {

	@Autowired
	private ShpgotMngMapper shpgotMngMapper;

	@Resource(name = "rawMtrInvntrService")
	private RawMtrInvntrService rawMtrInvntrService;

	@Override
	public ShpgotCrtrVO selectCrtr(ShpgotCrtrVO shpgotCrtrVO) throws Exception {
		return shpgotMngMapper.selectCrtr(shpgotCrtrVO);
	}

	@Override
	public ShpgotCrtrVO selectCrtr(String apcCd, String shpgotCrtrType, String crtrCd) throws Exception {
		ShpgotCrtrVO param = new ShpgotCrtrVO();
		param.setApcCd(apcCd);
		param.setShpgotCrtrType(shpgotCrtrType);
		param.setCrtrCd(crtrCd);
		return selectCrtr(param);
	}

	@Override
	public List<ShpgotCrtrVO> selectCrtrList(ShpgotCrtrVO shpgotCrtrVO) throws Exception {
		return shpgotMngMapper.selectCrtrList(shpgotCrtrVO);
	}

	@Override
	public List<ShpgotCrtrVO> selectCrtrDtlList(ShpgotCrtrVO shpgotCrtrVO) throws Exception {
		return shpgotMngMapper.selectCrtrDtlList(shpgotCrtrVO);
	}

	@Override
	public HashMap<String, Object> insertCrtr(ShpgotMngVO shpgotMngVO) throws Exception {
		String apcCd = shpgotMngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		List<ShpgotCrtrVO> crtrList = shpgotMngVO.getCrtrList();

		if (crtrList == null || crtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준저장");
		}

		String sysUserId = shpgotMngVO.getSysLastChgUserId();
		String sysPrgrmId = shpgotMngVO.getSysLastChgPrgrmId();

		for ( ShpgotCrtrVO crtr : crtrList ) {

			// validation check
			if (!StringUtils.hasText(crtr.getShpgotCrtrType())) {
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
			ShpgotCrtrVO crtrInfo = selectCrtr(crtr);

			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				crtr.setNeedsInsert(true);
			} else {
				crtr.setNeedsInsert(false);
			}
		}

		for ( ShpgotCrtrVO crtr : crtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);

			if (crtr.isNeedsInsert()) {
				shpgotMngMapper.insertCrtr(crtr);
			} else {
				shpgotMngMapper.updateCrtr(crtr);
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteCrtr(ShpgotMngVO shpgotMngVO) throws Exception {
		String apcCd = shpgotMngVO.getApcCd();

		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		List<ShpgotCrtrVO> crtrList = shpgotMngVO.getCrtrList();

		if (crtrList == null || crtrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "기준삭제");
		}

		String sysUserId = shpgotMngVO.getSysLastChgUserId();
		String sysPrgrmId = shpgotMngVO.getSysLastChgPrgrmId();

		for ( ShpgotCrtrVO crtr : crtrList ) {

			// validation check
			if (!StringUtils.hasText(crtr.getShpgotCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "통계기준유형");
			}
			if (!StringUtils.hasText(crtr.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
			}

			crtr.setApcCd(apcCd);

			// 데이터 확인
			ShpgotCrtrVO crtrInfo = selectCrtr(crtr);
			if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET, "등록");
			}
		}

		for ( ShpgotCrtrVO crtr : crtrList ) {
			crtr.setSysFrstInptUserId(sysUserId);
			crtr.setSysFrstInptPrgrmId(sysPrgrmId);
			crtr.setSysLastChgUserId(sysUserId);
			crtr.setSysLastChgPrgrmId(sysPrgrmId);

			List<ShpgotCrtrVO> dtlList = shpgotMngMapper.selectCrtrDtlList(crtr);

			for ( ShpgotCrtrVO dtl : dtlList ) {
				dtl.setSysFrstInptUserId(sysUserId);
				dtl.setSysFrstInptPrgrmId(sysPrgrmId);
				dtl.setSysLastChgUserId(sysUserId);
				dtl.setSysLastChgPrgrmId(sysPrgrmId);

				shpgotMngMapper.deleteCrtrDtl(dtl);
			}

			shpgotMngMapper.deleteCrtr(crtr);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertCrtrDtl(ShpgotMngVO shpgotMngVO) throws Exception {

		String apcCd = shpgotMngVO.getApcCd();
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String crtrType = shpgotMngVO.getShpgotCrtrType();
		if (!StringUtils.hasLength(crtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "통계기준유형");
		}

		String crtrCd = shpgotMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}

		// header 가 없으면 등록 안됨
		// 데이터 확인
		ShpgotCrtrVO crtrInfo = selectCrtr(apcCd, crtrType, crtrCd);
		if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "반품기준");
		}

		int dtlSn = crtrInfo.getMaxDtlSn();
		List<ShpgotCrtrVO> crtrDtlList = shpgotMngVO.getCrtrDtlList();

		if (crtrDtlList == null || crtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "저장");
		}

		String sysUserId = shpgotMngVO.getSysLastChgUserId();
		String sysPrgrmId = shpgotMngVO.getSysLastChgPrgrmId();

		for ( ShpgotCrtrVO dtl : crtrDtlList ) {

			// validation check
			if (!crtrType.equals(dtl.getShpgotCrtrType())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "반품기준유형||등록유형");
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
			ShpgotCrtrVO dtlInfo = shpgotMngMapper.selectCrtrDtl(dtl);

			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				dtl.setNeedsInsert(true);
				dtlSn++;
				dtl.setDtlSn(dtlSn);
			} else {
				dtl.setNeedsInsert(false);
			}
		}

		for ( ShpgotCrtrVO dtl : crtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);

			if (dtl.isNeedsInsert()) {
				shpgotMngMapper.insertCrtrDtl(dtl);
			} else {
				shpgotMngMapper.updateCrtrDtl(dtl);
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteCrtrDtl(ShpgotMngVO shpgotMngVO) throws Exception {

		String apcCd = shpgotMngVO.getApcCd();
		if (!StringUtils.hasLength(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String crtrType = shpgotMngVO.getShpgotCrtrType();
		if (!StringUtils.hasLength(crtrType)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준유형");
		}

		String crtrCd = shpgotMngVO.getCrtrCd();
		if (!StringUtils.hasLength(crtrCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준코드");
		}

		List<ShpgotCrtrVO> crtrDtlList = shpgotMngVO.getCrtrDtlList();

		if (crtrDtlList == null || crtrDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
		}

		String sysUserId = shpgotMngVO.getSysLastChgUserId();
		String sysPrgrmId = shpgotMngVO.getSysLastChgPrgrmId();

		for ( ShpgotCrtrVO dtl : crtrDtlList ) {

			// validation check
			if (!crtrType.equals(dtl.getShpgotCrtrType())) {
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
			ShpgotCrtrVO dtlInfo = shpgotMngMapper.selectCrtrDtl(dtl);

			if (dtlInfo == null || !StringUtils.hasText(dtlInfo.getCrtrCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "삭제");
			}
		}

		for ( ShpgotCrtrVO dtl : crtrDtlList ) {
			dtl.setSysFrstInptUserId(sysUserId);
			dtl.setSysFrstInptPrgrmId(sysPrgrmId);
			dtl.setSysLastChgUserId(sysUserId);
			dtl.setSysLastChgPrgrmId(sysPrgrmId);

			shpgotMngMapper.deleteCrtrDtl(dtl);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertShpgotRsltRawMtr(ShpgotMngVO shpgotMngVO) throws Exception {

		String apcCd = shpgotMngVO.getApcCd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String shpgotYmd = shpgotMngVO.getShpgotYmd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "반품일자");
		}

		List<ShpgotRsltVO> rsltList = shpgotMngVO.getRsltList();

		if (rsltList == null || rsltList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "반품등록");
		}

		String sysUserId = shpgotMngVO.getSysLastChgUserId();
		String sysPrgrmId = shpgotMngVO.getSysLastChgPrgrmId();

		for ( ShpgotRsltVO rslt : rsltList ) {
			// validation check
			if (!StringUtils.hasText(rslt.getWrhsno())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "입고번호");
			}

			int shpgotQntt = rslt.getShpgotQntt();
			double shpgotWght = rslt.getShpgotWght();

			if (shpgotQntt <= 0 && shpgotWght <= 0) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "반품량");
			}

			RawMtrInvntrVO chkVO = rawMtrInvntrService.selectRawMtrInvntrById(apcCd, rslt.getWrhsno());
			if (chkVO == null || !StringUtils.hasText(chkVO.getWrhsno())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "재고정보");
			}

			if (shpgotQntt < chkVO.getInvntrQntt() && shpgotWght < chkVO.getInvntrWght()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_TGT_LACK, "재고량");
			}

			// 상세정보 설정
			rslt.setPrdcrCd(chkVO.getPrdcrCd());
			rslt.setItemCd(chkVO.getItemCd());
			rslt.setVrtyCd(chkVO.getVrtyCd());
			rslt.setGrdCd(chkVO.getGrdCd());
			rslt.setGdsSeCd(chkVO.getGdsSeCd());
			rslt.setWrhsSeCd(chkVO.getWrhsSeCd());
			rslt.setWarehouseSeCd(chkVO.getWarehouseSeCd());
			rslt.setPrdcrCd(chkVO.getPrdcrCd());
		}

		ShpgotRsltVO chkParam = new ShpgotRsltVO();
		chkParam.setApcCd(apcCd);
		chkParam.setShpgotYmd(shpgotYmd);

		ShpgotRsltVO shpgotInfo = shpgotMngMapper.selectShpgotRsltRawMtrMaxSn(chkParam);
		if (shpgotInfo == null) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "순번정보");
		}

		int shpgotSn = shpgotInfo.getMaxSn() + 1;
		int dtlSn = 0;
		for ( ShpgotRsltVO rslt : rsltList ) {
			dtlSn++;

			rslt.setApcCd(apcCd);
			rslt.setShpgotYmd(shpgotYmd);
			rslt.setShpgotSn(shpgotSn);
			rslt.setDtlSn(dtlSn);

			rslt.setSysFrstInptUserId(sysUserId);
			rslt.setSysFrstInptPrgrmId(sysPrgrmId);
			rslt.setSysLastChgUserId(sysUserId);
			rslt.setSysLastChgPrgrmId(sysPrgrmId);

			// 원물재고 차감
			RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
			invntrVO.setApcCd(apcCd);
			invntrVO.setWrhsno(rslt.getWrhsno());
			invntrVO.setSysFrstInptUserId(sysUserId);
			invntrVO.setSysFrstInptPrgrmId(sysPrgrmId);
			invntrVO.setSysLastChgUserId(sysUserId);
			invntrVO.setSysLastChgPrgrmId(sysPrgrmId);

			invntrVO.setPrcsQntt(rslt.getShpgotQntt());
			invntrVO.setPrcsWght(rslt.getShpgotWght());

			HashMap<String, Object> rtnObj = rawMtrInvntrService.updateInvntrShpgot(invntrVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			shpgotMngMapper.insertShpgotRsltRawMtr(rslt);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteShpgotRsltRawMtr(ShpgotMngVO shpgotMngVO) throws Exception {

		String apcCd = shpgotMngVO.getApcCd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		List<ShpgotRsltVO> rsltList = shpgotMngVO.getRsltList();

		if (rsltList == null || rsltList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "반품취소");
		}

		String sysUserId = shpgotMngVO.getSysLastChgUserId();
		String sysPrgrmId = shpgotMngVO.getSysLastChgPrgrmId();

		for ( ShpgotRsltVO rslt : rsltList ) {
			rslt.setApcCd(apcCd);
			// validation check
			if (!StringUtils.hasText(rslt.getShpgotYmd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "반품일자");
			}

			ShpgotRsltVO chkRslt = shpgotMngMapper.selectShpgotRsltRawMtr(rslt);
			if (chkRslt == null || !StringUtils.hasText(chkRslt.getShpgotYmd()) || !ComConstants.CON_NONE.equals(chkRslt.getDelYn())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "반품정보");
			}

			rslt.setShpgotQntt(chkRslt.getShpgotQntt());
			rslt.setShpgotWght(chkRslt.getShpgotWght());
		}

		for ( ShpgotRsltVO rslt : rsltList ) {

			rslt.setSysFrstInptUserId(sysUserId);
			rslt.setSysFrstInptPrgrmId(sysPrgrmId);
			rslt.setSysLastChgUserId(sysUserId);
			rslt.setSysLastChgPrgrmId(sysPrgrmId);

			// 원물재고 복원
			RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
			invntrVO.setApcCd(apcCd);
			invntrVO.setWrhsno(rslt.getWrhsno());
			invntrVO.setSysFrstInptUserId(sysUserId);
			invntrVO.setSysFrstInptPrgrmId(sysPrgrmId);
			invntrVO.setSysLastChgUserId(sysUserId);
			invntrVO.setSysLastChgPrgrmId(sysPrgrmId);

			invntrVO.setPrcsQntt(rslt.getShpgotQntt());
			invntrVO.setPrcsWght(rslt.getShpgotWght());

			HashMap<String, Object> rtnObj = rawMtrInvntrService.updateInvntrShpgotCncl(invntrVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			shpgotMngMapper.updateShpgotRsltRawMtrForDelY(rslt);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertShpgotRsltGds(ShpgotMngVO shpgotMngVO) throws Exception {
		return null;
	}

	@Override
	public HashMap<String, Object> deleteShpgotRsltGds(ShpgotMngVO shpgotMngVO) throws Exception {
		return null;
	}

	@Override
	public List<ShpgotRsltVO> selectShpgotRsltRawMtrList(ShpgotRsltVO shpgotRsltVO) throws Exception {

		/** pltno 다중 검색조건 추가 **/
		if(shpgotRsltVO.getPltno() != null){
			String[] pltnos = shpgotRsltVO.getPltno().split(",");
			if(pltnos.length > 1){
				shpgotRsltVO.setPltno("");
				shpgotRsltVO.setPltnos(pltnos);
			}
		}

		return shpgotMngMapper.selectShpgotRsltRawMtrList(shpgotRsltVO);
	}
}
