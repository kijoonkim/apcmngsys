package com.at.apcss.am.sort.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.at.apcss.am.cmns.service.*;
import com.at.apcss.am.cmns.vo.*;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.pckg.service.PckgInptService;
import com.at.apcss.am.pckg.service.PckgMngService;
import com.at.apcss.am.pckg.service.PckgPrfmncService;
import com.at.apcss.am.pckg.vo.PckgInptVO;
import com.at.apcss.am.pckg.vo.PckgMngVO;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import com.at.apcss.am.sort.service.SortCmndService;
import com.at.apcss.am.sort.service.SortInptPrfmncService;
import com.at.apcss.am.sort.service.SortMngService;
import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.SortInptPrfmncVO;
import com.at.apcss.am.sort.vo.SortMngVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.am.spmt.service.SpmtPrfmncService;
import com.at.apcss.am.wrhs.service.RawMtrWrhsService;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : SortPrfmncServiceImpl.java
 * @Description : 선별실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("sortMngService")
public class SortMngServiceImpl extends BaseServiceImpl implements SortMngService {


	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name="sortCmndService")
	private SortCmndService sortCmndService;

	@Resource(name="sortInptPrfmncService")
	private SortInptPrfmncService sortInptPrfmncService;

	@Resource(name="sortPrfmncService")
	private SortPrfmncService sortPrfmncService;

	@Resource(name="sortInvntrService")
	private SortInvntrService sortInvntrService;

	@Resource(name="rawMtrInvntrService")
	private RawMtrInvntrService rawMtrInvntrService;

	@Resource(name="pckgMngService")
	private PckgMngService pckgMngService;

	@Resource(name="cmnsItemService")
	private CmnsItemService cmnsItemService;

	@Resource(name="cmnsVrtyService")
	private CmnsVrtyService cmnsVrtyService;

	@Resource(name="spmtPckgUnitService")
	private SpmtPckgUnitService spmtPckgUnitService;


	@Resource(name="cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Resource(name="rawMtrWrhsService")
	private RawMtrWrhsService rawMtrWrhsService;

	@Resource(name="pckgInptService")
	private PckgInptService pckgInptService;

	@Resource(name="pckgPrfmncService")
	private PckgPrfmncService pckgPrfmncService;


	@Resource(name="gdsInvntrService")
	private GdsInvntrService gdsInvntrService;

	@Resource(name="spmtPrfmncService")
	private SpmtPrfmncService spmtPrfmncService;

	@Resource(name="comCdService")
	private ComCdService comCdService;

	@Resource(name="prdcrService")
	private PrdcrService prdcrService;

	@Override
	public HashMap<String, Object> insertSortCmnd(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public HashMap<String, Object> insertSortInpt(SortMngVO sortMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		List<SortInptPrfmncVO> inptList = sortMngVO.getSortInptPrfmncList();

		// 선별투입 등록 list
		List<SortInptPrfmncVO> sortInptList = new ArrayList<>();

		for ( SortInptPrfmncVO inpt : inptList ) {

			// 원료정보 확인
			RawMtrInvntrVO invntrParam = new RawMtrInvntrVO();
			invntrParam.setApcCd(sortMngVO.getApcCd());
			invntrParam.setPltno(inpt.getPltno());
			invntrParam.setWrhsno(inpt.getWrhsno());

			RawMtrInvntrVO invntrInfo = rawMtrInvntrService.selectRawMtrInvntr(invntrParam);
			if (invntrInfo == null
					|| !StringUtils.hasText(invntrInfo.getWrhsno())
					|| ComConstants.CON_YES.equals(invntrInfo.getDelYn())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고정보");	// W0005	{0}이/가 없습니다.
			}

			if (!StringUtils.hasText(inpt.getFcltCd())) {
				ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별기");	// W0005	{0}이/가 없습니다.
			}

			if (inpt.getQntt() <= 0) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "투입수량");	// W0005	{0}이/가 없습니다.
			}

			if (inpt.getQntt() > invntrInfo.getInvntrQntt()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고수량||투입수량");	// W0008	{0} 보다 {1}이/가 큽니다.
			}

			SortInptPrfmncVO inptVO = new SortInptPrfmncVO();
			BeanUtils.copyProperties(sortMngVO, inptVO);
			BeanUtils.copyProperties(inpt, inptVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			// 투입실적 항목 set
			sortInptList.add(inptVO);
		}

		for ( SortInptPrfmncVO inptVO : sortInptList ) {

			// 투입등록
			rtnObj = sortInptPrfmncService.insertSortInptPrfmnc(inptVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 원물재고 투입진행량 update
			RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
			BeanUtils.copyProperties(inptVO, invntrVO);
			invntrVO.setInptPrgrsQntt(inptVO.getQntt());
			invntrVO.setInptPrgrsWght(inptVO.getWght());

			rtnObj = rawMtrInvntrService.updateInvntrSortInpt(invntrVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}


	@Override
	public HashMap<String, Object> deleteSortInpt(SortMngVO sortMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		List<SortInptPrfmncVO> inptList = sortMngVO.getSortInptPrfmncList();

		// 선별투입 삭제 list
		List<SortInptPrfmncVO> sortInptList = new ArrayList<>();

		for ( SortInptPrfmncVO inpt : inptList ) {

			inpt.setApcCd(sortMngVO.getApcCd());

			// 투입실적 확인
			SortInptPrfmncVO sortInptInfo = sortInptPrfmncService.selectSortInptPrfmnc(inpt);
			if (sortInptInfo == null
					|| !StringUtils.hasText(sortInptInfo.getWrhsno())
					|| ComConstants.CON_YES.equals(sortInptInfo.getDelYn())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별투입정보");	// W0005	{0}이/가 없습니다.
			}

			if (StringUtils.hasText(sortInptInfo.getSortno())) {
				// TODO 테이블 ALTER 후 진행
				//return ComUtil.getResultMap(ComConstants.MSGCD_TARGET_EXIST, "선별투입정보");
			}

			inpt.setQntt(sortInptInfo.getQntt());
			inpt.setWght(sortInptInfo.getWght());

			SortInptPrfmncVO inptVO = new SortInptPrfmncVO();
			BeanUtils.copyProperties(sortMngVO, inptVO);
			BeanUtils.copyProperties(inpt, inptVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			// 투입실적 항목 set
			sortInptList.add(inptVO);
		}

		for ( SortInptPrfmncVO inptVO : sortInptList ) {

			// 원물재고 투입진행량 update
			RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
			BeanUtils.copyProperties(inptVO, invntrVO);
			invntrVO.setInptPrgrsQntt(inptVO.getQntt());
			invntrVO.setInptPrgrsWght(inptVO.getWght());

			rtnObj = rawMtrInvntrService.deleteInvntrSortInpt(invntrVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 투입 취소
			rtnObj = sortInptPrfmncService.deleteSortInptPrfmnc(inptVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}



	@Override
	public HashMap<String, Object> insertSortInptPrfmnc(SortMngVO sortMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		List<SortInptPrfmncVO> inptList = sortMngVO.getSortInptPrfmncList();

		// 선별투입실적 등록용 list
		List<SortInptPrfmncVO> sortInptPrfmncVOList = new ArrayList<>();

		// 선별실적 등록용 list
		List<SortPrfmncVO> sortPrfmncVOList = new ArrayList<>();

		for ( SortInptPrfmncVO inptInfo : inptList ) {

			SortInptPrfmncVO inptVO = new SortInptPrfmncVO();
			BeanUtils.copyProperties(sortMngVO, inptVO);
			BeanUtils.copyProperties(inptInfo, inptVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			// 투입실적 항목 set

			sortInptPrfmncVOList.add(inptVO);

			// 선별실적 vo
			SortPrfmncVO sortPrfmncVO = new SortPrfmncVO();
			BeanUtils.copyProperties(inptInfo, sortPrfmncVO);
			// 선별실적 항목 set
			sortPrfmncVOList.add(sortPrfmncVO);
		}

		rtnObj = sortInptPrfmncService.insertSortInptPrfmncList(sortInptPrfmncVOList);

		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 실적 등록
		sortMngVO.setSortPrfmncList(sortPrfmncVOList);
		rtnObj = insertSortPrfmnc(sortMngVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertSortPrfmnc(SortMngVO sortMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		String apcCd = sortMngVO.getApcCd();

		String sortYmd = sortMngVO.getSortYmd();

		String rawMtrVlType = sortMngVO.getRawMtrVlType();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String sortno = sortMngVO.getSortno();

		if (!StringUtils.hasText(sortno)) {
			sortno = cmnsTaskNoService.selectSortno(apcCd, sortMngVO.getSortYmd());
		}
		sortMngVO.setSortno(sortno);

		// 실적등록 대상정보 목록
		List<SortPrfmncVO> prfmncList = sortMngVO.getSortPrfmncList();
		// 실적등록 대상재고 목록
		List<RawMtrInvntrVO> invntrList = sortMngVO.getRawMtrInvntrList();

		/** 원물입고재처리 관련 선별실적 등록시 prcsType 체크
		 *  모든 선별실적은 1개 이상의 원물재고 내역이 필요함. 재처리 경우 radio 단 1개만 존재 **/
		String prcsType = invntrList.get(0).getPrcsType();

		List<RawMtrInvntrVO> rawMtrInvntrVOList = new ArrayList<>();

		for ( SortPrfmncVO sort : prfmncList ) {
			sort.setRmnQntt(sort.getSortQntt());
			sort.setRmnWght(sort.getSortWght());
		}

		// 포장자동등록 대상
		List<SortPrfmncVO> pckgList = new ArrayList<>();

		String sortUpdtYn = sortMngVO.getSortUpdtYn();

		if (ComConstants.CON_YES.equals(sortUpdtYn)) {
			// 재고 >> 선별실적 정보 set	// 재고배분
			for ( RawMtrInvntrVO orgnInv : invntrList ) {

				RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
				BeanUtils.copyProperties(sortMngVO, invntrVO);
				BeanUtils.copyProperties(orgnInv, invntrVO,
						ApcConstants.PROP_APC_CD,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

				if (ComConstants.CON_YES.equals(orgnInv.getNeedInsertYn())) {

					RawMtrWrhsVO rawMtrWrhsVO = new RawMtrWrhsVO();
					BeanUtils.copyProperties(sortMngVO, rawMtrWrhsVO);
					rawMtrWrhsVO.setWrhsYmd(invntrVO.getWrhsYmd());
					rawMtrWrhsVO.setPrdctnYr(invntrVO.getPrdctnYr());
					rawMtrWrhsVO.setApcCd(apcCd);
					rawMtrWrhsVO.setPltno(invntrVO.getPltno());
					rawMtrWrhsVO.setItemCd(invntrVO.getItemCd());
					rawMtrWrhsVO.setVrtyCd(invntrVO.getVrtyCd());
					rawMtrWrhsVO.setPrdcrCd(invntrVO.getPrdcrCd());
					rawMtrWrhsVO.setWarehouseSeCd(invntrVO.getWarehouseSeCd());
					rawMtrWrhsVO.setBxQntt(invntrVO.getInvntrQntt());
					rawMtrWrhsVO.setWrhsWght(invntrVO.getInvntrWght());
					rawMtrWrhsVO.setGdsSeCd(invntrVO.getGdsSeCd());
					rawMtrWrhsVO.setWrhsSeCd(invntrVO.getWrhsSeCd());
					rawMtrWrhsVO.setTrsprtSeCd(invntrVO.getTrsprtSeCd());
					rawMtrWrhsVO.setGrdCd(invntrVO.getGrdCd());
					rawMtrWrhsVO.setStdGrdList(invntrVO.getStdGrdList());

					rtnObj = rawMtrWrhsService.insertRawMtrWrhs(rawMtrWrhsVO);

					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}

					invntrVO.setWrhsno(rawMtrWrhsVO.getWrhsno());
				}

				RawMtrInvntrVO invntrInfo = rawMtrInvntrService.selectRawMtrInvntr(invntrVO);

				if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
				}

				invntrVO.setInptPrgrsYn(orgnInv.getInptPrgrsYn());
				invntrVO.setPrdcrCd(invntrInfo.getPrdcrCd());
				invntrVO.setGdsSeCd(invntrInfo.getGdsSeCd());
				invntrVO.setWrhsSeCd(invntrInfo.getWrhsSeCd());
				invntrVO.setInvntrQntt(invntrInfo.getInvntrQntt());
				invntrVO.setInvntrWght(invntrInfo.getInvntrWght());

				invntrVO.setSortQntt(0);
				invntrVO.setSortWght(0);

				rawMtrInvntrVOList.add(invntrVO);
			}

			for ( RawMtrInvntrVO inv : rawMtrInvntrVOList ) {

				String wrhsno = inv.getWrhsno();
				String prdcrCd = inv.getPrdcrCd();
				String gdsSeCd = inv.getGdsSeCd();
				String wrhsSeCd = inv.getWrhsSeCd();

				// 배분없음
				for ( SortPrfmncVO sort : prfmncList ) {
					sort.setWrhsno(wrhsno);
					sort.setRprsPrdcrCd(prdcrCd);
					sort.setGdsSeCd(gdsSeCd);
					sort.setWrhsSeCd(wrhsSeCd);
					sort.setRmnQntt(0);
					sort.setRmnWght(0);
					sort.setInptYmd(sortMngVO.getSortYmd());
				}
			}
		} else {
			// 재고 >> 선별실적 정보 set	// 재고배분
			for ( RawMtrInvntrVO orgnInv : invntrList ) {

				RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
				BeanUtils.copyProperties(sortMngVO, invntrVO);
				BeanUtils.copyProperties(orgnInv, invntrVO,
						ApcConstants.PROP_APC_CD,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

				if (ComConstants.CON_YES.equals(orgnInv.getNeedInsertYn())) {

					RawMtrWrhsVO rawMtrWrhsVO = new RawMtrWrhsVO();
					BeanUtils.copyProperties(sortMngVO, rawMtrWrhsVO);
					rawMtrWrhsVO.setWrhsYmd(invntrVO.getWrhsYmd());
					rawMtrWrhsVO.setPrdctnYr(invntrVO.getPrdctnYr());
					rawMtrWrhsVO.setApcCd(apcCd);
					rawMtrWrhsVO.setPltno(invntrVO.getPltno());
					rawMtrWrhsVO.setItemCd(invntrVO.getItemCd());
					rawMtrWrhsVO.setVrtyCd(invntrVO.getVrtyCd());
					rawMtrWrhsVO.setPrdcrCd(invntrVO.getPrdcrCd());
					rawMtrWrhsVO.setWarehouseSeCd(invntrVO.getWarehouseSeCd());
					rawMtrWrhsVO.setBxQntt(invntrVO.getInvntrQntt());
					rawMtrWrhsVO.setWrhsWght(invntrVO.getInvntrWght());
					rawMtrWrhsVO.setGdsSeCd(invntrVO.getGdsSeCd());
					rawMtrWrhsVO.setWrhsSeCd(invntrVO.getWrhsSeCd());
					rawMtrWrhsVO.setTrsprtSeCd(invntrVO.getTrsprtSeCd());
					rawMtrWrhsVO.setGrdCd(invntrVO.getGrdCd());
					rawMtrWrhsVO.setStdGrdList(invntrVO.getStdGrdList());

					rtnObj = rawMtrWrhsService.insertRawMtrWrhs(rawMtrWrhsVO);

					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}

					invntrVO.setWrhsno(rawMtrWrhsVO.getWrhsno());
				}

				RawMtrInvntrVO invntrInfo = rawMtrInvntrService.selectRawMtrInvntr(invntrVO);

				if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
				}

				if (ComConstants.CON_YES.equals(orgnInv.getInptPrgrsYn())) {
					if (invntrVO.getInptWght() > invntrInfo.getInptPrgrsWght()) {
						return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "투입진행량||투입량");	// W0008	{0} 보다 {1}이/가 큽니다.
					}
				} else {
					if (invntrVO.getInptWght() > invntrInfo.getInvntrWght() && !("RR".equals(prcsType))) {
						return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
					}
				}

				invntrVO.setInptPrgrsYn(orgnInv.getInptPrgrsYn());
				invntrVO.setPrdcrCd(invntrInfo.getPrdcrCd());
				invntrVO.setGdsSeCd(invntrInfo.getGdsSeCd());
				invntrVO.setWrhsSeCd(invntrInfo.getWrhsSeCd());
				invntrVO.setInvntrQntt(invntrInfo.getInvntrQntt());
				invntrVO.setInvntrWght(invntrInfo.getInvntrWght());

				invntrVO.setSortQntt(0);
				invntrVO.setSortWght(0);

				rawMtrInvntrVOList.add(invntrVO);
			}

			for ( RawMtrInvntrVO inv : rawMtrInvntrVOList ) {

				String inptYmd = ComConstants.CON_BLANK;
				String wrhsno = inv.getWrhsno();
				String prdcrCd = inv.getPrdcrCd();
				String gdsSeCd = inv.getGdsSeCd();
				String wrhsSeCd = inv.getWrhsSeCd();

				// 지정 투입수량, 투입중량
				double inptQntt = inv.getInptQntt();
				double inptWght = inv.getInptWght();

				double sortQntt = inv.getSortQntt();
				double sortWght = inv.getSortWght();

				if (AmConstants.CON_INVNTR_VL_MNG_TYPE_QNTT.equals(rawMtrVlType)) {

					inptYmd = sortMngVO.getSortYmd();

					// 배분없음
					for ( SortPrfmncVO sort : prfmncList ) {
						sort.setWrhsno(wrhsno);
						sort.setRprsPrdcrCd(prdcrCd);
						sort.setGdsSeCd(gdsSeCd);
						sort.setWrhsSeCd(wrhsSeCd);
						sort.setRmnQntt(0);
						sort.setRmnWght(0);
					}

					inv.setInptYmd(inptYmd);
					inv.setSortQntt(inptQntt);
					inv.setSortWght(inptWght);

				} else {
					for ( SortPrfmncVO sort : prfmncList ) {

						if (StringUtils.hasText(sort.getWrhsno()) && sort.getRmnWght() <= 0) {
							continue;
						}

						double applQntt = 0;
						double applWght = 0;

						if (inptWght - sortWght < sort.getRmnWght()) {
							applQntt = inptQntt - sortQntt;
							applWght = inptWght - sortWght;
						} else {
							applQntt = sort.getRmnQntt();
							applWght = sort.getRmnWght();
						}

						sort.setWrhsno(wrhsno);
						sort.setRprsPrdcrCd(prdcrCd);
						sort.setGdsSeCd(gdsSeCd);
						sort.setWrhsSeCd(wrhsSeCd);

						sortQntt += applQntt;
						sortWght += applWght;
						if("RR".equals(prcsType)){
							sort.setRmnQntt(0);
							sort.setRmnWght(0);
						}else{
							sort.setRmnQntt((int) (sort.getRmnQntt() - applQntt));
							sort.setRmnWght(sort.getRmnWght() - applWght);
						}

						if (!StringUtils.hasText(inptYmd)) {
							inptYmd = sort.getInptYmd();
						}
					}

					inv.setInptYmd(inptYmd);
					inv.setSortQntt(sortQntt);
					inv.setSortWght(sortWght);
				}
			}

			for ( SortPrfmncVO sort : prfmncList ) {
				if (!StringUtils.hasText(sort.getWrhsno())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
				}
				if (sort.getRmnWght() > 0) {
					return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
				}
				if (!StringUtils.hasText(sort.getItemCd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품목");
				}
				if (!StringUtils.hasText(sort.getVrtyCd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품종");
				}
				if (!StringUtils.hasText(sort.getSpcfctCd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "규격");
				}
				if (!StringUtils.hasText(sort.getGrdCd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등급");
				}
			}
		}

		// 선별실적 등록
		List<SortPrfmncVO> sortPrfmncVOList = new ArrayList<>();
		List<String> sortSnList = new ArrayList<>();

		int sortSn = 0;
		for ( SortPrfmncVO prfmncInfo : prfmncList ) {

			sortSn++;

			SortPrfmncVO prfmncVO = new SortPrfmncVO();
			BeanUtils.copyProperties(sortMngVO, prfmncVO);
			BeanUtils.copyProperties(prfmncInfo, prfmncVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			prfmncVO.setSortno(sortno);
			prfmncVO.setSortSn(sortSn);
			prfmncVO.setStdGrdList(prfmncInfo.getStdGrdList());
			sortPrfmncVOList.add(prfmncVO);

			prfmncVO.setPckgYn(prfmncVO.getAutoPckgInptYn());

			if (ComConstants.CON_YES.equals(prfmncVO.getAutoPckgInptYn())) {

				SortPrfmncVO pckgVO = new SortPrfmncVO();
				BeanUtils.copyProperties(prfmncVO, pckgVO);
				pckgList.add(pckgVO);
			}

			sortSnList.add(ComUtil.toString(sortSn));
		}

		sortMngVO.setSortSnList(sortSnList);
		rtnObj = sortPrfmncService.insertSortPrfmncList(sortPrfmncVOList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		if (!ComConstants.CON_YES.equals(sortUpdtYn)) {
			// 선별실적 등록 시 투입실적도 함께 등록 (투입실적 여부 확인 후 등록)
			List<SortInptPrfmncVO> sortInptPrfmncVOList = new ArrayList<>();
			for ( RawMtrInvntrVO inv : rawMtrInvntrVOList ) {
				SortInptPrfmncVO sortInptVO = new SortInptPrfmncVO();
				BeanUtils.copyProperties(inv, sortInptVO);
				sortInptVO.setSortno(sortno);

				sortInptVO.setQntt((int) inv.getInptQntt());
				sortInptVO.setWght(inv.getInptWght());

				if(!StringUtils.hasText(sortInptVO.getInptYmd())){
					sortInptVO.setInptYmd(sortYmd);
				}

				// 투입실적 항목 set
				sortInptPrfmncVOList.add(sortInptVO);
			}

			rtnObj = sortInptPrfmncService.insertSortInptPrfmncList(sortInptPrfmncVOList);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 원물재고정보 update
			for ( RawMtrInvntrVO inv : rawMtrInvntrVOList ) {
				if("RR".equals(prcsType)){
					/** 원물입고 재처리된 원물재고에 대해서 잔량체크없이 0처리 **/
					inv.setQntt(0);
					inv.setWght(0);
				}
				HashMap<String, Object> rtnMap = rawMtrInvntrService.updateInvntrSortPrfmnc(inv);
				if (rtnMap != null) {
					throw new EgovBizException(getMessageForMap(rtnMap));
				}
			}
		}


		// 포장자동등록 선택 시 포장실적 등록
		if (!pckgList.isEmpty()) {
			//sortPrfmncVOList
			List<SortInvntrVO> sortInvntrList = new ArrayList<>();
			List<PckgPrfmncVO> pckgPrfmncList = new ArrayList<>();

			for ( SortPrfmncVO sortVO : pckgList ) {
				SortInvntrVO invntrVO = new SortInvntrVO();
				BeanUtils.copyProperties(sortVO, invntrVO);

				invntrVO.setInptQntt(sortVO.getSortQntt());
				invntrVO.setInptWght(sortVO.getSortWght());
				invntrVO.setQntt(0);
				invntrVO.setWght(0);

				sortInvntrList.add(invntrVO);

				PckgPrfmncVO pckgVO = new PckgPrfmncVO();
				BeanUtils.copyProperties(invntrVO, pckgVO);

				pckgVO.setFcltCd(null);
				pckgVO.setInptYmd(sortVO.getInptYmd());
				pckgVO.setPckgYmd(sortVO.getInptYmd());
				pckgVO.setPckgQntt(sortVO.getSortQntt());
				pckgVO.setPckgWght(sortVO.getSortWght());
				//pckgVO.setGdsGrd(sortVO.getGrdCd());

				pckgVO.setSpmtPckgUnitCd(sortVO.getSpmtPckgUnitCd());
				pckgVO.setGdsGrd(sortVO.getGdsGrd());
				pckgVO.setStdGrdList(sortVO.getGdsStdGrdList());

				if (!StringUtils.hasText(pckgVO.getSpmtPckgUnitCd())) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품명")));
				}
				if (!StringUtils.hasText(pckgVO.getGdsGrd())) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품등급")));
				}
				if (pckgVO.getStdGrdList() == null || pckgVO.getStdGrdList().isEmpty()) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품등급")));
				}

				SpmtPckgUnitVO pckgUnitParam = new SpmtPckgUnitVO();
				pckgUnitParam.setApcCd(pckgVO.getApcCd());
				pckgUnitParam.setSpmtPckgUnitCd(pckgVO.getSpmtPckgUnitCd());
				// 출하포장단위로 규격코드 조회
				SpmtPckgUnitVO spmtPckgUnitVO = spmtPckgUnitService.selectSpmtPckgUnit(pckgUnitParam);

				if (spmtPckgUnitVO == null || !StringUtils.hasText(spmtPckgUnitVO.getSpmtPckgUnitCd())) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품조회결과")));
				}

				pckgVO.setSpcfctCd(spmtPckgUnitVO.getSpcfctCd());

				pckgVO.setPckgSortno(sortVO.getSortno());
				pckgVO.setPckgSortSn(sortVO.getSortSn());

				pckgPrfmncList.add(pckgVO);
			}

			PckgMngVO pckgMngVO = new PckgMngVO();
			BeanUtils.copyProperties(sortMngVO, pckgMngVO);
			pckgMngVO.setSortInvntrList(sortInvntrList);
			pckgMngVO.setPckgPrfmncList(pckgPrfmncList);
			pckgMngVO.setPckgYmd(sortMngVO.getSortYmd());

			rtnObj = pckgMngService.insertPckgPrfmnc(pckgMngVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}


	@Override
	public HashMap<String, Object> insertImportSortRslt(SortMngVO sortMngVO) throws Exception {

		List<SortMngVO> sortMngList = new ArrayList<>();

		List<SortPrfmncVO> prfmncList = sortMngVO.getSortPrfmncList();

		if (prfmncList == null || prfmncList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등록대상");
		}

		// 선별일자별, 품목, 품종별 실적 분리
		for ( SortPrfmncVO sort : prfmncList ) {

			boolean needAdd = true;

			SortMngVO mngVO = null;

			List<SortPrfmncVO> sortPrfmncList = new ArrayList<>();

			String sortKey = sort.getInptYmd()
						+ sort.getItemCd()
						+ sort.getVrtyCd();

			for ( SortMngVO chkMngVO : sortMngList ) {
				if ( ComUtil.nullToEmpty(sortKey).equals(chkMngVO.getSortKey())) {
					mngVO = chkMngVO;
					sortPrfmncList = chkMngVO.getSortPrfmncList();
					if (sortPrfmncList == null) {
						sortPrfmncList = new ArrayList<>();
					}
					needAdd = false;
					break;
				}
			}

			if (mngVO == null) {
				mngVO = new SortMngVO();
				BeanUtils.copyProperties(sortMngVO, mngVO);
				mngVO.setSortKey(sortKey);
				mngVO.setSortYmd(sort.getInptYmd());
				mngVO.setIsImpYn(ComConstants.CON_YES);
			}

			sortPrfmncList.add(sort);
			mngVO.setSortPrfmncList(sortPrfmncList);
			if (needAdd) {
				sortMngList.add(mngVO);
			}
		}

		for ( SortMngVO mngVO : sortMngList ) {

			// 가상재고 생성 허용
			mngVO.setNeedsVrInvntrRegYn(ComConstants.CON_YES);
			HashMap<String, Object> rtnObj = insertSortRslt(mngVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertSortRslt(SortMngVO sortMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		String apcCd = sortMngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String sortno = sortMngVO.getSortno();

		if (!StringUtils.hasText(sortno)) {
			sortno = cmnsTaskNoService.selectSortno(apcCd, sortMngVO.getSortYmd());
		}

		String needsVrInvntrRegYn = sortMngVO.getNeedsVrInvntrRegYn();

		// 실적등록 대상재고 목록
		List<RawMtrInvntrVO> invntrList = sortMngVO.getRawMtrInvntrList();
		// 실적등록 대상정보 목록
		List<SortPrfmncVO> prfmncList = sortMngVO.getSortPrfmncList();

		if (prfmncList == null || prfmncList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별실적");
		}

		// 원물재고 투입대상
		List<RawMtrInvntrVO> rawMtrInvntrVOList = new ArrayList<>();
		// 포장자동등록 대상
		List<SortPrfmncVO> pckgList = new ArrayList<>();

		// 원물입고
		if (invntrList == null || invntrList.isEmpty()) {

			List<String> excldWrhsnoList = new ArrayList<>();

			invntrList = new ArrayList<RawMtrInvntrVO>();

			// 생산자, 품목, 품종에 따른 원물재고를 가져온다.
			// 투입진행 중 건은 제외한다.
			// 품목별

			double totInptQntt = (double)prfmncList.get(0).getInptQntt();
			double totInptWght = prfmncList.get(0).getInptWght();

			// 투입수량으로 처리
			boolean hasInptQntt = false;
			boolean hasInptWght = false;

			hasInptQntt = totInptQntt > 0;
			if (!hasInptQntt) {
				hasInptWght = totInptWght > 0;
			}

			int totCnt = prfmncList.size();

			if (hasInptQntt) {
				int idx = -1;
				// 투입수량 배분
				for ( SortPrfmncVO sort : prfmncList ) {
					idx++;
					int inptQntt = (int)ComUtil.round(totInptQntt / (totCnt - idx));
					sort.setInptQntt(inptQntt);

					totInptQntt -= inptQntt;
					logger.debug("idx {}, inptQntt {}", idx, inptQntt);
				}
			}

			if (hasInptWght) {
				int idx = -1;
				// 투입수량 배분
				for ( SortPrfmncVO sort : prfmncList ) {
					idx++;
					double inptWght = ComUtil.round(totInptWght / (totCnt - idx));
					sort.setInptWght(inptWght);

					totInptWght -= inptWght;
				}
			}

			int sn = 0;
			labelLoopSort:
				for ( SortPrfmncVO sort : prfmncList ) {
					String inptYmd = sort.getInptYmd();
					sn++;
					sort.setRmnQntt(sort.getSortQntt());
					sort.setRmnWght(sort.getSortWght());

					// 품목
					String itemCd = ComUtil.nullToEmpty(sort.getItemCd());
					// 품종
					String vrtyCd = ComUtil.nullToEmpty(sort.getVrtyCd());
					// 생산자
					String prdcrCd = ComUtil.nullToEmpty(sort.getPrdcrCd());
					// 창고
					String warehouseSeCdFrom = ComUtil.nullToEmpty(sort.getWarehouseSeCdFrom());

					int inptQntt = sort.getInptQntt();
					double inptWght = sort.getInptWght();

					double sortQntt = sort.getRmnQntt();
					double sortWght = sort.getRmnWght();

					// 감량률 조회
					CmnsItemVO itemParam = new CmnsItemVO();
					itemParam.setApcCd(apcCd);
					itemParam.setItemCd(itemCd);

					CmnsItemVO cmnsItemVO = cmnsItemService.selectCmnsApcItem(itemParam);
					if (cmnsItemVO == null || !StringUtils.hasText(cmnsItemVO.getItemCd())) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품목조회정보");
					}

					CmnsVrtyVO vrtyParam = new CmnsVrtyVO();
					vrtyParam.setApcCd(apcCd);
					vrtyParam.setItemCd(itemCd);
					vrtyParam.setVrtyCd(vrtyCd);

					CmnsVrtyVO cmnsVrtyVO = cmnsVrtyService.selectApcVrty(vrtyParam);
					if (cmnsVrtyVO == null || !StringUtils.hasText(cmnsVrtyVO.getVrtyCd())) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품종조회정보");
					}

					double unitWght = cmnsVrtyVO.getUnitWght();

					/*
					double sortRdcdRt = cmnsItemVO.getSortRdcdRt();

					if (sortRdcdRt >= 100) {
						return ComUtil.getResultMap(ComConstants.MSGCD_TGT_EQUAL_GREATER_THAN, "감량률||100%");
					}


					double calFctr = 100 / (100 - sortRdcdRt);
					sortQntt = (int)ComUtil.round(sortQntt * calFctr);
					sortWght = ComUtil.round(sortWght * calFctr);

					logger.debug("calFctr: {}", calFctr);
					 */
					logger.debug("sortQntt: {}", sortQntt);
					logger.debug("sortWght: {}", sortWght);

					// 투입수량이 있으면 수량 기준으로 차감
					if (hasInptQntt) {

						sortQntt = inptQntt;

						for ( RawMtrInvntrVO orgnInv : rawMtrInvntrVOList ) {

							logger.debug(
									"orgn$#@ s: {}, no: {}, inpt: {}, sort: {}",
									sn,
									orgnInv.getWrhsno(),
									orgnInv.getInptQntt(),
									orgnInv.getSortQntt());

							double wrhsQntt = orgnInv.getWrhsQntt();
							double wrhsWght = orgnInv.getWrhsWght();

							double invRmnQntt = orgnInv.getRmnQntt();
							double invRmnWght = orgnInv.getRmnWght();

							if (wrhsQntt <= 0) {
								continue;
							}

							if (invRmnQntt <= 0) {
								continue;
							}

							// 재고정보 확인 중량기준으로
							if (
								itemCd.equals(orgnInv.getItemCd())
								&& vrtyCd.equals(orgnInv.getVrtyCd())
								&& (!StringUtils.hasText(prdcrCd) || prdcrCd.equals(orgnInv.getPrdcrCd()))
								&& warehouseSeCdFrom.equals(orgnInv.getWarehouseSeCd())) {

								logger.debug(
										"orgnInv 1 $#@ s: {}, no: {}, wrhsQntt: {}, wrhsWght: {}, invRmnQntt: {}, invRmnWght: {}",
										sn,
										orgnInv.getWrhsno(),
										wrhsQntt,
										wrhsWght,
										invRmnQntt,
										invRmnWght
										);

								if (sortQntt > invRmnQntt) {
									sortQntt -= invRmnQntt;
									sortWght = ComUtil.round(invRmnQntt * wrhsWght / wrhsQntt);
									if (sortWght > invRmnWght) {
										sortWght = invRmnWght;
									}
									orgnInv.setRmnQntt(0);
									orgnInv.setRmnWght(0);

									orgnInv.setInptQntt(orgnInv.getInptQntt() + invRmnQntt);
									orgnInv.setInptWght(orgnInv.getInptWght() + sortWght);

								} else {
									invRmnQntt -= sortQntt;
									sortWght = sortQntt * wrhsWght / wrhsQntt;
									if (sortWght > invRmnWght) {
										sortWght = invRmnWght;
									}
									invRmnWght -= sortWght;
									orgnInv.setRmnQntt(invRmnQntt);
									orgnInv.setRmnWght(invRmnWght);

									orgnInv.setInptQntt(orgnInv.getInptQntt() + sortQntt);
									orgnInv.setInptWght(orgnInv.getInptWght() + sortWght);

									sortQntt = 0;
									sortWght = 0;
								}

								sort.setWrhsno(orgnInv.getWrhsno());
								sort.setRprsPrdcrCd(orgnInv.getPrdcrCd());
								sort.setGdsSeCd(orgnInv.getGdsSeCd());
								sort.setWrhsSeCd(orgnInv.getWrhsSeCd());
								sort.setPrdctnYr(orgnInv.getPrdctnYr());

								if (sortQntt <= 0) {
									sort.setRmnQntt(0);
									sort.setRmnWght(0);
									// 원물재고가 선정이 되었으므로 통과
									continue labelLoopSort;
								}
							}
						}

						// excldWrhsnoList	rawMtrInvntrVOList
						// 원물재고 미매칭 시 원물재고 읽어오기 call
						if (sortQntt > 0) {

							for (String no : excldWrhsnoList) {
								logger.debug("excld: {}", no);
							}

							RawMtrInvntrVO param = new RawMtrInvntrVO();

							param.setApcCd(apcCd);
							param.setItemCd(itemCd);
							param.setVrtyCd(vrtyCd);
							param.setPrdcrCd(prdcrCd);
							param.setWarehouseSeCd(warehouseSeCdFrom);
							param.setExcldWrhsnoList(excldWrhsnoList);
							param.setPagingYn(ComConstants.CON_YES);
							param.setCurrentPageNo(1);
							param.setRecordCountPerPage(100);

							List<RawMtrInvntrVO> invntrForSortList = rawMtrInvntrService.selectRawMtrInvntrListForSort(param);

							if (invntrForSortList == null || invntrForSortList.isEmpty()) {

								if (ComConstants.CON_YES.equals(needsVrInvntrRegYn)) {
									// 가상 원물재고 등록
									RawMtrWrhsVO rawMtrWrhsVO = new RawMtrWrhsVO();
									BeanUtils.copyProperties(sortMngVO, rawMtrWrhsVO);
									rawMtrWrhsVO.setInvntrSttsCd("S1");
									rawMtrWrhsVO.setWrhsYmd(inptYmd);
									rawMtrWrhsVO.setApcCd(apcCd);
									rawMtrWrhsVO.setItemCd(itemCd);
									rawMtrWrhsVO.setVrtyCd(vrtyCd);
									rawMtrWrhsVO.setPrdcrCd(prdcrCd);
									rawMtrWrhsVO.setWarehouseSeCd(warehouseSeCdFrom);
									rawMtrWrhsVO.setBxQntt(sortQntt);
									//rawMtrWrhsVO.setWrhsWght(sortWght);
									rawMtrWrhsVO.setWrhsWght(ComUtil.round(sortQntt * unitWght));
									rawMtrWrhsVO.setGdsSeCd(AmConstants.CON_GDS_SE_CD_DEFAULT);
									rawMtrWrhsVO.setWrhsSeCd(AmConstants.CON_WRHS_SE_CD_DEFAULT);
									rawMtrWrhsVO.setTrsprtSeCd(AmConstants.CON_TRSPRT_SE_CD_DEFAULT);

									rtnObj = rawMtrWrhsService.insertRawMtrWrhs(rawMtrWrhsVO);

									if (rtnObj != null) {
										throw new EgovBizException(getMessageForMap(rtnObj));
									}

									invntrForSortList = rawMtrInvntrService.selectRawMtrInvntrListForSort(param);

								} else {
									return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별가능재고");
								}
							}

							// 재고정보 조회
							for ( RawMtrInvntrVO orgnInv : invntrForSortList ) {

								double wrhsQntt = orgnInv.getWrhsQntt();
								double wrhsWght = orgnInv.getWrhsWght();

								double invRmnQntt = orgnInv.getInvntrQntt();
								double invRmnWght = orgnInv.getInvntrWght();

								if (wrhsQntt <= 0) {
									continue;
								}
								if (invRmnQntt <= 0) {
									continue;
								}

								logger.debug(
										"orgnInv$#@ s: {}, no: {}, wrhsQntt: {}, wrhsWght: {}, invRmnQntt: {}, invRmnWght: {}",
										sn,
										orgnInv.getWrhsno(),
										wrhsQntt,
										wrhsWght,
										invRmnQntt,
										invRmnWght
										);

								if (sortQntt > invRmnQntt) {
									sortQntt -= invRmnQntt;
									sortWght = ComUtil.round(sortQntt * wrhsWght / wrhsQntt);
									if (sortWght > invRmnWght) {
										sortWght = invRmnWght;
									}
									orgnInv.setRmnQntt(0);
									orgnInv.setRmnWght(0);

									orgnInv.setInptQntt(invRmnQntt);
									orgnInv.setInptWght(sortWght);

								} else {
									invRmnQntt -= sortQntt;
									sortWght = sortQntt * wrhsWght / wrhsQntt;
									if (sortWght > invRmnWght) {
										sortWght = invRmnWght;
									}

									invRmnWght -= sortWght;
									orgnInv.setRmnQntt(invRmnQntt);
									orgnInv.setRmnWght(invRmnWght);

									orgnInv.setInptQntt(sortQntt);
									orgnInv.setInptWght(sortWght);

									sortQntt = 0;
									sortWght = 0;
								}

								sort.setWrhsno(orgnInv.getWrhsno());
								sort.setRprsPrdcrCd(orgnInv.getPrdcrCd());
								sort.setGdsSeCd(orgnInv.getGdsSeCd());
								sort.setWrhsSeCd(orgnInv.getWrhsSeCd());
								sort.setPrdctnYr(orgnInv.getPrdctnYr());

								RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
								BeanUtils.copyProperties(sortMngVO, invntrVO);
								BeanUtils.copyProperties(orgnInv, invntrVO,
										ApcConstants.PROP_APC_CD,
										ComConstants.PROP_SYS_FRST_INPT_DT,
										ComConstants.PROP_SYS_FRST_INPT_USER_ID,
										ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
										ComConstants.PROP_SYS_LAST_CHG_DT,
										ComConstants.PROP_SYS_LAST_CHG_USER_ID,
										ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
								invntrVO.setInptYmd(inptYmd);
								invntrVO.setSortQntt(0);
								invntrVO.setSortWght(0);
								invntrVO.setRmrk(ComConstants.CON_BLANK);

								rawMtrInvntrVOList.add(invntrVO);
								excldWrhsnoList.add(invntrVO.getWrhsno());

								logger.debug(
										"$#@ s: {}, no: {}, inpt: {}, sort: {}",
										sn,
										invntrVO.getWrhsno(),
										invntrVO.getInptWght(),
										invntrVO.getSortWght());

								if (sortQntt <= 0) {
									sort.setRmnQntt(0);
									sort.setRmnWght(0);
									// 원물재고가 선정이 되었으므로 통과
									continue labelLoopSort;
								} else {

								}
							}
						}
					} else {
						if (inptWght > sortWght && sortWght > 0) {
							sortQntt = (int)ComUtil.round(sortQntt / sortWght * inptWght);
							sortWght = inptWght;
						}

						for ( RawMtrInvntrVO orgnInv : rawMtrInvntrVOList ) {
							logger.debug(
									"orgn$#@ s: {}, no: {}, inpt: {}, sort: {}",
									sn,
									orgnInv.getWrhsno(),
									orgnInv.getInptWght(),
									orgnInv.getSortWght());

							double invRmnQntt = orgnInv.getRmnQntt();
							double invRmnWght = orgnInv.getRmnWght();

							if (invRmnWght <= 0) {
								continue;
							}

							// 재고정보 확인 중량기준으로
							if (
								itemCd.equals(orgnInv.getItemCd())
								&& vrtyCd.equals(orgnInv.getVrtyCd())
								&& (!StringUtils.hasText(prdcrCd) || prdcrCd.equals(orgnInv.getPrdcrCd()))
								&& warehouseSeCdFrom.equals(orgnInv.getWarehouseSeCd())) {

								if (sortWght > invRmnWght) {
									sortQntt -= invRmnQntt;
									sortWght -= invRmnWght;

									orgnInv.setRmnQntt(0);
									orgnInv.setRmnWght(0);

									orgnInv.setInptQntt(orgnInv.getInptQntt() + invRmnQntt);
									orgnInv.setInptWght(orgnInv.getInptWght() + invRmnWght);

								} else {
									invRmnQntt -= sortQntt;
									invRmnWght -= sortWght;
									orgnInv.setRmnQntt(invRmnQntt);
									orgnInv.setRmnWght(invRmnWght);

									orgnInv.setInptQntt(orgnInv.getInptQntt() + sortQntt);
									orgnInv.setInptWght(orgnInv.getInptWght() + sortWght);

									sortQntt = 0;
									sortWght = 0;
								}

								sort.setWrhsno(orgnInv.getWrhsno());
								sort.setRprsPrdcrCd(orgnInv.getPrdcrCd());
								sort.setGdsSeCd(orgnInv.getGdsSeCd());
								sort.setWrhsSeCd(orgnInv.getWrhsSeCd());
								sort.setPrdctnYr(orgnInv.getPrdctnYr());

								if (sortWght <= 0) {
									sort.setRmnQntt(0);
									sort.setRmnWght(0);
									// 원물재고가 선정이 되었으므로 통과
									continue labelLoopSort;
								}
							}
						}

						// excldWrhsnoList	rawMtrInvntrVOList
						// 원물재고 미매칭 시 원물재고 읽어오기 call
						if (sortWght > 0) {

							for (String no : excldWrhsnoList) {
								logger.debug("excld: {}", no);
							}

							RawMtrInvntrVO param = new RawMtrInvntrVO();

							param.setApcCd(apcCd);
							param.setItemCd(itemCd);
							param.setVrtyCd(vrtyCd);
							param.setPrdcrCd(prdcrCd);
							param.setWarehouseSeCd(warehouseSeCdFrom);
							param.setExcldWrhsnoList(excldWrhsnoList);
							param.setPagingYn(ComConstants.CON_YES);
							param.setCurrentPageNo(1);
							param.setRecordCountPerPage(100);

							List<RawMtrInvntrVO> invntrForSortList = rawMtrInvntrService.selectRawMtrInvntrListForSort(param);

							if (invntrForSortList == null || invntrForSortList.isEmpty()) {

								if (ComConstants.CON_YES.equals(needsVrInvntrRegYn)) {
									// 가상 원물재고 등록
									RawMtrWrhsVO rawMtrWrhsVO = new RawMtrWrhsVO();
									BeanUtils.copyProperties(sortMngVO, rawMtrWrhsVO);
									rawMtrWrhsVO.setInvntrSttsCd("S1");
									rawMtrWrhsVO.setWrhsYmd(inptYmd);
									rawMtrWrhsVO.setApcCd(apcCd);
									rawMtrWrhsVO.setItemCd(itemCd);
									rawMtrWrhsVO.setVrtyCd(vrtyCd);
									rawMtrWrhsVO.setPrdcrCd(prdcrCd);
									rawMtrWrhsVO.setWarehouseSeCd(warehouseSeCdFrom);
									rawMtrWrhsVO.setBxQntt(sortQntt);
									rawMtrWrhsVO.setWrhsWght(sortWght);

									rawMtrWrhsVO.setGdsSeCd(AmConstants.CON_GDS_SE_CD_DEFAULT);
									rawMtrWrhsVO.setWrhsSeCd(AmConstants.CON_WRHS_SE_CD_DEFAULT);
									rawMtrWrhsVO.setTrsprtSeCd(AmConstants.CON_TRSPRT_SE_CD_DEFAULT);

									rtnObj = rawMtrWrhsService.insertRawMtrWrhs(rawMtrWrhsVO);

									if (rtnObj != null) {
										throw new EgovBizException(getMessageForMap(rtnObj));
									}

									invntrForSortList = rawMtrInvntrService.selectRawMtrInvntrListForSort(param);

								} else {
									return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별가능재고");
								}
							}

							if (invntrForSortList == null || invntrForSortList.isEmpty()) {
								return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별가능재고");
							}

							// 재고정보 조회
							for ( RawMtrInvntrVO orgnInv : invntrForSortList ) {

								double invRmnQntt = orgnInv.getInvntrQntt();
								double invRmnWght = orgnInv.getInvntrWght();

								if (invRmnWght <= 0) {
									continue;
								}

								if (sortWght > invRmnWght) {
									sortQntt -= invRmnQntt;
									sortWght -= invRmnWght;

									orgnInv.setRmnQntt(0);
									orgnInv.setRmnWght(0);

									orgnInv.setInptQntt(invRmnQntt);
									orgnInv.setInptWght(invRmnWght);

								} else {
									invRmnQntt -= sortQntt;
									invRmnWght -= sortWght;
									orgnInv.setRmnQntt(invRmnQntt);
									orgnInv.setRmnWght(invRmnWght);

									orgnInv.setInptQntt(sortQntt);
									orgnInv.setInptWght(sortWght);

									sortQntt = 0;
									sortWght = 0;
								}

								sort.setWrhsno(orgnInv.getWrhsno());
								sort.setRprsPrdcrCd(orgnInv.getPrdcrCd());
								sort.setGdsSeCd(orgnInv.getGdsSeCd());
								sort.setWrhsSeCd(orgnInv.getWrhsSeCd());
								sort.setPrdctnYr(orgnInv.getPrdctnYr());

								RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
								BeanUtils.copyProperties(sortMngVO, invntrVO);
								BeanUtils.copyProperties(orgnInv, invntrVO,
										ApcConstants.PROP_APC_CD,
										ComConstants.PROP_SYS_FRST_INPT_DT,
										ComConstants.PROP_SYS_FRST_INPT_USER_ID,
										ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
										ComConstants.PROP_SYS_LAST_CHG_DT,
										ComConstants.PROP_SYS_LAST_CHG_USER_ID,
										ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

								invntrVO.setSortQntt(0);
								invntrVO.setSortWght(0);
								invntrVO.setRmrk(ComConstants.CON_BLANK);
								invntrVO.setInptYmd(inptYmd);
								rawMtrInvntrVOList.add(invntrVO);
								excldWrhsnoList.add(invntrVO.getWrhsno());

								logger.debug(
										"$#@ s: {}, no: {}, inpt: {}, sort: {}",
										sn,
										invntrVO.getWrhsno(),
										invntrVO.getInptWght(),
										invntrVO.getSortWght());

								if (sortWght <= 0) {
									sort.setRmnQntt(0);
									sort.setRmnWght(0);
									// 원물재고가 선정이 되었으므로 통과
									continue labelLoopSort;
								}
							}
						}
					}


				}

		} else {

			for ( SortPrfmncVO sort : prfmncList ) {
				sort.setRmnQntt(sort.getSortQntt());
				sort.setRmnWght(sort.getSortWght());
			}

			// 재고 >> 선별실적 정보 set	// 재고배분
			for ( RawMtrInvntrVO orgnInv : invntrList ) {

				RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
				BeanUtils.copyProperties(sortMngVO, invntrVO);
				BeanUtils.copyProperties(orgnInv, invntrVO,
						ApcConstants.PROP_APC_CD,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

				RawMtrInvntrVO invntrInfo = rawMtrInvntrService.selectRawMtrInvntr(invntrVO);

				if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
				}

				if (invntrVO.getInptWght() > invntrInfo.getInvntrWght()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
				}

				invntrVO.setPrdcrCd(invntrInfo.getPrdcrCd());
				invntrVO.setGdsSeCd(invntrInfo.getGdsSeCd());
				invntrVO.setWrhsSeCd(invntrInfo.getWrhsSeCd());
				invntrVO.setInvntrQntt(invntrInfo.getInvntrQntt());
				invntrVO.setInvntrWght(invntrInfo.getInvntrWght());
				invntrVO.setPrdctnYr(invntrInfo.getPrdctnYr());

				invntrVO.setSortQntt(0);
				invntrVO.setSortWght(0);

				rawMtrInvntrVOList.add(invntrVO);
			}
		}

		if (!ComConstants.CON_YES.equals(sortMngVO.getIsImpYn())) {
			for ( RawMtrInvntrVO inv : rawMtrInvntrVOList ) {

				String inptYmd = ComConstants.CON_BLANK;
				String wrhsno = inv.getWrhsno();
				String prdcrCd = inv.getPrdcrCd();
				String gdsSeCd = inv.getGdsSeCd();
				String wrhsSeCd = inv.getWrhsSeCd();
				String prdctnYr = inv.getPrdctnYr();

				// 지정 투입수량, 투입중량
				double inptQntt = inv.getInptQntt();
				double inptWght = inv.getInptWght();

				double sortQntt = inv.getSortQntt();
				double sortWght = inv.getSortWght();

				for ( SortPrfmncVO sort : prfmncList ) {

					if (StringUtils.hasText(sort.getWrhsno()) && sort.getRmnWght() <= 0) {
						continue;
					}

					double applQntt = 0;
					double applWght = 0;

					if (inptWght - sortWght < sort.getRmnWght()) {
						applQntt = inptQntt - sortQntt;
						applWght = inptWght - sortWght;
					} else {
						applQntt = sort.getRmnQntt();
						applWght = sort.getRmnWght();
					}

					sort.setWrhsno(wrhsno);
					sort.setRprsPrdcrCd(prdcrCd);
					sort.setGdsSeCd(gdsSeCd);
					sort.setWrhsSeCd(wrhsSeCd);
					sort.setPrdctnYr(prdctnYr);

					sortQntt += applQntt;
					sortWght += applWght;

					sort.setRmnQntt((int) (sort.getRmnQntt() - applQntt));
					sort.setRmnWght(sort.getRmnWght() - applWght);

					if (!StringUtils.hasText(inptYmd)) {
						inptYmd = sort.getInptYmd();
					}
				}

				inv.setInptYmd(inptYmd);
				inv.setSortQntt(sortQntt);
				inv.setSortWght(sortWght);

				logger.debug("!@#$ no: {}, inpt: {}, sort: {}", inv.getWrhsno(), inv.getInptWght(), inv.getSortWght());
			}
		}


		for ( SortPrfmncVO sort : prfmncList ) {
			if (!StringUtils.hasText(sort.getWrhsno())) {
				logger.debug("no wrhsno");
				return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
			}

			if (sort.getRmnQntt() > 0 && sort.getRmnWght() > 0) {
				logger.debug("sn: {}, rmnQntt: {}, rmnWght: {}", sort.getSortSn(), sort.getRmnQntt(), sort.getRmnWght());
				return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
			}
		}

		// 선별실적 등록
		List<SortPrfmncVO> sortPrfmncVOList = new ArrayList<>();

		int sortSn = 0;
		for ( SortPrfmncVO prfmncInfo : prfmncList ) {

			sortSn++;

			SortPrfmncVO prfmncVO = new SortPrfmncVO();
			BeanUtils.copyProperties(sortMngVO, prfmncVO);
			BeanUtils.copyProperties(prfmncInfo, prfmncVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			prfmncVO.setSortno(sortno);
			prfmncVO.setSortSn(sortSn);
			prfmncVO.setStdGrdList(prfmncInfo.getStdGrdList());
			sortPrfmncVOList.add(prfmncVO);

			prfmncVO.setPckgYn(prfmncVO.getAutoPckgInptYn());

			if (ComConstants.CON_YES.equals(prfmncVO.getAutoPckgInptYn())) {
				SortPrfmncVO pckgVO = new SortPrfmncVO();
				BeanUtils.copyProperties(prfmncVO, pckgVO);
				pckgList.add(pckgVO);
			}
		}

		rtnObj = sortPrfmncService.insertSortPrfmncList(sortPrfmncVOList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 선별실적 등록 시 투입실적도 함께 등록 (투입실적 여부 확인 후 등록)
		List<SortInptPrfmncVO> sortInptPrfmncVOList = new ArrayList<>();
		for ( RawMtrInvntrVO inv : rawMtrInvntrVOList ) {
			SortInptPrfmncVO sortInptVO = new SortInptPrfmncVO();
			BeanUtils.copyProperties(inv, sortInptVO);
			sortInptVO.setSortno(sortno);

			sortInptVO.setQntt((int) inv.getInptQntt());
			sortInptVO.setWght(inv.getInptWght());

			// 투입실적 항목 set
			sortInptPrfmncVOList.add(sortInptVO);
		}

		rtnObj = sortInptPrfmncService.insertSortInptPrfmncList(sortInptPrfmncVOList);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 원물재고정보 update
		for ( RawMtrInvntrVO inv : rawMtrInvntrVOList ) {
			rtnObj = rawMtrInvntrService.updateInvntrSortPrfmnc(inv);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		// 포장자동등록 선택 시 포장실적 등록
		if (!pckgList.isEmpty()) {
			//sortPrfmncVOList
			List<SortInvntrVO> sortInvntrList = new ArrayList<>();
			List<PckgPrfmncVO> pckgPrfmncList = new ArrayList<>();

			for ( SortPrfmncVO sortVO : pckgList ) {

				logger.debug("@@@상품코드: {}", sortVO.getSpmtPckgUnitCd());

				SortInvntrVO invntrVO = new SortInvntrVO();
				BeanUtils.copyProperties(sortVO, invntrVO);

				invntrVO.setInptQntt(sortVO.getSortQntt());
				invntrVO.setInptWght(sortVO.getSortWght());
				invntrVO.setQntt(0);
				invntrVO.setWght(0);

				sortInvntrList.add(invntrVO);

				PckgPrfmncVO pckgVO = new PckgPrfmncVO();
				BeanUtils.copyProperties(invntrVO, pckgVO);
				pckgVO.setInptYmd(sortVO.getInptYmd());
				pckgVO.setPckgYmd(sortVO.getInptYmd());
				pckgVO.setPckgQntt(sortVO.getSortQntt());
				pckgVO.setPckgWght(sortVO.getSortWght());
				//pckgVO.setGdsGrd(sortVO.getGrdCd());

				pckgVO.setSpmtPckgUnitCd(sortVO.getSpmtPckgUnitCd());
				pckgVO.setGdsGrd(sortVO.getGdsGrd());
				pckgVO.setStdGrdList(sortVO.getGdsStdGrdList());

				if (!StringUtils.hasText(pckgVO.getSpmtPckgUnitCd())) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품명")));
				}
				if (!StringUtils.hasText(pckgVO.getGdsGrd())) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품등급")));
				}
				if (pckgVO.getStdGrdList() == null || pckgVO.getStdGrdList().isEmpty()) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품등급")));
				}

				SpmtPckgUnitVO pckgUnitParam = new SpmtPckgUnitVO();
				pckgUnitParam.setApcCd(pckgVO.getApcCd());
				pckgUnitParam.setSpmtPckgUnitCd(pckgVO.getSpmtPckgUnitCd());
				// 출하포장단위로 규격코드 조회
				SpmtPckgUnitVO spmtPckgUnitVO = spmtPckgUnitService.selectSpmtPckgUnit(pckgUnitParam);

				if (spmtPckgUnitVO == null || !StringUtils.hasText(spmtPckgUnitVO.getSpmtPckgUnitCd())) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품조회결과")));
				}

				pckgVO.setSpcfctCd(spmtPckgUnitVO.getSpcfctCd());
				pckgVO.setPckgSortno(sortVO.getSortno());
				pckgVO.setPckgSortSn(sortVO.getSortSn());

				pckgPrfmncList.add(pckgVO);
			}

			PckgMngVO pckgMngVO = new PckgMngVO();
			BeanUtils.copyProperties(sortMngVO, pckgMngVO);
			pckgMngVO.setSortInvntrList(sortInvntrList);
			pckgMngVO.setPckgPrfmncList(pckgPrfmncList);
			pckgMngVO.setPckgYmd(sortMngVO.getSortYmd());

			rtnObj = pckgMngService.insertPckgPrfmnc(pckgMngVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}


	@Override
	public HashMap<String, Object> insertSortRsltSimply(SortMngVO sortMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		String apcCd = sortMngVO.getApcCd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String sortYmd = sortMngVO.getSortYmd();
		if (!StringUtils.hasText(sortYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별일자");
		}

		String userId = sortMngVO.getSysLastChgUserId();
		String prgrmId = sortMngVO.getSysLastChgPrgrmId();

		// 실적등록 대상정보 목록
		List<SortPrfmncVO> prfmncList = sortMngVO.getSortPrfmncList();

		if (prfmncList == null || prfmncList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별실적");
		}

		boolean hasInputList = true;
		List<RawMtrInvntrVO> inptList = sortMngVO.getRawMtrInptList();
		if (inptList == null || inptList.isEmpty()) {

			hasInputList = false;
			inptList = new ArrayList<>();

			for ( SortPrfmncVO sort : prfmncList ) {
				// 품목, 품종 별 수량, 중량 합산 넣기

				String itemCd = sort.getItemCd();
				if (!StringUtils.hasText(itemCd)) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품목코드");
				}

				String vrtyCd = sort.getVrtyCd();
				if (!StringUtils.hasText(vrtyCd)) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품종코드");
				}

				int sortQntt = sort.getSortQntt();
				double sortWght = sort.getSortWght();
				// null check


				// 1. inptList 에서 품목, 품종 있나 확인
				// 2. 없으면 리스트에 추가
				// 2.1 있으면 수량, 중량 합산

				RawMtrInvntrVO inptVO = null;
				for ( RawMtrInvntrVO raw : inptList ) {
					if (itemCd.equals(raw.getItemCd())
						&& vrtyCd.equals(raw.getVrtyCd())
					) {
						inptVO = raw;
						break;
					}
				}

				if (inptVO == null) {
					// 추가
					inptVO = new RawMtrInvntrVO();
					inptVO.setItemCd(itemCd);
					inptVO.setVrtyCd(vrtyCd);
					inptVO.setInptQntt(sortQntt);
					inptVO.setInptWght(sortWght);
					inptVO.setAllowsMinusInvntrYn(ComConstants.CON_YES);
					inptList.add(inptVO);

				} else {
					// 합산
					inptVO.setInptQntt(inptVO.getInptQntt() + sortQntt);
					inptVO.setInptWght(inptVO.getInptWght() + sortWght);
				}


			}

		}

		String sortno = sortMngVO.getSortno();
		if (!StringUtils.hasText(sortno)) {
			sortno = cmnsTaskNoService.selectSortno(apcCd, sortMngVO.getSortYmd());
		}

		// 원물재고 투입대상
		List<RawMtrInvntrVO> rawMtrInvntrVOList = new ArrayList<>();

		// 원물재고 투입대상 : 가상 음수 재고 목록
		List<RawMtrInvntrVO> vrInvntrVOList = new ArrayList<>();

		// 포장자동등록 대상
		List<SortPrfmncVO> pckgList = new ArrayList<>();

		// 대표생산자 설정
		List<ItemVrtyRprsPrdcrVO> rprsPrdcrList = new ArrayList<>();

		List<String> excldWrhsnoList = new ArrayList<>();

		// 대표 코드 확인
		String defaultGdsSeCd = AmConstants.CON_GDS_SE_CD_DEFAULT;
		String defaultWrhsSeCd = AmConstants.CON_WRHS_SE_CD_DEFAULT;

		ComCdVO paramComCd = new ComCdVO();
		paramComCd.setApcCd(apcCd);
		paramComCd.setCdId(AmConstants.CON_APC_ATRB);
		paramComCd.setCdVl(AmConstants.CON_BSC_GDS_SE_CD);

		ComCdVO gdsSeCdVO = comCdService.selectComCdDtl(paramComCd);
		if (gdsSeCdVO != null
				&& StringUtils.hasText(gdsSeCdVO.getCdVl())
				&& StringUtils.hasText(gdsSeCdVO.getCdChrVl())
				&& ComConstants.CON_YES.equals(gdsSeCdVO.getUseYn())
				&& ComConstants.CON_NONE.equals(gdsSeCdVO.getDelYn())) {
			defaultGdsSeCd = gdsSeCdVO.getCdChrVl();
		}

		paramComCd.setCdVl(AmConstants.CON_BSC_WRHS_SE_CD);
		ComCdVO wrhsSeCdVO = comCdService.selectComCdDtl(paramComCd);
		if (wrhsSeCdVO != null
				&& StringUtils.hasText(wrhsSeCdVO.getCdVl())
				&& StringUtils.hasText(wrhsSeCdVO.getCdChrVl())
				&& ComConstants.CON_YES.equals(wrhsSeCdVO.getUseYn())
				&& ComConstants.CON_NONE.equals(wrhsSeCdVO.getDelYn())) {
			defaultWrhsSeCd = wrhsSeCdVO.getCdChrVl();
		}


		labelLoopInpt:
		for ( RawMtrInvntrVO inpt : inptList ) {

			double rmnQntt = inpt.getInptQntt();
			double rmnWght = inpt.getInptWght();

			String itemCd = inpt.getItemCd();
			String vrtyCd = inpt.getVrtyCd();
			String prdcrCd = inpt.getPrdcrCd();
			String warehouseSeCd = inpt.getWarehouseSeCd();
			String wrhsYmd = inpt.getWrhsYmd();

			// 투입실적에서 찾기
			if (!rawMtrInvntrVOList.isEmpty()) {
				for ( RawMtrInvntrVO orgnInv : rawMtrInvntrVOList ) {
					double invRmnQntt = orgnInv.getRmnQntt();
					double invRmnWght = orgnInv.getRmnWght();

					if (invRmnWght <= 0) {
						continue;
					}

					double inptQntt = 0;
					double inptWght = 0;

					if (rmnWght > invRmnWght) {
						inptWght = invRmnWght;
						inptQntt = Math.min(invRmnQntt, rmnQntt);
						orgnInv.setRmnQntt(0);
						orgnInv.setRmnWght(0);
					} else {
						inptWght = rmnWght;
						inptQntt = Math.min(invRmnQntt, rmnQntt);
						orgnInv.setRmnQntt(invRmnQntt - inptQntt);
						orgnInv.setRmnWght(invRmnWght - inptWght);
					}

					orgnInv.setInptQntt(orgnInv.getInptQntt() + inptQntt);
					orgnInv.setInptWght(orgnInv.getInptWght() + inptWght);
					rmnQntt -= inptQntt;
					rmnWght -= inptWght;

					if (inptWght > inpt.getRprsWght()) {
						inpt.setRprsWght(inptWght);
						inpt.setGdsSeCd(orgnInv.getGdsSeCd());
						inpt.setWrhsSeCd(orgnInv.getWrhsSeCd());
					}
				}
			}

			// 원물재고
			if (rmnWght > 0) {
				RawMtrInvntrVO param = new RawMtrInvntrVO();
				param.setApcCd(apcCd);
				param.setItemCd(itemCd);
				param.setVrtyCd(vrtyCd);
				param.setPrdcrCd(prdcrCd);
				param.setWrhsYmd(wrhsYmd);
				param.setWarehouseSeCd(warehouseSeCd);
				param.setExcldWrhsnoList(excldWrhsnoList);
				param.setPagingYn(ComConstants.CON_YES);
				param.setCurrentPageNo(1);
				param.setRecordCountPerPage(100);

				List<RawMtrInvntrVO> invntrForSortList = rawMtrInvntrService.selectRawMtrInvntrListForSort(param);
				if (invntrForSortList != null && !invntrForSortList.isEmpty()) {
					for ( RawMtrInvntrVO orgnInv : invntrForSortList ) {
						double wrhsQntt = orgnInv.getWrhsQntt();
						double wrhsWght = orgnInv.getWrhsWght();
						double invRmnQntt = orgnInv.getInvntrQntt();
						double invRmnWght = orgnInv.getInvntrWght();

						if (wrhsWght <= 0) {
							continue;
						}
						if (invRmnWght <= 0) {
							continue;
						}

						double inptQntt = 0;
						double inptWght = 0;

						if (rmnWght > invRmnWght) {
							inptWght = invRmnWght;
							inptQntt = Math.min(invRmnQntt, rmnQntt);
							orgnInv.setRmnQntt(0);
							orgnInv.setRmnWght(0);
						} else {
							inptWght = rmnWght;
							inptQntt = Math.min(invRmnQntt, rmnQntt);
							orgnInv.setRmnQntt(invRmnQntt - inptQntt);
							orgnInv.setRmnWght(invRmnWght - inptWght);
						}

						orgnInv.setInptQntt(orgnInv.getInptQntt() + inptQntt);
						orgnInv.setInptWght(orgnInv.getInptWght() + inptWght);
						rmnQntt -= inptQntt;
						rmnWght -= inptWght;

						if (inptWght > inpt.getRprsWght()) {
							inpt.setRprsWght(inptWght);
							inpt.setGdsSeCd(orgnInv.getGdsSeCd());
							inpt.setWrhsSeCd(orgnInv.getWrhsSeCd());
						}

						RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
						BeanUtils.copyProperties(sortMngVO, invntrVO);
						BeanUtils.copyProperties(orgnInv, invntrVO,
								ApcConstants.PROP_APC_CD,
								ComConstants.PROP_SYS_FRST_INPT_DT,
								ComConstants.PROP_SYS_FRST_INPT_USER_ID,
								ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
								ComConstants.PROP_SYS_LAST_CHG_DT,
								ComConstants.PROP_SYS_LAST_CHG_USER_ID,
								ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
						invntrVO.setInptYmd(sortYmd);
						invntrVO.setSortQntt(0);
						invntrVO.setSortWght(0);
						invntrVO.setRmrk(ComConstants.CON_BLANK);
						rawMtrInvntrVOList.add(invntrVO);
						excldWrhsnoList.add(invntrVO.getWrhsno());

						if (rmnWght <= 0) {
							continue labelLoopInpt;
						}
					}
				}
			}

			// 아직도 남았을 때는 가상재고 마이너스 처리
			if (rmnWght > 0 && ComConstants.CON_YES.equals(inpt.getAllowsMinusInvntrYn())) {
				RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
				invntrVO.setSysFrstInptUserId(userId);
				invntrVO.setSysFrstInptPrgrmId(prgrmId);
				invntrVO.setSysLastChgUserId(userId);
				invntrVO.setSysLastChgPrgrmId(prgrmId);
				invntrVO.setApcCd(apcCd);
				invntrVO.setWrhsYmd(ComUtil.nullToDefault(wrhsYmd, sortYmd));
				invntrVO.setInptYmd(sortYmd);
				invntrVO.setItemCd(itemCd);
				invntrVO.setVrtyCd(vrtyCd);
				invntrVO.setPrdcrCd(prdcrCd);
				invntrVO.setWarehouseSeCd(warehouseSeCd);
				invntrVO.setInptQntt(rmnQntt);
				invntrVO.setInptWght(rmnWght);
				invntrVO.setInvntrQntt(0);
				invntrVO.setInvntrWght(0);

				vrInvntrVOList.add(invntrVO);

			} else {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "투입가능재고");
			}
		}

		if (hasInputList) {
			// 투입정보 대상으로 품목별 대표생산자를 설정
			for (RawMtrInvntrVO inpt : inptList) {

				String itemCd = inpt.getItemCd();
				String vrtyCd = inpt.getVrtyCd();
				String prdcrCd = inpt.getPrdcrCd();

				PrdcrVO prdcrParam = new PrdcrVO();
				prdcrParam.setApcCd(apcCd);
				prdcrParam.setPrdcrCd(prdcrCd);
				PrdcrVO prdcrVO = prdcrService.selectPrdcr(prdcrParam);
				if (prdcrVO == null || !StringUtils.hasText(prdcrVO.getPrdcrCd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_TGT_WRONG, "생산자정보");
				}

				String gdsSeCd = ComUtil.nullToDefault(inpt.getGdsSeCd(), prdcrVO.getGdsSeCd());
				String wrhsSeCd = ComUtil.nullToDefault(inpt.getWrhsSeCd(), prdcrVO.getWrhsSeCd());

				double wght = inpt.getInptWght();

				if (!StringUtils.hasText(itemCd)) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "투입-품목");
				}
				if (!StringUtils.hasText(vrtyCd)) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "투입-품종");
				}
				if (!StringUtils.hasText(prdcrCd)) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "투입-생산자");
				}

				boolean existItemVrtyRprs = false;
				if (!rprsPrdcrList.isEmpty()) {
					for (ItemVrtyRprsPrdcrVO rprs : rprsPrdcrList) {
						if (itemCd.equals(rprs.getItemCd()) && vrtyCd.equals(rprs.getVrtyCd())) {
							existItemVrtyRprs = true;
							if (wght > rprs.getWght()) {
								rprs.setRprsPrdcrCd(prdcrCd);
								rprs.setWght(wght);
							}
							break;
						}
					}
				}

				if (!existItemVrtyRprs) {
					ItemVrtyRprsPrdcrVO rprsVO = new ItemVrtyRprsPrdcrVO();
					rprsVO.setItemCd(itemCd);
					rprsVO.setVrtyCd(vrtyCd);
					rprsVO.setRprsPrdcrCd(prdcrCd);
					rprsVO.setWght(wght);
					rprsVO.setGdsSeCd(gdsSeCd);
					rprsVO.setWrhsSeCd(wrhsSeCd);
					rprsPrdcrList.add(rprsVO);
				}
			}
		}

		// 선별실적 유효성 확인
		for ( SortPrfmncVO prfmncInfo : prfmncList ) {
			String itemCd = prfmncInfo.getItemCd();
			String vrtyCd = prfmncInfo.getVrtyCd();
			String spcfctCd = prfmncInfo.getSpcfctCd();
			String grdCd = prfmncInfo.getGrdCd();
			int sortQntt = prfmncInfo.getSortQntt();
			double sortWght = prfmncInfo.getSortWght();
			String fcltCd = prfmncInfo.getFcltCd();
			String warehouseSeCd = prfmncInfo.getWarehouseSeCd();
			if (!StringUtils.hasText(itemCd)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별-품목");
			}
			if (!StringUtils.hasText(vrtyCd)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별-품종");
			}
			if (!StringUtils.hasText(spcfctCd)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별-규격");
			}
			if (!StringUtils.hasText(grdCd)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별-등급");
			}
			if (sortQntt <= 0) {
				if (sortWght <= 0) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별-중량");
				} else {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별-수량");	
				}
			}
			if (!StringUtils.hasText(fcltCd)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별기");
			}
			if (!StringUtils.hasText(warehouseSeCd)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별창고");
			}

			if (hasInputList) {
				// 대표 생산자 설정
				for (ItemVrtyRprsPrdcrVO rprs : rprsPrdcrList) {
					if (itemCd.equals(rprs.getItemCd()) && vrtyCd.equals(rprs.getVrtyCd())) {
						prfmncInfo.setRprsPrdcrCd(rprs.getRprsPrdcrCd());
						prfmncInfo.setGdsSeCd(ComUtil.nullToDefault(rprs.getGdsSeCd(), defaultGdsSeCd));
						prfmncInfo.setWrhsSeCd(ComUtil.nullToDefault(rprs.getWrhsSeCd(), defaultWrhsSeCd));
						break;
					}
				}
			} else {
				prfmncInfo.setGdsSeCd(defaultGdsSeCd);
				prfmncInfo.setWrhsSeCd(defaultWrhsSeCd);
			}
		}

		// 선별실적 등록
		List<SortPrfmncVO> sortPrfmncVOList = new ArrayList<>();

		int sortSn = 0;
		for ( SortPrfmncVO prfmncInfo : prfmncList ) {

			sortSn++;
			SortPrfmncVO prfmncVO = new SortPrfmncVO();
			BeanUtils.copyProperties(sortMngVO, prfmncVO);
			BeanUtils.copyProperties(prfmncInfo, prfmncVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			prfmncVO.setSortno(sortno);
			prfmncVO.setSortSn(sortSn);
			prfmncVO.setStdGrdList(prfmncInfo.getStdGrdList());
			sortPrfmncVOList.add(prfmncVO);

			prfmncVO.setPckgYn(prfmncVO.getAutoPckgInptYn());

			if (ComConstants.CON_YES.equals(prfmncVO.getAutoPckgInptYn())) {
				SortPrfmncVO pckgVO = new SortPrfmncVO();
				BeanUtils.copyProperties(prfmncVO, pckgVO);
				pckgList.add(pckgVO);
			}
		}

		rtnObj = sortPrfmncService.insertSortPrfmncList(sortPrfmncVOList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 원물재고 차감 + 선별투입실적 등록
		// 원물재고에서 대상을 선정, 빠진 양은 음수 처리
		// 선별실적 등록 시 투입실적도 함께 등록 (투입실적 여부 확인 후 등록)
		List<SortInptPrfmncVO> sortInptPrfmncVOList = new ArrayList<>();

		logger.debug("@@@@rawMtr");
		// 원물재고정보 update
		for ( RawMtrInvntrVO inv : rawMtrInvntrVOList ) {
			rtnObj = rawMtrInvntrService.updateInvntrSortPrfmnc(inv);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			SortInptPrfmncVO sortInptVO = new SortInptPrfmncVO();
			BeanUtils.copyProperties(inv, sortInptVO);
			sortInptVO.setSortno(sortno);

			sortInptVO.setQntt((int) inv.getInptQntt());
			sortInptVO.setWght(inv.getInptWght());

			// 투입실적 항목 set
			sortInptPrfmncVOList.add(sortInptVO);
		}
		logger.debug("@@@@vrInvntrVOList");
		for ( RawMtrInvntrVO inv : vrInvntrVOList ) {

			// negative 재고 등록
			// 가상 원물재고 등록
			RawMtrWrhsVO rawMtrWrhsVO = new RawMtrWrhsVO();
			BeanUtils.copyProperties(sortMngVO, rawMtrWrhsVO);

			rawMtrWrhsVO.setInvntrSttsCd(AmConstants.CON_INVNTR_STTS_CD_FRCS_SORT_CREDIT);
			rawMtrWrhsVO.setWrhsYmd(inv.getWrhsYmd());
			rawMtrWrhsVO.setApcCd(apcCd);
			rawMtrWrhsVO.setItemCd(inv.getItemCd());
			rawMtrWrhsVO.setVrtyCd(inv.getVrtyCd());
			rawMtrWrhsVO.setPrdcrCd(inv.getPrdcrCd());
			rawMtrWrhsVO.setWarehouseSeCd(inv.getWarehouseSeCd());

			rawMtrWrhsVO.setWrhsQntt(0);
			rawMtrWrhsVO.setWrhsWght(0);
			rawMtrWrhsVO.setInvntrQntt(inv.getInptQntt() * -1);
			rawMtrWrhsVO.setInvntrQntt(inv.getInptWght() * -1);
			rawMtrWrhsVO.setInptQntt(inv.getInptQntt());
			rawMtrWrhsVO.setInptWght(inv.getInptWght());

			rawMtrWrhsVO.setGdsSeCd(ComUtil.nullToDefault(inv.getGdsSeCd(), defaultGdsSeCd));
			rawMtrWrhsVO.setWrhsSeCd(ComUtil.nullToDefault(inv.getWrhsSeCd(), defaultWrhsSeCd));
			rawMtrWrhsVO.setTrsprtSeCd(AmConstants.CON_TRSPRT_SE_CD_DEFAULT);

			rtnObj = rawMtrWrhsService.insertRawMtrWrhsForCredit(rawMtrWrhsVO);

			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			inv.setWrhsno(rawMtrWrhsVO.getWrhsno());

			SortInptPrfmncVO sortInptVO = new SortInptPrfmncVO();
			BeanUtils.copyProperties(inv, sortInptVO);
			sortInptVO.setSortno(sortno);

			sortInptVO.setQntt((int) inv.getInptQntt());
			sortInptVO.setWght(inv.getInptWght());

			logger.debug("@@@@inv wrhsno {}", inv.getWrhsno());

			// 투입실적 항목 set
			sortInptPrfmncVOList.add(sortInptVO);
		}

		rtnObj = sortInptPrfmncService.insertSortInptPrfmncList(sortInptPrfmncVOList);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}


		// 포장자동등록 선택 시 포장실적 등록
		if (!pckgList.isEmpty()) {
			//sortPrfmncVOList
			List<SortInvntrVO> sortInvntrList = new ArrayList<>();
			List<PckgPrfmncVO> pckgPrfmncList = new ArrayList<>();

			for ( SortPrfmncVO sortVO : pckgList ) {

				SortInvntrVO invntrVO = new SortInvntrVO();
				BeanUtils.copyProperties(sortVO, invntrVO);

				invntrVO.setInptQntt(sortVO.getSortQntt());
				invntrVO.setInptWght(sortVO.getSortWght());
				invntrVO.setQntt(0);
				invntrVO.setWght(0);

				sortInvntrList.add(invntrVO);

				PckgPrfmncVO pckgVO = new PckgPrfmncVO();
				BeanUtils.copyProperties(invntrVO, pckgVO);
				pckgVO.setInptYmd(sortVO.getInptYmd());
				pckgVO.setPckgYmd(sortVO.getInptYmd());
				pckgVO.setPckgQntt(sortVO.getSortQntt());
				pckgVO.setPckgWght(sortVO.getSortWght());
				//pckgVO.setGdsGrd(sortVO.getGrdCd());

				pckgVO.setSpmtPckgUnitCd(sortVO.getSpmtPckgUnitCd());
				pckgVO.setGdsGrd(sortVO.getGdsGrd());
				pckgVO.setStdGrdList(sortVO.getGdsStdGrdList());

				if (!StringUtils.hasText(pckgVO.getSpmtPckgUnitCd())) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품명")));
				}
				if (!StringUtils.hasText(pckgVO.getGdsGrd())) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품등급")));
				}
				if (pckgVO.getStdGrdList() == null || pckgVO.getStdGrdList().isEmpty()) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품등급")));
				}

				SpmtPckgUnitVO pckgUnitParam = new SpmtPckgUnitVO();
				pckgUnitParam.setApcCd(pckgVO.getApcCd());
				pckgUnitParam.setSpmtPckgUnitCd(pckgVO.getSpmtPckgUnitCd());
				// 출하포장단위로 규격코드 조회
				SpmtPckgUnitVO spmtPckgUnitVO = spmtPckgUnitService.selectSpmtPckgUnit(pckgUnitParam);

				if (spmtPckgUnitVO == null || !StringUtils.hasText(spmtPckgUnitVO.getSpmtPckgUnitCd())) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품조회결과")));
				}

				pckgVO.setSpcfctCd(spmtPckgUnitVO.getSpcfctCd());
				pckgVO.setPckgSortno(sortVO.getSortno());
				pckgVO.setPckgSortSn(sortVO.getSortSn());

				pckgPrfmncList.add(pckgVO);
			}

			PckgMngVO pckgMngVO = new PckgMngVO();
			BeanUtils.copyProperties(sortMngVO, pckgMngVO);
			pckgMngVO.setSortInvntrList(sortInvntrList);
			pckgMngVO.setPckgPrfmncList(pckgPrfmncList);
			pckgMngVO.setPckgYmd(sortMngVO.getSortYmd());

			rtnObj = pckgMngService.insertPckgPrfmnc(pckgMngVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}


	@Override
	public HashMap<String, Object> updateSortCmnd(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> updateSortInptPrfmnc(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> updateSortPrfmnc(SortMngVO sortMngVO) throws Exception {

		// apc 코드와 선별번호로 선별실적, 투입실적, 선별재고 삭제 : delYn 'Y'
		HashMap<String, Object> rtnObj = new HashMap<>();
		// validation check
		String apcCd = sortMngVO.getApcCd();

		List<String> pckgnoList = new ArrayList<>();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String sortno = sortMngVO.getSortno();
		if (!StringUtils.hasText(sortno)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별번호");
		}

		SortPrfmncVO sortPrfmncParamVO = new SortPrfmncVO();
		sortPrfmncParamVO.setApcCd(apcCd);
		sortPrfmncParamVO.setSortno(sortno);

		List<SortPrfmncVO> prfmncList = sortPrfmncService.selectSortCnclList(sortPrfmncParamVO);
		if (prfmncList == null || prfmncList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별실적");
		}

		if (prfmncList == null || prfmncList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "삭제대상");
		}

		List<SortPrfmncVO> sortPrfmncVOList = new ArrayList<>();

		for ( SortPrfmncVO sort : prfmncList ) {

			// 마감확인
			String sortYmd = sort.getInptYmd();
			String ddlnYn = cmnsValidationService.selectChkDdlnYn(apcCd, sortYmd);
			if (!ComConstants.CON_NONE.equals(ddlnYn)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "선별재고");
			}

			SortPrfmncVO prfmncVO = new SortPrfmncVO();
			BeanUtils.copyProperties(sortMngVO, prfmncVO);
			BeanUtils.copyProperties(sort, prfmncVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			prfmncVO.setSortRealDelY(ComConstants.CON_YES);
			sortPrfmncVOList.add(prfmncVO);

			String pckgno = sort.getNxtPckgno();
			if (StringUtils.hasText(pckgno) && !pckgnoList.contains(pckgno)) {
				pckgnoList.add(pckgno);
			}
		}

		// 처리

		// 포장실적 삭제
		for ( String pckgno : pckgnoList) {
			PckgMngVO pckgMngVO = new PckgMngVO();
			BeanUtils.copyProperties(sortMngVO, pckgMngVO);
			pckgMngVO.setApcCd(apcCd);
			pckgMngVO.setPckgno(pckgno);

			rtnObj = pckgMngService.deletePckgPrfmnc(pckgMngVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		// 재고삭제 + 선별실적 삭제
		rtnObj = sortPrfmncService.deleteSortPrfmncList(sortPrfmncVOList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		sortMngVO.setSortUpdtYn(ComConstants.CON_YES);

		rtnObj = insertSortPrfmnc(sortMngVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateSortPrfmncForFcrs(SortPrfmncVO sortMngVO) throws Exception {

		// apc 코드와 선별번호로 선별실적, 투입실적, 선별재고 삭제 : delYn 'Y'
		HashMap<String, Object> rtnObj = new HashMap<>();
		// validation check
		String apcCd = sortMngVO.getApcCd();



		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		String sortno = sortMngVO.getSortno();
		int sortsn = sortMngVO.getSortSn();


		if (!StringUtils.hasText(sortno)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별번호");
		}

		SortPrfmncVO sortPrfmncParamVO = new SortPrfmncVO();

		sortPrfmncParamVO.setApcCd(apcCd);
		sortPrfmncParamVO.setSortno(sortno);
		sortPrfmncParamVO.setSortSn(sortsn);
		SortPrfmncVO sortPrfmncVO = sortPrfmncService.selectSortUpdtForFcrs(sortPrfmncParamVO);
		//List<SortPrfmncVO> prfmncList = sortPrfmncService.selectSortCnclList(sortPrfmncParamVO);

//		SortPrfmncVO prfmncList = sortPrfmncService.selectSortPrfmnc(sortPrfmncParamVO);



		// 투입실적 확인
//		SortInptPrfmncVO sortInptParamVO = new SortInptPrfmncVO();
//		sortInptParamVO.setApcCd(apcCd);
//		sortInptParamVO.setSortno(sortno);
//
//		List<SortInptPrfmncVO> inptList = sortInptPrfmncService.selectSortInptCnclList(sortInptParamVO);








//		double rawMtrInptWght = 0;
//		int rawMtrInptQntt = 0;
//		for(SortInptPrfmncVO inpt : inptList) {
//			RawMtrInvntrVO rawMtrInfo;
//			RawMtrInvntrVO rawMtrInvntrVO = new RawMtrInvntrVO();
//			rawMtrInvntrVO.setWrhsno(inpt.getWrhsno());
//			rawMtrInvntrVO.setApcCd(apcCd);
//			rawMtrInfo = rawMtrInvntrService.selectRawMtrInvntr(rawMtrInvntrVO);
//			if (rawMtrInfo == null) {
//				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
//			}

//			rawMtrInptQntt += rawMtrInfo.getInptQntt();
//			rawMtrInptWght += rawMtrInfo.getInptWght();

//		}





//		if (inptList == null || inptList.isEmpty()) {
//			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "투입실적");
//		}
//
//		if (sortPrfmncVO == null ) {
//			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별실적");
//		}

//		if (sortPrfmncVO == null ) {
//			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "삭제대상");
//		}





		// 마감확인
		String sortYmd = sortPrfmncVO.getInptYmd();
		String ddlnYn = cmnsValidationService.selectChkDdlnYn(apcCd, sortYmd);
		if (!ComConstants.CON_NONE.equals(ddlnYn)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "선별재고");
		}

		SortPrfmncVO prfmncVO = new SortPrfmncVO();
		BeanUtils.copyProperties(sortMngVO, prfmncVO);
		BeanUtils.copyProperties(sortPrfmncVO, prfmncVO,
				ApcConstants.PROP_APC_CD,
				ComConstants.PROP_SYS_FRST_INPT_DT,
				ComConstants.PROP_SYS_FRST_INPT_USER_ID,
				ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
				ComConstants.PROP_SYS_LAST_CHG_DT,
				ComConstants.PROP_SYS_LAST_CHG_USER_ID,
				ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

		//prfmncVO.setSortRealDelY(ComConstants.CON_YES);
		prfmncVO.setSortQntt((int) sortMngVO.getQntt());
		prfmncVO.setSortWght(sortMngVO.getWght());


		String pckgno = prfmncVO.getNxtPckgno();





		// 포장실적 수정
		if(pckgno != null) {
			PckgPrfmncVO pckgPrfmncVO = new PckgPrfmncVO();
			BeanUtils.copyProperties(sortMngVO, pckgPrfmncVO);
			pckgPrfmncVO.setApcCd(apcCd);
			pckgPrfmncVO.setPckgno(pckgno);
			pckgPrfmncVO.setPckgSn(sortsn);
			pckgPrfmncVO.setPckgYmd(sortYmd);
			pckgPrfmncVO.setPckgWght(sortMngVO.getWght());
			pckgPrfmncVO.setPckgQntt((int) sortMngVO.getQntt());




			rtnObj = pckgPrfmncService.updatePckgPrfmnc(pckgPrfmncVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			PckgInptVO pckgInptVO = new PckgInptVO();
			BeanUtils.copyProperties(sortMngVO, pckgInptVO);
			pckgInptVO.setApcCd(apcCd);
			pckgInptVO.setPckgno(pckgno);
			pckgInptVO.setSortSn(sortsn);
			pckgInptVO.setWght(sortMngVO.getWght());
			pckgInptVO.setQntt((int) sortMngVO.getQntt());
			pckgInptVO.setInptYmd(sortMngVO.getInptYmd());

			int rtn = pckgInptService.updatePckgInpt(pckgInptVO);


//			if (rtn == 0) {
//				throw new EgovBizException(getMessageForMap(rtnObj));
//			}
			GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
			gdsInvntrVO.setApcCd(apcCd);
			gdsInvntrVO.setPckgno(pckgno);
			gdsInvntrVO.setPckgSn(sortsn);

			gdsInvntrVO = gdsInvntrService.selectGdsInvntr(gdsInvntrVO);

			gdsInvntrVO.setPckgQntt((int) sortMngVO.getQntt());
			gdsInvntrVO.setPckgWght(sortMngVO.getWght());
			gdsInvntrVO.setInvntrQntt((int) sortMngVO.getQntt());
			gdsInvntrVO.setInvntrWght(sortMngVO.getWght());
			gdsInvntrVO.setSysLastChgUserId(sortMngVO.getSysLastChgUserId());
			gdsInvntrVO.setSysLastChgPrgrmId(sortMngVO.getSysLastChgPrgrmId());

			gdsInvntrService.updateGdsInvntr(gdsInvntrVO);

		}

		// 선별 재고,실적 수정

		sortMngVO.setSortQntt(sortMngVO.getQntt());
		sortMngVO.setSortWght(sortMngVO.getWght());
		rtnObj = sortPrfmncService.updateSortPrfmnc(sortMngVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		SortInvntrVO sortInvntrVOFcrs = new SortInvntrVO();
		SortInvntrVO orgSortInvntrVO = new SortInvntrVO();
		BeanUtils.copyProperties(sortMngVO, sortInvntrVOFcrs);
		sortInvntrVOFcrs = sortInvntrService.selectSortInvntr(sortInvntrVOFcrs);





		if(pckgno != null) {
			sortInvntrVOFcrs.setSortQntt(sortMngVO.getQntt());
			sortInvntrVOFcrs.setSortWght(sortMngVO.getWght());
			sortInvntrVOFcrs.setInvntrQntt(0);
			sortInvntrVOFcrs.setInvntrWght(0);
			sortInvntrVOFcrs.setPckgQntt(sortMngVO.getQntt());
			sortInvntrVOFcrs.setPckgWght(sortMngVO.getWght());
			sortInvntrVOFcrs.setPckgYn("Y");
		}else {
			sortInvntrVOFcrs.setSortQntt(sortMngVO.getQntt());
			sortInvntrVOFcrs.setSortWght(sortMngVO.getWght());
			sortInvntrVOFcrs.setInvntrQntt(sortMngVO.getQntt());
			sortInvntrVOFcrs.setInvntrWght(sortMngVO.getWght());
			sortInvntrVOFcrs.setPckgQntt(0);
			sortInvntrVOFcrs.setPckgWght(0);
		}

		sortInvntrVOFcrs.setSysLastChgUserId(sortMngVO.getSysLastChgUserId());
		sortInvntrVOFcrs.setSysLastChgPrgrmId(sortMngVO.getSysLastChgPrgrmId());
		sortInvntrVOFcrs.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_C1);

		orgSortInvntrVO.setApcCd(apcCd);
		orgSortInvntrVO.setSortno(sortMngVO.getSortno());
		orgSortInvntrVO.setSortSn(sortsn);
		orgSortInvntrVO.setInvntrQntt(sortMngVO.getQntt());
		orgSortInvntrVO.setInvntrWght(sortMngVO.getWght());
		orgSortInvntrVO.setSysLastChgUserId(sortMngVO.getSysLastChgUserId());
		orgSortInvntrVO.setSysLastChgPrgrmId(sortMngVO.getSysLastChgPrgrmId());
		// 선별 재고변경 이력 등록
		rtnObj = sortInvntrService.insertSortChgHstry(orgSortInvntrVO);

		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		rtnObj = sortInvntrService.updateSortInvntr(sortInvntrVOFcrs);

		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}


	@Override
	public HashMap<String, Object> deleteSortCmnd(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortInptPrfmnc(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortPrfmnc(SortMngVO sortMngVO) throws Exception {

		// apc 코드와 선별번호로 선별실적, 투입실적, 선별재고 삭제 : delYn 'Y'
		HashMap<String, Object> rtnObj = new HashMap<>();
		// validation check
		String apcCd = sortMngVO.getApcCd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		List<SortPrfmncVO> sortList = sortMngVO.getSortPrfmncList();

		if (sortList == null || sortList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "삭제대상");
		}

		for ( SortPrfmncVO cncl : sortList ) {

			String sortno = cncl.getSortno();
			if (!StringUtils.hasText(sortno)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별번호");
			}

			SortPrfmncVO sortPrfmncParamVO = new SortPrfmncVO();
			sortPrfmncParamVO.setApcCd(apcCd);
			sortPrfmncParamVO.setSortno(sortno);

			List<SortPrfmncVO> prfmncList = sortPrfmncService.selectSortCnclList(sortPrfmncParamVO);
			if (prfmncList == null || prfmncList.isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별실적");
			}

			// 투입실적 확인
			SortInptPrfmncVO sortInptParamVO = new SortInptPrfmncVO();
			sortInptParamVO.setApcCd(apcCd);
			sortInptParamVO.setSortno(sortno);

			List<SortInptPrfmncVO> inptList = sortInptPrfmncService.selectSortInptCnclList(sortInptParamVO);
			if (inptList == null || inptList.isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "투입실적");
			}

			List<SortPrfmncVO> sortPrfmncVOList = new ArrayList<>();
			for ( SortPrfmncVO sort : prfmncList ) {

				// 마감확인
				String sortYmd = sort.getInptYmd();
				String ddlnYn = cmnsValidationService.selectChkDdlnYn(apcCd, sortYmd);
				if (!ComConstants.CON_NONE.equals(ddlnYn)) {
					return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "선별재고");
				}

				// 선별량 재고량 변경 확인
				if (sort.getInvntrQntt() < sort.getSortQntt()) {
					String pckgNo = sort.getNxtPckgno();
					if(pckgNo == null) {
						return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||선별량");		// W0008	{0} 보다 {1}이/가 큽니다.
					}else {
						PckgMngVO pckgMngVO = new PckgMngVO();
						pckgMngVO.setApcCd(apcCd);
						pckgMngVO.setPckgno(pckgNo);
						BeanUtils.copyProperties(sortMngVO, pckgMngVO);
						pckgMngService.deletePckgPrfmnc(pckgMngVO);
					}

				}

				SortPrfmncVO prfmncVO = new SortPrfmncVO();
				BeanUtils.copyProperties(sortMngVO, prfmncVO);
				BeanUtils.copyProperties(sort, prfmncVO,
						ApcConstants.PROP_APC_CD,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

				sortPrfmncVOList.add(prfmncVO);
			}

			// 처리

			// 재고삭제 + 선별실적 삭제
			rtnObj = sortPrfmncService.deleteSortPrfmncList(sortPrfmncVOList);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 투입실적 삭제 + 원물재고 갱신
			for ( SortInptPrfmncVO inpt : inptList ) {

				// 투입실적 삭제
				SortInptPrfmncVO sortInptVO = new SortInptPrfmncVO();
				BeanUtils.copyProperties(sortMngVO, sortInptVO);
				sortInptVO.setWrhsno(inpt.getWrhsno());
				sortInptVO.setInptSn(inpt.getInptSn());

				rtnObj = sortInptPrfmncService.deleteSortInptPrfmnc(sortInptVO);
				if (rtnObj != null) {
					// error throw exception;
					throw new EgovBizException(getMessageForMap(rtnObj));
				}

				// 원물재고 갱신
				RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
				BeanUtils.copyProperties(sortMngVO, invntrVO);
				invntrVO.setWrhsno(inpt.getWrhsno());

				invntrVO.setInptQntt(inpt.getQntt());
				invntrVO.setInptWght(inpt.getWght());

				rtnObj = rawMtrInvntrService.updateInvntrSortPrfmncCncl(invntrVO);
				if (rtnObj != null) {
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}
		}

		return null;
	}





}
