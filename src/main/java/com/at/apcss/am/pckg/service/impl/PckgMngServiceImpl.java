package com.at.apcss.am.pckg.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.InvntrDtlVO;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.pckg.service.PckgCmndService;
import com.at.apcss.am.pckg.service.PckgInptService;
import com.at.apcss.am.pckg.service.PckgMngService;
import com.at.apcss.am.pckg.service.PckgPrfmncService;
import com.at.apcss.am.pckg.vo.PckgInptVO;
import com.at.apcss.am.pckg.vo.PckgMngVO;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : PckgInptServiceImpl.java
 * @Description : 포장투입 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("pckgMngService")
public class PckgMngServiceImpl extends BaseServiceImpl implements PckgMngService {


	@Resource(name = "pckgCmndService")
	private PckgCmndService pckgCmndService;

	@Resource(name = "pckgInptService")
	private PckgInptService pckgInptService;

	@Resource(name = "pckgPrfmncService")
	private PckgPrfmncService pckgPrfmncService;

	@Resource(name = "sortInvntrService")
	private SortInvntrService sortInvntrService;	// 선별재고

	@Resource(name = "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;	// 포장번호 발번용

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;	// 마감여부 확인용


	@Override
	public HashMap<String, Object> insertPckgInpt(PckgMngVO pckgMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		List<PckgInptVO> inptList = pckgMngVO.getPckgInptList();

		// 선별투입 등록 list
		List<PckgInptVO> pckgInptList = new ArrayList<>();

		for ( PckgInptVO inpt : inptList ) {

			// 선별재고 확인
			SortInvntrVO invntrParam = new SortInvntrVO();
			invntrParam.setApcCd(pckgMngVO.getApcCd());
			invntrParam.setSortno(inpt.getSortno());
			invntrParam.setSortSn(inpt.getSortSn());

			SortInvntrVO invntrInfo = sortInvntrService.selectSortInvntr(invntrParam);
			if (invntrInfo == null
					|| !StringUtils.hasText(invntrInfo.getSortno())
					|| ComConstants.CON_YES.equals(invntrInfo.getDelYn())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별재고정보");	// W0005	{0}이/가 없습니다.
			}

			if (!StringUtils.hasText(inpt.getFcltCd())) {
				ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "포장기");	// W0005	{0}이/가 없습니다.
			}

			if (inpt.getQntt() <= 0) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "투입수량");	// W0005	{0}이/가 없습니다.
			}

			if (inpt.getQntt() > invntrInfo.getInvntrQntt()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고수량||투입수량");	// W0008	{0} 보다 {1}이/가 큽니다.
			}

			PckgInptVO inptVO = new PckgInptVO();
			BeanUtils.copyProperties(pckgMngVO, inptVO);
			BeanUtils.copyProperties(inpt, inptVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			// 투입실적 항목 set
			pckgInptList.add(inptVO);
		}

