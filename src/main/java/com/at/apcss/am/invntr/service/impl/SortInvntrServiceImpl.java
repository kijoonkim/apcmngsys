package com.at.apcss.am.invntr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.invntr.mapper.SortInvntrMapper;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.InvntrVO;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.invntr.vo.SortStdGrdVO;
import com.at.apcss.am.trnsf.mapper.InvntrTrnsfMapper;
import com.at.apcss.am.trnsf.vo.InvntrTrnsfVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : SortInvntrServiceImpl.java
 * @Description : 선별재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("sortInvntrService")
public class SortInvntrServiceImpl extends BaseServiceImpl implements SortInvntrService {

	@Autowired
	private SortInvntrMapper sortInvntrMapper;

	@Autowired
	private InvntrTrnsfMapper invntrTrnsfMapper;

	@Resource(name= "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Override
	public SortInvntrVO selectSortInvntr(SortInvntrVO sortInvntrVO) throws Exception {

		SortInvntrVO resultVO = sortInvntrMapper.selectSortInvntr(sortInvntrVO);

		return resultVO;
	}

	@Override
	public List<SortInvntrVO> selectSortInvntrDsctnList(SortInvntrVO sortInvntrVO) throws Exception {

		List<SortInvntrVO> resultList = sortInvntrMapper.selectSortInvntrDsctnList(sortInvntrVO);

		return resultList;
	}

	@Override
	public List<SortInvntrVO> selectSortInvntrList(SortInvntrVO sortInvntrVO) throws Exception {

		List<SortInvntrVO> resultList = sortInvntrMapper.selectSortInvntrList(sortInvntrVO);

		return resultList;
	}


	@Override
	public List<SortInvntrVO> selectSortInvntrListForPckg(SortInvntrVO sortInvntrVO) throws Exception {

		List<SortInvntrVO> resultList = sortInvntrMapper.selectSortInvntrListForPckg(sortInvntrVO);

		return resultList;
	}



	@Override
	public HashMap<String, Object> insertSortInvntr(SortInvntrVO sortInvntrVO) throws Exception {

		sortInvntrMapper.insertSortInvntr(sortInvntrVO);

		List<SortStdGrdVO> stdGrdList = sortInvntrVO.getStdGrdList();

		if (stdGrdList != null ) {

			for ( SortStdGrdVO stdGrd : stdGrdList ) {

				SortStdGrdVO sortStdGrdVO = new SortStdGrdVO();
				BeanUtils.copyProperties(sortInvntrVO, sortStdGrdVO);
				BeanUtils.copyProperties(stdGrd, sortStdGrdVO,
						ApcConstants.PROP_APC_CD,
						ApcConstants.PROP_SORTNO,
						ApcConstants.PROP_SORT_SN,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
				logger.debug("sortSn : {}", sortStdGrdVO.getSortSn());
				sortInvntrMapper.insertSortStdGrd(sortStdGrdVO);
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertSortInvntrList(List<SortInvntrVO> sortInvntrList) throws Exception {

		for ( SortInvntrVO sortInvntrVO : sortInvntrList ) {
			HashMap<String, Object> rtnObj = insertSortInvntr(sortInvntrVO);
			if (rtnObj != null) {
				return rtnObj;
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertSortInvntrListForImport(List<SortInvntrVO> sortInvntrList) throws Exception {
		
		if (sortInvntrList == null || sortInvntrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등록대상");
		}
		
		String apcCd = ComConstants.CON_BLANK;
		
		// 선별일자별로 처리		
		List<InvntrVO> mstList = new ArrayList<>();
		for ( SortInvntrVO sortInvntr : sortInvntrList ) {
						
			if (!StringUtils.hasText(sortInvntr.getApcCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC정보");
			}
			if (!StringUtils.hasText(sortInvntr.getInptYmd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별일자");
			}
			if (!StringUtils.hasText(sortInvntr.getItemCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품목");
			}
			if (!StringUtils.hasText(sortInvntr.getVrtyCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품종");
			}
			if (!StringUtils.hasText(sortInvntr.getSpcfctCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "규격");
			}
			
			if (StringUtils.hasText(apcCd)) {
				if (!apcCd.equals(sortInvntr.getApcCd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_TARGET_EXIST, "서로 다른 APC코드");					
				}
			} else {
				apcCd = sortInvntr.getApcCd();
			}
			
			sortInvntr.setExcelYn(ComConstants.CON_YES);
			
			boolean needAdd = true;
			
			InvntrVO mstVO = null;
			
			List<SortInvntrVO> importList = new ArrayList<>();
			
			String invntrKey = sortInvntr.getInptYmd()
						+ sortInvntr.getItemCd()
						+ sortInvntr.getVrtyCd();
			
			for ( InvntrVO chkVO : mstList ) {
				if ( ComUtil.nullToEmpty(invntrKey).equals(chkVO.getInvntrKey())) {
					mstVO = chkVO;
					importList = mstVO.getSortInvntrList();
					if (importList == null) {
						importList = new ArrayList<>();
					}
					needAdd = false;
					break;
				}
			}
			
			if (mstVO == null) {
				mstVO = new InvntrVO();
				mstVO.setApcCd(apcCd);
				mstVO.setInvntrKey(invntrKey);
				mstVO.setInvntrYmd(sortInvntr.getInptYmd());
			}
			
			importList.add(sortInvntr);
			mstVO.setSortInvntrList(importList);
			
			if (needAdd) {
				mstList.add(mstVO);
			}
		}
		
		for ( InvntrVO mstVO : mstList ) {
			List<SortInvntrVO> importList = mstVO.getSortInvntrList();
			if (importList != null && !importList.isEmpty()) {
				String sortno = cmnsTaskNoService.selectSortno(mstVO.getApcCd(), mstVO.getInvntrYmd());
				int sortSn = 0;
				for ( SortInvntrVO sort : importList ) {
					sortSn++;
					sort.setSortno(sortno);
					sort.setSortSn(sortSn);
				}
				HashMap<String, Object> rtnObj = insertSortInvntrList(importList);
				if (rtnObj != null) {
					// error throw exception;
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}
		}
		
		return null;
	}

	
	@Override
	public HashMap<String, Object> updateSortInvntr(SortInvntrVO sortInvntrVO) throws Exception {

		sortInvntrMapper.updateSortInvntr(sortInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortInvntr(SortInvntrVO sortInvntrVO) throws Exception {

		sortInvntrMapper.updateSortInvntrForDelY(sortInvntrVO);

		sortInvntrMapper.updateSortStdGrdForDelY(sortInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> updateInvntrPckgPrfmnc(SortInvntrVO sortInvntrVO) throws Exception {

		SortInvntrVO invntrInfo = sortInvntrMapper.selectSortInvntr(sortInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getSortno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별재고");
		}

		if (sortInvntrVO.getPckgWght() > invntrInfo.getInvntrWght()) {
			return ComUtil.getResultMap("W0008", "재고량||포장량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() - sortInvntrVO.getInptQntt();
		double invntrWght = invntrInfo.getInvntrWght() - sortInvntrVO.getInptWght();
		sortInvntrVO.setInvntrQntt(invntrQntt);
		sortInvntrVO.setInvntrWght(invntrWght);

		// 포장량
		int pckgQntt = invntrInfo.getPckgQntt() + sortInvntrVO.getInptQntt();
		double pckgWght = invntrInfo.getPckgWght() + sortInvntrVO.getInptWght();
		sortInvntrVO.setPckgQntt(pckgQntt);
		sortInvntrVO.setPckgWght(pckgWght);

		// 선별 재고변경 이력 등록 (투입)
		sortInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_P1);
		HashMap<String, Object> rtnObj = insertSortChgHstry(sortInvntrVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		sortInvntrMapper.updateInvntrPckgPrfmnc(sortInvntrVO);

		return null;
	}


	@Override
	public HashMap<String, Object> updateInvntrPckgPrfmncCncl(SortInvntrVO sortInvntrVO) throws Exception {

		SortInvntrVO invntrInfo = sortInvntrMapper.selectSortInvntr(sortInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getSortno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별재고");
		}

		if (sortInvntrVO.getInptQntt() > invntrInfo.getPckgQntt()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "취소량||포장량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() + sortInvntrVO.getInptQntt();
		double invntrWght = invntrInfo.getInvntrWght() + sortInvntrVO.getInptWght();
		sortInvntrVO.setInvntrQntt(invntrQntt);
		sortInvntrVO.setInvntrWght(invntrWght);

		// 포장량
		int pckgQntt = invntrInfo.getPckgQntt() - sortInvntrVO.getInptQntt();
		double pckgWght = invntrInfo.getPckgWght() - sortInvntrVO.getInptWght();
		sortInvntrVO.setPckgQntt(pckgQntt);
		sortInvntrVO.setPckgWght(pckgWght);

		// 선별 재고변경 이력 등록 (투입취소)
		sortInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_P2);
		HashMap<String, Object> rtnObj = insertSortChgHstry(sortInvntrVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		sortInvntrMapper.updateInvntrPckgPrfmnc(sortInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> multiSaveSortInvntrList(List<SortInvntrVO> sortInvntrList) throws Exception {

		List<SortInvntrVO> updateList = new ArrayList<>();
		List<SortInvntrVO> insertList = new ArrayList<>();
		List<SortInvntrVO> trnsfList = new ArrayList<>();

		for (SortInvntrVO sortInvntrVO : sortInvntrList) {

			SortInvntrVO vo = new SortInvntrVO();
			BeanUtils.copyProperties(sortInvntrVO, vo);

			if (ComConstants.ROW_STS_INSERT.equals(sortInvntrVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(sortInvntrVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		if(insertList.size() > 0 ){
			String sortno = cmnsTaskNoService.selectSortno(insertList.get(0).getApcCd(), insertList.get(0).getSortYmd());
			int sortSn = 1;
			// 선별 재고 등록
			for (SortInvntrVO sortInvntrVO : insertList) {
				sortInvntrVO.setSortno(sortno);
				sortInvntrVO.setSortSn(sortSn);

				if(ComConstants.CON_YES.equals(sortInvntrVO.getTrnsfYn())) {
					sortInvntrVO.setPrcsno(sortno);
					sortInvntrVO.setPrcsSn(sortSn);
					trnsfList.add(sortInvntrVO);
				}

				insertSortInvntr(sortInvntrVO);

				sortSn ++;

				// 선별 재고등록 이력
			}
		}

		if(trnsfList.size() > 0) {
			for (SortInvntrVO sortInvntrVO : trnsfList) {
				InvntrTrnsfVO vo = new InvntrTrnsfVO();
				BeanUtils.copyProperties(sortInvntrVO, vo);
				invntrTrnsfMapper.updateTrnsfInvntr(vo);
			}
		}

		if(updateList.size() > 0) {

			// 선별 재고 변경
			for (SortInvntrVO sortInvntrVO : updateList) {

				// 선별 재고변경 이력 등록 (재고변경)
				sortInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_C1);
				HashMap<String, Object> rtnObj = insertSortChgHstry(sortInvntrVO);
				if (rtnObj != null) {
					// error throw exception;
					throw new EgovBizException(getMessageForMap(rtnObj));
				}

				// 선별 재고변경
				sortInvntrMapper.updateSortInvntrChg(sortInvntrVO);
			}
		}

		return null;
	}

	@Override
	public List<SortInvntrVO> selectPckgCmndTrgetList(SortInvntrVO sortInvntrVO) throws Exception {

		List<SortInvntrVO> resultList = sortInvntrMapper.selectPckgCmndTrgetList(sortInvntrVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> updateInvntrTrnsf(SortInvntrVO sortInvntrVO) throws Exception {

		SortInvntrVO invntrInfo = sortInvntrMapper.selectSortInvntr(sortInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getSortno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별재고");
		}

		if (sortInvntrVO.getInptQntt() > invntrInfo.getPckgQntt()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "취소량||포장량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고 - 이송
		int invntrQntt = invntrInfo.getInvntrQntt() - sortInvntrVO.getTrnsfQntt();
		double invntrWght = invntrInfo.getInvntrWght() - sortInvntrVO.getTrnsfWght();
		sortInvntrVO.setInvntrQntt(invntrQntt);
		sortInvntrVO.setInvntrWght(invntrWght);

		int trnsfQntt = invntrInfo.getTrnsfQntt() + sortInvntrVO.getTrnsfQntt();
		double trnsfWght = invntrInfo.getTrnsfWght() + sortInvntrVO.getTrnsfWght();
		sortInvntrVO.setTrnsfQntt(trnsfQntt);
		sortInvntrVO.setTrnsfWght(trnsfWght);

		// 선별 재고변경 이력 등록 (이송)
		sortInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_T1);
		HashMap<String, Object> rtnObj = insertSortChgHstry(sortInvntrVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		sortInvntrMapper.updateInvntrTrnsf(sortInvntrVO);

		return null;
	}

	@Override
	public List<SortInvntrVO> selectDailySortInvntrList(SortInvntrVO sortInvntrVO) throws Exception {

		List<SortInvntrVO> resultList = sortInvntrMapper.selectDailySortInvntrList(sortInvntrVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> updateInvntrPckgInpt(SortInvntrVO sortInvntrVO) throws Exception {

		SortInvntrVO invntrInfo = sortInvntrMapper.selectSortInvntr(sortInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getSortno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별재고");
		}

		if (sortInvntrVO.getInptPrgrsQntt() > invntrInfo.getInvntrQntt()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "투입량||재고량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고 - 이송
		int invntrQntt = invntrInfo.getInvntrQntt() - sortInvntrVO.getInptPrgrsQntt();
		double invntrWght = invntrInfo.getInvntrWght() - sortInvntrVO.getInptPrgrsWght();
		sortInvntrVO.setInvntrQntt(invntrQntt);
		sortInvntrVO.setInvntrWght(invntrWght);

		int inptPrgrsQntt = invntrInfo.getInptPrgrsQntt() + sortInvntrVO.getInptPrgrsQntt();
		double inptPrgrsWght = invntrInfo.getInptPrgrsWght() + sortInvntrVO.getInptPrgrsWght();

		sortInvntrVO.setInptPrgrsQntt(inptPrgrsQntt);
		sortInvntrVO.setInptPrgrsWght(inptPrgrsWght);

		// 선별 재고변경 이력 등록 (투입)
		sortInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_P1);
		HashMap<String, Object> rtnObj = insertSortChgHstry(sortInvntrVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		sortInvntrMapper.updateInvntrInptPrgrs(sortInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> deleteInvntrPckgInpt(SortInvntrVO sortInvntrVO) throws Exception {

		SortInvntrVO invntrInfo = sortInvntrMapper.selectSortInvntr(sortInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getSortno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별재고");
		}

		if (sortInvntrVO.getInptPrgrsQntt() > invntrInfo.getInptPrgrsQntt()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "투입진행량||취소량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고 - 이송
		int invntrQntt = invntrInfo.getInvntrQntt() + sortInvntrVO.getInptPrgrsQntt();
		double invntrWght = invntrInfo.getInvntrWght() + sortInvntrVO.getInptPrgrsWght();
		sortInvntrVO.setInvntrQntt(invntrQntt);
		sortInvntrVO.setInvntrWght(invntrWght);

		int inptPrgrsQntt = invntrInfo.getInptPrgrsQntt() - sortInvntrVO.getInptPrgrsQntt();
		double inptPrgrsWght = invntrInfo.getInptPrgrsWght() - sortInvntrVO.getInptPrgrsWght();

		sortInvntrVO.setInptPrgrsQntt(inptPrgrsQntt);
		sortInvntrVO.setInptPrgrsWght(inptPrgrsWght);

		// 선별 재고변경 이력 등록 (투입취소)
		sortInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_P2);
		HashMap<String, Object> rtnObj = insertSortChgHstry(sortInvntrVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		sortInvntrMapper.updateInvntrInptPrgrs(sortInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> insertSortChgHstry(SortInvntrVO sortInvntrVO) throws Exception {

		SortInvntrVO invntrInfo = sortInvntrMapper.selectSortInvntr(sortInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getSortno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별재고정보");
		}

		SortInvntrVO chgHstryVO = new SortInvntrVO();

		BeanUtils.copyProperties(sortInvntrVO, chgHstryVO);
		chgHstryVO.setChgBfrQntt(invntrInfo.getInvntrQntt());
		chgHstryVO.setChgBfrWght(invntrInfo.getInvntrWght());
		chgHstryVO.setChgAftrQntt(sortInvntrVO.getInvntrQntt());
		chgHstryVO.setChgAftrWght(sortInvntrVO.getInvntrWght());

		if (!StringUtils.hasText(sortInvntrVO.getWarehouseSeCd())
				|| sortInvntrVO.getWarehouseSeCd().equals(invntrInfo.getWarehouseSeCd())) {
			chgHstryVO.setWarehouseSeCd(ComConstants.CON_BLANK);
		}

		// 이력 insert
		sortInvntrMapper.insertSortChgHstry(chgHstryVO);

		return null;
	}

}
