package com.at.apcss.am.spmt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsGdsService;
import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.SpmtPckgUnitService;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
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
	public HashMap<String, Object> insertSpmtPrfmncByPckgList(SpmtPrfmncComVO spmtPrfmncComVO) throws Exception {
		HashMap<String, Object> rtnObj;

		String apcCd = spmtPrfmncComVO.getApcCd();
		String spmtYmd = spmtPrfmncComVO.getSpmtYmd();

		List<SpmtPrfmncVO> spmtPrfmncList = spmtPrfmncComVO.getSpmtPrfmncList();

		if (spmtPrfmncList == null || spmtPrfmncList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하대상");
		}

		List<GdsInvntrVO> invntrList = new ArrayList<>();
		
		// 상품재고 배분
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
			
			String pckgno = spmt.getPckgno();
			int pckgSn = spmt.getPckgSn();
			
			if (StringUtils.hasText(pckgno) && pckgSn > 0) {
				GdsInvntrVO gdsVO = new GdsInvntrVO();
				gdsVO.setApcCd(apcCd);
				gdsVO.setPckgno(pckgno);
				gdsVO.setPckgSn(pckgSn);
				
				GdsInvntrVO orgnInv = gdsInvntrService.selectGdsInvntr(gdsVO);
				
				if (orgnInv == null 
						|| ComConstants.CON_YES.equals(orgnInv.getDelYn())
						|| orgnInv.getInvntrQntt() < spmtQntt) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하가능재고");
				}
				
				if (!spmtPckgUnitCd.equals(orgnInv.getSpmtPckgUnitCd())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "출하상품||재고상품");
				}
				
				int invRmnQntt = orgnInv.getInvntrQntt();
				double invRmnWght = orgnInv.getInvntrWght();
				
				int qntt = 0;
				double wght = 0;
				
				if (invRmnQntt > spmtQntt) {
					qntt = spmtQntt;
				} else {
					qntt = invRmnQntt;
				}
				
				wght = ComUtil.round(qntt * spcfctWght, 3);
				spmtQntt -= qntt;
				//spmtWght -= wght;
				
				GdsInvntrVO gdsInv = new GdsInvntrVO();
				BeanUtils.copyProperties(spmtPrfmncComVO, gdsInv);
				BeanUtils.copyProperties(orgnInv, gdsInv,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
				
				if (wght > invRmnWght) {
					wght = invRmnWght;
				}
				
				gdsInv.setSpmtQntt(qntt);
				gdsInv.setSpmtWght(wght);
				
				invntrList.add(gdsInv);
				
			} else {
				
				List<SpmtGdsVO> spmtGdsList = spmt.getSpmtGdsList();
				
				if (spmtGdsList == null || spmtGdsList.isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품내역");
				}
				
				GdsInvntrVO gdsVO = new GdsInvntrVO();
				gdsVO.setApcCd(apcCd);
				gdsVO.setSpmtGdsList(spmtGdsList);
				
				List<GdsInvntrVO> gdsInvntrList = gdsInvntrService.selectSpmtGdsInvntrListByPckgno(gdsVO);
				
				if (gdsInvntrList.isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하가능재고");
				}
				
				for ( GdsInvntrVO orgnInv : gdsInvntrList ) {
					
					if (spmtQntt <= 0) {
						break;
					}
					

					if (!spmtPckgUnitCd.equals(orgnInv.getSpmtPckgUnitCd())) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "출하상품||재고상품");
					}
					
					int invRmnQntt = orgnInv.getInvntrQntt();
					double invRmnWght = orgnInv.getInvntrWght();
					
					int qntt = 0;
					double wght = 0;
					
					if (invRmnQntt > spmtQntt) {
						qntt = spmtQntt;
					} else {
						qntt = invRmnQntt;
					}
					
					wght = ComUtil.round(qntt * spcfctWght, 3);
					spmtQntt -= qntt;
					//spmtWght -= wght;
					
					GdsInvntrVO gdsInv = new GdsInvntrVO();
					BeanUtils.copyProperties(spmtPrfmncComVO, gdsInv);
					BeanUtils.copyProperties(orgnInv, gdsInv,
							ComConstants.PROP_SYS_FRST_INPT_DT,
							ComConstants.PROP_SYS_FRST_INPT_USER_ID,
							ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
							ComConstants.PROP_SYS_LAST_CHG_DT,
							ComConstants.PROP_SYS_LAST_CHG_USER_ID,
							ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
					
					if (wght > invRmnWght) {
						wght = invRmnWght;
					}
					
					gdsInv.setSpmtQntt(qntt);
					gdsInv.setSpmtWght(wght);
					
					invntrList.add(gdsInv);
				}
			}
			
			// 품목
			//String itemCd = ComUtil.nullToEmpty(spmt.getItemCd());
			// 품종
			//String vrtyCd = ComUtil.nullToEmpty(spmt.getVrtyCd());
			// 규격
			//String spcfctCd = ComUtil.nullToEmpty(spmt.getSpcfctCd());
			// 등급
			//String gdsGrd = ComUtil.nullToEmpty(spmt.getGdsGrd());
			// 상품
			//String spmtPckgUnitCd = ComUtil.nullToEmpty(spmt.getSpmtPckgUnitCd());
			// 창고
			//String warehouseSeCd = ComUtil.nullToEmpty(spmt.getWarehouseSeCd());

			// 생산자
			//String prdcrCd = ComUtil.nullToEmpty(spmt.getPrdcrCd());
			
			//double spmtWght = ComUtil.round(spmtQntt * spcfctWght, 3);
			
			// 재고조회
			
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
							insertGdsInvntrVO.setPckgYmd(spmtPrfmncVO.getSpmtYmd());

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
						insertGdsInvntrVO.setPckgYmd(spmtPrfmncVO.getSpmtYmd());

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


}