		for ( PckgInptVO inptVO : pckgInptList ) {

			// 투입등록
			rtnObj = pckgInptService.insertPckgInpt(inptVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 원물재고 투입진행량 update
			SortInvntrVO invntrVO = new SortInvntrVO();
			BeanUtils.copyProperties(inptVO, invntrVO);
			invntrVO.setInptPrgrsQntt(inptVO.getQntt());
			invntrVO.setInptPrgrsWght(inptVO.getWght());

			rtnObj = sortInvntrService.updateInvntrPckgInpt(invntrVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	
	@Override
	public HashMap<String, Object> insertPckgRslt(PckgMngVO pckgMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		String apcCd = pckgMngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String pckgno = pckgMngVO.getPckgno();
		String pckgYmd = pckgMngVO.getPckgYmd();
		
		logger.debug("@@@@pckgYmd: {}", pckgYmd);
		
		if (!StringUtils.hasText(pckgno)) {
			pckgno = cmnsTaskNoService.selectPckgno(apcCd, pckgYmd);
		}

		// 실적등록 대상정보 목록
		List<PckgPrfmncVO> prfmncList = pckgMngVO.getPckgPrfmncList();
		// 실적등록 대상선별재고 목록
		List<SortInvntrVO> invntrList = pckgMngVO.getSortInvntrList();

		List<SortInvntrVO> sortInvntrVOList = new ArrayList<>();

		if (invntrList == null || invntrList.isEmpty()) {
			
			List<InvntrDtlVO> excldInvntrList = new ArrayList<>();
			invntrList = new ArrayList<SortInvntrVO>();
			
			// 생산자, 품목, 품종에 따른 원물재고를 가져온다.
			// 투입진행 중 건은 제외한다.
			
			labelLoopPckg:
				for ( PckgPrfmncVO pckg : prfmncList ) {
					
					pckg.setRmnQntt(pckg.getPckgQntt());
					pckg.setRmnWght(pckg.getPckgWght());
					
					// 품목
					String itemCd = ComUtil.nullToEmpty(pckg.getItemCd());
					// 품종
					String vrtyCd = ComUtil.nullToEmpty(pckg.getVrtyCd());
					// 규격
					String spcfctCd = ComUtil.nullToEmpty(pckg.getSpcfctCd());
					// 생산자
					String prdcrCd = ComUtil.nullToEmpty(pckg.getPrdcrCd());
					// 창고
					String warehouseSeCdFrom = ComUtil.nullToEmpty(pckg.getWarehouseSeCdFrom());
					
					int pckgQntt = pckg.getRmnQntt();
					double pckgWght = pckg.getRmnWght();
					
					for ( SortInvntrVO orgnInv : sortInvntrVOList ) {
						
						int invRmnQntt = orgnInv.getRmnQntt();
						double invRmnWght = orgnInv.getRmnWght();
						
						if (invRmnWght <= 0) {
							continue;
						}
						
						// 재고정보 확인 중량기준으로 
						if (
							itemCd.equals(orgnInv.getItemCd())
							&& vrtyCd.equals(orgnInv.getVrtyCd())
							//&& spcfctCd.equals(orgnInv.getSpcfctCd())
							//&& prdcrCd.equals(orgnInv.getPrdcrCd())
							&& warehouseSeCdFrom.equals(orgnInv.getWarehouseSeCd())) {
							
							if (pckgWght > invRmnWght) {
								pckgQntt -= invRmnQntt;
								pckgWght -= invRmnWght;
								
								orgnInv.setRmnQntt(0);
								orgnInv.setRmnWght(0);
								
								orgnInv.setInptQntt(orgnInv.getInptQntt() + invRmnQntt);
								orgnInv.setInptWght(orgnInv.getInptWght() + invRmnWght);
								
							} else {
								invRmnQntt -= pckgQntt;
								invRmnWght -= pckgWght;
								orgnInv.setRmnQntt(invRmnQntt);
								orgnInv.setRmnWght(invRmnWght);
								
								orgnInv.setInptQntt(orgnInv.getInptQntt() + pckgQntt);
								orgnInv.setInptWght(orgnInv.getInptWght() + pckgWght);
								
								pckgQntt = 0;
								pckgWght = 0;
							}
							
							pckg.setRprsPrdcrCd(orgnInv.getRprsPrdcrCd());
							
							if (pckgWght <= 0) {
								// 선별재고가 선정이 되었으므로 통과
								continue labelLoopPckg;
							}
						}
					}
					
					// excldWrhsnoList	rawMtrInvntrVOList
					// 원물재고 미매칭 시 원물재고 읽어오기 call
					if (pckgWght > 0) {
						
						SortInvntrVO param = new SortInvntrVO();
						
						param.setApcCd(apcCd);
						param.setItemCd(itemCd);
						param.setVrtyCd(vrtyCd);
						param.setSpcfctCd(spcfctCd);
						param.setRprsPrdcrCd(prdcrCd);						
						param.setWarehouseSeCd(warehouseSeCdFrom);
						param.setExcldInvntrList(excldInvntrList);
						param.setPagingYn(ComConstants.CON_YES);
						param.setCurrentPageNo(1);
						param.setRecordCountPerPage(100);
						
						List<SortInvntrVO> invntrForPckgList = sortInvntrService.selectSortInvntrListForPckg(param);
						
						if (invntrForPckgList == null || invntrForPckgList.isEmpty()) {
							return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "포장가능재고");
						}
						
						// 재고정보 조회
						for ( SortInvntrVO orgnInv : invntrForPckgList ) {
							
							int invRmnQntt = orgnInv.getInvntrQntt();
							double invRmnWght = orgnInv.getInvntrWght();
							
							if (invRmnWght <= 0) {
								continue;
							}
							
							if (pckgWght > invRmnWght) {
								pckgQntt -= invRmnQntt;
								pckgWght -= invRmnWght;
								
								orgnInv.setRmnQntt(0);
								orgnInv.setRmnWght(0);
								
								orgnInv.setInptQntt(invRmnQntt);
								orgnInv.setInptWght(invRmnWght);								
							} else {
								invRmnQntt -= pckgQntt;
								invRmnWght -= pckgWght;
								orgnInv.setRmnQntt(invRmnQntt);
								orgnInv.setRmnWght(invRmnWght);
								
								orgnInv.setInptQntt(pckgQntt);
								orgnInv.setInptWght(pckgWght);
								
								pckgQntt = 0;
								pckgWght = 0;
							}
							
							SortInvntrVO invntrVO = new SortInvntrVO();
							BeanUtils.copyProperties(pckgMngVO, invntrVO);
							BeanUtils.copyProperties(orgnInv, invntrVO,
									ApcConstants.PROP_APC_CD,
									ComConstants.PROP_SYS_FRST_INPT_DT,
									ComConstants.PROP_SYS_FRST_INPT_USER_ID,
									ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
									ComConstants.PROP_SYS_LAST_CHG_DT,
									ComConstants.PROP_SYS_LAST_CHG_USER_ID,
									ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
							
							invntrVO.setPckgQntt(0);
							invntrVO.setPckgWght(0);
							invntrVO.setRmrk(ComConstants.CON_BLANK);
							
							//invntrVO.setPrdcrCd(prdcrCd);
							
							sortInvntrVOList.add(invntrVO);
							
							InvntrDtlVO invntrDtlVO = new InvntrDtlVO();
							invntrDtlVO.setInvntrno(invntrVO.getSortno());
							invntrDtlVO.setInvntrSn(invntrVO.getSortSn());
							
							excldInvntrList.add(invntrDtlVO);
							
							pckg.setRprsPrdcrCd(orgnInv.getRprsPrdcrCd());
							
							if (pckgWght <= 0) {
								// 선별재고가 선정이 되었으므로 통과
								continue labelLoopPckg;
							}
						}
					}
				}
		} else {
			// 선별재고 >> 포장실적 정보 set	// 재고배분
			for ( SortInvntrVO orgnInv : invntrList ) {

				SortInvntrVO invntrVO = new SortInvntrVO();
				BeanUtils.copyProperties(pckgMngVO, invntrVO);
				BeanUtils.copyProperties(orgnInv, invntrVO,
						ApcConstants.PROP_APC_CD,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

				SortInvntrVO invntrInfo = sortInvntrService.selectSortInvntr(invntrVO);

				if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getSortno())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별재고");
				}

				if (invntrVO.getInptWght() > invntrInfo.getInvntrWght()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||포장투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
				}

				invntrVO.setRprsPrdcrCd(invntrInfo.getRprsPrdcrCd());
				invntrVO.setItemCd(invntrInfo.getItemCd());
				invntrVO.setVrtyCd(invntrInfo.getVrtyCd());
				invntrVO.setSpcfctCd(invntrInfo.getSpcfctCd());
				invntrVO.setWarehouseSeCd(invntrInfo.getWarehouseSeCd());
				invntrVO.setGdsSeCd(invntrInfo.getGdsSeCd());
				invntrVO.setWrhsSeCd(invntrInfo.getWrhsSeCd());
				invntrVO.setInvntrQntt(invntrInfo.getInvntrQntt());
				invntrVO.setInvntrWght(invntrInfo.getInvntrWght());
				invntrVO.setPrdctnYr(invntrInfo.getPrdctnYr());
				
				invntrVO.setPckgQntt(0);
				invntrVO.setPckgWght(0);

				sortInvntrVOList.add(invntrVO);
			}
		}
		
		for ( SortInvntrVO inv : sortInvntrVOList ) {

			String sortno = inv.getSortno();
			int sortSn = inv.getSortSn();
			String rprsPrdcrCd = inv.getRprsPrdcrCd();
			String itemCd = inv.getItemCd();
			String vrtyCd = inv.getVrtyCd();
			//String spcfctCd = inv.getSpcfctCd();
			String gdsSeCd = inv.getGdsSeCd();
			String wrhsSeCd = inv.getWrhsSeCd();
			String prdctnYr = inv.getPrdctnYr();
			
			// 지정 투입수량, 투입중량
			//int inptQntt = inv.getInptQntt();
			double inptWght = inv.getInptWght();

			int pckgQntt = inv.getPckgQntt();
			double pckgWght = inv.getPckgWght();

			for ( PckgPrfmncVO pckg : prfmncList ) {
				if (StringUtils.hasText(pckg.getSortno())) {
					continue;
				}

				if (inptWght - pckgWght < pckg.getPckgWght()) {
					continue;
				}

				pckg.setSortno(sortno);
				pckg.setSortSn(sortSn);
				pckg.setRprsPrdcrCd(rprsPrdcrCd);
				pckg.setItemCd(itemCd);
				pckg.setVrtyCd(vrtyCd);
				//pckg.setSpcfctCd(spcfctCd);
				pckg.setGdsSeCd(gdsSeCd);
				pckg.setWrhsSeCd(wrhsSeCd);
				pckg.setPrdctnYr(prdctnYr);

				pckgQntt += pckg.getPckgQntt();
				pckgWght += pckg.getPckgWght();
			}

			inv.setPckgno(pckgno);
			inv.setInptYmd(pckgYmd);
			inv.setPckgQntt(pckgQntt);
			inv.setPckgWght(pckgWght);
		}

		// 포장투입실적 등록 (투입실적 여부 확인 후 등록)
		List<PckgInptVO> pckgInptVOList = new ArrayList<>();
		for ( SortInvntrVO inv : sortInvntrVOList ) {

			PckgInptVO pckgInptVO = new PckgInptVO();
			BeanUtils.copyProperties(inv, pckgInptVO);
			
			logger.debug("inptYmd: {}", inv.getInptYmd());
			logger.debug("(inp)inptYmd: {}", pckgInptVO.getInptYmd());
			
			pckgInptVO.setQntt(inv.getInptQntt());
			pckgInptVO.setWght(inv.getInptWght());

			// 투입실적 항목 set
			pckgInptVOList.add(pckgInptVO);
		}

		rtnObj = pckgInptService.insertPckgInptList(pckgInptVOList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 선별재고정보 update
		for ( SortInvntrVO inv : sortInvntrVOList ) {
			rtnObj = sortInvntrService.updateInvntrPckgPrfmnc(inv);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		// 포장실적 등록
		List<PckgPrfmncVO> pckgPrfmncVOList = new ArrayList<>();

		for ( PckgPrfmncVO prfmncInfo : prfmncList ) {
			PckgPrfmncVO prfmncVO = new PckgPrfmncVO();
			BeanUtils.copyProperties(pckgMngVO, prfmncVO);
			BeanUtils.copyProperties(prfmncInfo, prfmncVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			prfmncVO.setPckgno(pckgno);
			pckgPrfmncVOList.add(prfmncVO);
		}

		rtnObj = pckgPrfmncService.insertPckgPrfmncList(pckgPrfmncVOList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}
	

	@Override
	public HashMap<String, Object> insertImportPckgRslt(PckgMngVO pckgMngVO) throws Exception {
		
		List<PckgMngVO> pckgMngList = new ArrayList<>();
		
		List<PckgPrfmncVO> pckgList = pckgMngVO.getPckgPrfmncList();
		
		if (pckgList == null || pckgList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등록대상");
		}
		
		// 포장일자별, 품목, 품종, 규격별 실적 분리
		for ( PckgPrfmncVO pckg : pckgList ) {
			
			pckg.setPckgYmd(ComUtil.nullToEmpty(pckg.getPckgYmd()).replace(ComConstants.CON_DASH, ComConstants.CON_BLANK));
			
			boolean needAdd = true;
			
			PckgMngVO mngVO = null;
			List<PckgPrfmncVO> pckgPrfmncList = new ArrayList<>();
			
			String pckgKey = pckg.getPckgYmd() 
						+ pckg.getItemCd() 
						+ pckg.getVrtyCd() 
						+ pckg.getSpcfctCd()
						+ pckg.getSpmtPckgUnitCd();  
			logger.debug("xxx@@pckgKey : {}", pckgKey);
			
			for ( PckgMngVO chkMngVO : pckgMngList ) {
				if ( ComUtil.nullToEmpty(pckgKey).equals(chkMngVO.getPckgKey())) {
					mngVO = chkMngVO;
					pckgPrfmncList = chkMngVO.getPckgPrfmncList();
					if (pckgPrfmncList == null) {
						pckgPrfmncList = new ArrayList<>();
					}
					needAdd = false;
					break;
				}
			}
			
			if (mngVO == null) {
				mngVO = new PckgMngVO();
				BeanUtils.copyProperties(pckgMngVO, mngVO);
				mngVO.setPckgKey(pckgKey);
				mngVO.setPckgYmd(pckg.getPckgYmd());
				logger.debug("xxx@@pckgYmd : {}", mngVO.getPckgYmd());
			}
			
			pckgPrfmncList.add(pckg);
			mngVO.setPckgPrfmncList(pckgPrfmncList);
			if (needAdd) {
				pckgMngList.add(mngVO);
			}
		}
		
		for ( PckgMngVO mngVO : pckgMngList ) {
			HashMap<String, Object> rtnObj = insertPckgRslt(mngVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}
		
		return null;
	}



	
	
	@Override
	public HashMap<String, Object> insertPckgPrfmnc(PckgMngVO pckgMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		String apcCd = pckgMngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String pckgno = pckgMngVO.getPckgno();
		String pckgYmd = pckgMngVO.getPckgYmd();

		if (!StringUtils.hasText(pckgno)) {
			pckgno = cmnsTaskNoService.selectPckgno(apcCd, pckgYmd);
		}

		// 실적등록 대상정보 목록
		List<PckgPrfmncVO> prfmncList = pckgMngVO.getPckgPrfmncList();
		// 실적등록 대상선별재고 목록
		List<SortInvntrVO> invntrList = pckgMngVO.getSortInvntrList();

		List<SortInvntrVO> sortInvntrVOList = new ArrayList<>();

		// 선별재고 >> 포장실적 정보 set	// 재고배분
		for ( SortInvntrVO orgnInv : invntrList ) {

			SortInvntrVO invntrVO = new SortInvntrVO();
			BeanUtils.copyProperties(pckgMngVO, invntrVO);
			BeanUtils.copyProperties(orgnInv, invntrVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			SortInvntrVO invntrInfo = sortInvntrService.selectSortInvntr(invntrVO);

			if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getSortno())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별재고");
			}

			if (invntrVO.getInptWght() > invntrInfo.getInvntrWght()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||포장투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
			}

			invntrVO.setRprsPrdcrCd(invntrInfo.getRprsPrdcrCd());
			invntrVO.setItemCd(invntrInfo.getItemCd());
			invntrVO.setVrtyCd(invntrInfo.getVrtyCd());
			invntrVO.setSpcfctCd(invntrInfo.getSpcfctCd());
			invntrVO.setWarehouseSeCd(invntrInfo.getWarehouseSeCd());
			invntrVO.setGdsSeCd(invntrInfo.getGdsSeCd());
			invntrVO.setWrhsSeCd(invntrInfo.getWrhsSeCd());
			invntrVO.setInvntrQntt(invntrInfo.getInvntrQntt());
			invntrVO.setInvntrWght(invntrInfo.getInvntrWght());

			invntrVO.setPckgQntt(0);
			invntrVO.setPckgWght(0);

			sortInvntrVOList.add(invntrVO);
		}

		for ( SortInvntrVO inv : sortInvntrVOList ) {

			String sortno = inv.getSortno();
			int sortSn = inv.getSortSn();
			String rprsPrdcrCd = inv.getRprsPrdcrCd();
			String itemCd = inv.getItemCd();
			String vrtyCd = inv.getVrtyCd();
			//String spcfctCd = inv.getSpcfctCd();
			String gdsSeCd = inv.getGdsSeCd();
			String wrhsSeCd = inv.getWrhsSeCd();

			// 지정 투입수량, 투입중량
			//int inptQntt = inv.getInptQntt();
			double inptWght = inv.getInptWght();

			int pckgQntt = inv.getPckgQntt();
			double pckgWght = inv.getPckgWght();

			for ( PckgPrfmncVO pckg : prfmncList ) {
				if (StringUtils.hasText(pckg.getSortno())) {
					continue;
				}

				if (inptWght - pckgWght < pckg.getPckgWght()) {
					continue;
				}

				pckg.setSortno(sortno);
				pckg.setSortSn(sortSn);
				pckg.setRprsPrdcrCd(rprsPrdcrCd);
				pckg.setItemCd(itemCd);
				pckg.setVrtyCd(vrtyCd);
				//pckg.setSpcfctCd(spcfctCd);
				pckg.setGdsSeCd(gdsSeCd);
				pckg.setWrhsSeCd(wrhsSeCd);

				pckgQntt += pckg.getPckgQntt();
				pckgWght += pckg.getPckgWght();
			}

			inv.setPckgno(pckgno);
			inv.setInptYmd(pckgYmd);
			inv.setPckgQntt(pckgQntt);
			inv.setPckgWght(pckgWght);
		}

		// 포장투입실적 등록 (투입실적 여부 확인 후 등록)
		List<PckgInptVO> pckgInptVOList = new ArrayList<>();
		for ( SortInvntrVO inv : sortInvntrVOList ) {

			PckgInptVO pckgInptVO = new PckgInptVO();
			BeanUtils.copyProperties(inv, pckgInptVO);

			pckgInptVO.setQntt(inv.getInptQntt());
			pckgInptVO.setWght(inv.getInptWght());

			// 투입실적 항목 set
			pckgInptVOList.add(pckgInptVO);
		}

		rtnObj = pckgInptService.insertPckgInptList(pckgInptVOList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 선별재고정보 update
		for ( SortInvntrVO inv : sortInvntrVOList ) {
			rtnObj = sortInvntrService.updateInvntrPckgPrfmnc(inv);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		// 포장실적 등록
		List<PckgPrfmncVO> pckgPrfmncVOList = new ArrayList<>();

		for ( PckgPrfmncVO prfmncInfo : prfmncList ) {
			PckgPrfmncVO prfmncVO = new PckgPrfmncVO();
			BeanUtils.copyProperties(pckgMngVO, prfmncVO);
			BeanUtils.copyProperties(prfmncInfo, prfmncVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			prfmncVO.setPckgno(pckgno);
			pckgPrfmncVOList.add(prfmncVO);
		}

		rtnObj = pckgPrfmncService.insertPckgPrfmncList(pckgPrfmncVOList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}


	@Override
	public HashMap<String, Object> insertPckgPrfmncAuto(PckgMngVO pckgMngVO) throws Exception {

		return null;
	}


	@Override
	public HashMap<String, Object> deletePckgPrfmnc(PckgMngVO pckgMngVO) throws Exception {

		// apc 코드와 포장번호로 포장실적, 투입실적, 상품재고 삭제 : delYn 'Y'

		HashMap<String, Object> rtnObj = new HashMap<>();

		// validation check
		String apcCd = pckgMngVO.getApcCd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String pckgno = pckgMngVO.getPckgno();
		if (!StringUtils.hasText(pckgno)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "포장번호");
		}

		PckgPrfmncVO prfmncParamVO = new PckgPrfmncVO();
		prfmncParamVO.setApcCd(apcCd);
		prfmncParamVO.setPckgno(pckgno);

		List<PckgPrfmncVO> prfmncList = pckgPrfmncService.selectPckgPrfmncList(prfmncParamVO);

		if (prfmncList == null || prfmncList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "포장실적");
		}

		// 투입실적 확인
		PckgInptVO pckgInptParamVO = new PckgInptVO();
		pckgInptParamVO.setApcCd(apcCd);
		pckgInptParamVO.setPckgno(pckgno);

		List<PckgInptVO> inptList = pckgInptService.selectPckgInptList(pckgInptParamVO);
		if (inptList == null || inptList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "투입실적");
		}

		List<PckgPrfmncVO> pckgPrfmncVOList = new ArrayList<>();
		for ( PckgPrfmncVO pckg : prfmncList ) {

			// 마감확인
			String pckgYmd = pckg.getPckgYmd();
			String ddlnYn = cmnsValidationService.selectChkDdlnYn(apcCd, pckgYmd);
			if (!ComConstants.CON_NONE.equals(ddlnYn)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_ALEADY_CLOSE, "상품재고");
			}

			// 포장량 재고량 변경 확인
			if (pckg.getInvntrQntt() < pckg.getPckgQntt()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||포장량");		// W0008	{0} 보다 {1}이/가 큽니다.
			}

			PckgPrfmncVO prfmncVO = new PckgPrfmncVO();
			BeanUtils.copyProperties(pckgMngVO, prfmncVO);
			BeanUtils.copyProperties(pckg, prfmncVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			pckgPrfmncVOList.add(prfmncVO);
		}

		// 처리

		// 재고삭제 + 포장실적 삭제
		rtnObj = pckgPrfmncService.deletePckgPrfmncList(pckgPrfmncVOList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 투입실적 삭제 + 선별재고 갱신
		for ( PckgInptVO inpt : inptList ) {

			// 투입실적 삭제
			PckgInptVO pckgInptVO = new PckgInptVO();
			BeanUtils.copyProperties(pckgMngVO, pckgInptVO);
			pckgInptVO.setSortno(inpt.getSortno());
			pckgInptVO.setSortSn(inpt.getSortSn());
			pckgInptVO.setInptSn(inpt.getInptSn());

			rtnObj = pckgInptService.deletePckgInpt(pckgInptVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 선별재고 갱신
			SortInvntrVO invntrVO = new SortInvntrVO();
			BeanUtils.copyProperties(pckgMngVO, invntrVO);
			invntrVO.setSortno(inpt.getSortno());
			invntrVO.setSortSn(inpt.getSortSn());

			invntrVO.setInptQntt(inpt.getQntt());
			invntrVO.setInptWght(inpt.getWght());

			rtnObj = sortInvntrService.updateInvntrPckgPrfmncCncl(invntrVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}


	@Override
	public HashMap<String, Object> deletePckgPrfmncList(PckgMngVO pckgMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		List<PckgPrfmncVO> pckgList = pckgMngVO.getPckgPrfmncList();

		if (pckgList == null || pckgList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "삭제대상");
		}

		for ( PckgPrfmncVO pckg : pckgList ) {

			PckgMngVO cnclVO = new PckgMngVO();
			BeanUtils.copyProperties(pckgMngVO, cnclVO);
			cnclVO.setPckgno(pckg.getPckgno());
			rtnObj = deletePckgPrfmnc(cnclVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}


	@Override
	public HashMap<String, Object> updatePckgInpt(PckgMngVO pckgMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> updatePckgPrfmnc(PckgMngVO pckgMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> deletePckgInpt(PckgMngVO pckgMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		List<PckgInptVO> inptList = pckgMngVO.getPckgInptList();

		// 선별투입 삭제 list
		List<PckgInptVO> pckgInptList = new ArrayList<>();

		for ( PckgInptVO inpt : inptList ) {

			inpt.setApcCd(pckgMngVO.getApcCd());

			// 투입실적 확인
			PckgInptVO pckgInptInfo = pckgInptService.selectPckgInpt(inpt);
			if (pckgInptInfo == null
					|| !StringUtils.hasText(pckgInptInfo.getSortno())
					|| ComConstants.CON_YES.equals(pckgInptInfo.getDelYn())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "포장투입정보");	// W0005	{0}이/가 없습니다.
			}

			if (StringUtils.hasText(pckgInptInfo.getPckgno())) {
				// TODO 테이블 ALTER 후 진행
				return ComUtil.getResultMap(ComConstants.MSGCD_TARGET_EXIST, "포장실적");
			}

			inpt.setQntt(pckgInptInfo.getQntt());
			inpt.setWght(pckgInptInfo.getWght());

			PckgInptVO inptVO = new PckgInptVO();
			BeanUtils.copyProperties(pckgMngVO, inptVO);
			BeanUtils.copyProperties(inpt, inptVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			// 투입실적 항목 set
			pckgInptList.add(inptVO);
		}

		for ( PckgInptVO inptVO : pckgInptList ) {

			// 선별재고 투입진행량 update
			SortInvntrVO invntrVO = new SortInvntrVO();
			BeanUtils.copyProperties(inptVO, invntrVO);
			invntrVO.setInptPrgrsQntt(inptVO.getQntt());
			invntrVO.setInptPrgrsWght(inptVO.getWght());

			rtnObj = sortInvntrService.deleteInvntrPckgInpt(invntrVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 투입 취소
			rtnObj = pckgInptService.deletePckgInpt(inptVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}




}
