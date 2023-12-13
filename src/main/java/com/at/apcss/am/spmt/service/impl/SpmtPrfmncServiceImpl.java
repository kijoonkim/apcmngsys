package com.at.apcss.am.spmt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsGdsService;
import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.service.PltWrhsSpmtService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;
import com.at.apcss.am.sls.service.SlsPrfmncService;
import com.at.apcss.am.sls.vo.SlsPrfmncVO;
import com.at.apcss.am.spmt.mapper.SpmtPrfmncMapper;
import com.at.apcss.am.spmt.service.SpmtPrfmncService;
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

								if(resultMap != null) {
									throw new EgovBizException(getMessageForMap(resultMap));
								}
								remainderSpmtQntt = remainderSpmtQntt - spmtPrfmncVO.getSpmtQntt();
								remainderSpmtWght = remainderSpmtWght - spmtPrfmncVO.getSpmtWght();

							}else {

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

				}else {
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
				pltWrhsSpmtVO.setPrcsno(spmtno);
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

			if(resultMap != null) {
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

}
