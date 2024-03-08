package com.at.apcss.am.wrhs.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.wrhs.service.RawMtrWrhsMngService;
import com.at.apcss.am.wrhs.service.RawMtrWrhsService;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsMngVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsSmmryVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : RawMtrWrhsMngServiceImpl.java
 * @Description : 원물입고 관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("rawMtrWrhsMngService")
public class RawMtrWrhsMngServiceImpl extends BaseServiceImpl implements RawMtrWrhsMngService {

	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name="rawMtrWrhsService")
	private RawMtrWrhsService rawMtrWrhsService;

	@Resource(name="rawMtrInvntrService")
	private RawMtrInvntrService rawMtrInvntrService;

	@Resource(name="cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Override
	public HashMap<String, Object> insertRawMtrRePrcs(RawMtrWrhsMngVO rawMtrWrhsMngVO) throws Exception {

		// 원물입고 재처리
		HashMap<String, Object> rtnObj = new HashMap<>();

		String apcCd = rawMtrWrhsMngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String wrhsYmd = rawMtrWrhsMngVO.getWrhsYmd();
		if (!StringUtils.hasText(wrhsYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "처리일자");
		}

		// 재처리 번호 발번 :
		String rawMtrPrcsNo = rawMtrWrhsMngVO.getPrcsNo();

		if (!StringUtils.hasText(rawMtrPrcsNo)) {
			rawMtrPrcsNo = cmnsTaskNoService.selectWrhsPrcsNo(apcCd, wrhsYmd);
		}

		// 실적등록 대상재고 목록
		List<RawMtrInvntrVO> invntrList = rawMtrWrhsMngVO.getRawMtrInvntrList();
		// 실적등록 대상정보 목록
		List<RawMtrWrhsVO> rawMtrRePrcsList = rawMtrWrhsMngVO.getRawMtrRePrcsList();

		if (rawMtrRePrcsList == null || rawMtrRePrcsList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "처리대상");
		}

		// 원물재고 투입대상
		List<RawMtrInvntrVO> rawMtrInvntrVOList = new ArrayList<>();

		// 원물입고
		if (invntrList == null || invntrList.isEmpty()) {

			List<String> excldWrhsnoList = new ArrayList<>();

			invntrList = new ArrayList<RawMtrInvntrVO>();

			// 생산자, 품목, 품종에 따른 원물재고를 가져온다.
			// 투입진행 중 건은 제외한다.

			labelLoop:
				for ( RawMtrWrhsVO rePrcs : rawMtrRePrcsList ) {

					rePrcs.setRmnQntt(rePrcs.getWrhsQntt());
					rePrcs.setRmnWght(rePrcs.getWrhsWght());

					// 품목
					String itemCd = ComUtil.nullToEmpty(rePrcs.getItemCd());
					// 품종
					String vrtyCd = ComUtil.nullToEmpty(rePrcs.getVrtyCd());
					// 창고
					String warehouseSeCdFrom = ComUtil.nullToEmpty(rePrcs.getWarehouseSeCdFrom());

					int wrhsQntt = rePrcs.getRmnQntt();
					double wrhsWght = rePrcs.getRmnWght();

					for ( RawMtrInvntrVO orgnInv : rawMtrInvntrVOList ) {

						int invRmnQntt = orgnInv.getRmnQntt();
						double invRmnWght = orgnInv.getRmnWght();

						if (invRmnWght <= 0) {
							continue;
						}

						// 재고정보 확인 중량기준으로
						if (
							itemCd.equals(orgnInv.getItemCd())
							&& vrtyCd.equals(orgnInv.getVrtyCd())
							&& warehouseSeCdFrom.equals(orgnInv.getWarehouseSeCd())) {

							if (wrhsWght > invRmnWght) {
								wrhsQntt -= invRmnQntt;
								wrhsWght -= invRmnWght;

								orgnInv.setRmnQntt(0);
								orgnInv.setRmnWght(0);

								orgnInv.setInptQntt(orgnInv.getInptQntt() + invRmnQntt);
								orgnInv.setInptWght(orgnInv.getInptWght() + invRmnWght);

							} else {
								invRmnQntt -= wrhsQntt;
								invRmnWght -= wrhsWght;
								orgnInv.setRmnQntt(invRmnQntt);
								orgnInv.setRmnWght(invRmnWght);

								orgnInv.setInptQntt(orgnInv.getInptQntt() + wrhsQntt);
								orgnInv.setInptWght(orgnInv.getInptWght() + wrhsWght);

								wrhsQntt = 0;
								wrhsWght = 0;
							}

							if (wrhsWght <= 0) {
								// 원물재고가 선정이 되었으므로 통과
								continue labelLoop;
							}
						}
					}

					// excldWrhsnoList	rawMtrInvntrVOList
					// 원물재고 미매칭 시 원물재고 읽어오기 call
					if (wrhsWght > 0) {

						RawMtrInvntrVO param = new RawMtrInvntrVO();

						param.setApcCd(apcCd);
						param.setItemCd(itemCd);
						param.setVrtyCd(vrtyCd);
						param.setWarehouseSeCd(warehouseSeCdFrom);
						param.setExcldWrhsnoList(excldWrhsnoList);
						param.setPagingYn(ComConstants.CON_YES);
						param.setCurrentPageNo(1);
						param.setRecordCountPerPage(100);

						List<RawMtrInvntrVO> invntrForPrcsList = rawMtrInvntrService.selectRawMtrInvntrListForSort(param);

						if (invntrForPrcsList == null || invntrForPrcsList.isEmpty()) {
							return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "처리가능재고");
						}

						// 재고정보 조회
						for ( RawMtrInvntrVO orgnInv : invntrForPrcsList ) {

							int invRmnQntt = orgnInv.getInvntrQntt();
							double invRmnWght = orgnInv.getInvntrWght();

							if (invRmnWght <= 0) {
								continue;
							}

							if (wrhsWght > invRmnWght) {
								wrhsQntt -= invRmnQntt;
								wrhsWght -= invRmnWght;

								orgnInv.setRmnQntt(0);
								orgnInv.setRmnWght(0);

								orgnInv.setInptQntt(invRmnQntt);
								orgnInv.setInptWght(invRmnWght);

							} else {
								invRmnQntt -= wrhsQntt;
								invRmnWght -= wrhsWght;
								orgnInv.setRmnQntt(invRmnQntt);
								orgnInv.setRmnWght(invRmnWght);

								orgnInv.setInptQntt(wrhsQntt);
								orgnInv.setInptWght(wrhsWght);

								wrhsQntt = 0;
								wrhsWght = 0;
							}

							RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
							BeanUtils.copyProperties(rawMtrWrhsMngVO, invntrVO);
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

							if (wrhsWght <= 0) {
								// 원물재고가 선정이 되었으므로 통과
								continue labelLoop;
							}
						}
					}
				}

		} else {

			for ( RawMtrWrhsVO rePrcs : rawMtrRePrcsList ) {
				rePrcs.setRmnQntt(rePrcs.getWrhsQntt());
				rePrcs.setRmnWght(rePrcs.getWrhsWght());
			}

			// 재고 >> 선별실적 정보 set	// 재고배분
			for ( RawMtrInvntrVO orgnInv : invntrList ) {

				RawMtrInvntrVO invntrVO = new RawMtrInvntrVO();
				BeanUtils.copyProperties(rawMtrWrhsMngVO, invntrVO);
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

				invntrVO.setWrhsQntt(0);
				invntrVO.setWrhsWght(0);

				rawMtrInvntrVOList.add(invntrVO);
			}
		}

		for ( RawMtrInvntrVO inv : rawMtrInvntrVOList ) {

			String wrhsno = inv.getWrhsno();
			String prdcrCd = inv.getPrdcrCd();
			String gdsSeCd = inv.getGdsSeCd();
			String wrhsSeCd = inv.getWrhsSeCd();
			String prdctnYr = inv.getPrdctnYr();

			// 지정 투입수량, 투입중량
			int inptQntt = inv.getInptQntt();
			double inptWght = inv.getInptWght();

			int wrhsQntt = inv.getWrhsQntt();
			double wrhsWght = inv.getWrhsWght();

			for ( RawMtrWrhsVO rePrcs : rawMtrRePrcsList ) {

				if (StringUtils.hasText(rePrcs.getWrhsno()) && rePrcs.getRmnWght() <= 0) {
					continue;
				}

				int applQntt = 0;
				double applWght = 0;

				if (inptWght - wrhsWght < rePrcs.getRmnWght()) {
					applQntt = inptQntt - wrhsQntt;
					applWght = inptWght - wrhsWght;
				} else {
					applQntt = rePrcs.getRmnQntt();
					applWght = rePrcs.getRmnWght();
				}

				rePrcs.setWrhsno(wrhsno);
				rePrcs.setPrdcrCd(prdcrCd);
				rePrcs.setGdsSeCd(gdsSeCd);
				rePrcs.setWrhsSeCd(wrhsSeCd);
				rePrcs.setPrdctnYr(prdctnYr);
				// 운송구분 기본값 적용
				rePrcs.setTrsprtSeCd(AmConstants.CON_TRSPRT_SE_CD_ETC);
				rePrcs.setPrdctnYr(prdctnYr);

				wrhsQntt += applQntt;
				wrhsWght += applWght;

				rePrcs.setRmnQntt(rePrcs.getRmnQntt() - applQntt);
				rePrcs.setRmnWght(rePrcs.getRmnWght() - applWght);
			}

			inv.setInptYmd(wrhsYmd);
			inv.setPrcsType(AmConstants.CON_PRCS_TYPE_RAW_MTR_REPRCS);
			inv.setPrcsQntt(inptQntt);
			inv.setPrcsWght(inptWght);
		}

		for ( RawMtrWrhsVO rePrcs : rawMtrRePrcsList ) {
			if (!StringUtils.hasText(rePrcs.getWrhsno())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
			}
			if (rePrcs.getRmnWght() > 0) {
				return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
			}
		}

		// 입고실적(재처리) 등록
		for ( RawMtrWrhsVO rePrcsInfo : rawMtrRePrcsList ) {
			RawMtrWrhsVO wrhsVO = new RawMtrWrhsVO();
			BeanUtils.copyProperties(rawMtrWrhsMngVO, wrhsVO);
			BeanUtils.copyProperties(rePrcsInfo, wrhsVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			wrhsVO.setWrhsYmd(wrhsYmd);
			wrhsVO.setPrcsNo(rawMtrPrcsNo);
			wrhsVO.setPrcsType(AmConstants.CON_PRCS_TYPE_RAW_MTR_REPRCS);
			wrhsVO.setStdGrdList(rePrcsInfo.getStdGrdList());

			rtnObj = rawMtrWrhsService.insertRawMtrRePrcs(wrhsVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		int prcsSn = 0;
		// 재처리실적 등록 시 투입실적도 함께 등록 (투입실적 여부 확인 후 등록)
		for ( RawMtrInvntrVO inv : rawMtrInvntrVOList ) {

			prcsSn++;

			RawMtrWrhsVO inptVO = new RawMtrWrhsVO();
			BeanUtils.copyProperties(inv, inptVO);

			inptVO.setPrcsYmd(wrhsYmd);
			inptVO.setPrcsSn(prcsSn);
			inptVO.setPrcsNo(rawMtrPrcsNo);

			inptVO.setQntt(inv.getInptQntt());
			inptVO.setWght(inv.getInptWght());

			// 투입실적있을 경우 update 처리로 분기
			rtnObj = rawMtrWrhsService.insertRawMtrPrcsInpt(inptVO);

			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 원물재고정보 update
			rtnObj = rawMtrInvntrService.updateInvntrPrcs(inv);

			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteRawMtrRePrcs(RawMtrWrhsMngVO rawMtrWrhsMngVO) throws Exception {

		// 원물입고 재처리
		HashMap<String, Object> rtnObj = new HashMap<>();

		String apcCd = rawMtrWrhsMngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}

		String prcsno = rawMtrWrhsMngVO.getPrcsNo();

		if (!StringUtils.hasText(prcsno)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "재처리번호");
		}

		RawMtrWrhsVO prcsParam = new RawMtrWrhsVO();
		prcsParam.setApcCd(apcCd);;
		prcsParam.setPrcsNo(prcsno);
		List<RawMtrWrhsVO> rawMtrRePrcsList = rawMtrWrhsService.selectRawMtrPrcsList(prcsParam);

		if (rawMtrRePrcsList == null || rawMtrRePrcsList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "재처리실적");
		}

		List<RawMtrWrhsVO> rawMtrRePrcsInptList = rawMtrWrhsService.selectRawMtrPrcsInptList(prcsParam);
		if (rawMtrRePrcsInptList == null || rawMtrRePrcsInptList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "재처리투입실적");
		}

		// 입고실적 취소
		// 입고실적(재처리) 등록
		for ( RawMtrWrhsVO rePrcsInfo : rawMtrRePrcsList ) {
			RawMtrWrhsVO wrhsVO = new RawMtrWrhsVO();
			BeanUtils.copyProperties(rawMtrWrhsMngVO, wrhsVO);
			BeanUtils.copyProperties(rePrcsInfo, wrhsVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			rtnObj = rawMtrWrhsService.deleteRawMtrRePrcs(wrhsVO);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		// 재처리 실적 취소 (재고 변경)
		for ( RawMtrWrhsVO prcsInptInfo : rawMtrRePrcsInptList ) {

			RawMtrWrhsVO inptVO = new RawMtrWrhsVO();
			BeanUtils.copyProperties(rawMtrWrhsMngVO, inptVO);
			BeanUtils.copyProperties(prcsInptInfo, inptVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			RawMtrInvntrVO invVO = new RawMtrInvntrVO();
			BeanUtils.copyProperties(inptVO, invVO);
			invVO.setPrcsQntt(inptVO.getQntt());
			invVO.setPrcsWght(inptVO.getWght());

			// 재고 복원
			// 원물재고정보 update
			rtnObj = rawMtrInvntrService.deleteInvntrPrcs(invVO);

			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 재처리 삭제
			rtnObj = rawMtrWrhsService.deleteRawMtrPrcsInpt(inptVO);

			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteRawMtrPrcs(RawMtrWrhsMngVO rawMtrWrhsMngVO) throws Exception {


		RawMtrInvntrVO invParam = new RawMtrInvntrVO();
		invParam.setApcCd(rawMtrWrhsMngVO.getApcCd());
		invParam.setWrhsno(rawMtrWrhsMngVO.getWrhsno());

		RawMtrInvntrVO invInfo = rawMtrInvntrService.selectRawMtrInvntr(invParam);

		if (invInfo == null || !StringUtils.hasText(invInfo.getWrhsno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "재고정보");
		}

		if (StringUtils.hasText(invInfo.getPrcsNo())) {
			rawMtrWrhsMngVO.setPrcsNo(invInfo.getPrcsNo());
			return deleteRawMtrRePrcs(rawMtrWrhsMngVO);
		} else {
			RawMtrWrhsVO wrhsVO = new RawMtrWrhsVO();
			BeanUtils.copyProperties(rawMtrWrhsMngVO, wrhsVO);

			return rawMtrWrhsService.deleteRawMtrWrhs(wrhsVO);
		}

	}


	@Override
	public HashMap<String, Object> deleteRawMtrPrcsList(RawMtrWrhsMngVO rawMtrWrhsMngVO) throws Exception {
		
		HashMap<String, Object> rtnObj = new HashMap<>();
		
		List<RawMtrInvntrVO> rawMtrInvntrList = rawMtrWrhsMngVO.getRawMtrInvntrList();
		
		if (rawMtrInvntrList == null || rawMtrInvntrList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "삭제대상");
		}
		
		String apcCd = rawMtrWrhsMngVO.getApcCd();
		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		
		List<String> prcsnoList = new ArrayList<>();
		
		for ( RawMtrInvntrVO invVO : rawMtrInvntrList ) {
			
			String wrhsno = invVO.getWrhsno();			
			if (!StringUtils.hasText(wrhsno)) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "입고번호");
			}
			
			invVO.setApcCd(apcCd);			
			RawMtrInvntrVO invInfo = rawMtrInvntrService.selectRawMtrInvntr(invVO);
			
			if (invInfo == null || !StringUtils.hasText(invInfo.getWrhsno())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "입고정보");
			}
			
			if (StringUtils.hasText(invInfo.getPrcsNo())) {
				prcsnoList.add(invInfo.getPrcsNo());
			} else {
				RawMtrWrhsVO wrhsVO = new RawMtrWrhsVO();
				BeanUtils.copyProperties(rawMtrWrhsMngVO, wrhsVO);
				wrhsVO.setWrhsno(wrhsno);
				
				rtnObj = rawMtrWrhsService.deleteRawMtrWrhs(wrhsVO);
				if (rtnObj != null) {
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}
		}
		
		if (!prcsnoList.isEmpty()) {
			// 중복 제거
			HashSet<String> rePrcsList = new HashSet<>(prcsnoList);
			for ( String prcsno : rePrcsList ) {
				RawMtrWrhsMngVO rePrcsVO = new RawMtrWrhsMngVO();
				BeanUtils.copyProperties(rawMtrWrhsMngVO, rePrcsVO);
				rePrcsVO.setPrcsNo(prcsno);
				
				rtnObj = deleteRawMtrRePrcs(rePrcsVO);
				if (rtnObj != null) {
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> insertRawMtrWrhsSmmry(RawMtrWrhsMngVO rawMtrWrhsMngVO) throws Exception {

		// 원물입고 재처리
		HashMap<String, Object> rtnObj = new HashMap<>();

		String apcCd = rawMtrWrhsMngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}


		List<RawMtrWrhsSmmryVO> rawMtrWrhsSmmryList = rawMtrWrhsMngVO.getRawMtrWrhsSmmryList();
		
		if (rawMtrWrhsSmmryList == null || rawMtrWrhsSmmryList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "처리대상");
		}
		
		String vrtyCd1 = rawMtrWrhsMngVO.getVrtyCd1();
		String vrtyCd2 = rawMtrWrhsMngVO.getVrtyCd2();
		String vrtyCd3 = rawMtrWrhsMngVO.getVrtyCd3();
		String vrtyCd4 = rawMtrWrhsMngVO.getVrtyCd4();
		String vrtyCd5 = rawMtrWrhsMngVO.getVrtyCd5();
		
		List<RawMtrWrhsSmmryVO> wrhsSmmryList = new ArrayList<>();
		
		for ( RawMtrWrhsSmmryVO wrhs : rawMtrWrhsSmmryList ) {
			String prdcrCd = wrhs.getPrdcrCd();
			
			if (StringUtils.hasText(vrtyCd1)) {
				RawMtrWrhsSmmryVO wrhsVO = new RawMtrWrhsSmmryVO();
				BeanUtils.copyProperties(rawMtrWrhsMngVO, wrhsVO);
				
				wrhsVO.setVrtyCd(vrtyCd1);
				wrhsVO.setPrdcrCd(prdcrCd);
				wrhsVO.setWrhsCmptnYn(wrhs.getV1WrhsCmptnYn());
				
				wrhsVO.setQnttCycl1(wrhs.getV1QnttCycl1());
				wrhsVO.setQnttCycl2(wrhs.getV1QnttCycl2());
				wrhsVO.setQnttCycl3(wrhs.getV1QnttCycl3());
				wrhsVO.setQnttCycl4(wrhs.getV1QnttCycl4());
				wrhsVO.setQnttCycl5(wrhs.getV1QnttCycl5());
				
				wrhsVO.setWghtCycl1(wrhs.getV1WghtCycl1());
				wrhsVO.setWghtCycl2(wrhs.getV1WghtCycl2());
				wrhsVO.setWghtCycl3(wrhs.getV1WghtCycl3());
				wrhsVO.setWghtCycl4(wrhs.getV1WghtCycl4());
				wrhsVO.setWghtCycl5(wrhs.getV1WghtCycl5());
				
				wrhsSmmryList.add(wrhsVO);
			}
			
			if (StringUtils.hasText(vrtyCd2)) {
				RawMtrWrhsSmmryVO wrhsVO = new RawMtrWrhsSmmryVO();
				BeanUtils.copyProperties(rawMtrWrhsMngVO, wrhsVO);
				
				wrhsVO.setVrtyCd(vrtyCd2);
				wrhsVO.setPrdcrCd(prdcrCd);
				wrhsVO.setWrhsCmptnYn(wrhs.getV2WrhsCmptnYn());
				
				wrhsVO.setQnttCycl1(wrhs.getV2QnttCycl1());
				wrhsVO.setQnttCycl2(wrhs.getV2QnttCycl2());
				wrhsVO.setQnttCycl3(wrhs.getV2QnttCycl3());
				wrhsVO.setQnttCycl4(wrhs.getV2QnttCycl4());
				wrhsVO.setQnttCycl5(wrhs.getV2QnttCycl5());
				
				wrhsVO.setWghtCycl1(wrhs.getV2WghtCycl1());
				wrhsVO.setWghtCycl2(wrhs.getV2WghtCycl2());
				wrhsVO.setWghtCycl3(wrhs.getV2WghtCycl3());
				wrhsVO.setWghtCycl4(wrhs.getV2WghtCycl4());
				wrhsVO.setWghtCycl5(wrhs.getV2WghtCycl5());
				
				wrhsSmmryList.add(wrhsVO);
			}
			
			if (StringUtils.hasText(vrtyCd3)) {
				RawMtrWrhsSmmryVO wrhsVO = new RawMtrWrhsSmmryVO();
				BeanUtils.copyProperties(rawMtrWrhsMngVO, wrhsVO);
				
				wrhsVO.setVrtyCd(vrtyCd3);
				wrhsVO.setPrdcrCd(prdcrCd);
				wrhsVO.setWrhsCmptnYn(wrhs.getV3WrhsCmptnYn());
				
				wrhsVO.setQnttCycl1(wrhs.getV3QnttCycl1());
				wrhsVO.setQnttCycl2(wrhs.getV3QnttCycl2());
				wrhsVO.setQnttCycl3(wrhs.getV3QnttCycl3());
				wrhsVO.setQnttCycl4(wrhs.getV3QnttCycl4());
				wrhsVO.setQnttCycl5(wrhs.getV3QnttCycl5());
				
				wrhsVO.setWghtCycl1(wrhs.getV3WghtCycl1());
				wrhsVO.setWghtCycl2(wrhs.getV3WghtCycl2());
				wrhsVO.setWghtCycl3(wrhs.getV3WghtCycl3());
				wrhsVO.setWghtCycl4(wrhs.getV3WghtCycl4());
				wrhsVO.setWghtCycl5(wrhs.getV3WghtCycl5());
				
				wrhsSmmryList.add(wrhsVO);
			}
			
			if (StringUtils.hasText(vrtyCd4)) {
				RawMtrWrhsSmmryVO wrhsVO = new RawMtrWrhsSmmryVO();
				BeanUtils.copyProperties(rawMtrWrhsMngVO, wrhsVO);
				
				wrhsVO.setVrtyCd(vrtyCd4);
				wrhsVO.setPrdcrCd(prdcrCd);
				wrhsVO.setWrhsCmptnYn(wrhs.getV4WrhsCmptnYn());
				
				wrhsVO.setQnttCycl1(wrhs.getV4QnttCycl1());
				wrhsVO.setQnttCycl2(wrhs.getV4QnttCycl2());
				wrhsVO.setQnttCycl3(wrhs.getV4QnttCycl3());
				wrhsVO.setQnttCycl4(wrhs.getV4QnttCycl4());
				wrhsVO.setQnttCycl5(wrhs.getV4QnttCycl5());
				
				wrhsVO.setWghtCycl1(wrhs.getV4WghtCycl1());
				wrhsVO.setWghtCycl2(wrhs.getV4WghtCycl2());
				wrhsVO.setWghtCycl3(wrhs.getV4WghtCycl3());
				wrhsVO.setWghtCycl4(wrhs.getV4WghtCycl4());
				wrhsVO.setWghtCycl5(wrhs.getV4WghtCycl5());
				
				wrhsSmmryList.add(wrhsVO);
			}
			
			if (StringUtils.hasText(vrtyCd5)) {
				RawMtrWrhsSmmryVO wrhsVO = new RawMtrWrhsSmmryVO();
				BeanUtils.copyProperties(rawMtrWrhsMngVO, wrhsVO);
				
				wrhsVO.setVrtyCd(vrtyCd5);
				wrhsVO.setPrdcrCd(prdcrCd);
				wrhsVO.setWrhsCmptnYn(wrhs.getV5WrhsCmptnYn());
				
				wrhsVO.setQnttCycl1(wrhs.getV5QnttCycl1());
				wrhsVO.setQnttCycl2(wrhs.getV5QnttCycl2());
				wrhsVO.setQnttCycl3(wrhs.getV5QnttCycl3());
				wrhsVO.setQnttCycl4(wrhs.getV5QnttCycl4());
				wrhsVO.setQnttCycl5(wrhs.getV5QnttCycl5());
				
				wrhsVO.setWghtCycl1(wrhs.getV5WghtCycl1());
				wrhsVO.setWghtCycl2(wrhs.getV5WghtCycl2());
				wrhsVO.setWghtCycl3(wrhs.getV5WghtCycl3());
				wrhsVO.setWghtCycl4(wrhs.getV5WghtCycl4());
				wrhsVO.setWghtCycl5(wrhs.getV5WghtCycl5());
				
				wrhsSmmryList.add(wrhsVO);
			}
		}
		
		rtnObj = rawMtrWrhsService.insertRawMtrWrhsSmmryList(wrhsSmmryList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> deleteRawMtrWrhsSmmry(RawMtrWrhsMngVO rawMtrWrhsMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		String apcCd = rawMtrWrhsMngVO.getApcCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}


		List<RawMtrWrhsSmmryVO> rawMtrWrhsSmmryList = rawMtrWrhsMngVO.getRawMtrWrhsSmmryList();
		
		if (rawMtrWrhsSmmryList == null || rawMtrWrhsSmmryList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "처리대상");
		}
		
		String userId = rawMtrWrhsMngVO.getSysLastChgUserId();
		String prgrmId = rawMtrWrhsMngVO.getSysLastChgPrgrmId();
		
		List<RawMtrWrhsSmmryVO> wrhsSmmryList = new ArrayList<>();
		
		for ( RawMtrWrhsSmmryVO wrhs : rawMtrWrhsSmmryList ) {
			
			String vrtyCd1 = wrhs.getVrtyCd1();
			String vrtyCd2 = wrhs.getVrtyCd2();
			String vrtyCd3 = wrhs.getVrtyCd3();
			String vrtyCd4 = wrhs.getVrtyCd4();
			String vrtyCd5 = wrhs.getVrtyCd5();
			
			if (StringUtils.hasText(vrtyCd1)) {
				RawMtrWrhsSmmryVO wrhsVO = new RawMtrWrhsSmmryVO();
				BeanUtils.copyProperties(wrhs, wrhsVO);
				
				wrhsVO.setSysFrstInptUserId(userId);
				wrhsVO.setSysFrstInptPrgrmId(prgrmId);
				wrhsVO.setSysLastChgUserId(userId);
				wrhsVO.setSysLastChgPrgrmId(prgrmId);
				wrhsVO.setVrtyCd(vrtyCd1);
				
				wrhsSmmryList.add(wrhsVO);
			}
			
			if (StringUtils.hasText(vrtyCd2)) {
				RawMtrWrhsSmmryVO wrhsVO = new RawMtrWrhsSmmryVO();
				BeanUtils.copyProperties(wrhs, wrhsVO);
				
				wrhsVO.setSysFrstInptUserId(userId);
				wrhsVO.setSysFrstInptPrgrmId(prgrmId);
				wrhsVO.setSysLastChgUserId(userId);
				wrhsVO.setSysLastChgPrgrmId(prgrmId);
				wrhsVO.setVrtyCd(vrtyCd2);
				
				wrhsSmmryList.add(wrhsVO);
			}
			
			if (StringUtils.hasText(vrtyCd3)) {
				RawMtrWrhsSmmryVO wrhsVO = new RawMtrWrhsSmmryVO();
				BeanUtils.copyProperties(wrhs, wrhsVO);
				
				wrhsVO.setSysFrstInptUserId(userId);
				wrhsVO.setSysFrstInptPrgrmId(prgrmId);
				wrhsVO.setSysLastChgUserId(userId);
				wrhsVO.setSysLastChgPrgrmId(prgrmId);
				wrhsVO.setVrtyCd(vrtyCd3);
				
				wrhsSmmryList.add(wrhsVO);
			}
			
			if (StringUtils.hasText(vrtyCd4)) {
				RawMtrWrhsSmmryVO wrhsVO = new RawMtrWrhsSmmryVO();
				BeanUtils.copyProperties(wrhs, wrhsVO);
				
				wrhsVO.setSysFrstInptUserId(userId);
				wrhsVO.setSysFrstInptPrgrmId(prgrmId);
				wrhsVO.setSysLastChgUserId(userId);
				wrhsVO.setSysLastChgPrgrmId(prgrmId);
				wrhsVO.setVrtyCd(vrtyCd4);
				
				wrhsSmmryList.add(wrhsVO);
			}
			
			if (StringUtils.hasText(vrtyCd5)) {
				RawMtrWrhsSmmryVO wrhsVO = new RawMtrWrhsSmmryVO();
				BeanUtils.copyProperties(wrhs, wrhsVO);
				
				wrhsVO.setSysFrstInptUserId(userId);
				wrhsVO.setSysFrstInptPrgrmId(prgrmId);
				wrhsVO.setSysLastChgUserId(userId);
				wrhsVO.setSysLastChgPrgrmId(prgrmId);
				wrhsVO.setVrtyCd(vrtyCd5);
				
				wrhsSmmryList.add(wrhsVO);
			}
		}
		
		rtnObj = rawMtrWrhsService.deleteRawMtrWrhsSmmryList(wrhsSmmryList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		
		// TODO Auto-generated method stub
		return null;
		
	}
	
	
	
	
}
