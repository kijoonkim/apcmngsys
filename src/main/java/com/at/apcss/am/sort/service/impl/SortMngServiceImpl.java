package com.at.apcss.am.sort.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsItemService;
import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.SpmtPckgUnitService;
import com.at.apcss.am.cmns.vo.CmnsItemVO;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitVO;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.pckg.service.PckgMngService;
import com.at.apcss.am.pckg.vo.PckgMngVO;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import com.at.apcss.am.sort.service.SortCmndService;
import com.at.apcss.am.sort.service.SortInptPrfmncService;
import com.at.apcss.am.sort.service.SortMngService;
import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.SortInptPrfmncVO;
import com.at.apcss.am.sort.vo.SortMngVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
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

	@Resource(name="rawMtrInvntrService")
	private RawMtrInvntrService rawMtrInvntrService;

	@Resource(name="pckgMngService")
	private PckgMngService pckgMngService;

	@Resource(name="cmnsItemService")
	private CmnsItemService cmnsItemService;
		
	@Resource(name="spmtPckgUnitService")
	private SpmtPckgUnitService spmtPckgUnitService;
	
	
	@Resource(name="cmnsValidationService")
	private CmnsValidationService cmnsValidationService;


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

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String sortno = sortMngVO.getSortno();

		if (!StringUtils.hasText(sortno)) {
			sortno = cmnsTaskNoService.selectSortno(apcCd, sortMngVO.getSortYmd());
		}

		// 실적등록 대상정보 목록
		List<SortPrfmncVO> prfmncList = sortMngVO.getSortPrfmncList();
		// 실적등록 대상재고 목록
		List<RawMtrInvntrVO> invntrList = sortMngVO.getRawMtrInvntrList();

		List<RawMtrInvntrVO> rawMtrInvntrVOList = new ArrayList<>();

		for ( SortPrfmncVO sort : prfmncList ) {
			sort.setRmnQntt(sort.getSortQntt());
			sort.setRmnWght(sort.getSortWght());
		}

		// 포장자동등록 대상
		List<SortPrfmncVO> pckgList = new ArrayList<>();

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
			int inptQntt = inv.getInptQntt();
			double inptWght = inv.getInptWght();

			int sortQntt = inv.getSortQntt();
			double sortWght = inv.getSortWght();

			for ( SortPrfmncVO sort : prfmncList ) {
				if (StringUtils.hasText(sort.getWrhsno()) && sort.getRmnWght() <= 0) {
					continue;
				}

				int applQntt = 0;
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

				sort.setRmnQntt(sort.getRmnQntt() - applQntt);
				sort.setRmnWght(sort.getRmnWght() - applWght);

				if (!StringUtils.hasText(inptYmd)) {
					inptYmd = sort.getInptYmd();
				}
			}

			inv.setInptYmd(inptYmd);
			inv.setSortQntt(sortQntt);
			inv.setSortWght(sortWght);
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

			sortInptVO.setQntt(inv.getInptQntt());
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
			HashMap<String, Object> rtnMap = rawMtrInvntrService.updateInvntrSortPrfmnc(inv);
			if (rtnMap != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
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
			}
			
			sortPrfmncList.add(sort);
			mngVO.setSortPrfmncList(sortPrfmncList);
			if (needAdd) {
				sortMngList.add(mngVO);
			}
		}
		
		for ( SortMngVO mngVO : sortMngList ) {
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
					
					int sortQntt = sort.getRmnQntt();
					double sortWght = sort.getRmnWght();
					
					// 감량률 조회
					CmnsItemVO itemParam = new CmnsItemVO();
					itemParam.setApcCd(apcCd);
					itemParam.setItemCd(itemCd);
					
					CmnsItemVO cmnsItemVO = cmnsItemService.selectCmnsApcItem(itemParam);
					if (cmnsItemVO == null || !StringUtils.hasText(cmnsItemVO.getItemCd())) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품목조회정보");
					}
					
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
							
							int wrhsQntt = orgnInv.getWrhsQntt();
							double wrhsWght = orgnInv.getWrhsWght();
							
							int invRmnQntt = orgnInv.getRmnQntt();
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
								
								if (sortQntt <= 0) {
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
								return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별가능재고");
							}
							
							// 재고정보 조회
							for ( RawMtrInvntrVO orgnInv : invntrForSortList ) {
								
								int wrhsQntt = orgnInv.getWrhsQntt();
								double wrhsWght = orgnInv.getWrhsWght();
								
								int invRmnQntt = orgnInv.getInvntrQntt();
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
								
								rawMtrInvntrVOList.add(invntrVO);
								excldWrhsnoList.add(invntrVO.getWrhsno());
								
								logger.debug(
										"$#@ s: {}, no: {}, inpt: {}, sort: {}",
										sn,
										invntrVO.getWrhsno(), 
										invntrVO.getInptWght(), 
										invntrVO.getSortWght());
								
								if (sortQntt <= 0) {
									// 원물재고가 선정이 되었으므로 통과
									continue labelLoopSort;
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
							
							int invRmnQntt = orgnInv.getRmnQntt();
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
								
								if (sortWght <= 0) {
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
								return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별가능재고");
							}
							
							// 재고정보 조회
							for ( RawMtrInvntrVO orgnInv : invntrForSortList ) {
								
								int invRmnQntt = orgnInv.getInvntrQntt();
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
								
								rawMtrInvntrVOList.add(invntrVO);
								excldWrhsnoList.add(invntrVO.getWrhsno());
								
								logger.debug(
										"$#@ s: {}, no: {}, inpt: {}, sort: {}",
										sn,
										invntrVO.getWrhsno(), 
										invntrVO.getInptWght(), 
										invntrVO.getSortWght());
								
								if (sortWght <= 0) {
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

		for ( RawMtrInvntrVO inv : rawMtrInvntrVOList ) {
			
			String inptYmd = ComConstants.CON_BLANK;
			String wrhsno = inv.getWrhsno();
			String prdcrCd = inv.getPrdcrCd();
			String gdsSeCd = inv.getGdsSeCd();
			String wrhsSeCd = inv.getWrhsSeCd();
			String prdctnYr = inv.getPrdctnYr();
						
			// 지정 투입수량, 투입중량
			int inptQntt = inv.getInptQntt();
			double inptWght = inv.getInptWght();
			
			int sortQntt = inv.getSortQntt();
			double sortWght = inv.getSortWght();
			
			for ( SortPrfmncVO sort : prfmncList ) {
				
				if (StringUtils.hasText(sort.getWrhsno()) && sort.getRmnWght() <= 0) {
					continue;
				}

				int applQntt = 0;
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

				sort.setRmnQntt(sort.getRmnQntt() - applQntt);
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

		for ( SortPrfmncVO sort : prfmncList ) {
			if (!StringUtils.hasText(sort.getWrhsno())) {
				logger.debug("no wrhsno");
				return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
			}
			if (sort.getRmnWght() > 0) {
				logger.debug("rmnWght");
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

			sortInptVO.setQntt(inv.getInptQntt());
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
		// TODO Auto-generated method stub
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
					return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||선별량");		// W0008	{0} 보다 {1}이/가 큽니다.
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
