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

import com.at.apcss.am.cmns.service.CmnsGdsService;
import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.invntr.mapper.GdsInvntrMapper;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.GdsStdGrdVO;
import com.at.apcss.am.invntr.vo.InvntrVO;
import com.at.apcss.am.spmt.vo.SpmtDsctnTotVO;
import com.at.apcss.am.trnsf.mapper.InvntrTrnsfMapper;
import com.at.apcss.am.trnsf.vo.InvntrTrnsfVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : GdsInvntrServiceImpl.java
 * @Description : 상품재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("gdsInvntrService")
public class GdsInvntrServiceImpl extends BaseServiceImpl implements GdsInvntrService {


	@Autowired
	private GdsInvntrMapper gdsInvntrMapper;

	@Autowired
	private InvntrTrnsfMapper invntrTrnsfMapper;

	@Resource(name= "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name= "cmnsGdsService")
	private CmnsGdsService cmnsGdsService;

	@Override
	public GdsInvntrVO selectGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO resultVO = gdsInvntrMapper.selectGdsInvntr(gdsInvntrVO);

		return resultVO;
	}

	@Override
	public GdsInvntrVO selectSpmtGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO resultVO = gdsInvntrMapper.selectSpmtGdsInvntr(gdsInvntrVO);

		return resultVO;
	}


	@Override
	public List<GdsInvntrVO> selectSpmtGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception {

		List<GdsInvntrVO> resultList = gdsInvntrMapper.selectSpmtGdsInvntrList(gdsInvntrVO);

		return resultList;

	}


	@Override
	public List<GdsInvntrVO> selectGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception {

		List<GdsInvntrVO> resultList = gdsInvntrMapper.selectGdsInvntrList(gdsInvntrVO);

		return resultList;
	}
	@Override
	public List<GdsInvntrVO> selectGdsInvntrTotalList(GdsInvntrVO gdsInvntrVO) throws Exception {

		List<GdsInvntrVO> resultList = gdsInvntrMapper.selectGdsInvntrTotalList(gdsInvntrVO);

		return resultList;
	}

	@Override
	public List<GdsInvntrVO> selectUpdateGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception {

		List<GdsInvntrVO> resultList = gdsInvntrMapper.selectUpdateGdsInvntrList(gdsInvntrVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		gdsInvntrMapper.insertGdsInvntr(gdsInvntrVO);

		List<GdsStdGrdVO> stdGrdList = gdsInvntrVO.getStdGrdList();
		if (stdGrdList != null) {
			for ( GdsStdGrdVO stdGrd : stdGrdList ) {
				GdsStdGrdVO gdsStdGrdVO = new GdsStdGrdVO();
				BeanUtils.copyProperties(gdsInvntrVO, gdsStdGrdVO);
				BeanUtils.copyProperties(stdGrd, gdsStdGrdVO,
						ApcConstants.PROP_APC_CD,
						ApcConstants.PROP_PCKGNO,
						ApcConstants.PROP_PCKG_SN,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

				gdsInvntrMapper.insertGdsStdGrd(gdsStdGrdVO);
			}
		}

		return null;
	}

	@Override
	public int updateGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		int updatedCnt = gdsInvntrMapper.updateGdsInvntr(gdsInvntrVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

        //int deletedCnt = gdsInvntrMapper.deleteGdsInvntr(gdsInvntrVO);
        gdsInvntrMapper.updateGdsInvntrForDelY(gdsInvntrVO);

        GdsStdGrdVO gdsStdGrdVO = new GdsStdGrdVO();
        BeanUtils.copyProperties(gdsInvntrVO, gdsStdGrdVO);
        gdsInvntrMapper.updateGdsStdGrdForDelY(gdsStdGrdVO);

        return null;
	}

	@Override
	public HashMap<String, Object> insertGdsInvntrList(List<GdsInvntrVO> gdsInvntrList) throws Exception {

		for ( GdsInvntrVO gdsInvntrVO : gdsInvntrList ) {

			HashMap<String, Object> rtnObj = insertGdsInvntr(gdsInvntrVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}


	@Override
	public HashMap<String, Object> insertGdsInvntrListForImport(List<GdsInvntrVO> gdsInvntrList) throws Exception {

		HashMap<String, Object> rtnObj = null;

		if (gdsInvntrList == null || gdsInvntrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등록대상");
		}

		String apcCd = ComConstants.CON_BLANK;

		// 선별일자별로 처리
		List<InvntrVO> mstList = new ArrayList<>();
		for ( GdsInvntrVO gdsInvntr : gdsInvntrList ) {

			if (!StringUtils.hasText(gdsInvntr.getApcCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC정보");
			}
			if (!StringUtils.hasText(gdsInvntr.getPckgYmd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "포장일자");
			}
			if (!StringUtils.hasText(gdsInvntr.getItemCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품목");
			}
			if (!StringUtils.hasText(gdsInvntr.getVrtyCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품종");
			}
			if (!StringUtils.hasText(gdsInvntr.getSpcfctCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "규격");
			}
			if (!StringUtils.hasText(gdsInvntr.getSpmtPckgUnitCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품명");
			}

			if (StringUtils.hasText(apcCd)) {
				if (!apcCd.equals(gdsInvntr.getApcCd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_TARGET_EXIST, "서로 다른 APC코드");
				}
			} else {
				apcCd = gdsInvntr.getApcCd();
			}

			CmnsGdsVO cmnsGdsParam = new CmnsGdsVO();
			BeanUtils.copyProperties(gdsInvntr, cmnsGdsParam);
			rtnObj = cmnsGdsService.insertCheckGdsCd(cmnsGdsParam);
			if (rtnObj != null) {
				return rtnObj;
			}
			gdsInvntr.setGdsCd(cmnsGdsParam.getNewGdsCd());

			gdsInvntr.setExcelYn(ComConstants.CON_YES);

			boolean needAdd = true;

			InvntrVO mstVO = null;

			List<GdsInvntrVO> importList = new ArrayList<>();

			String invntrKey = gdsInvntr.getPckgYmd()
						+ gdsInvntr.getItemCd()
						+ gdsInvntr.getVrtyCd();

			for ( InvntrVO chkVO : mstList ) {
				if ( ComUtil.nullToEmpty(invntrKey).equals(chkVO.getInvntrKey())) {
					mstVO = chkVO;
					importList = mstVO.getGdsInvntrList();
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
				mstVO.setInvntrYmd(gdsInvntr.getPckgYmd());
			}

			importList.add(gdsInvntr);
			mstVO.setGdsInvntrList(importList);

			if (needAdd) {
				mstList.add(mstVO);
			}
		}

		for ( InvntrVO mstVO : mstList ) {
			List<GdsInvntrVO> importList = mstVO.getGdsInvntrList();
			if (importList != null && !importList.isEmpty()) {
				String pckgno = cmnsTaskNoService.selectPckgno(mstVO.getApcCd(), mstVO.getInvntrYmd());
				int pckgSn = 0;
				for ( GdsInvntrVO gds : importList ) {
					pckgSn++;
					gds.setPckgno(pckgno);
					gds.setPckgSn(pckgSn);
				}
				rtnObj = insertGdsInvntrList(importList);
				if (rtnObj != null) {
					// error throw exception;
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}
		}

		return null;
	}


	@Override
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmnc(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO invntrInfo = selectGdsInvntr(gdsInvntrVO);

		if (invntrInfo == null
				|| !StringUtils.hasText(invntrInfo.getPckgno())
				|| !ComConstants.CON_NONE.equals(invntrInfo.getDelYn())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품재고");
		}

		if (gdsInvntrVO.getSpmtQntt() > invntrInfo.getInvntrQntt()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||출하량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() - gdsInvntrVO.getSpmtQntt();
		double invntrWght = invntrInfo.getInvntrWght() - gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setInvntrQntt(invntrQntt);
		gdsInvntrVO.setInvntrWght(invntrWght);

		// 출하량
		int spmtQntt = invntrInfo.getSpmtQntt() + gdsInvntrVO.getSpmtQntt();
		double spmtWght = invntrInfo.getSpmtWght() + gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setSpmtQntt(spmtQntt);
		gdsInvntrVO.setSpmtWght(spmtWght);

		if (StringUtils.hasText(invntrInfo.getGdsGrd())) {
			gdsInvntrVO.setGdsGrd(invntrInfo.getGdsGrd());
		}
		if (StringUtils.hasText(invntrInfo.getSpmtPckgUnitCd())) {
			gdsInvntrVO.setSpmtPckgUnitCd(invntrInfo.getSpmtPckgUnitCd());
		}
		if (StringUtils.hasText(invntrInfo.getGdsCd())) {
			gdsInvntrVO.setGdsCd(invntrInfo.getGdsCd());
		}

		// 상품 재고변경 이력 등록 (출고)
		gdsInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_S1);
		HashMap<String, Object> rtnObj = insertGdsInvntrChgHstry(gdsInvntrVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		gdsInvntrMapper.updateGdsInvntrSpmtPrfmnc(gdsInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmncCncl(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO invntrInfo = selectGdsInvntr(gdsInvntrVO);

		if (invntrInfo == null
				|| !StringUtils.hasText(invntrInfo.getPckgno())
				|| !ComConstants.CON_NONE.equals(invntrInfo.getDelYn())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품재고정보");
		}

		if (gdsInvntrVO.getSpmtWght() > invntrInfo.getSpmtWght()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "출하량||취소량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() + gdsInvntrVO.getSpmtQntt();
		double invntrWght = invntrInfo.getInvntrWght() + gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setInvntrQntt(invntrQntt);
		gdsInvntrVO.setInvntrWght(invntrWght);

		// 출하량
		int spmtQntt = invntrInfo.getSpmtQntt() - gdsInvntrVO.getSpmtQntt();
		double spmtWght = invntrInfo.getSpmtWght() - gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setSpmtQntt(spmtQntt);
		gdsInvntrVO.setSpmtWght(spmtWght);

		// 상품 재고변경 이력 등록 (출고취소)
		gdsInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_S2);
		HashMap<String, Object> rtnObj = insertGdsInvntrChgHstry(gdsInvntrVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		gdsInvntrMapper.updateGdsInvntrSpmtPrfmnc(gdsInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> multiSaveGdsInvntrList(List<GdsInvntrVO> gdsInvntrList) throws Exception {

		List<GdsInvntrVO> updateList = new ArrayList<>();
		List<GdsInvntrVO> insertList = new ArrayList<>();
		List<GdsInvntrVO> trnsfList = new ArrayList<>();

		for (GdsInvntrVO gdsInvntrVO : gdsInvntrList) {
			GdsInvntrVO vo = new GdsInvntrVO();
			BeanUtils.copyProperties(gdsInvntrVO, vo);

			if (ComConstants.ROW_STS_INSERT.equals(gdsInvntrVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(gdsInvntrVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		// 상품재고 등록
		if(insertList.size() > 0) {
			String pckgno = cmnsTaskNoService.selectPckgno(insertList.get(0).getApcCd(), insertList.get(0).getPckgYmd());
			int pckgSn = 1;
			for (GdsInvntrVO gdsInvntrVO : insertList) {

				gdsInvntrVO.setPckgno(pckgno);
				gdsInvntrVO.setPckgSn(pckgSn);

				if(ComConstants.CON_YES.equals(gdsInvntrVO.getTrnsfYn())) {
					gdsInvntrVO.setPrcsNo(pckgno);
					gdsInvntrVO.setPrcsSn(pckgSn);
					trnsfList.add(gdsInvntrVO);
				}

				// 상품재고 등록 이력 남기기

				insertGdsInvntr(gdsInvntrVO);
				pckgSn ++;
			}
		}

		if(trnsfList.size() > 0) {
			for (GdsInvntrVO gdsInvntrVO : trnsfList) {
				InvntrTrnsfVO vo = new InvntrTrnsfVO();
				BeanUtils.copyProperties(gdsInvntrVO, vo);
				invntrTrnsfMapper.updateTrnsfInvntr(vo);
			}
		}

		// 상품재고 변경
		for (GdsInvntrVO gdsInvntrVO : updateList) {

			// 상품 재고변경 이력 등록 (재고보정)
			gdsInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_C1);
			HashMap<String, Object> rtnObj = insertGdsInvntrChgHstry(gdsInvntrVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 상품재고 변경
			if(1 != gdsInvntrMapper.updateGdsInvntrChg(gdsInvntrVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "재고변경")));		// E0003	{0} 시 오류가 발생하였습니다.
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateInvntrTrnsf(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO invntrInfo = selectGdsInvntr(gdsInvntrVO);

		if (invntrInfo == null
				|| !StringUtils.hasText(invntrInfo.getPckgno())
				|| !ComConstants.CON_NONE.equals(invntrInfo.getDelYn())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품재고정보");
		}

		if (gdsInvntrVO.getTrnsfWght() > invntrInfo.getInvntrWght()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||이송량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고 - 이송
		int invntrQntt = invntrInfo.getInvntrQntt() - gdsInvntrVO.getTrnsfQntt();
		double invntrWght = invntrInfo.getInvntrWght() - gdsInvntrVO.getTrnsfWght();
		gdsInvntrVO.setInvntrQntt(invntrQntt);
		gdsInvntrVO.setInvntrWght(invntrWght);
		int trnsfQntt = invntrInfo.getTrnsfQntt() + gdsInvntrVO.getTrnsfQntt();
		double trnsfWght = invntrInfo.getTrnsfWght() + gdsInvntrVO.getTrnsfWght();
		gdsInvntrVO.setTrnsfQntt(trnsfQntt);
		gdsInvntrVO.setTrnsfWght(trnsfWght);

		// 상품 재고변경 이력 등록 (이송)
		gdsInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_T1);
		HashMap<String, Object> rtnObj = insertGdsInvntrChgHstry(gdsInvntrVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		gdsInvntrMapper.updateInvntrTrnsf(gdsInvntrVO);

		return null;
	}

	@Override
	public List<GdsInvntrVO> selectDailyGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception {

		List<GdsInvntrVO> resultList = gdsInvntrMapper.selectDailyGdsInvntrList(gdsInvntrVO);

		return resultList;
	}

	@Override
	public List<GdsInvntrVO> selectDailyGdsInvntrTotalList(GdsInvntrVO gdsInvntrVO) throws Exception {

		List<GdsInvntrVO> resultList = gdsInvntrMapper.selectDailyGdsInvntrTotalList(gdsInvntrVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertGdsInvntrChgHstry(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO invntrInfo = selectGdsInvntr(gdsInvntrVO);

		if (invntrInfo == null
				|| !StringUtils.hasText(invntrInfo.getPckgno())
				|| !ComConstants.CON_NONE.equals(invntrInfo.getDelYn())
				) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품재고정보");
		}

		GdsInvntrVO chgHstryVO = new GdsInvntrVO();
		BeanUtils.copyProperties(gdsInvntrVO, chgHstryVO);
		chgHstryVO.setChgBfrQntt(invntrInfo.getInvntrQntt());
		chgHstryVO.setChgBfrWght(invntrInfo.getInvntrWght());
		chgHstryVO.setChgAftrQntt(gdsInvntrVO.getInvntrQntt());
		chgHstryVO.setChgAftrWght(gdsInvntrVO.getInvntrWght());
		chgHstryVO.setChgRsn(gdsInvntrVO.getRmrk());

		if (!StringUtils.hasText(gdsInvntrVO.getWarehouseSeCd())
				|| gdsInvntrVO.getWarehouseSeCd().equals(invntrInfo.getWarehouseSeCd())) {
			chgHstryVO.setWarehouseSeCd(ComConstants.CON_BLANK);
		}

		gdsInvntrMapper.insertGdsInvntrChgHstry(chgHstryVO);

		return null;
	}

	@Override
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmncRtn(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO invntrInfo = selectGdsInvntr(gdsInvntrVO);

		if (invntrInfo == null
				|| !StringUtils.hasText(invntrInfo.getPckgno())
				|| !ComConstants.CON_NONE.equals(invntrInfo.getDelYn())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품재고정보");
		}

		if (gdsInvntrVO.getRtnGdsWght() > invntrInfo.getSpmtWght()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "출하량||반품량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() + gdsInvntrVO.getRtnGdsQntt();
		double invntrWght = invntrInfo.getInvntrWght() + gdsInvntrVO.getRtnGdsWght();
		gdsInvntrVO.setInvntrQntt(invntrQntt);
		gdsInvntrVO.setInvntrWght(invntrWght);

		// 상품 재고변경 이력 등록 (반품등록)
		gdsInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_R1);
		HashMap<String, Object> rtnObj = insertGdsInvntrChgHstry(gdsInvntrVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		gdsInvntrMapper.updateGdsInvntrSpmtPrfmncRtn(gdsInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmncRtnCncl(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO invntrInfo = selectGdsInvntr(gdsInvntrVO);

		if (invntrInfo == null
				|| !StringUtils.hasText(invntrInfo.getPckgno())
				|| !ComConstants.CON_NONE.equals(invntrInfo.getDelYn())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품재고");
		}

		if (gdsInvntrVO.getSpmtWght() > invntrInfo.getInvntrWght()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||출하량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 반품량
		int rtnGdsQntt = invntrInfo.getRtnGdsQntt() - gdsInvntrVO.getRtnGdsQntt();
		double rtnGdsWght = invntrInfo.getRtnGdsWght() - gdsInvntrVO.getRtnGdsWght();
		gdsInvntrVO.setRtnGdsQntt(rtnGdsQntt);
		gdsInvntrVO.setRtnGdsWght(rtnGdsWght);

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() - gdsInvntrVO.getRtnGdsQntt();
		double invntrWght = invntrInfo.getInvntrWght() - gdsInvntrVO.getRtnGdsWght();
		gdsInvntrVO.setInvntrQntt(invntrQntt);
		gdsInvntrVO.setInvntrWght(invntrWght);

		// 상품 재고변경 이력 등록 (반품취소)
		gdsInvntrVO.setChgRsnCd(AmConstants.CON_INVNTR_CHG_RSN_CD_R2);
		HashMap<String, Object> rtnObj = insertGdsInvntrChgHstry(gdsInvntrVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		gdsInvntrMapper.updateGdsInvntrSpmtPrfmncRtn(gdsInvntrVO);

		return null;
	}

	@Override
	public List<SpmtDsctnTotVO> selectGdsDsctn(SpmtDsctnTotVO spmtDsctnTotVO) throws Exception {
		List<SpmtDsctnTotVO> resultList = gdsInvntrMapper.selectGdsDsctn(spmtDsctnTotVO);
		return resultList;
	}

	@Override
	public List<GdsInvntrVO> selectSortGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception {
		return gdsInvntrMapper.selectSortGdsInvntrList(gdsInvntrVO);
	}


}
