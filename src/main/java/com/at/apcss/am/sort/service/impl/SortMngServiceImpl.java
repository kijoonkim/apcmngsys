package com.at.apcss.am.sort.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
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




	@Override
	public HashMap<String, Object> insertSortCmnd(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
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
			return ComUtil.getResultMap("W0005", "APC코드");
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
			sort.setRmnQntt(sort.getQntt());
			sort.setRmnWght(sort.getWght());
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
				return ComUtil.getResultMap("W0005", "원물재고");
			}

			if (invntrVO.getInptWght() > invntrInfo.getInvntrWght()) {
				logger.debug("{}: 재고 {}, 투입 {}", invntrVO.getWrhsno(), invntrInfo.getInvntrWght(), invntrVO.getInptWght());
				return ComUtil.getResultMap("W0008", "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
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
				return ComUtil.getResultMap("W0008", "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
			}
			if (sort.getRmnWght() > 0) {
				return ComUtil.getResultMap("W0008", "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
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

				invntrVO.setInptQntt(sortVO.getQntt());
				invntrVO.setInptWght(sortVO.getWght());
				invntrVO.setQntt(0);
				invntrVO.setWght(0);

				sortInvntrList.add(invntrVO);

				PckgPrfmncVO pckgVO = new PckgPrfmncVO();
				BeanUtils.copyProperties(invntrVO, pckgVO);
				pckgVO.setInptYmd(sortVO.getInptYmd());
				pckgVO.setPckgYmd(sortVO.getInptYmd());
				pckgVO.setPckgQntt(sortVO.getQntt());
				pckgVO.setPckgWght(sortVO.getWght());
				pckgVO.setGdsGrd(sortVO.getGrdCd());
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
		// TODO Auto-generated method stub
		return null;
	}



}
