package com.at.apcss.am.spmt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import com.at.apcss.am.invntr.mapper.GdsInvntrMapper;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.pckg.service.PckgPrfmncService;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.am.cmns.service.CmnsGdsService;
import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.CmnsVrtyService;
import com.at.apcss.am.cmns.service.PrdcrService;
import com.at.apcss.am.cmns.service.SpmtPckgUnitService;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
import com.at.apcss.am.cmns.vo.CmnsVrtyVO;
import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.service.PltWrhsSpmtService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;
import com.at.apcss.am.sls.service.SlsPrfmncService;
import com.at.apcss.am.sls.vo.SlsPrfmncVO;
import com.at.apcss.am.spmt.mapper.SpmtPrfmncMapper;
import com.at.apcss.am.spmt.service.SpmtPrfmncService;
import com.at.apcss.am.spmt.vo.SpmtDsctnTotVO;
import com.at.apcss.am.spmt.vo.SpmtGdsVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncComVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : SpmtPrfmncServiceImpl.java
 * @Description : 출고실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("spmtPrfmncService")
public class SpmtPrfmncServiceImpl extends BaseServiceImpl implements SpmtPrfmncService {

	@Autowired
	private SpmtPrfmncMapper spmtPrfmncMapper;

	@Autowired
	private GdsInvntrMapper gdsInvntrMapper;

	// 재고서비스
	@Resource(name= "gdsInvntrService")
	private GdsInvntrService gdsInvntrService;

	// 번호발급 서비스
	@Resource(name= "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	// 매출확정확인 서비스
	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	// 팔레트 서비스
	@Resource(name = "pltWrhsSpmtService")
	private PltWrhsSpmtService pltWrhsSpmtService;

	// 출하포장단위 서비스
	@Resource(name = "spmtPckgUnitService")
	private SpmtPckgUnitService spmtPckgUnitService;

	// 상품코드 서비스
	@Resource(name = "cmnsGdsService")
	private CmnsGdsService cmnsGdsService;

	// 매출실적조회
	@Resource(name = "slsPrfmncService")
	private SlsPrfmncService slsPrfmncService;

	// 매출실적조회
	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;

	// 생산자정보 서비스
	@Resource(name= "prdcrService")
	private PrdcrService prdcrService;
	
	// 품종정보 서비스
	@Resource(name= "cmnsVrtyService")
	private CmnsVrtyService cmnsVrtyService;

	//선별서비스
	@Resource(name= "sortInvntrService")
	private SortInvntrService sortInvntrService;

	//포장서비스
	@Resource(name= "pckgPrfmncService")
	private PckgPrfmncService pckgPrfmncService;
	
	@Override
	public SpmtPrfmncVO selectSpmtPrfmnc(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		SpmtPrfmncVO resultVO = spmtPrfmncMapper.selectSpmtPrfmnc(spmtPrfmncVO);

		return resultVO;
	}

	@Override
	public List<SpmtPrfmncVO> selectSpmtPrfmncList(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		List<SpmtPrfmncVO> resultList = spmtPrfmncMapper.selectSpmtPrfmncList(spmtPrfmncVO);

		return resultList;
	}

	@Override
	public List<SpmtPrfmncVO> selectSpmtPrfmncTotalList(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		List<SpmtPrfmncVO> resultList = spmtPrfmncMapper.selectSpmtPrfmncTotalList(spmtPrfmncVO);

		return resultList;
	}

	@Override
	public List<SpmtDsctnTotVO> selectSpmtPrfmncDsctnList(SpmtDsctnTotVO spmtDsctnTotVO) throws Exception {

		List<SpmtDsctnTotVO> resultList = spmtPrfmncMapper.selectSpmtPrfmncDsctnList(spmtDsctnTotVO);

		return resultList;
	}

	@Override
	public int insertSpmtPrfmncCom(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int insertedCnt = spmtPrfmncMapper.insertSpmtPrfmncCom(spmtPrfmncVO);

		return insertedCnt;
	}

	@Override
	public int updateSpmtPrfmncCom(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int updatedCnt = spmtPrfmncMapper.updateSpmtPrfmncCom(spmtPrfmncVO);

		return updatedCnt;
	}

	@Override
	public int deleteSpmtPrfmncCom(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int deletedCnt = spmtPrfmncMapper.deleteSpmtPrfmncCom(spmtPrfmncVO);

		return deletedCnt;
	}

	@Override
	public int insertSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int insertedCnt = spmtPrfmncMapper.insertSpmtPrfmncDtl(spmtPrfmncVO);

		return insertedCnt;
	}

	@Override
	public int updateSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int updatedCnt = spmtPrfmncMapper.updateSpmtPrfmncDtl(spmtPrfmncVO);

