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
import com.at.apcss.am.invntr.service.SortInvntrService;
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


	@Override
	public HashMap<String, Object> insertPckgInpt(PckgMngVO pckgMngVO) throws Exception {
		// TODO Auto-generated method stub
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
				return ComUtil.getResultMap("W0005", "선별재고");
			}

			if (invntrVO.getInptWght() > invntrInfo.getInvntrWght()) {
				return ComUtil.getResultMap("W0008", "재고량||포장투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
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
			String spcfctCd = inv.getSpcfctCd();
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
				pckg.setSpcfctCd(spcfctCd);
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

			// pckgInptVO.setQntt(inv.getInptQntt());
			// pckgInptVO.setWght(inv.getInptWght());

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
			HashMap<String, Object> rtnMap = sortInvntrService.updateInvntrPckgPrfmnc(inv);
			if (rtnMap != null) {
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> deletePckgPrfmnc(PckgMngVO pckgMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
