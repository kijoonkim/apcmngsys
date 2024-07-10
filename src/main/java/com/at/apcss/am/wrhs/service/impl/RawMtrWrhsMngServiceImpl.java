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

				/** 상단그리드 재처리 전 재고에 대하여 레코드마다 처리
				 *  그러나, 하나의 로우당 n개의 입고번호가 있을수 있음으로 아래와 같이 쿼리 변경 모두 Sum처리됨. **/
//				RawMtrInvntrVO invntrInfo = rawMtrInvntrService.selectRawMtrInvntr(invntrVO);
				RawMtrInvntrVO invntrInfo = rawMtrInvntrService.selectRawMtrInvntrSumWrhsno(invntrVO);

				if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "원물재고");
				}

				/** 최종중량 직접입력가능  > 삭제컨펌 **/
				if (invntrVO.getInptWght() > invntrInfo.getInvntrWght()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
				}
				/** sum된 재고정보 객체를 이용해 원물재고정보 객체에 세팅 **/
				invntrVO.setPrdcrCd(invntrInfo.getPrdcrCd());
				invntrVO.setGdsSeCd(invntrInfo.getGdsSeCd());
				invntrVO.setWrhsSeCd(invntrInfo.getWrhsSeCd());
				invntrVO.setInvntrQntt(invntrInfo.getInvntrQntt());
				invntrVO.setInvntrWght(invntrInfo.getInvntrWght());
				invntrVO.setPrdctnYr(invntrInfo.getPrdctnYr());
				/** 상단 그리드 원재고 데이터에 입고수량, 입고중량을 0으로 맞춤. **/
				invntrVO.setWrhsQntt(0);
				invntrVO.setWrhsWght(0);

				rawMtrInvntrVOList.add(invntrVO);
			}
		}

		/** 상단 재고그리드에 대한 재처리투입 실적 연산 ? 작업 start**/
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

			/** 재처리 내역 그리드 : rawMtrRePrcsList
			 *  여기서 갑자기 재처리가 등장합니다.**/
			for ( RawMtrWrhsVO rePrcs : rawMtrRePrcsList ) {
				/** 재처리할 대상중에 입고번호가 존재하거나, 잔여중량이 0보다 작거나 같으면 다음 재처리 목록으로 넘김**/
				if (StringUtils.hasText(rePrcs.getWrhsno()) && rePrcs.getRmnWght() <= 0) {
					continue;
				}

				int applQntt = 0;
				double applWght = 0;

				/** 투입중량 - 입고중량 < 재처리할 잔여 중량
				 *  위에서 이미 입고중량을 0으로 셋팅했기에 투입중량이 재처리할 잔여중량보다 크고작은지 판단.
				 *  여기 재처리할 잔여 중량이 무슨 값으로 세팅되는지 확인 필요하고 //TODO:: 잔여중량이뭔디
				 *  잔여중량이 더 크면 투입량이 가능한 수량 중량이됨 **/
				if (inptWght - wrhsWght < rePrcs.getRmnWght()) {
					applQntt = inptQntt - wrhsQntt;
					applWght = inptWght - wrhsWght;
				} else {
					applQntt = rePrcs.getRmnQntt();
					applWght = rePrcs.getRmnWght();
				}
				/** 여기서 분기점이 크게 뒤틀리는데 상단 재고 그리드 하나에 대해서 재처리할 내역을 순회하면서 참조하는데
				 * 상단 재고 그리드도 사실상 n개의 입고실적을 가지고있기 때문에 wrhsno 가 다수일경우가 있음.**/
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
			/** 여기서도 사실상 지금은 하나의 로우로 취급하고 inv이 처리가 되는데 사실 N개가 있을수 있음;; **/
			inv.setInptYmd(wrhsYmd);
			inv.setPrcsType(AmConstants.CON_PRCS_TYPE_RAW_MTR_REPRCS);
			inv.setPrcsQntt(inptQntt);
			inv.setPrcsWght(inptWght);
		}
		/** end **/
		/** 재처리 내역들이 상단 반복을 통해 재처리가능한지 여부와 잔여수량에 변동이 생겼기에
		 *  1.셋팅이 됫는가[입고번호]
		 *  2.잔여중량이 0보다 큰가를 체크함.  **/
		for ( RawMtrWrhsVO rePrcs : rawMtrRePrcsList ) {
			if (!StringUtils.hasText(rePrcs.getWrhsno())) {
				return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
			}
			if (rePrcs.getRmnWght() > 0) {
				return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
			}
		}

		/** 입고실적(재처리) 등록
		 *  실질적으로 재처리 그리드의 정보를 DB에 반영하는데 위에서 포맷이 잘못되었을 가능성 290000%
		 *  그리고 여기서 wrhsno가 n개일때 여러번 등록하게되는데 이게 틀림. 여기서는 rawMtrRePrcsList의 로우만큼만 생성되야함.
		 *  세팅이 잘되었다는 전제하에 아 여기선 심지어 wrhsNo 없이 넘겨도 알아서 채워주네;;**/
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

			String[] wrhsnos = wrhsVO.getWrhsno().replace(" ","").split(",");
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
			/** 교통사고 지점 wrhsno 바꿔야함. **/
			String[] wrhsnos = inptVO.getWrhsno().replace(" ","").split(",");
			if(wrhsnos.length > 1){
				for(int i = 0; i < wrhsnos.length; i++){
					RawMtrWrhsVO updateWrhsVO = new RawMtrWrhsVO();
					BeanUtils.copyProperties(inptVO,updateWrhsVO);
					updateWrhsVO.setWrhsno(wrhsnos[i]);
					rtnObj = rawMtrWrhsService.insertRawMtrPrcsInpt(updateWrhsVO);
				}
			}else{
				rtnObj = rawMtrWrhsService.insertRawMtrPrcsInpt(inptVO);
			}

			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			// 원물재고정보 update
			/** 이부분이 상단 그리드 되돌리는 곳. 0처리가 되어야함 ? 아니면 사용한만큼 빠져야함. **/
			if(wrhsnos.length > 1){
				rtnObj = rawMtrInvntrService.updateInvntrRePrcs(inv);
			}else{
				rtnObj = rawMtrInvntrService.updateInvntrPrcs(inv);
			}

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
			String sortYmd = wrhs.getSortYmd();
			String lastWrhsCmptnYn = wrhs.getLastWrhsCmptnYn();
			if (StringUtils.hasText(vrtyCd1)) {
				RawMtrWrhsSmmryVO wrhsVO = new RawMtrWrhsSmmryVO();
				BeanUtils.copyProperties(rawMtrWrhsMngVO, wrhsVO);

				wrhsVO.setVrtyCd(vrtyCd1);
				wrhsVO.setPrdcrCd(prdcrCd);
				wrhsVO.setWrhsCmptnYn(wrhs.getV1WrhsCmptnYn());
				wrhsVO.setSortYmd(sortYmd);
				wrhsVO.setLastWrhsCmptnYn(lastWrhsCmptnYn);

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
				wrhsVO.setSortYmd(sortYmd);
				wrhsVO.setLastWrhsCmptnYn(lastWrhsCmptnYn);

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
				wrhsVO.setSortYmd(sortYmd);
				wrhsVO.setLastWrhsCmptnYn(lastWrhsCmptnYn);

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
				wrhsVO.setSortYmd(sortYmd);
				wrhsVO.setLastWrhsCmptnYn(lastWrhsCmptnYn);

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
				wrhsVO.setSortYmd(sortYmd);
				wrhsVO.setLastWrhsCmptnYn(lastWrhsCmptnYn);

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