		return updatedCnt;
	}

	@Override
	public int deleteSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		int deletedCnt = spmtPrfmncMapper.deleteSpmtPrfmncDtl(spmtPrfmncVO);

		return deletedCnt;
	}


	@Override
	public HashMap<String, Object> insertSpmtPrfmncByGrd(SpmtPrfmncComVO spmtPrfmncComVO) throws Exception {

		HashMap<String, Object> rtnObj;

		String apcCd = spmtPrfmncComVO.getApcCd();
		String spmtYmd = spmtPrfmncComVO.getSpmtYmd();

		List<SpmtPrfmncVO> spmtPrfmncList = spmtPrfmncComVO.getSpmtPrfmncList();

		if (spmtPrfmncList == null || spmtPrfmncList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하대상");
		}

		List<String> gdsList = new ArrayList<>();

		List<GdsInvntrVO> invntrList = new ArrayList<>();

		// 상품재고 배분
		labelLoopSpmt:
		for ( SpmtPrfmncVO spmt : spmtPrfmncList ) {

			int spmtQntt = spmt.getSpmtQntt();
			//double spmtWght = spmt.getSpmtWght();

			// 품목
			String itemCd = ComUtil.nullToEmpty(spmt.getItemCd());
			// 품종
			String vrtyCd = ComUtil.nullToEmpty(spmt.getVrtyCd());
			// 규격
			String spcfctCd = ComUtil.nullToEmpty(spmt.getSpcfctCd());
			// 등급
			String gdsGrd = ComUtil.nullToEmpty(spmt.getGdsGrd());
			// 상품
			String spmtPckgUnitCd = ComUtil.nullToEmpty(spmt.getSpmtPckgUnitCd());
			// 생산자
			String prdcrCd = ComUtil.nullToEmpty(spmt.getPrdcrCd());
			// 창고
			String warehouseSeCd = ComUtil.nullToEmpty(spmt.getWarehouseSeCd());

			SpmtPckgUnitVO pckgUnitParam = new SpmtPckgUnitVO();
			pckgUnitParam.setApcCd(apcCd);
			pckgUnitParam.setSpmtPckgUnitCd(spmtPckgUnitCd);
			// 출하포장단위로 스펙 조회
			SpmtPckgUnitVO spmtPckgUnitVO = spmtPckgUnitService.selectSpmtPckgUnit(pckgUnitParam);

			if (spmtPckgUnitVO == null || !StringUtils.hasText(spmtPckgUnitVO.getSpmtPckgUnitCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품조회결과");
			}

			double spcfctWght = spmtPckgUnitVO.getSpcfctWght();

			for ( GdsInvntrVO orgnInv : invntrList ) {

				int invRmnQntt = orgnInv.getRmnQntt();
				double invRmnWght = orgnInv.getRmnWght();

				if (invRmnQntt <= 0) {
					continue;
				}

				if (
						itemCd.equals(orgnInv.getItemCd())
						&& vrtyCd.equals(orgnInv.getVrtyCd())
						&& spcfctCd.equals(orgnInv.getSpcfctCd())
						&& gdsGrd.equals(orgnInv.getGdsGrd())
						&& spmtPckgUnitCd.equals(orgnInv.getSpmtPckgUnitCd())
						&& (!StringUtils.hasText(prdcrCd) || prdcrCd.equals(orgnInv.getRprsPrdcrCd()))
						&& (!StringUtils.hasText(warehouseSeCd) || warehouseSeCd.equals(orgnInv.getWarehouseSeCd()))) {

					int qntt = 0;

					if (spmtQntt > invRmnQntt) {
						qntt = invRmnQntt;
					} else {
						qntt = spmtQntt;

					}

					double wght = ComUtil.round(invRmnQntt * spcfctWght);

					if (wght > invRmnWght) {
						wght = invRmnWght;
					}
					spmtQntt -= qntt;
					invRmnQntt -= qntt;
					invRmnWght -= wght;

					orgnInv.setRmnQntt(invRmnQntt);
					orgnInv.setRmnWght(invRmnWght);

					orgnInv.setSpmtQntt(orgnInv.getSpmtQntt() + qntt);
					orgnInv.setSpmtWght(orgnInv.getSpmtWght() + wght);

					if (spmtQntt <= 0) {
						continue labelLoopSpmt;
					}
				}
			}

			if (spmtQntt > 0) {

				// 재고 조회 및 배분
				GdsInvntrVO param = new GdsInvntrVO();
				param.setApcCd(apcCd);
				param.setPckgYmdTo(spmtYmd);
				param.setItemCd(itemCd);
				param.setVrtyCd(vrtyCd);
				param.setSpcfctCd(spcfctCd);
				param.setGdsGrd(gdsGrd);
				param.setSpmtPckgUnitCd(spmtPckgUnitCd);
				param.setRprsPrdcrCd(prdcrCd);
				param.setWarehouseSeCd(warehouseSeCd);

				List<GdsInvntrVO> invntrListForSpmt = gdsInvntrService.selectSpmtGdsInvntrList(param);

				if (invntrListForSpmt == null || invntrListForSpmt.isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하가능재고");
				}

				for ( GdsInvntrVO invntr : invntrListForSpmt ) {

					String gdsKey = invntr.getPckgno() + ComUtil.toString(invntr.getPckgSn());
					if (gdsList.contains(gdsKey)) {
						continue;
					}

					int invRmnQntt = invntr.getInvntrQntt();
					double invRmnWght = invntr.getInvntrWght();

					if (invRmnQntt <= 0) {
						continue;
					}

					GdsInvntrVO gdsInv = new GdsInvntrVO();
					BeanUtils.copyProperties(spmtPrfmncComVO, gdsInv);
					BeanUtils.copyProperties(invntr, gdsInv,
							ComConstants.PROP_SYS_FRST_INPT_DT,
							ComConstants.PROP_SYS_FRST_INPT_USER_ID,
							ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
							ComConstants.PROP_SYS_LAST_CHG_DT,
							ComConstants.PROP_SYS_LAST_CHG_USER_ID,
							ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

					gdsInv.setSpmtQntt(0);
					gdsInv.setSpmtWght(0);

					int qntt = 0;
					double wght = 0;

					if (spmtQntt > invRmnQntt) {
						qntt = invRmnQntt;
					} else {
						qntt = spmtQntt;
					}

					wght = ComUtil.round(qntt * spcfctWght);
					if (wght > invRmnWght) {
						wght = invRmnWght;
					}

					spmtQntt -= qntt;
					invRmnQntt -= qntt;
					invRmnWght -= wght;

					gdsInv.setSpmtQntt(qntt);
					gdsInv.setSpmtWght(wght);
					gdsInv.setRmnQntt(invRmnQntt);
					gdsInv.setRmnWght(invRmnWght);

					invntrList.add(gdsInv);
					gdsList.add(gdsKey);

					if (spmtQntt <= 0) {
						continue labelLoopSpmt;
					}
				}
			}

			// 재고 부족
			if (spmtQntt > 0) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하가능재고");
			}
		}


		String spmtno = cmnsTaskNoService.selectSpmtno(apcCd, spmtYmd);
		spmtPrfmncComVO.setSpmtno(spmtno);

		// 출하공통
		SpmtPrfmncVO spmtCom = new SpmtPrfmncVO();
		BeanUtils.copyProperties(spmtPrfmncComVO, spmtCom);
		spmtPrfmncMapper.insertSpmtPrfmncCom(spmtCom);

		// 출하상세
		for ( GdsInvntrVO gds : invntrList ) {
			SpmtPrfmncVO spmtDtl = new SpmtPrfmncVO();
			BeanUtils.copyProperties(gds, spmtDtl);
			spmtDtl.setSpmtno(spmtno);
			spmtDtl.setPrdcrCd(gds.getRprsPrdcrCd());

			// 재고변경
			rtnObj = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(gds);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 출하상세
			spmtPrfmncMapper.insertSpmtPrfmncDtl(spmtDtl);
		}

		// 팔레트 불출
		if (spmtCom.getBssInvntrQntt() > 0) {
			PltWrhsSpmtVO pltWrhsSpmtVO = new PltWrhsSpmtVO();
			pltWrhsSpmtVO.setSysFrstInptPrgrmId(spmtCom.getSysFrstInptPrgrmId());
			pltWrhsSpmtVO.setSysFrstInptUserId(spmtCom.getSysFrstInptUserId());
			pltWrhsSpmtVO.setSysLastChgPrgrmId(spmtCom.getSysLastChgPrgrmId());
			pltWrhsSpmtVO.setSysLastChgUserId(spmtCom.getSysLastChgUserId());
			pltWrhsSpmtVO.setApcCd(apcCd);
			pltWrhsSpmtVO.setQntt(spmtCom.getBssInvntrQntt());
			pltWrhsSpmtVO.setWrhsSpmtSeCd(AmConstants.CON_WRHS_SPMT_SE_CD_SPMT);
			pltWrhsSpmtVO.setPltBxCd(spmtCom.getPltBxCd());
			pltWrhsSpmtVO.setPltBxSeCd(AmConstants.CON_PLT_BX_SE_CD_PLT);
			pltWrhsSpmtVO.setJobYmd(spmtCom.getSpmtYmd());
			pltWrhsSpmtVO.setPrcsNo(spmtno);
			pltWrhsSpmtVO.setWrhsSpmtType(AmConstants.CON_WRHS_SPMT_TYPE_SPMT);

			rtnObj = pltWrhsSpmtService.insertPltWrhsSpmt(pltWrhsSpmtVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertSpmtPrfmncCallByPckgList(SpmtPrfmncComVO spmtPrfmncComVO) throws Exception {
		
		HashMap<String, Object> rtnObj = insertSpmtPrfmncByPckgList(spmtPrfmncComVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		
		return null;
	}
	
	@Override
	public HashMap<String, Object> insertSpmtPrfmncByPckgList(SpmtPrfmncComVO spmtPrfmncComVO) throws Exception {
		HashMap<String, Object> rtnObj;

		String apcCd = spmtPrfmncComVO.getApcCd();
		String spmtYmd = spmtPrfmncComVO.getSpmtYmd();

		//공통 VO 필수값
		String sysFrstInptUserId = spmtPrfmncComVO.getSysFrstInptPrgrmId();
		String sysFrstInptPrgrmId = spmtPrfmncComVO.getSysFrstInptPrgrmId();
		String sysLastChgUserId = spmtPrfmncComVO.getSysLastChgUserId();
		String sysLastChgPrgrmId = spmtPrfmncComVO.getSysLastChgPrgrmId();

		List<SpmtPrfmncVO> spmtPrfmncList = spmtPrfmncComVO.getSpmtPrfmncList();

		if (spmtPrfmncList == null || spmtPrfmncList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하대상");
		}

		String invntrSttsCd = spmtPrfmncComVO.getInvntrSttsCd();
		boolean needsIgnoreInvntrQntt = AmConstants.CON_INVNTR_STTS_CD_CHNG_SPMT.equals(invntrSttsCd);

		// 출하강제처리 여부 : 마이너스 재고생성하여 출하
		boolean allowsFrcdPrcs = ComConstants.CON_YES.equals(spmtPrfmncComVO.getSpmtFrcdPrcsYn());
		
		List<GdsInvntrVO> invntrList = new ArrayList<>();

		// 상품재고 조회 임시 List (동일 제품 skip 용)
		List<GdsInvntrVO> gdsTempList = new ArrayList<>();
		
		
		String newSortno = ComConstants.CON_BLANK;
		String newPckgno = ComConstants.CON_BLANK;
		int newSortSn = 0;
		int newPckgSn = 0;
		
		if (needsIgnoreInvntrQntt || allowsFrcdPrcs) {
			newSortno = cmnsTaskNoService.selectSortno(apcCd, spmtYmd);
			newPckgno = cmnsTaskNoService.selectPckgno(apcCd, spmtYmd);
		}
		
		// 상품재고 배분
		
		for ( SpmtPrfmncVO spmt : spmtPrfmncList ) {

			int spmtQntt = spmt.getSpmtQntt();
			if (spmtQntt <= 0) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하수량");
			}

			String itemCd = ComUtil.nullToEmpty(spmt.getItemCd());
			String vrtyCd = ComUtil.nullToEmpty(spmt.getVrtyCd());
			String spcfctCd = ComUtil.nullToEmpty(spmt.getSpcfctCd());

			String gdsGrd = ComUtil.nullToEmpty(spmt.getSortGrdCd());
			String gdsCd = ComUtil.nullToEmpty(spmt.getGdsCd());
			String sortGrdCd = ComUtil.nullToEmpty(spmt.getSortGrdCd());
			String prdcrIdentno = ComUtil.nullToEmpty(spmt.getPrdcrIdentno());

			String spmtPckgUnitCd = ComUtil.nullToEmpty(spmt.getSpmtPckgUnitCd());
			String aftrGrdCd = ComUtil.nullToEmpty(spmt.getAftrGrdCd());
			double spmtWght = 0;

			SpmtPckgUnitVO pckgUnitParam = new SpmtPckgUnitVO();
			pckgUnitParam.setApcCd(apcCd);
			pckgUnitParam.setSpmtPckgUnitCd(spmtPckgUnitCd);
			
			// 출하포장단위로 스펙 조회
			SpmtPckgUnitVO spmtPckgUnitVO = spmtPckgUnitService.selectSpmtPckgUnit(pckgUnitParam);
			double spcfctWght = 0;

			if (spmtPckgUnitVO == null || !StringUtils.hasText(spmtPckgUnitVO.getSpmtPckgUnitCd())) {
				if (!allowsFrcdPrcs) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품조회결과");
				}
			}else{
				spcfctWght = spmtPckgUnitVO.getSpcfctWght();
			}

			String pckgno = spmt.getPckgno();
			int pckgSn = spmt.getPckgSn();
			String rmrk = spmt.getRmrk();

			List<SpmtGdsVO> spmtGdsList = spmt.getSpmtGdsList();
			int spmtSn = spmt.getSpmtSn();
			/** 마이너스재고,선출하,정상건 분기점 **/
			if (StringUtils.hasText(pckgno) && pckgSn > 0) {
				GdsInvntrVO gdsVO = new GdsInvntrVO();
				gdsVO.setApcCd(apcCd);
				gdsVO.setPckgno(pckgno);
				gdsVO.setPckgSn(pckgSn);

				GdsInvntrVO orgnInv = gdsInvntrService.selectGdsInvntr(gdsVO);

				if (orgnInv == null
						|| ComConstants.CON_YES.equals(orgnInv.getDelYn())
						|| orgnInv.getInvntrQntt() < 0) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품재고");
				}

				if (!needsIgnoreInvntrQntt && orgnInv.getInvntrQntt() < spmtQntt) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하가능재고");
				}

				if (!spmtPckgUnitCd.equals(orgnInv.getSpmtPckgUnitCd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "출하상품||재고상품");
				}

				GdsInvntrVO gdsInv = new GdsInvntrVO();
				BeanUtils.copyProperties(spmtPrfmncComVO, gdsInv);
				BeanUtils.copyProperties(orgnInv, gdsInv,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

				int invRmnQntt = orgnInv.getInvntrQntt();
				double invRmnWght = orgnInv.getInvntrWght();

				int qntt = 0;
				double wght = 0;

				if (invRmnQntt > spmtQntt) {
					qntt = spmtQntt;
				} else {
					qntt = invRmnQntt;
				}

				if (needsIgnoreInvntrQntt && qntt < spmtQntt) {
					qntt = spmtQntt;
					gdsInv.setInvntrSttsCd(invntrSttsCd);
				}

				wght = ComUtil.round(qntt * spcfctWght, 3);
				
				spmtQntt -= qntt;

				if (wght > invRmnWght) {	// && !needsIgnoreInvntrQntt) {
					wght = invRmnWght;
				}

				gdsInv.setSpmtQntt(qntt);
				gdsInv.setSpmtWght(wght);

				invntrList.add(gdsInv);

			} else if (spmtGdsList != null && !spmtGdsList.isEmpty()) {

				GdsInvntrVO gdsVO = new GdsInvntrVO();
				gdsVO.setApcCd(apcCd);
				gdsVO.setSpmtGdsList(spmtGdsList);

				List<GdsInvntrVO> gdsInvntrList = gdsInvntrService.selectSpmtGdsInvntrListByPckgno(gdsVO);

				if (gdsInvntrList.isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하가능재고");
				}

				int idx = -1;
				for ( GdsInvntrVO orgnInv : gdsInvntrList ) {

					idx++;
					boolean isLastIndex = idx == gdsInvntrList.size() - 1;
					
					if (spmtQntt <= 0) {
						break;
					}

					if (!spmtPckgUnitCd.equals(orgnInv.getSpmtPckgUnitCd())) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "출하상품||재고상품");
					}

					vrtyCd = orgnInv.getVrtyCd();
					spcfctCd = orgnInv.getSpcfctCd();
					
					int invRmnQntt = orgnInv.getInvntrQntt();
					double invRmnWght = orgnInv.getInvntrWght();

					String gdsPckgno = ComUtil.nullToEmpty(orgnInv.getPckgno());
					int gdsPckgSn = orgnInv.getPckgSn();
					
					GdsInvntrVO gdsTempVO = null;
					
					// 상품임시테이블에서 찾기
					for ( GdsInvntrVO gdsTemp : gdsTempList ) {
						if (gdsPckgno.equals(gdsTemp.getPckgno()) && gdsPckgSn == gdsTemp.getPckgSn()) {
							invRmnQntt = gdsTemp.getRmnQntt();
							invRmnWght = gdsTemp.getRmnWght();
							
							logger.debug("@@@@chk invRmnQntt {}", invRmnQntt);
							
							gdsTempVO = gdsTemp;
						}
					}
					
					boolean needsTempAdd = false;
					
					if (gdsTempVO == null) {
						gdsTempVO = new GdsInvntrVO();
						BeanUtils.copyProperties(orgnInv, gdsTempVO);
						
						needsTempAdd = true;
					}
					
					logger.debug("@@@@normal invRmnQntt {}", invRmnQntt);
					
					// 출하변경 시 마지막에 남은 잔량 처리
					if (invRmnQntt <= 0 && !isLastIndex) {
						continue;
					}
//					if (!needsIgnoreInvntrQntt && !allowsFrcdPrcs && invRmnQntt <= 0) {
//						continue;
//					}
					if (!needsIgnoreInvntrQntt && invRmnQntt <= 0) {
						continue;
					}
					GdsInvntrVO gdsInv = new GdsInvntrVO();
					BeanUtils.copyProperties(spmtPrfmncComVO, gdsInv);
					BeanUtils.copyProperties(orgnInv, gdsInv,
							ComConstants.PROP_SYS_FRST_INPT_DT,
							ComConstants.PROP_SYS_FRST_INPT_USER_ID,
							ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
							ComConstants.PROP_SYS_LAST_CHG_DT,
							ComConstants.PROP_SYS_LAST_CHG_USER_ID,
							ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

					int qntt = 0;
					double wght = 0;

					if (invRmnQntt > spmtQntt) {
						qntt = spmtQntt;
					} else {
						qntt = invRmnQntt;
					}

					// 출하변경 시 마지막에 남은 잔량 처리
					if (needsIgnoreInvntrQntt && isLastIndex && qntt < spmtQntt) {
						qntt = spmtQntt;
						gdsInv.setInvntrSttsCd(invntrSttsCd);
					}

					wght = ComUtil.round(qntt * spcfctWght, 3);
					spmtQntt -= qntt;

//					   출하강제처리 잔량이 남을 경우
//					if (allowsFrcdPrcs && isLastIndex && spmtQntt > 0) {
//						qntt += spmtQntt;
//						wght = ComUtil.round(qntt * spcfctWght, 3);
//						spmtQntt = 0;
//
//						gdsInv.setInvntrSttsCd(AmConstants.CON_INVNTR_STTS_CD_SPMT_BELOW_ZERO);
//
//					} else {
//					}
						if (wght > invRmnWght) {	//  && !needsIgnoreInvntrQntt && isLastIndex) {
							wght = invRmnWght;
						}

					gdsInv.setSpmtQntt(qntt);
					gdsInv.setSpmtWght(wght);
					gdsInv.setRmrk(rmrk);
					gdsInv.setSpmtSn(spmtSn);

					invntrList.add(gdsInv);

					gdsTempVO.setRmnQntt(invRmnQntt - qntt);
					gdsTempVO.setRmnWght(invRmnQntt - wght);

					if (needsTempAdd) {
						gdsTempList.add(gdsTempVO);
					}
				}

			} else {
				//
			}

			// 재고 부족
			if (spmtQntt > 0) {

				if (allowsFrcdPrcs) {

					if (!StringUtils.hasText(itemCd)) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품목");
					}

					if (!StringUtils.hasText(spcfctCd)) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "규격");
					}

					if (!StringUtils.hasText(gdsGrd)) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품등급");
					}

					if (!StringUtils.hasText(sortGrdCd)) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별등급");
					}
					//순번 ++
					newSortSn++;
					newPckgSn++;


					if (!StringUtils.hasText(vrtyCd)) {
						// 품종코드 찾기
						CmnsVrtyVO vrtyParam = new CmnsVrtyVO();
						vrtyParam.setApcCd(apcCd);
						vrtyParam.setItemCd(itemCd);
						List<CmnsVrtyVO> vrtyList = cmnsVrtyService.selectApcVrtyList(vrtyParam);

						if (vrtyList == null || vrtyList.isEmpty()) {
							return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품종정보");
						}
						if (vrtyList.size() > 1) {
							return ComUtil.getResultMap(ComConstants.MSGCD_TGT_EQUAL_GREATER_THAN, "품종||두개");
						}

						vrtyCd = vrtyList.get(0).getVrtyCd();
					}

					String prdcrCd = ComConstants.CON_BLANK;

					if (StringUtils.hasText(prdcrIdentno) && !prdcrIdentno.equals("X")) {
						PrdcrVO prdcrParam = new PrdcrVO();
						prdcrParam.setApcCd(apcCd);
						prdcrParam.setIdentno(prdcrIdentno);
						PrdcrVO prdcrVO = prdcrService.selectPrdcrByIdentno(prdcrParam);

						if (prdcrVO != null && StringUtils.hasText(prdcrVO.getPrdcrCd())) {
							prdcrCd = prdcrVO.getPrdcrCd();
						} else {
							return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "생산자정보");
						}
					}

					if (!StringUtils.hasText(spmtPckgUnitCd)) {

						SpmtPckgUnitVO spmtPckgUnitParam = new SpmtPckgUnitVO();
						spmtPckgUnitParam.setApcCd(apcCd);
						spmtPckgUnitParam.setItemCd(itemCd);
						spmtPckgUnitParam.setVrtyCd(vrtyCd);
						spmtPckgUnitParam.setSpcfctCd(spcfctCd);
						spmtPckgUnitParam.setGdsGrd(sortGrdCd);

						List<SpmtPckgUnitVO> specList = spmtPckgUnitService.selectSpmtPckgUnitListBySpec(spmtPckgUnitParam);
						if (specList == null || specList.isEmpty()) {
							return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품정보");
						}

						spmtPckgUnitCd = specList.get(0).getSpmtPckgUnitCd();
						spcfctWght = specList.get(0).getSpcfctWght();
						//중량 계산
						spmtWght = spmtQntt * spcfctWght;

						gdsCd = ComConstants.CON_BLANK;
						//gdsCd
						if (!StringUtils.hasText(gdsCd) && StringUtils.hasText(spmtPckgUnitCd)){
							CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
							BeanUtils.copyProperties(spmtPckgUnitParam, cmnsGdsVO);
							cmnsGdsVO.setSpmtPckgUnitCd(spmtPckgUnitCd);

							rtnObj = cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
							if(rtnObj != null){
								throw new EgovBizException(getMessageForMap(rtnObj));
							}
							if (!StringUtils.hasText(cmnsGdsVO.getNewGdsCd())) {
								throw new EgovBizException(
										getMessageForMap(ComUtil.getResultMap("E0003", "상품코드 발번"))
								);
							}
							gdsCd = cmnsGdsVO.getNewGdsCd();
						}


						// 선별재고 생성
						//SortInvntrService
						// 0재고 생성하여 상태코드 지정
						// 번호, 순번
						SortInvntrVO sortInvntrVO = new SortInvntrVO();
						sortInvntrVO.setApcCd(apcCd);
						sortInvntrVO.setSortno(newSortno);
						sortInvntrVO.setSortSn(newSortSn);
						sortInvntrVO.setGrdCd(sortGrdCd);
						sortInvntrVO.setInptYmd(spmtYmd);
						sortInvntrVO.setRprsPrdcrCd(prdcrCd);
						sortInvntrVO.setItemCd(itemCd);
						sortInvntrVO.setVrtyCd(vrtyCd);
						sortInvntrVO.setSpcfctCd(spcfctCd);
						sortInvntrVO.setGdsSeCd(AmConstants.CON_GDS_SE_CD_DEFAULT); //1
						sortInvntrVO.setWrhsSeCd(AmConstants.CON_WRHS_SE_CD_DEFAULT); //3
						sortInvntrVO.setSortQntt(0);
						sortInvntrVO.setSortWght(0);
						sortInvntrVO.setPckgQntt(0);
						sortInvntrVO.setPckgWght(0);
						sortInvntrVO.setInvntrQntt(0);
						sortInvntrVO.setInvntrWght(0);
						sortInvntrVO.setRmrk(rmrk);
						sortInvntrVO.setSysFrstInptUserId(sysFrstInptUserId);
						sortInvntrVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
						sortInvntrVO.setSysLastChgUserId(sysLastChgUserId);
						sortInvntrVO.setSysLastChgPrgrmId(sysLastChgPrgrmId);
						sortInvntrVO.setInvntrSttsCd(AmConstants.CON_INVNTR_STTS_CD_SPMT_BELOW_ZERO); //D3

						HashMap<String, Object> sortResult;
						sortResult = sortInvntrService.insertSortInvntr(sortInvntrVO);
						if(sortResult != null){
							throw new EgovBizException(getMessageForMap(sortResult));
						}
						// 상품재고 생성
						// GdsInvntrService
						// 0 재고 생성하여 상태코드 지정
						// 번호, 순번
						GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
						gdsInvntrVO.setApcCd(apcCd);
						gdsInvntrVO.setPckgno(newPckgno);
						gdsInvntrVO.setPckgSn(newPckgSn);
						gdsInvntrVO.setPckgYmd(spmtYmd);
						gdsInvntrVO.setGdsSeCd(AmConstants.CON_GDS_SE_CD_DEFAULT);
						gdsInvntrVO.setWrhsSeCd(AmConstants.CON_WRHS_SE_CD_DEFAULT);
						gdsInvntrVO.setRprsPrdcrCd(prdcrCd);
						gdsInvntrVO.setItemCd(itemCd);
						gdsInvntrVO.setVrtyCd(vrtyCd);
						gdsInvntrVO.setSpcfctCd(spcfctCd);
						gdsInvntrVO.setGdsGrd(aftrGrdCd);
						gdsInvntrVO.setSpmtPckgUnitCd(spmtPckgUnitCd);
						gdsInvntrVO.setGdsCd(gdsCd);
						gdsInvntrVO.setPckgQntt(0);
						gdsInvntrVO.setPckgWght(0);
						gdsInvntrVO.setSpmtQntt(spmtQntt);
						gdsInvntrVO.setSpmtWght(spmtWght);
						gdsInvntrVO.setInvntrQntt(0);
						gdsInvntrVO.setInvntrWght(0);
						gdsInvntrVO.setPckgSortno(newSortno);
						gdsInvntrVO.setPckgSortSn(newSortSn);
						gdsInvntrVO.setSpmtSn(spmtSn);
						gdsInvntrVO.setRmrk(rmrk);
						gdsInvntrVO.setSysFrstInptUserId(sysFrstInptUserId);
						gdsInvntrVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
						gdsInvntrVO.setSysLastChgUserId(sysLastChgUserId);
						gdsInvntrVO.setSysLastChgPrgrmId(sysLastChgPrgrmId);
						HashMap<String, Object> gdsInvntrResult;
						gdsInvntrResult = gdsInvntrService.insertGdsInvntr(gdsInvntrVO);
						if(gdsInvntrResult != null){
							throw new EgovBizException(getMessageForMap(gdsInvntrResult));
						}
						gdsInvntrVO.setInvntrSttsCd(AmConstants.CON_INVNTR_STTS_CD_SPMT_BELOW_ZERO);
						invntrList.add(gdsInvntrVO);
					}
				} else {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하가능재고");
				}
			}
		}

		// 출하자 신고번호 추가
		String spmtPrsnDclrno = spmtPrfmncComVO.getSpmtPrsnDclrno();
		if (!StringUtils.hasText(spmtPrsnDclrno)) {
			ApcEvrmntStngVO apcVO = new ApcEvrmntStngVO();
			apcVO.setApcCd(apcCd);
			ApcEvrmntStngVO apcInfo = apcEvrmntStngService.selectApcEvrmntStng(apcVO);

			if (apcInfo != null) {
				spmtPrsnDclrno = apcInfo.getSpmtPrsnDclrNo();
				spmtPrfmncComVO.setSpmtPrsnDclrno(spmtPrsnDclrno);
			}
		}

		String spmtno = cmnsTaskNoService.selectSpmtno(apcCd, spmtYmd);
		spmtPrfmncComVO.setSpmtno(spmtno);

		// 출하공통
		SpmtPrfmncVO spmtCom = new SpmtPrfmncVO();
		BeanUtils.copyProperties(spmtPrfmncComVO, spmtCom);
		spmtPrfmncMapper.insertSpmtPrfmncCom(spmtCom);

		// 출하상세
		for ( GdsInvntrVO gds : invntrList ) {
			SpmtPrfmncVO spmtDtl = new SpmtPrfmncVO();
			BeanUtils.copyProperties(gds, spmtDtl);
			spmtDtl.setSpmtno(spmtno);
			spmtDtl.setPrdcrCd(gds.getRprsPrdcrCd());

			// 재고변경
			rtnObj = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(gds);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 출하상세
			spmtPrfmncMapper.insertSpmtPrfmncDtl(spmtDtl);

		}

		// 팔레트 불출
		if (spmtCom.getBssInvntrQntt() > 0) {
			PltWrhsSpmtVO pltWrhsSpmtVO = new PltWrhsSpmtVO();
			pltWrhsSpmtVO.setSysFrstInptPrgrmId(spmtCom.getSysFrstInptPrgrmId());
			pltWrhsSpmtVO.setSysFrstInptUserId(spmtCom.getSysFrstInptUserId());
			pltWrhsSpmtVO.setSysLastChgPrgrmId(spmtCom.getSysLastChgPrgrmId());
			pltWrhsSpmtVO.setSysLastChgUserId(spmtCom.getSysLastChgUserId());
			pltWrhsSpmtVO.setApcCd(apcCd);
			pltWrhsSpmtVO.setQntt(spmtCom.getBssInvntrQntt());
			pltWrhsSpmtVO.setWrhsSpmtSeCd(AmConstants.CON_WRHS_SPMT_SE_CD_SPMT);
			pltWrhsSpmtVO.setPltBxCd(spmtCom.getPltBxCd());
			pltWrhsSpmtVO.setPltBxSeCd(AmConstants.CON_PLT_BX_SE_CD_PLT);
			pltWrhsSpmtVO.setJobYmd(spmtCom.getSpmtYmd());
			pltWrhsSpmtVO.setPrcsNo(spmtno);
			pltWrhsSpmtVO.setWrhsSpmtType(AmConstants.CON_WRHS_SPMT_TYPE_SPMT);

			rtnObj = pltWrhsSpmtService.insertPltWrhsSpmt(pltWrhsSpmtVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}



	@Override
	public HashMap<String, Object> insertSpmtPrfmncTabletList(List<SpmtPrfmncVO> spmtPrfmncList) throws Exception {
		HashMap<String, Object> resultMap;

		Map<String, List<SpmtPrfmncVO>> collectList = spmtPrfmncList.stream().collect(Collectors.groupingBy(SpmtPrfmncVO::getSpmtCmndno));

		List<String> keyList = collectList.keySet().stream().collect(Collectors.toList());

		for (String key : keyList) {

			List<SpmtPrfmncVO> insertList = new ArrayList<>();
			List<SpmtPrfmncVO> valueList = collectList.get(key);

			for (SpmtPrfmncVO value : valueList) {
				insertList.add(value);
			}

			resultMap = insertSpmtPrfmncList(insertList);

			if(resultMap != null) {
				throw new EgovBizException(getMessageForMap(resultMap));
			}
		}
		return null;
	}

	@Override
	public HashMap<String, Object> insertSpmtPrfmncList(List<SpmtPrfmncVO> spmtPrfmncList) throws Exception {
		HashMap<String, Object> resultMap;

		if(ComConstants.EXCEL_YES.equals(spmtPrfmncList.get(0).getExcelYn())) {

			for (SpmtPrfmncVO spmtPrfmncVO : spmtPrfmncList) {
				String spmtno = cmnsTaskNoService.selectSpmtno(spmtPrfmncVO.getApcCd(), spmtPrfmncVO.getSpmtYmd());
				spmtPrfmncVO.setSpmtno(spmtno);

				GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
				gdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());

				gdsInvntrVO.setItemCd(spmtPrfmncVO.getItemCd());
				gdsInvntrVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
				gdsInvntrVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
				gdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
				gdsInvntrVO.setGdsSeCd(spmtPrfmncVO.getGdsSeCd());
				gdsInvntrVO.setRprsPrdcrCd(spmtPrfmncVO.getPrdcrCd());

				List<GdsInvntrVO> gdsInvntrList = gdsInvntrService.selectGdsInvntrList(gdsInvntrVO);
				if(gdsInvntrList.size() > 0) {

					if (0 == insertSpmtPrfmncCom(spmtPrfmncVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
					}

					int remainderSpmtQntt = spmtPrfmncVO.getSpmtQntt();
					Double remainderSpmtWght = spmtPrfmncVO.getSpmtWght();


					for (GdsInvntrVO gdsInvntr : gdsInvntrList) {

						if(remainderSpmtQntt == 0) {
							break;
						}

						if(remainderSpmtQntt > 0) {

							if(gdsInvntr.getInvntrQntt() - remainderSpmtQntt >= 0) {

								spmtPrfmncVO.setPckgno(gdsInvntr.getPckgno());
								spmtPrfmncVO.setPckgSn(gdsInvntr.getPckgSn());
								spmtPrfmncVO.setBrndNm(gdsInvntr.getBrndNm());

								spmtPrfmncVO.setSpmtQntt(remainderSpmtQntt);
								spmtPrfmncVO.setSpmtWght(remainderSpmtWght);

								if(!StringUtils.hasText(spmtPrfmncVO.getGdsCd())) {
									CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
									cmnsGdsVO.setApcCd(spmtPrfmncVO.getApcCd());
									cmnsGdsVO.setItemCd(spmtPrfmncVO.getItemCd());
									cmnsGdsVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
									cmnsGdsVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
									cmnsGdsVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
									cmnsGdsVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
									cmnsGdsVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

									cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
									spmtPrfmncVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
									spmtPrfmncVO.setBrndNm(cmnsGdsVO.getBrndNm());
								}

								if (0 == insertSpmtPrfmncDtl(spmtPrfmncVO)) {
									throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
								}

								GdsInvntrVO updateGdsInvntrVO = new GdsInvntrVO();
								updateGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
								updateGdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
								updateGdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
								updateGdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());
								updateGdsInvntrVO.setSpmtWght(spmtPrfmncVO.getSpmtWght());
								updateGdsInvntrVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
								updateGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
								updateGdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
								updateGdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

								resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(updateGdsInvntrVO);

								if (resultMap != null) {
									throw new EgovBizException(getMessageForMap(resultMap));
								}
								remainderSpmtQntt = remainderSpmtQntt - spmtPrfmncVO.getSpmtQntt();
								remainderSpmtWght = remainderSpmtWght - spmtPrfmncVO.getSpmtWght();

							} else {

								spmtPrfmncVO.setPckgno(gdsInvntr.getPckgno());
								spmtPrfmncVO.setPckgSn(gdsInvntr.getPckgSn());
								spmtPrfmncVO.setBrndNm(gdsInvntr.getBrndNm());

								spmtPrfmncVO.setSpmtQntt(gdsInvntr.getInvntrQntt());
								spmtPrfmncVO.setSpmtWght(gdsInvntr.getInvntrWght());

								if(!StringUtils.hasText(spmtPrfmncVO.getGdsCd())) {
									CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
									cmnsGdsVO.setApcCd(spmtPrfmncVO.getApcCd());
									cmnsGdsVO.setItemCd(spmtPrfmncVO.getItemCd());
									cmnsGdsVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
									cmnsGdsVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
									cmnsGdsVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
									cmnsGdsVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
									cmnsGdsVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

									cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
									spmtPrfmncVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
									spmtPrfmncVO.setBrndNm(cmnsGdsVO.getBrndNm());
								}

								if (0 == insertSpmtPrfmncDtl(spmtPrfmncVO)) {
									throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
								}

								GdsInvntrVO updateGdsInvntrVO = new GdsInvntrVO();
								updateGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
								updateGdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
								updateGdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
								updateGdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());
								updateGdsInvntrVO.setSpmtWght(spmtPrfmncVO.getSpmtWght());
								updateGdsInvntrVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
								updateGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
								updateGdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
								updateGdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());
								resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(updateGdsInvntrVO);

								if(resultMap != null) {
									throw new EgovBizException(getMessageForMap(resultMap));
								}

								remainderSpmtQntt = remainderSpmtQntt - spmtPrfmncVO.getSpmtQntt();
								remainderSpmtWght = remainderSpmtWght - spmtPrfmncVO.getSpmtWght();
							}
						}
					}

					if(remainderSpmtQntt > 0) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap("W0005", "상품재고")));
					}

				} else {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap("W0005", "상품재고")));
				}
			}

		}else {
			String spmtno = cmnsTaskNoService.selectSpmtno(spmtPrfmncList.get(0).getApcCd(), spmtPrfmncList.get(0).getSpmtYmd());

			spmtPrfmncList.get(0).setSpmtno(spmtno);

			if (0 == insertSpmtPrfmncCom(spmtPrfmncList.get(0))) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
			}

			for (SpmtPrfmncVO spmtPrfmncVO : spmtPrfmncList) {
				spmtPrfmncVO.setSpmtno(spmtno);

				if(!StringUtils.hasText(spmtPrfmncVO.getGdsCd())) {
					CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
					cmnsGdsVO.setApcCd(spmtPrfmncVO.getApcCd());
					cmnsGdsVO.setItemCd(spmtPrfmncVO.getItemCd());
					cmnsGdsVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
					cmnsGdsVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
					cmnsGdsVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
					cmnsGdsVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
					cmnsGdsVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

					cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
					spmtPrfmncVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
					spmtPrfmncVO.setBrndNm(cmnsGdsVO.getBrndNm());
				}

				if (0 == insertSpmtPrfmncDtl(spmtPrfmncVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
				}

				GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
				gdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
				gdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
				gdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
				gdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());
				gdsInvntrVO.setSpmtWght(spmtPrfmncVO.getSpmtWght());
				gdsInvntrVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
				gdsInvntrVO.setGdsCd(spmtPrfmncVO.getGdsCd());
				gdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
				gdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
				gdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

				resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(gdsInvntrVO);
				if(resultMap != null) {
					throw new EgovBizException(getMessageForMap(resultMap));
				}

			}

			if(ComConstants.CON_YES.equals(spmtPrfmncList.get(0).getPltSpmtYn())) {

				PltWrhsSpmtVO pltWrhsSpmtVO = new PltWrhsSpmtVO();
				pltWrhsSpmtVO.setSysFrstInptPrgrmId(spmtPrfmncList.get(0).getSysFrstInptPrgrmId());
				pltWrhsSpmtVO.setSysFrstInptUserId(spmtPrfmncList.get(0).getSysFrstInptUserId());
				pltWrhsSpmtVO.setSysLastChgPrgrmId(spmtPrfmncList.get(0).getSysLastChgPrgrmId());
				pltWrhsSpmtVO.setSysLastChgUserId(spmtPrfmncList.get(0).getSysLastChgUserId());
				pltWrhsSpmtVO.setApcCd(spmtPrfmncList.get(0).getApcCd());
				pltWrhsSpmtVO.setQntt(spmtPrfmncList.get(0).getBssInvntrQntt());
				pltWrhsSpmtVO.setWrhsSpmtSeCd("2");
				pltWrhsSpmtVO.setPltBxCd(spmtPrfmncList.get(0).getPltBxCd());
				pltWrhsSpmtVO.setPltBxSeCd("P");
				pltWrhsSpmtVO.setJobYmd(spmtPrfmncList.get(0).getSpmtYmd());
				pltWrhsSpmtVO.setPrcsNo(spmtno);
				pltWrhsSpmtVO.setWrhsSpmtType("DT");
				pltWrhsSpmtVO.setPrdcrCd(spmtPrfmncList.get(0).getPrdcrCd());

				resultMap = pltWrhsSpmtService.insertPltWrhsSpmt(pltWrhsSpmtVO);
				if(resultMap != null) {
					throw new EgovBizException(getMessageForMap(resultMap));
				}
			}
		}

		return null;
	}

	@Override
	public List<SpmtPrfmncVO> selectSpmtPrfmncDtlList(SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		List<SpmtPrfmncVO> resultList = spmtPrfmncMapper.selectSpmtPrfmncDtlList(spmtPrfmncVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> deleteSpmtPrfmnc(List<SpmtPrfmncVO> spmtPrfmncList) throws Exception {

		HashMap<String, Object> resultMap;

		List<SpmtPrfmncVO> deleteList = new ArrayList<>();

		for (SpmtPrfmncVO spmtPrfmncVO : spmtPrfmncList) {

			String ddlnYn = cmnsValidationService.selectChkDdlnYn(spmtPrfmncVO.getApcCd(), spmtPrfmncVO.getSpmtYmd());

			if(ComConstants.CON_NONE.equals(ddlnYn)) {

				if (0 == deleteSpmtPrfmncCom(spmtPrfmncVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 삭제")));		// E0003	{0} 시 오류가 발생하였습니다.
				}

				deleteList = selectSpmtPrfmncDtl(spmtPrfmncVO);

				for (SpmtPrfmncVO spmtPrfmnc : deleteList) {

					SlsPrfmncVO slsPrfmncVO = new SlsPrfmncVO();
					slsPrfmncVO.setApcCd(spmtPrfmnc.getApcCd());
					slsPrfmncVO.setSpmtno(spmtPrfmnc.getSpmtno());

					slsPrfmncVO = slsPrfmncService.selectSlsPrfmncCfmtnYn(slsPrfmncVO);

					if (ComConstants.CON_YES.equals(slsPrfmncVO.getCfmtnYn())) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_DONE, "매출확정||출하실적")));		// W0010	이미 {0}된 {1} 입니다.
					} else {
						if(0 < slsPrfmncVO.getSlsPrfmncQntt()) {
							slsPrfmncVO.setApcCd(spmtPrfmnc.getApcCd());
							slsPrfmncVO.setSpmtno(spmtPrfmnc.getSpmtno());
							if (0 == slsPrfmncService.deleteSlsPrfmncAll(slsPrfmncVO)) {
								throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "매출확정 삭제")));		// E0003	{0} 시 오류가 발생하였습니다.
							};
						}
					}

					spmtPrfmnc.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
					spmtPrfmnc.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

					if (0 == deleteSpmtPrfmncDtl(spmtPrfmnc)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 삭제")));		// E0003	{0} 시 오류가 발생하였습니다.
					}

					GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
					gdsInvntrVO.setApcCd(spmtPrfmnc.getApcCd());
					gdsInvntrVO.setPckgno(spmtPrfmnc.getPckgno());
					gdsInvntrVO.setPckgSn(spmtPrfmnc.getPckgSn());
					gdsInvntrVO.setSpmtQntt(spmtPrfmnc.getSpmtQntt());
					gdsInvntrVO.setSpmtWght(spmtPrfmnc.getSpmtWght());
					gdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
					gdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

					resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmncCncl(gdsInvntrVO);
					if(resultMap != null) {
						throw new EgovBizException(getMessageForMap(resultMap));
					}

				}
				if(ComConstants.CON_YES.equals(spmtPrfmncList.get(0).getPltSpmtYn())) {

					PltWrhsSpmtVO pltWrhsSpmtVO = new PltWrhsSpmtVO();
					pltWrhsSpmtVO.setSysFrstInptPrgrmId(spmtPrfmncVO.getSysFrstInptPrgrmId());
					pltWrhsSpmtVO.setSysFrstInptUserId(spmtPrfmncVO.getSysFrstInptUserId());
					pltWrhsSpmtVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
					pltWrhsSpmtVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());
					pltWrhsSpmtVO.setApcCd(spmtPrfmncVO.getApcCd());
					pltWrhsSpmtVO.setJobYmd(spmtPrfmncVO.getSpmtYmd());
					pltWrhsSpmtVO.setSn(spmtPrfmncVO.getSn());
					pltWrhsSpmtVO.setPltBxCd(spmtPrfmncVO.getPltBxCd());
					pltWrhsSpmtVO.setPltBxSeCd("P");
					pltWrhsSpmtVO.setWrhsSpmtSeCd("2");
					pltWrhsSpmtVO.setQntt(spmtPrfmncVO.getBssInvntrQntt());
					resultMap = pltWrhsSpmtService.updateDelYnPltWrhsSpmt(pltWrhsSpmtVO);

					if(resultMap != null) {
						throw new EgovBizException(getMessageForMap(resultMap));
					}
				}
			}else {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "출하실적")));		// W0012	마감등록 된 {0} 입니다.
			}


		}
		return null ;
	}

	@Override
	public List<SpmtPrfmncVO> selectSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception {
		List<SpmtPrfmncVO> resultList  = spmtPrfmncMapper.selectSpmtPrfmncDtl(spmtPrfmncVO);
		return resultList;
	}

	@Override
	public HashMap<String, Object> insertRtnSpmtPrfmncList(List<SpmtPrfmncVO> spmtPrfmncList) throws Exception {
		HashMap<String, Object> resultMap;
		String spmtno = cmnsTaskNoService.selectSpmtno(spmtPrfmncList.get(0).getApcCd(), spmtPrfmncList.get(0).getSpmtYmd());
		spmtPrfmncList.get(0).setSpmtno(spmtno);

		if (0 == insertSpmtPrfmncCom(spmtPrfmncList.get(0))) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
		}

		for (SpmtPrfmncVO spmtPrfmncVO : spmtPrfmncList) {

			spmtPrfmncVO.setSpmtno(spmtno);

			if (0 == insertSpmtPrfmncDtl(spmtPrfmncVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
			}

			GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
			gdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
			gdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
			gdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
			gdsInvntrVO.setRtnGdsQntt(spmtPrfmncVO.getRtnGdsQntt());
			gdsInvntrVO.setRtnGdsWght(spmtPrfmncVO.getRtnGdsWght());
			gdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
			gdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

			resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmncRtn(gdsInvntrVO);

			if (resultMap != null) {
				return resultMap;
			}
		}
		return null;
	}

	@Override
	public HashMap<String, Object> deleteRtnSpmtPrfmncList(List<SpmtPrfmncVO> spmtPrfmncList) throws Exception {

		HashMap<String, Object> resultMap;

		List<SpmtPrfmncVO> deleteList = new ArrayList<>();


		for (SpmtPrfmncVO spmtPrfmncVO : spmtPrfmncList) {


				if (0 == deleteSpmtPrfmncCom(spmtPrfmncVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "반품실적 삭제")));		// E0003	{0} 시 오류가 발생하였습니다.
				}

				deleteList = selectSpmtPrfmncDtl(spmtPrfmncVO);


				for (SpmtPrfmncVO spmtPrfmnc : deleteList) {


					spmtPrfmnc.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
					spmtPrfmnc.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

					if (0 == deleteSpmtPrfmncDtl(spmtPrfmnc)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "반품실적 삭제")));		// E0003	{0} 시 오류가 발생하였습니다.
					}

					GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
					gdsInvntrVO.setApcCd(spmtPrfmnc.getApcCd());
					gdsInvntrVO.setPckgno(spmtPrfmnc.getPckgno());
					gdsInvntrVO.setPckgSn(spmtPrfmnc.getPckgSn());
					gdsInvntrVO.setRtnGdsQntt(spmtPrfmnc.getRtnGdsQntt());
					gdsInvntrVO.setRtnGdsWght(spmtPrfmnc.getRtnGdsWght());
					gdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
					gdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

					resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmncRtnCncl(gdsInvntrVO);
					if(resultMap != null) {
						throw new EgovBizException(getMessageForMap(resultMap));
					}

				}

		}
		return null;
	}


	// 파프리카출하실적등록
	public HashMap<String, Object> insertSpmtPrfmncDsctn(List<SpmtPrfmncComVO> spmtPrfmncComList) throws Exception{
		HashMap<String, Object> resultMap;

		// 거래처별 출하 번호 생성
		for (SpmtPrfmncComVO spmtPrfmncComVO : spmtPrfmncComList) {

			String prgrmId = spmtPrfmncComVO.getSysFrstInptPrgrmId();
			String userId = spmtPrfmncComVO.getSysFrstInptUserId();

			String spmtno = cmnsTaskNoService.selectSpmtno(spmtPrfmncComVO.getSpmtPrfmncList().get(0).getApcCd(), spmtPrfmncComVO.getSpmtPrfmncList().get(0).getSpmtYmd());

			List<SpmtPrfmncVO> spmtPrfmncList = spmtPrfmncComVO.getSpmtPrfmncList();

			spmtPrfmncList.get(0).setSysFrstInptPrgrmId(prgrmId);
			spmtPrfmncList.get(0).setSysFrstInptUserId(userId);
			spmtPrfmncList.get(0).setSysLastChgPrgrmId(prgrmId);
			spmtPrfmncList.get(0).setSysLastChgUserId(userId);
			spmtPrfmncList.get(0).setSpmtno(spmtno);

			if (0 == insertSpmtPrfmncCom(spmtPrfmncList.get(0))) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
			}


			// System Id 세팅
			for (SpmtPrfmncVO spmtPrfmncVO : spmtPrfmncList) {
				spmtPrfmncVO.setSpmtno(spmtno);
				spmtPrfmncVO.setSysFrstInptPrgrmId(prgrmId);
				spmtPrfmncVO.setSysFrstInptUserId(userId);
				spmtPrfmncVO.setSysLastChgPrgrmId(prgrmId);
				spmtPrfmncVO.setSysLastChgUserId(userId);
			}

			// 출하 강제생성 여부 판단
			if (ComConstants.CON_YES.equals(spmtPrfmncList.get(0).getBlwInvntrAprv())) {
				List<GdsInvntrVO> insertgdsInvntrList = new ArrayList<>();
				String pckgno = cmnsTaskNoService.selectPckgno(spmtPrfmncList.get(0).getApcCd(), spmtPrfmncList.get(0).getSpmtYmd());

				int sn = 1;

				for (SpmtPrfmncVO spmtPrfmncVO : spmtPrfmncList) {

					GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
					gdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
					gdsInvntrVO.setItemCd(spmtPrfmncVO.getItemCd());
					gdsInvntrVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
					gdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());

					if (ComConstants.CON_YES.equals(spmtPrfmncVO.getSortDsctnYn())) {
						gdsInvntrVO.setPckgYmdFrom(spmtPrfmncVO.getPckgYmdFrom());
						gdsInvntrVO.setPckgYmdTo(spmtPrfmncVO.getPckgYmdTo());
					}

					List<GdsInvntrVO> gdsInvntrList = gdsInvntrService.selectGdsInvntrList(gdsInvntrVO);

					// 조회 결과 유무 판단
					if (gdsInvntrList.size() > 0) {

						int remainderSpmtQntt = spmtPrfmncVO.getSpmtQntt();
						// 출하량 만큼 재고 리스트에서 순차적으로 차감
						for (GdsInvntrVO gdsInvntr : gdsInvntrList) {

							// 출하량 만큼 재고 차감인 경우
							if (remainderSpmtQntt == 0) {
								break;
							}

							// 출하량 보다 재고 차감을 덜 한 경우
							if (remainderSpmtQntt > 0) {

								// 현재 n번째 재고가 출하량보다 많을 경우
								if (gdsInvntr.getInvntrQntt() - remainderSpmtQntt >= 0) {
									spmtPrfmncVO.setPckgno(gdsInvntr.getPckgno());
									spmtPrfmncVO.setPckgSn(gdsInvntr.getPckgSn());
									spmtPrfmncVO.setBrndNm(gdsInvntr.getBrndNm());
									spmtPrfmncVO.setSpcfctCd(gdsInvntr.getSpcfctCd());
									spmtPrfmncVO.setSpmtPckgUnitCd(gdsInvntr.getSpmtPckgUnitCd());

									spmtPrfmncVO.setSpmtQntt(remainderSpmtQntt);

									if (!StringUtils.hasText(spmtPrfmncVO.getGdsCd())) {
										CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
										cmnsGdsVO.setApcCd(spmtPrfmncVO.getApcCd());
										cmnsGdsVO.setItemCd(spmtPrfmncVO.getItemCd());
										cmnsGdsVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
										cmnsGdsVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
										cmnsGdsVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
										cmnsGdsVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
										cmnsGdsVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

										cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
										spmtPrfmncVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
										spmtPrfmncVO.setBrndNm(cmnsGdsVO.getBrndNm());
									}

									if (0 == insertSpmtPrfmncDtl(spmtPrfmncVO)) {
										throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
									}

									GdsInvntrVO updateGdsInvntrVO = new GdsInvntrVO();
									updateGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
									updateGdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
									updateGdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
									updateGdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());
									updateGdsInvntrVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
									updateGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
									updateGdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
									updateGdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

									resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(updateGdsInvntrVO);

									if (resultMap != null) {
										throw new EgovBizException(getMessageForMap(resultMap));
									}
									remainderSpmtQntt = remainderSpmtQntt - spmtPrfmncVO.getSpmtQntt();
								} else { // 현재 n번째 재고가 출하량 보다 적을 경우
									spmtPrfmncVO.setPckgno(gdsInvntr.getPckgno());
									spmtPrfmncVO.setPckgSn(gdsInvntr.getPckgSn());
									spmtPrfmncVO.setBrndNm(gdsInvntr.getBrndNm());
									spmtPrfmncVO.setSpcfctCd(gdsInvntr.getSpcfctCd());
									spmtPrfmncVO.setSpmtPckgUnitCd(gdsInvntr.getSpmtPckgUnitCd());

									spmtPrfmncVO.setSpmtQntt(gdsInvntr.getInvntrQntt());

									if (!StringUtils.hasText(spmtPrfmncVO.getGdsCd())) {
										CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
										cmnsGdsVO.setApcCd(spmtPrfmncVO.getApcCd());
										cmnsGdsVO.setItemCd(spmtPrfmncVO.getItemCd());
										cmnsGdsVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
										cmnsGdsVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
										cmnsGdsVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
										cmnsGdsVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
										cmnsGdsVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

										cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
										spmtPrfmncVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
										spmtPrfmncVO.setBrndNm(cmnsGdsVO.getBrndNm());
									}

									if (0 == insertSpmtPrfmncDtl(spmtPrfmncVO)) {
										throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
									}

									GdsInvntrVO updateGdsInvntrVO = new GdsInvntrVO();
									updateGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
									updateGdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
									updateGdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
									updateGdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());
									updateGdsInvntrVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
									updateGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
									updateGdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
									updateGdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());
									resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(updateGdsInvntrVO);

									if (resultMap != null) {
										throw new EgovBizException(getMessageForMap(resultMap));
									}

									remainderSpmtQntt = remainderSpmtQntt - spmtPrfmncVO.getSpmtQntt();
								}
							}
						}

						/* 조회된 재고리스트 재고 보다 출하량이 많은 경우
						 * 출하 재고 생성
						*/
						if (remainderSpmtQntt > 0) {
							GdsInvntrVO insertGdsInvntrVO = new GdsInvntrVO();
							insertGdsInvntrVO.setSysFrstInptPrgrmId(prgrmId);
							insertGdsInvntrVO.setSysFrstInptUserId(userId);
							insertGdsInvntrVO.setSysLastChgPrgrmId(prgrmId);
							insertGdsInvntrVO.setSysLastChgUserId(userId);
							insertGdsInvntrVO.setInvntrSttsCd("D1");
							insertGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
							insertGdsInvntrVO.setItemCd(spmtPrfmncVO.getItemCd());
							insertGdsInvntrVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
							insertGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());

							insertGdsInvntrVO.setInvntrQntt(remainderSpmtQntt * -1);
							insertGdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());

							if (ComConstants.CON_YES.equals(spmtPrfmncVO.getSortDsctnYn())) {
								insertGdsInvntrVO.setPckgYmd(spmtPrfmncVO.getPckgYmdTo());
							} else {
								insertGdsInvntrVO.setPckgYmd(spmtPrfmncVO.getSpmtYmd());
							}

							insertGdsInvntrVO.setPckgno(pckgno);
							insertGdsInvntrVO.setPckgSn(sn);

							insertgdsInvntrList.add(insertGdsInvntrVO);

							spmtPrfmncVO.setPckgno(insertGdsInvntrVO.getPckgno());
							spmtPrfmncVO.setPckgSn(insertGdsInvntrVO.getPckgSn());
							spmtPrfmncVO.setSpmtQntt(remainderSpmtQntt);

							sn++;

							if (0 == insertSpmtPrfmncDtl(spmtPrfmncVO)) {
								throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
							}
						}

					} else { // 조회 결과가 없을 경우 출하 재고 생성
						GdsInvntrVO insertGdsInvntrVO = new GdsInvntrVO();
						insertGdsInvntrVO.setSysFrstInptPrgrmId(prgrmId);
						insertGdsInvntrVO.setSysFrstInptUserId(userId);
						insertGdsInvntrVO.setSysLastChgPrgrmId(prgrmId);
						insertGdsInvntrVO.setSysLastChgUserId(userId);
						insertGdsInvntrVO.setInvntrSttsCd("D1");
						insertGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
						insertGdsInvntrVO.setItemCd(spmtPrfmncVO.getItemCd());
						insertGdsInvntrVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
						insertGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());

						insertGdsInvntrVO.setInvntrQntt(spmtPrfmncVO.getSpmtQntt() * -1);
						insertGdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());

						if (ComConstants.CON_YES.equals(spmtPrfmncVO.getSortDsctnYn())) {
							insertGdsInvntrVO.setPckgYmd(spmtPrfmncVO.getPckgYmdTo());
						} else {
							insertGdsInvntrVO.setPckgYmd(spmtPrfmncVO.getSpmtYmd());
						}

						insertGdsInvntrVO.setPckgno(pckgno);
						insertGdsInvntrVO.setPckgSn(sn);

						insertgdsInvntrList.add(insertGdsInvntrVO);

						spmtPrfmncVO.setPckgno(insertGdsInvntrVO.getPckgno());
						spmtPrfmncVO.setPckgSn(insertGdsInvntrVO.getPckgSn());

						sn++;

						if (0 == insertSpmtPrfmncDtl(spmtPrfmncVO)) {
							throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
						}
					}

				}

				// 출하시 강제 생성된 재고 등록
				if (insertgdsInvntrList.size() > 0) {

					gdsInvntrService.insertGdsInvntrList(insertgdsInvntrList);

				}
			} else {

				for (SpmtPrfmncVO spmtPrfmncVO : spmtPrfmncList) {

					GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
					gdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
					gdsInvntrVO.setItemCd(spmtPrfmncVO.getItemCd());
					gdsInvntrVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
					gdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());

					List<GdsInvntrVO> gdsInvntrList = gdsInvntrService.selectGdsInvntrList(gdsInvntrVO);

					if (gdsInvntrList.size() > 0) {

						int remainderSpmtQntt = spmtPrfmncVO.getSpmtQntt();

						for (GdsInvntrVO gdsInvntr : gdsInvntrList) {

							if (remainderSpmtQntt == 0) {
								break;
							}

							if (remainderSpmtQntt > 0) {

								if (gdsInvntr.getInvntrQntt() - remainderSpmtQntt >= 0) {
									spmtPrfmncVO.setPckgno(gdsInvntr.getPckgno());
									spmtPrfmncVO.setPckgSn(gdsInvntr.getPckgSn());
									spmtPrfmncVO.setBrndNm(gdsInvntr.getBrndNm());
									spmtPrfmncVO.setSpcfctCd(gdsInvntr.getSpcfctCd());
									spmtPrfmncVO.setSpmtPckgUnitCd(gdsInvntr.getSpmtPckgUnitCd());

									spmtPrfmncVO.setSpmtQntt(remainderSpmtQntt);

									if (!StringUtils.hasText(spmtPrfmncVO.getGdsCd())) {
										CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
										cmnsGdsVO.setApcCd(spmtPrfmncVO.getApcCd());
										cmnsGdsVO.setItemCd(spmtPrfmncVO.getItemCd());
										cmnsGdsVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
										cmnsGdsVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
										cmnsGdsVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
										cmnsGdsVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
										cmnsGdsVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

										cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
										spmtPrfmncVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
										spmtPrfmncVO.setBrndNm(cmnsGdsVO.getBrndNm());
									}

									if (0 == insertSpmtPrfmncDtl(spmtPrfmncVO)) {
										throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
									}

									GdsInvntrVO updateGdsInvntrVO = new GdsInvntrVO();
									updateGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
									updateGdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
									updateGdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
									updateGdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());
									updateGdsInvntrVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
									updateGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
									updateGdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
									updateGdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

									resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(updateGdsInvntrVO);

									if (resultMap != null) {
										throw new EgovBizException(getMessageForMap(resultMap));
									}
									remainderSpmtQntt = remainderSpmtQntt - spmtPrfmncVO.getSpmtQntt();

								} else {

									spmtPrfmncVO.setPckgno(gdsInvntr.getPckgno());
									spmtPrfmncVO.setPckgSn(gdsInvntr.getPckgSn());
									spmtPrfmncVO.setBrndNm(gdsInvntr.getBrndNm());
									spmtPrfmncVO.setSpcfctCd(gdsInvntr.getSpcfctCd());
									spmtPrfmncVO.setSpmtPckgUnitCd(gdsInvntr.getSpmtPckgUnitCd());

									spmtPrfmncVO.setSpmtQntt(gdsInvntr.getInvntrQntt());

									if (!StringUtils.hasText(spmtPrfmncVO.getGdsCd())) {
										CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
										cmnsGdsVO.setApcCd(spmtPrfmncVO.getApcCd());
										cmnsGdsVO.setItemCd(spmtPrfmncVO.getItemCd());
										cmnsGdsVO.setVrtyCd(spmtPrfmncVO.getVrtyCd());
										cmnsGdsVO.setSpcfctCd(spmtPrfmncVO.getSpcfctCd());
										cmnsGdsVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
										cmnsGdsVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
										cmnsGdsVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());

										cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
										spmtPrfmncVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
										spmtPrfmncVO.setBrndNm(cmnsGdsVO.getBrndNm());
									}

									if (0 == insertSpmtPrfmncDtl(spmtPrfmncVO)) {
										throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "출하실적 등록")));		// E0003	{0} 시 오류가 발생하였습니다.
									}

									GdsInvntrVO updateGdsInvntrVO = new GdsInvntrVO();
									updateGdsInvntrVO.setApcCd(spmtPrfmncVO.getApcCd());
									updateGdsInvntrVO.setPckgno(spmtPrfmncVO.getPckgno());
									updateGdsInvntrVO.setPckgSn(spmtPrfmncVO.getPckgSn());
									updateGdsInvntrVO.setSpmtQntt(spmtPrfmncVO.getSpmtQntt());
									updateGdsInvntrVO.setSpmtPckgUnitCd(spmtPrfmncVO.getSpmtPckgUnitCd());
									updateGdsInvntrVO.setGdsGrd(spmtPrfmncVO.getGdsGrd());
									updateGdsInvntrVO.setSysLastChgPrgrmId(spmtPrfmncVO.getSysLastChgPrgrmId());
									updateGdsInvntrVO.setSysLastChgUserId(spmtPrfmncVO.getSysLastChgUserId());
									resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(updateGdsInvntrVO);

									if (resultMap != null) {
										throw new EgovBizException(getMessageForMap(resultMap));
									}

									remainderSpmtQntt = remainderSpmtQntt - spmtPrfmncVO.getSpmtQntt();
								}
							}
						}
						// 조회된 재고 보다 출하량이 많을 경우 롤백 처리
						if (remainderSpmtQntt > 0) {
							throw new EgovBizException(getMessageForMap(ComUtil.getResultMap("W0005", "상품재고")));
						}

					} else { // 현재 재고가 없는 경우
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap("W0005", "상품재고")));
					}

				}
			}

		}

		return null;
	}
	@Override
	public List<GdsInvntrVO> selectSpmtPrfmncInvntList(SpmtPrfmncVO spmtPrfmncVO) throws Exception {
		return spmtPrfmncMapper.selectSpmtPrfmncInvntList(spmtPrfmncVO);
	}

	@Override
	public List<SpmtPrfmncVO> selectSpmtPrfmncComList(SpmtPrfmncVO spmtPrfmncVO) throws Exception {
		return spmtPrfmncMapper.selectSpmtPrfmncComList(spmtPrfmncVO);
	}


	@Override
	public List<SpmtPrfmncVO> selectSpmtPrfmncRegList(SpmtPrfmncVO spmtPrfmncVO) throws Exception {
		return spmtPrfmncMapper.selectSpmtPrfmncRegList(spmtPrfmncVO);
	}




	@Override
	public HashMap<String, Object> updateSpmtPrfmncByPckgList(SpmtPrfmncComVO spmtPrfmncComVO) throws Exception {

		HashMap<String, Object> rtnObj;

		String apcCd = spmtPrfmncComVO.getApcCd();
		String spmtno = spmtPrfmncComVO.getSpmtno();

		// 공통정보는 변경 없음
		// 기 출하정보 조회 후 취소 + 재등록

		if (!StringUtils.hasText(spmtno)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하번호");
		}

		List<SpmtPrfmncVO> spmtPrfmncList = spmtPrfmncComVO.getSpmtPrfmncList();

		if (spmtPrfmncList == null || spmtPrfmncList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하대상");
		}

		// 출하실적list validation check
		for ( SpmtPrfmncVO spmt : spmtPrfmncList ) {

			int spmtQntt = spmt.getSpmtQntt();
			if (spmtQntt <= 0) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하수량");
			}

			String spmtPckgUnitCd = ComUtil.nullToEmpty(spmt.getSpmtPckgUnitCd());
			SpmtPckgUnitVO pckgUnitParam = new SpmtPckgUnitVO();
			pckgUnitParam.setApcCd(apcCd);
			pckgUnitParam.setSpmtPckgUnitCd(spmtPckgUnitCd);
			// 출하포장단위로 스펙 조회
			SpmtPckgUnitVO spmtPckgUnitVO = spmtPckgUnitService.selectSpmtPckgUnit(pckgUnitParam);

			if (spmtPckgUnitVO == null || !StringUtils.hasText(spmtPckgUnitVO.getSpmtPckgUnitCd())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품조회결과");
			}

			double spcfctWght = spmtPckgUnitVO.getSpcfctWght();
			spmt.setSpcfctWght(spcfctWght);

			String pckgno = spmt.getPckgno();
			int pckgSn = spmt.getPckgSn();

			if (StringUtils.hasText(pckgno) && pckgSn > 0) {
				GdsInvntrVO gdsVO = new GdsInvntrVO();
				gdsVO.setApcCd(apcCd);
				gdsVO.setPckgno(pckgno);
				gdsVO.setPckgSn(pckgSn);

				GdsInvntrVO orgnInv = gdsInvntrService.selectGdsInvntr(gdsVO);

				if (orgnInv == null
						|| ComConstants.CON_YES.equals(orgnInv.getDelYn())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품정보");
				}

				if (!spmtPckgUnitCd.equals(orgnInv.getSpmtPckgUnitCd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "출하상품||재고상품");
				}
			} else {

				List<SpmtGdsVO> spmtGdsList = spmt.getSpmtGdsList();

				if (spmtGdsList == null || spmtGdsList.isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품내역");
				}
			}
		}

		// 출하실적 취소
		SpmtPrfmncComVO spmtComVO = new SpmtPrfmncComVO();
		BeanUtils.copyProperties(spmtPrfmncComVO, spmtComVO);

		rtnObj = deleteSpmt(spmtComVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 출하실적 재등록
		spmtPrfmncComVO.setSpmtno(null);
		// 출하변경으로 재고 음수 적용
		spmtPrfmncComVO.setInvntrSttsCd(AmConstants.CON_INVNTR_STTS_CD_CHNG_SPMT);

		rtnObj = insertSpmtPrfmncByPckgList(spmtPrfmncComVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteSpmt(SpmtPrfmncComVO spmtPrfmncComVO) throws Exception {

		HashMap<String, Object> resultMap;

		// 출하실적조회
		SpmtPrfmncComVO spmtComInfo = spmtPrfmncMapper.selectSpmtCom(spmtPrfmncComVO);
		if (spmtComInfo == null || ComConstants.CON_YES.equals(spmtComInfo.getDelYn())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기출하내역");
		}

		String apcCd = spmtComInfo.getApcCd();
		String spmtno = spmtComInfo.getSpmtno();

		SpmtPrfmncVO spmtComParam = new SpmtPrfmncVO();
		spmtComParam.setApcCd(apcCd);
		spmtComParam.setSpmtno(spmtno);
		spmtComParam.setSysFrstInptUserId(spmtPrfmncComVO.getSysFrstInptUserId());
		spmtComParam.setSysFrstInptPrgrmId(spmtPrfmncComVO.getSysFrstInptPrgrmId());
		spmtComParam.setSysLastChgUserId(spmtPrfmncComVO.getSysLastChgUserId());
		spmtComParam.setSysLastChgPrgrmId(spmtPrfmncComVO.getSysLastChgPrgrmId());

		List<SpmtPrfmncVO> spmtDtlList = spmtPrfmncMapper.selectSpmtDtlList(spmtComParam);
		if (spmtDtlList == null || spmtDtlList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기출하내역");
		}

		String ddlnYn = cmnsValidationService.selectChkDdlnYn(spmtComInfo.getApcCd(), spmtComInfo.getSpmtYmd());

		if (!ComConstants.CON_NONE.equals(ddlnYn)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "출하실적");	// W0012	마감등록 된 {0} 입니다.
		}

		// 매출확정 삭제
		SlsPrfmncVO slsPrfmncVO = new SlsPrfmncVO();
		slsPrfmncVO.setApcCd(apcCd);
		slsPrfmncVO.setSpmtno(spmtno);

		slsPrfmncVO = slsPrfmncService.selectSlsPrfmncCfmtnYn(slsPrfmncVO);
		if (slsPrfmncVO != null) {
			if (ComConstants.CON_YES.equals(slsPrfmncVO.getCfmtnYn())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_DONE, "매출확정||출하실적");
			}

			if (slsPrfmncVO.getSlsPrfmncQntt() > 0) {
				slsPrfmncVO.setApcCd(apcCd);
				slsPrfmncVO.setSpmtno(spmtno);
				int deletedCnt = slsPrfmncService.deleteSlsPrfmncAll(slsPrfmncVO);
				if (deletedCnt == 0) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "매출확정 삭제")));		// E0003	{0} 시 오류가 발생하였습니다.
				};
			}
		}

		for (SpmtPrfmncVO spmtDtl : spmtDtlList) {
			// audit 항목 설정
			spmtDtl.setSysFrstInptUserId(spmtPrfmncComVO.getSysFrstInptUserId());
			spmtDtl.setSysFrstInptPrgrmId(spmtPrfmncComVO.getSysFrstInptPrgrmId());
			spmtDtl.setSysLastChgUserId(spmtPrfmncComVO.getSysLastChgUserId());
			spmtDtl.setSysLastChgPrgrmId(spmtPrfmncComVO.getSysLastChgPrgrmId());

			// 상품재고살리기
			GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
			BeanUtils.copyProperties(spmtDtl, gdsInvntrVO);

			resultMap = gdsInvntrService.updateGdsInvntrSpmtPrfmncCncl(gdsInvntrVO);
			if (resultMap != null) {
				throw new EgovBizException(getMessageForMap(resultMap));
			}

			spmtPrfmncMapper.deleteSpmtPrfmncDtl(spmtDtl);
		}

		// FIXME 팔레트 불출 취소 추가할 것.

		// 출하공통삭제
		spmtPrfmncMapper.deleteSpmtPrfmncCom(spmtComParam);

		return null;
	}

	@Override
	public HashMap<String, Object> reconciliationDaliySpmt(SortInvntrVO sortInvntrVO, SpmtPrfmncVO spmtPrfmncVO) throws Exception {

		/** 상품재고간 취합을 위해 선별재고로 상품재고의 정보 SELECT **/
		GdsInvntrVO originGdsInvntrVO = new GdsInvntrVO();
		GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
		/** 공통값 세팅실패 **/
		GdsInvntrVO delGdsInvntrVO = new GdsInvntrVO();
		originGdsInvntrVO = gdsInvntrService.selectGdsInvntrToSortInvntr(sortInvntrVO);

		/** 출하상세에 update시킬 포장번호 ==> 2번 해결 **/
		String pckgno = originGdsInvntrVO.getPckgno();

		/** 선출하 실적 내역에 연결되어있는 선출고 재고정보 추출 **/
		BeanUtils.copyProperties(spmtPrfmncVO,gdsInvntrVO);
		delGdsInvntrVO = gdsInvntrService.selectGdsInvntr(gdsInvntrVO);

		/** 실제 재고에 선출하 실적에 대한 연산처리 **/
		/** 재고량 감산 **/
		originGdsInvntrVO.setInvntrQntt(originGdsInvntrVO.getInvntrQntt()+delGdsInvntrVO.getInvntrQntt());
		originGdsInvntrVO.setInvntrWght(originGdsInvntrVO.getInvntrWght()+delGdsInvntrVO.getInvntrWght());
		/** 출하량 가산 **/
		originGdsInvntrVO.setSpmtQntt(originGdsInvntrVO.getSpmtQntt() + delGdsInvntrVO.getSpmtQntt());
		originGdsInvntrVO.setSpmtWght(originGdsInvntrVO.getSpmtWght() + delGdsInvntrVO.getSpmtWght());

		/** 가감산 UPDATE 적용 **/
		int count = gdsInvntrService.updateReconciliation(originGdsInvntrVO);
		if(count == 0){
			HashMap<String,Object> result = new HashMap<>();
			result.put(ComConstants.PROP_RESULT_CODE,ComConstants.RESULT_STATUS_ERROR);
			result.put(ComConstants.PROP_RESULT_MESSAGE,"재고정보 반영에 실패했습니다.");
			throw new EgovBizException(getMessageForMap(result));
		}

		/** 선출하실적에 사용된 마이너스재고 DEL_YN 처리 **/
		int delResult = gdsInvntrService.updateGdsInvntrDelQnttWght(gdsInvntrVO);
		if(delResult == 0){
			HashMap<String,Object> result = new HashMap<>();
			result.put(ComConstants.PROP_RESULT_CODE,ComConstants.RESULT_STATUS_ERROR);
			result.put(ComConstants.PROP_RESULT_MESSAGE,"재고정보 반영에 실패했습니다.");
			throw new EgovBizException(getMessageForMap(result));
		}
		/** 선출하실적 상세 레코드에 실제 포장번호 반영 UPDATE
		 *  포장번호가 PK 임으로 해당 레코드 삭제후 새로운 INSERT 필요
		 *  추적하기위해 만든 선별재고 del_yn처리
		 * **/
		SortInvntrVO delSortInvtrVO = new SortInvntrVO();
		delSortInvtrVO.setApcCd(delGdsInvntrVO.getApcCd());
		delSortInvtrVO.setSortno(delGdsInvntrVO.getPckgSortno());
		delSortInvtrVO.setSortSn(delGdsInvntrVO.getPckgSn());
		delSortInvtrVO.setSysLastChgUserId(delGdsInvntrVO.getSysLastChgUserId());
		delSortInvtrVO.setSysLastChgPrgrmId(delGdsInvntrVO.getSysLastChgPrgrmId());

		int delCount = spmtPrfmncMapper.deletePermanentSpmtDtl(spmtPrfmncVO);
		HashMap<String, Object> resultMap = sortInvntrService.deleteSortInvntr(delSortInvtrVO);
		if(resultMap != null){
			throw new EgovBizException(getMessageForMap(resultMap));
		}

		if(delCount != 0){
			spmtPrfmncVO.setPckgno(pckgno);
			delCount = spmtPrfmncMapper.insertSpmtPrfmncDtl(spmtPrfmncVO);
			if(delCount == 0){
				HashMap<String,Object> dtlResult = new HashMap<>();
				dtlResult.put(ComConstants.PROP_RESULT_CODE,ComConstants.RESULT_STATUS_ERROR);
				dtlResult.put(ComConstants.PROP_RESULT_MESSAGE,"출하 실적반영에 실패했습니다.");
				throw new EgovBizException(getMessageForMap(dtlResult));
			}
		}
		return null;
	}

	@Override
	public HashMap<String, Object> insertSpmtPrfmncByPckg(List<SpmtPrfmncComVO> list) throws Exception {

		HashMap<String,Object> result = new HashMap<>();
		/** report 대비 출하번호 return **/
		String[] spmtnos = new String[list.size()];
		int spmtIdx = 0;


		for(SpmtPrfmncComVO spmtPrfmncComVO : list ){
			/** 출하실적번호 발번 **/
			String apcCd = spmtPrfmncComVO.getApcCd();
			String spmtYmd = spmtPrfmncComVO.getSpmtYmd();
			/** update용 공통 정보 **/
			String userId = spmtPrfmncComVO.getSysLastChgUserId();
			String prgrmId = spmtPrfmncComVO.getSysLastChgPrgrmId();

			String spmtno = cmnsTaskNoService.selectSpmtno(apcCd, spmtYmd);
			spmtnos[spmtIdx] = spmtno;

			SpmtPrfmncVO spmtPrfmncVO = new SpmtPrfmncVO();
			BeanUtils.copyProperties(spmtPrfmncComVO, spmtPrfmncVO);
			spmtPrfmncVO.setSpmtno(spmtno);

			/** 출하실적 공통 생성 **/
			int insertCnt = spmtPrfmncMapper.insertSpmtPrfmncCom(spmtPrfmncVO);
			if(insertCnt == 0){
				HashMap<String,Object> comResult = new HashMap<>();
				comResult.put(ComConstants.PROP_RESULT_CODE,ComConstants.RESULT_STATUS_ERROR);
				comResult.put(ComConstants.PROP_RESULT_MESSAGE,"출하 실적등록에 실패했습니다.");
				throw new EgovBizException(getMessageForMap(comResult));
			}

			/** 출하실적 상세 생성 **/
			List<SpmtPrfmncVO> spmtPrfmncVoList = spmtPrfmncComVO.getSpmtPrfmncList();
			for(SpmtPrfmncVO item : spmtPrfmncVoList) {
				/** 출하 순번 **/
				int spmtSn = 0;
				/** 포장번호 확보 **/
				String pckgNo = "";
				item.setApcCd(apcCd);
				/** 재고확인 및 출하반영 S**/
				List<GdsInvntrVO> invntrList = gdsInvntrMapper.selectGdsInvntrForSpmt(item);
				/** 재고정보 조차 없는경우 **/
				if (invntrList.isEmpty()) {
					/** 포장번호 확보 **/
					pckgNo = cmnsTaskNoService.selectPckgno(apcCd, spmtYmd);

					/** 포장실적 정보 생성 **/
					PckgPrfmncVO pckgPrfmncVO = new PckgPrfmncVO();
					pckgPrfmncVO.setApcCd(apcCd);
					pckgPrfmncVO.setPckgSn(0);
					pckgPrfmncVO.setPckgQntt(item.getSpmtQntt());
					pckgPrfmncVO.setPckgYmd(item.getSpmtYmd());
					pckgPrfmncVO.setPckgno(pckgNo);

					/** 상품재고 정보 생성 (재고 -출하수량 => 생성후 사용)**/
					GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
					BeanUtils.copyProperties(item, gdsInvntrVO);
					gdsInvntrVO.setApcCd(apcCd);
					gdsInvntrVO.setInvntrSttsCd("D1");
					gdsInvntrVO.setInvntrQntt(item.getSpmtQntt() * -1);
					gdsInvntrVO.setPckgno(pckgNo);
					gdsInvntrVO.setPckgYmd(spmtYmd);

					HashMap<String, Object> insertObj = new HashMap<>();
					insertObj.put("userId", userId);
					insertObj.put("prgrmId", prgrmId);
					insertObj.put("gdsInvntrVO", gdsInvntrVO);
					insertObj.put("pckgPrfmncVO", pckgPrfmncVO);

					int pckgCnt = pckgPrfmncService.insertPckgPrfmncSc(insertObj);
					if (pckgCnt == 0) {
						HashMap<String, Object> comResult = new HashMap<>();
						comResult.put(ComConstants.PROP_RESULT_CODE, ComConstants.RESULT_STATUS_ERROR);
						comResult.put(ComConstants.PROP_RESULT_MESSAGE, "포장 실적등록에 실패했습니다.");
						throw new EgovBizException(getMessageForMap(comResult));
					}
				} else if (!invntrList.isEmpty()) {
					pckgNo = invntrList.get(0).getPckgno();
					int invntrQntt = invntrList.stream().mapToInt(GdsInvntrVO::getInvntrQntt).sum();
					int spmtQntt = item.getSpmtQntt();
					if (invntrQntt < item.getSpmtQntt()) {
						/** 재고수량이 부족한 경우 **/
						for (GdsInvntrVO gdsInvntrQntt : invntrList) {
							int qntt = gdsInvntrQntt.getInvntrQntt() > spmtQntt ? 0 : gdsInvntrQntt.getInvntrQntt() - spmtQntt;
							gdsInvntrQntt.setInvntrQntt(qntt);
							spmtQntt -= gdsInvntrQntt.getInvntrQntt();
						}
					} else {
						/** 재고도 있는 경우 **/
						for (int i = 0; i < invntrList.size() || spmtQntt != 0; i++) {
							int flag = spmtQntt - invntrList.get(i).getInvntrQntt();
							/** 출하 수량이  현재고 보다 클때 **/
							if (flag > 0) {
								spmtQntt -= invntrList.get(i).getInvntrQntt();
								invntrList.get(i).setInvntrQntt(0);
								/** 쓰고도 남을 경우 **/
							} else if (flag < 0) {
								spmtQntt = 0;
								invntrList.get(i).setInvntrQntt(invntrList.get(i).getInvntrQntt() - spmtQntt);
								/** 출하 수량과 재고수량이 같을떄 **/
							} else if (flag == 0) {
								spmtQntt = 0;
								invntrList.get(i).setInvntrQntt(0);
							}
						}
					}
					/** 수정된 재고정보 업데이트 반영 **/
					for (GdsInvntrVO updateVo : invntrList) {
						updateVo.setSysLastChgUserId(userId);
						updateVo.setSysLastChgPrgrmId(prgrmId);
						int updateCnt = gdsInvntrMapper.updateGdsInvntr(updateVo);
						if (updateCnt == 0) {
							HashMap<String, Object> comResult = new HashMap<>();
							comResult.put(ComConstants.PROP_RESULT_CODE, ComConstants.RESULT_STATUS_ERROR);
							comResult.put(ComConstants.PROP_RESULT_MESSAGE, "재고 업데이트에 실패했습니다.");
							throw new EgovBizException(getMessageForMap(comResult));
						}
					}
				}
				/** 재고확인 및 출하반영 E **/
				/** 출하실적 상세 생성 **/
				item.setPckgno(pckgNo);
				item.setPckgSn(0);
				item.setSpmtSn(spmtSn);
				item.setSpmtno(spmtno);
				/** insert 공통정보 **/
				item.setSysFrstInptUserId(userId);
				item.setSysFrstInptPrgrmId(prgrmId);
				item.setSysLastChgUserId(userId);
				item.setSysLastChgPrgrmId(prgrmId);

				int insertSpmtCnt = spmtPrfmncMapper.insertSpmtPrfmncDtl(item);
				if (insertSpmtCnt == 0) {
					HashMap<String, Object> comResult = new HashMap<>();
					comResult.put(ComConstants.PROP_RESULT_CODE, ComConstants.RESULT_STATUS_ERROR);
					comResult.put(ComConstants.PROP_RESULT_MESSAGE, "출하 실적등록에 실패했습니다.");
					throw new EgovBizException(getMessageForMap(comResult));
				}
				/** 출하 순번++ **/
				spmtSn++;
			}
			/** return 용 spmtNo **/
			spmtIdx++;
		}
		result.put(ComConstants.PROP_RESULT_LIST,spmtnos);
		return result;
	}
}
