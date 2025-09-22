package com.at.apcss.am.unty.service.impl;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.pckg.service.PckgInptService;
import com.at.apcss.am.pckg.service.PckgPrfmncService;
import com.at.apcss.am.pckg.vo.PckgInptVO;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import com.at.apcss.am.sort.service.SortInptPrfmncService;
import com.at.apcss.am.sort.service.SortPrfmncAtrbService;
import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.SortInptPrfmncVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.am.sort.vo.SortPrfmncAtrbVO;
import com.at.apcss.am.spmt.service.SpmtPrfmncService;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.am.unty.vo.UntyPrfmncVO;
import com.at.apcss.am.wgh.service.WghPrfmncService;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;

import com.at.apcss.am.unty.mapper.UntyPrfmncMapper;
import com.at.apcss.am.wrhs.service.RawMtrWrhsService;
import com.at.apcss.am.unty.service.UntyPrfmncService;
import com.at.apcss.am.wrhs.vo.*;

import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

import com.at.apcss.co.sys.util.ComUtil;
import org.springframework.beans.BeanUtils;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;


import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : UntyPrfmncServiceImpl.java
 * @Description : 통합실적 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김 호
 * @since 2025.08.18
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.08.18  김 호        최초 생성
 * </pre>
 */
@Service("untyPrfmncService")
public class UntyPrfmncServiceImpl extends BaseServiceImpl implements UntyPrfmncService {

	@Autowired
	private UntyPrfmncMapper untyPrfmncMapper;

	/**
	 * 공통실적발번 서비스
	 * */
	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;
	/**
	 * 원물계량 서비스
	 * */
	@Resource(name="wghPrfmncService")
	private WghPrfmncService wghPrfmncService;
	/**
	 * 원물입고 서비스
	 * */
	@Resource(name="rawMtrWrhsService")
	private RawMtrWrhsService rawMtrWrhsService;
	/**
	 * 선별실적 서비스
	 * */
	@Resource(name="sortPrfmncService")
	private SortPrfmncService sortPrfmncService;
	/**
	 * 포장실적 서비스
	 * */
	@Resource(name="pckgPrfmncService")
	private PckgPrfmncService pckgPrfmncService;
	/**
	 * 출하실적 서비스
	 * */
	@Resource(name="spmtPrfmncService")
	private SpmtPrfmncService spmtPrfmncService;
	/**
	 * 선별투입실적 서비스
	 * */
	@Resource(name="sortInptPrfmncService")
	private SortInptPrfmncService sortInptPrfmncService;

	/**
	 * 포장투입실적 서비스
	 * */
	@Resource(name="pckgInptService")
	private PckgInptService pckgInptService;

	/**
	 * 선별실적속성 서비스
	 * */
	@Resource(name="sortPrfmncAtrbService")
	private SortPrfmncAtrbService sortPrfmncAtrbService;


	@Override
	public List<UntyPrfmncVO> selectRawDlngPrfmncList(UntyPrfmncVO untyPrfmncVO) throws Exception {
		return untyPrfmncMapper.selectRawDlngPrfmncList(untyPrfmncVO);
	}

	@Override
	public HashMap<String, Object> multiUntyPrfmnc(List<UntyPrfmncVO> untyPrfmncList) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<String, Object>();
		/**
		 * 통합실적 목록 저장
		 * 통합실적 인 경우 입고->출하 모든 데이터를 생성한다.
		 * 계량실적 OR 입고실적 -> 선별실적 -> 포장실적 -> 출하실적
		* */
		for (UntyPrfmncVO untyPrfmncVO: untyPrfmncList) {

			rtnObj = multiUntyPrfmnc(untyPrfmncVO);

			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}
    @Override
	public HashMap<String, Object> multiUntyPrfmnc(UntyPrfmncVO untyPrfmncVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<String, Object>();

		String untyPrfmncType = untyPrfmncVO.getUntyPrfmncType();

		if (untyPrfmncType == null) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "통합실적타입");
		}

		if (untyPrfmncType.length() != 12) {
			return ComUtil.getResultMap(ComConstants.MSGCD_TGT_WRONG, "통합실적타입");
		}

		String rawMtrWrhsPrfmncType = untyPrfmncType.substring(0,2);
		String sortPrfmncType = untyPrfmncType.substring(2,4);
		String sortInptPrfmncType = untyPrfmncType.substring(4,6);
		String pckgPrfmncType = untyPrfmncType.substring(6,8);
		String pckgInptPrfmncType = untyPrfmncType.substring(8,10);
		String spmtPrfmncType = untyPrfmncType.substring(10);

		String sysFrstInptPrgrmId = untyPrfmncVO.getSysFrstInptPrgrmId();
		String sysFrstInptUserId = untyPrfmncVO.getSysFrstInptUserId();
		String rowSts = untyPrfmncVO.getRowSts();

		RawMtrWrhsVO rawMtrWrhsVO = new RawMtrWrhsVO();
		WghPrfmncVO wghPrfmncVO = new WghPrfmncVO();
		SortPrfmncVO sortPrfmncVO = new SortPrfmncVO();
		SortInptPrfmncVO sortInptPrfmncVO = new SortInptPrfmncVO();
		PckgPrfmncVO pckgPrfmncVO = new PckgPrfmncVO();
		PckgInptVO pckgInptPrfmncVO = new PckgInptVO();
		SpmtPrfmncVO spmtPrfmncVO = new SpmtPrfmncVO();

		String sortPrfmncAtrbYn = untyPrfmncVO.getSortPrfmncAtrbYn();


		List<RawMtrWrhsVO> rawMtrWrhsList = new ArrayList<>();
		List<WghPrfmncVO> wghPrfmncList = new ArrayList<>();
		List<SortPrfmncVO> sortPrfmncList = new ArrayList<>();
		List<SortInptPrfmncVO> sortInptPrfmncList = new ArrayList<>();
		List<PckgPrfmncVO> pckgPrfmncList = new ArrayList<>();
		List<PckgInptVO> pckgInptPrfmncList = new ArrayList<>();
		List<SpmtPrfmncVO> spmtPrfmncList = new ArrayList<>();

		/**
		 * 입고실적 생성 없음
		 * */
		if (!ApcConstants.RAW_MTR_WRHS_PRFMNC_TYPE_R0.equals(rawMtrWrhsPrfmncType)) {

			/**
			 * 입고실적 다중 생성
			 * */
			if (ApcConstants.RAW_MTR_WRHS_PRFMNC_TYPE_R1.equals(rawMtrWrhsPrfmncType)) {

				rawMtrWrhsList = untyPrfmncVO.getRawMtrWrhsList();

				for (RawMtrWrhsVO rawMtrWrhs : rawMtrWrhsList) {
					rawMtrWrhs.setSortPrfmncType(sortPrfmncType);
					rawMtrWrhs.setSysFrstInptUserId(sysFrstInptUserId);
					rawMtrWrhs.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
					rawMtrWrhs.setSysLastChgUserId(sysFrstInptUserId);
					rawMtrWrhs.setSysLastChgPrgrmId(sysFrstInptPrgrmId);
					rtnObj = rawMtrWrhsSet(rawMtrWrhs);
					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}

					rtnObj = insertRawMtrWrhsPrfmnc(rawMtrWrhsVO);
					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}
				}

			}

			/**
			 * 입고실적 단일 생성
			 * */
			if (ApcConstants.RAW_MTR_WRHS_PRFMNC_TYPE_R2.equals(rawMtrWrhsPrfmncType)) {

				rawMtrWrhsVO = untyPrfmncVO.getRawMtrWrhsVO();
				rawMtrWrhsVO.setSortPrfmncType(sortPrfmncType);
				rawMtrWrhsVO.setSysFrstInptUserId(sysFrstInptUserId);
				rawMtrWrhsVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
				rawMtrWrhsVO.setSysLastChgUserId(sysFrstInptUserId);
				rawMtrWrhsVO.setSysLastChgPrgrmId(sysFrstInptPrgrmId);
				rawMtrWrhsVO.setRowSts(rowSts);
				/**
				 * 원물입고 데이터 확인 및 기본 정보 데이터 추가
				 * */
				rtnObj = rawMtrWrhsSet(rawMtrWrhsVO);
				if (rtnObj != null) {
					throw new EgovBizException(getMessageForMap(rtnObj));
				}

				/**
				 * ROW_STS 확인
				 * */
				if (ComConstants.ROW_STS_INSERT.equals(untyPrfmncVO.getRowSts())) {
					rtnObj = insertRawMtrWrhsPrfmnc(rawMtrWrhsVO);
					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}
				}
				if (ComConstants.ROW_STS_UPDATE.equals(untyPrfmncVO.getRowSts())) {
					rtnObj = updateRawMtrWrhsPrfmnc(rawMtrWrhsVO);
					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}
				}


			}

			/**
			 * 입고실적 강제 생성
			 * */
			if (ApcConstants.RAW_MTR_WRHS_PRFMNC_TYPE_R3.equals(rawMtrWrhsPrfmncType)) {

			}

			/**
			 * 계량실적 상세 다중 생성
			 * */
			if (ApcConstants.RAW_MTR_WGH_PRFMNC_TYPE_W1.equals(rawMtrWrhsPrfmncType)) {

			}

			/**
			 * 계량실적 상세 단일 생성
			 * */
			if (ApcConstants.RAW_MTR_WGH_PRFMNC_TYPE_W2.equals(rawMtrWrhsPrfmncType)) {

			}
		}


		/**
		 * 선별실적생성 없음
		 * */
		if (!ApcConstants.SORT_PRFMNC_TYPE_S0.equals(sortPrfmncType)) {

			/**
			 * 선별실적생성 단일
			 * */
			if (ApcConstants.SORT_PRFMNC_TYPE_S1.equals(sortPrfmncType)) {
				sortPrfmncVO = untyPrfmncVO.getSortPrfmncVO();
				sortPrfmncVO.setRowSts(rowSts);
				sortPrfmncVO.setSysFrstInptUserId(sysFrstInptUserId);
				sortPrfmncVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
				sortPrfmncVO.setSysLastChgUserId(sysFrstInptUserId);
				sortPrfmncVO.setSysLastChgPrgrmId(sysFrstInptPrgrmId);

				rtnObj =  sortPrfmncSet(sortPrfmncVO);
				if (rtnObj != null) {
					throw new EgovBizException(getMessageForMap(rtnObj));
				}
			}
			/**
			 * 선별실적생성 다중
			 * */
			if (ApcConstants.SORT_PRFMNC_TYPE_S2.equals(sortPrfmncType)) {

				sortPrfmncList = untyPrfmncVO.getSortPrfmncList();

				for (SortPrfmncVO sortPrfmnc : sortPrfmncList) {

					sortPrfmnc.setSysFrstInptUserId(sysFrstInptUserId);
					sortPrfmnc.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
					sortPrfmnc.setSysLastChgUserId(sysFrstInptUserId);
					sortPrfmnc.setSysLastChgPrgrmId(sysFrstInptPrgrmId);
					sortPrfmnc.setRowSts(rowSts);

					rtnObj =  sortPrfmncSet(sortPrfmnc);
					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}
				}

				rtnObj = multiUntySortPrfmncList(sortPrfmncList);
				if (rtnObj != null) {
					throw new EgovBizException(getMessageForMap(rtnObj));
				}

				/**
				 * 선별투입실적 생성 없음
				 * */
				if (!ApcConstants.INPT_PRFMNC_TYPE_I0.equals(sortInptPrfmncType)) {

					/**
					 * 선별투입실적 단일 생성
					 * */
					if (ApcConstants.INPT_PRFMNC_TYPE_I1.equals(sortInptPrfmncType)) {

						/**
						 * 원물계량실적 여부
						 * */
						if (ApcConstants.RAW_MTR_WRHS_PRFMNC_TYPE_R2.equals(rawMtrWrhsPrfmncType)) {

							if (ComConstants.CON_YES.equals(rawMtrWrhsVO.getInptPrfmncYn())) {
								BeanUtils.copyProperties(rawMtrWrhsVO, sortInptPrfmncVO);
								sortInptPrfmncVO.setWrhsno(rawMtrWrhsVO.getWrhsno());
								sortInptPrfmncVO.setInptSn(1);
								sortInptPrfmncVO.setInptYmd(rawMtrWrhsVO.getWrhsYmd());
								sortInptPrfmncVO.setQntt((int)rawMtrWrhsVO.getBxQntt());
								sortInptPrfmncVO.setWght(rawMtrWrhsVO.getWght());
								sortInptPrfmncVO.setRowSts(rowSts);
							}

							rtnObj = sortInptSet(sortInptPrfmncVO);
							if (rtnObj != null) {
								throw new EgovBizException(getMessageForMap(rtnObj));
							}

							sortInptPrfmncVO.setSortno(sortPrfmncList.get(0).getSortno());
							rtnObj = multiUntySortInptPrfmnc(sortInptPrfmncVO);
							if (rtnObj != null) {
								throw new EgovBizException(getMessageForMap(rtnObj));
							}
						}

					}
					/**
					 * 선별투입실적 다중 생성
					 * */
					if (ApcConstants.INPT_PRFMNC_TYPE_I2.equals(sortInptPrfmncType)) {

					}
					/**
					 * 선별투입실적 강제 생성
					 * */
					if (ApcConstants.INPT_PRFMNC_TYPE_I3.equals(sortInptPrfmncType)) {

					}
				}

			}
			/**
			 * 선별실적생성 강제 생성
			 * */
			if (ApcConstants.SORT_PRFMNC_TYPE_S3.equals(sortPrfmncType)) {

			}

		}
		/**
		 * 선별실적속성 여부에 따라 변경 시에는 삭제 후 재등록 으로 처리 한다.
		 * */
		if (ComConstants.CON_YES.equals(sortPrfmncAtrbYn)) {

			if (ComConstants.ROW_STS_UPDATE.equals(rowSts)) {

				SortPrfmncAtrbVO sortPrfmncAtrbVO = new SortPrfmncAtrbVO();
				BeanUtils.copyProperties(untyPrfmncVO, sortPrfmncAtrbVO);
				sortPrfmncAtrbService.deleteSortPrfmncAtrbAll(sortPrfmncAtrbVO);

			}

			List<SortPrfmncAtrbVO> sortPrfmncAtrbList = untyPrfmncVO.getSortPrfmncAtrbList();

			String sortno = sortPrfmncList.get(0).getSortno();

			for (SortPrfmncAtrbVO sortPrfmncAtrbVO : sortPrfmncAtrbList) {

				sortPrfmncAtrbVO.setSysFrstInptUserId(sysFrstInptUserId);
				sortPrfmncAtrbVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
				sortPrfmncAtrbVO.setSysLastChgUserId(sysFrstInptUserId);
				sortPrfmncAtrbVO.setSysLastChgPrgrmId(sysFrstInptPrgrmId);

				if (ComConstants.ROW_STS_UPDATE.equals(rowSts)) {
					sortPrfmncAtrbVO.setRowSts("I");
				} else {
					sortPrfmncAtrbVO.setRowSts(rowSts);
				}

				sortPrfmncAtrbVO.setSortno(sortno);

			}

			rtnObj = sortPrfmncAtrbService.muliSaveSortPrfmncList(sortPrfmncAtrbList);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

		}

		/**
		 * 포장 실적 생성 없음
		 * */
		if (!ApcConstants.PCKG_PRFMNC_TYPE_P0.equals(pckgPrfmncType)) {

			/**
			 * 포장실적 단일 생성
			 * */
			if (ApcConstants.PCKG_PRFMNC_TYPE_P1.equals(pckgPrfmncType)) {

				/**
				 * 투입 실적 생성 없음
				 * */
				if (!ApcConstants.INPT_PRFMNC_TYPE_I0.equals(pckgInptPrfmncType)) {
					/**
					 * 투입 실적 단일 생성
					 * */
					if (ApcConstants.INPT_PRFMNC_TYPE_I1.equals(pckgInptPrfmncType)) {

					}
					/**
					 * 투입 실적 다중 생성
					 * */
					if (ApcConstants.INPT_PRFMNC_TYPE_I2.equals(pckgInptPrfmncType)) {

					}
					/**
					 * 투입 실적 강제 생성
					 * */
					if (ApcConstants.INPT_PRFMNC_TYPE_I3.equals(pckgInptPrfmncType)) {

					}
				}


			}
			/**
			 * 포장실적 다중 생성
			 * */
			if (ApcConstants.PCKG_PRFMNC_TYPE_P2.equals(pckgPrfmncType)) {

				pckgPrfmncList = untyPrfmncVO.getPckgPrfmncList();

				for (PckgPrfmncVO pckgPrfmnc : pckgPrfmncList) {

					pckgPrfmnc.setSysFrstInptUserId(sysFrstInptUserId);
					pckgPrfmnc.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
					pckgPrfmnc.setSysLastChgUserId(sysFrstInptUserId);
					pckgPrfmnc.setSysLastChgPrgrmId(sysFrstInptPrgrmId);
					pckgPrfmnc.setRowSts(rowSts);

					rtnObj = pckgPrfmncSet(pckgPrfmnc);
					if (rtnObj != null) {
						throw new EgovBizException(getMessageForMap(rtnObj));
					}
				}
				rtnObj = multiUntyPckgPrfmncList(pckgPrfmncList);
				if (rtnObj != null) {
					throw new EgovBizException(getMessageForMap(rtnObj));
				}



				/**
				 * 투입 실적 생성 없음
				 * */
				if (!ApcConstants.INPT_PRFMNC_TYPE_I0.equals(pckgInptPrfmncType)) {
					/**
					 * 투입 실적 단일 생성
					 * */
					if (ApcConstants.INPT_PRFMNC_TYPE_I1.equals(pckgInptPrfmncType)) {
					}
					/**
					 * 투입 실적 다중 생성
					 * */
					if (ApcConstants.INPT_PRFMNC_TYPE_I2.equals(pckgInptPrfmncType)) {

						/**
						 * 포장투입 선별재고 변경에 따라 투입실적 삭제 후 재 등록 처리
						 * */
						if (ComConstants.ROW_STS_UPDATE.equals(rowSts)) {

							PckgInptVO pckgInptVO = new PckgInptVO();
							BeanUtils.copyProperties(untyPrfmncVO, pckgInptVO);
							rtnObj = pckgInptService.deletePckgInptPrfmncAll(pckgInptVO);
							if (rtnObj != null) {
								throw new EgovBizException(getMessageForMap(rtnObj));
							}
						}

						String pckgno = pckgPrfmncList.get(0).getPckgno();
						int pckgInptSn = 1;
						for (SortPrfmncVO sortPrfmnc : sortPrfmncList) {

							if (ComConstants.CON_YES.equals(sortPrfmnc.getInptPrfmncYn())) {

								PckgInptVO pckgInptVO = new PckgInptVO();
								BeanUtils.copyProperties(sortPrfmnc, pckgInptVO);
								pckgInptVO.setPckgno(pckgno);
								pckgInptVO.setInptSn(pckgInptSn);
								pckgInptVO.setQntt(sortPrfmnc.getSortQntt());
								pckgInptVO.setWght(sortPrfmnc.getSortWght());
								pckgInptVO.setRowSts(rowSts);

								rtnObj = pckgInptSet(pckgInptVO);
								if (rtnObj != null) {
									throw new EgovBizException(getMessageForMap(rtnObj));
								}

								pckgInptPrfmncList.add(pckgInptVO);
								pckgInptSn++;
							}
						}

						rtnObj = insertUntyPckgInptPrfmncList(pckgInptPrfmncList);
						if (rtnObj != null) {
							throw new EgovBizException(getMessageForMap(rtnObj));
						}
					}
					/**
					 * 투입 실적 강제 생성
					 * */
					if (ApcConstants.INPT_PRFMNC_TYPE_I3.equals(pckgInptPrfmncType)) {

					}
				}

			}
			/**
			 * 포장실적 강제 생성
			 * */
			if (ApcConstants.PCKG_PRFMNC_TYPE_P3.equals(pckgPrfmncType)) {

			}
		}



		return null;
	}

	@Override
	public HashMap<String, Object> rawMtrWrhsSet (RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		String inptPrfmncType = rawMtrWrhsVO.getInptPrfmncType();

		/**
		 * 1. 입고실적 생성 을 위한 데이터 확인
		 * 2. 필수 데이터에 대한 기본 값 세팅
		 * */
		String apcCd = rawMtrWrhsVO.getApcCd();
		String wrhsYmd = rawMtrWrhsVO.getWrhsYmd();
		double bxQntt = rawMtrWrhsVO.getBxQntt();
		double wght = rawMtrWrhsVO.getWght();
		String itemCd = rawMtrWrhsVO.getItemCd();
		String vrtyCd = rawMtrWrhsVO.getVrtyCd();
		String grdCd = rawMtrWrhsVO.getGrdCd();
		String gdsSeCd = rawMtrWrhsVO.getGdsSeCd();
		String wrhsSeCd = rawMtrWrhsVO.getWrhsSeCd();
		String trsprtSeCd = rawMtrWrhsVO.getTrsprtSeCd();
		String prdctnYr = rawMtrWrhsVO.getPrdctnYr();
		String prdcrCd = rawMtrWrhsVO.getPrdcrCd();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		if (!StringUtils.hasText(wrhsYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "입고일자");
		}
		if (bxQntt == 0 && wght == 0) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "수량 및 중량");
		}
		if (!StringUtils.hasText(itemCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품목");
		}
		if (!StringUtils.hasText(vrtyCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품종");
		}

		/**
		 * 필수 정보 가 없을 경우 기본 값으로 처리
		 * */
		if (!StringUtils.hasText((prdcrCd))) {
			rawMtrWrhsVO.setPrdcrCd(ApcConstants.PRDCR_CD_BASIC);
		}
		if (!StringUtils.hasText(grdCd)) {
			rawMtrWrhsVO.setGrdCd(ApcConstants.GRD_CD_BASIC);
		}
		if (!StringUtils.hasText(gdsSeCd)) {
			rawMtrWrhsVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
		}
		if (!StringUtils.hasText(wrhsSeCd)) {
			rawMtrWrhsVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
		}
		if (!StringUtils.hasText(trsprtSeCd)) {
			rawMtrWrhsVO.setTrsprtSeCd(ApcConstants.TRSPRT_SE_CD_BASIC);
		}
		if (!StringUtils.hasText(prdctnYr)) {
			rawMtrWrhsVO.setPrdctnYr(rawMtrWrhsVO.getWrhsYmd().substring(0, 4));
		}

		/**
		 * 선별투입 실적에 유무에 따라 원물재고 0처리
		 * */
		if (ComConstants.CON_YES.equals(rawMtrWrhsVO.getInptPrfmncYn())) {

			rawMtrWrhsVO.setInptQntt(bxQntt);
			rawMtrWrhsVO.setInptWght(wght);
			rawMtrWrhsVO.setInvntrQntt(0);
			rawMtrWrhsVO.setInvntrWght(0.0);
		} else {
			rawMtrWrhsVO.setInvntrWght(rawMtrWrhsVO.getWght());
			rawMtrWrhsVO.setInvntrQntt(rawMtrWrhsVO.getBxQntt());
		}

		return null;

	}

	@Override
	public HashMap<String, Object> sortPrfmncSet (SortPrfmncVO sortPrfmncVO) throws Exception {

		String apcCd = sortPrfmncVO.getApcCd();
		String inptYmd = sortPrfmncVO.getInptYmd();
		double sortQntt = sortPrfmncVO.getSortQntt();
		double sortWght = sortPrfmncVO.getSortWght();
		String itemCd = sortPrfmncVO.getItemCd();
		String vrtyCd = sortPrfmncVO.getVrtyCd();
		String grdCd = sortPrfmncVO.getGrdCd();
		String gdsSeCd = sortPrfmncVO.getGdsSeCd();
		String wrhsSeCd = sortPrfmncVO.getWrhsSeCd();
		String trsprtSeCd = sortPrfmncVO.getTrsprtSe();
		String prdcrCd = sortPrfmncVO.getPrdcrCd();


		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		if (!StringUtils.hasText(inptYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별일자");
		}
		if (sortQntt == 0 && sortWght == 0) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "수량 및 중량");
		}
		if (!StringUtils.hasText(itemCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품목");
		}
		if (!StringUtils.hasText(vrtyCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품종");
		}


		if (!StringUtils.hasText((prdcrCd))) {
			sortPrfmncVO.setPrdcrCd(ApcConstants.PRDCR_CD_BASIC);
		}
		if (!StringUtils.hasText(grdCd)) {
			sortPrfmncVO.setGrdCd(ApcConstants.GRD_CD_BASIC);
		}
		if (!StringUtils.hasText(gdsSeCd)) {
			sortPrfmncVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
		}
		if (!StringUtils.hasText(wrhsSeCd)) {
			sortPrfmncVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
		}
		if (!StringUtils.hasText(trsprtSeCd)) {
			sortPrfmncVO.setTrsprtSe(ApcConstants.TRSPRT_SE_CD_BASIC);
		}

		/**
		 * 포장투입실적 여부에 따라 선별재고 0처리
		 * */
		if (ComConstants.CON_YES.equals(sortPrfmncVO.getInptPrfmncYn())) {

			sortPrfmncVO.setInptQntt(sortPrfmncVO.getSortQntt());
			sortPrfmncVO.setInptWght(sortPrfmncVO.getSortWght());
			sortPrfmncVO.setPckgQntt(sortPrfmncVO.getSortQntt());
			sortPrfmncVO.setPckgWght(sortPrfmncVO.getSortWght());
			sortPrfmncVO.setInvntrQntt(0);
			sortPrfmncVO.setInvntrWght(0.0);
		} else {
			sortPrfmncVO.setInvntrQntt(sortPrfmncVO.getSortQntt());
			sortPrfmncVO.setInvntrWght(sortPrfmncVO.getSortWght());
		}

		return null;

	}
	@Override
	public HashMap<String, Object> sortInptSet (SortInptPrfmncVO sortInptPrfmncVO) throws Exception {

		String apcCd = sortInptPrfmncVO.getApcCd();
		String inptYmd = sortInptPrfmncVO.getInptYmd();
		double qntt = sortInptPrfmncVO.getQntt();
		double wght = sortInptPrfmncVO.getWght();
		String wrhsno = sortInptPrfmncVO.getWrhsno();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		if (!StringUtils.hasText(inptYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별일자");
		}
		if (qntt == 0 && wght == 0) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "수량 및 중량");
		}
		if (!StringUtils.hasText(wrhsno)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "입고번호");
		}

		return null;
	}
	@Override
	public HashMap<String, Object> pckgPrfmncSet (PckgPrfmncVO pckgPrfmncVO) throws Exception {

		String apcCd = pckgPrfmncVO.getApcCd();
		String pckgYmd = pckgPrfmncVO.getPckgYmd();
		double pckgQntt = pckgPrfmncVO.getPckgQntt();
		double pckgWght = pckgPrfmncVO.getPckgWght();
		String itemCd = pckgPrfmncVO.getItemCd();
		String vrtyCd = pckgPrfmncVO.getVrtyCd();
		String grdCd = pckgPrfmncVO.getGrdCd();
		String gdsSeCd = pckgPrfmncVO.getGdsSeCd();
		String wrhsSeCd = pckgPrfmncVO.getWrhsSeCd();
		String prdcrCd = pckgPrfmncVO.getPrdcrCd();
		String spcfctCd = pckgPrfmncVO.getSpcfctCd();
		String pckgSpmtUnitCd = pckgPrfmncVO.getSpmtPckgUnitCd();


		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		if (!StringUtils.hasText(pckgYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "포장일자");
		}
		if (pckgQntt == 0 && pckgWght == 0) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "수량 및 중량");
		}
		if (!StringUtils.hasText(itemCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품목");
		}
		if (!StringUtils.hasText(vrtyCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품종");
		}


		if (!StringUtils.hasText((prdcrCd))) {
			pckgPrfmncVO.setPrdcrCd(ApcConstants.PRDCR_CD_BASIC);
		}
		if (!StringUtils.hasText(grdCd)) {
			pckgPrfmncVO.setGrdCd(ApcConstants.GRD_CD_BASIC);
		}
		if (!StringUtils.hasText(gdsSeCd)) {
			pckgPrfmncVO.setGdsSeCd(ApcConstants.GDS_SE_CD_BASIC);
		}
		if (!StringUtils.hasText(wrhsSeCd)) {
			pckgPrfmncVO.setWrhsSeCd(ApcConstants.WRHS_SE_CD_BASIC);
		}
		if (!StringUtils.hasText(spcfctCd)) {
			pckgPrfmncVO.setSpcfctCd(ApcConstants.SPCFCT_CD_BASIC);
		}
		if (!StringUtils.hasText(pckgSpmtUnitCd)) {
			pckgPrfmncVO.setSpmtPckgUnitCd(ApcConstants.PCKG_SPMT_UNIT_CD_BASIC);
		}

		/**
		 * 출하실적여부 판단 -> 포장 후 출하 일 경우 재고 0처리
		 * */
		if (ComConstants.CON_YES.equals(pckgPrfmncVO.getSpmtPrfmncYn())) {

			pckgPrfmncVO.setPckgQntt((int)pckgQntt);
			pckgPrfmncVO.setPckgWght(pckgWght);
			pckgPrfmncVO.setInvntrQntt(0);
			pckgPrfmncVO.setInvntrWght(0.0);
		} else {
			pckgPrfmncVO.setInvntrQntt(pckgPrfmncVO.getPckgQntt());
			pckgPrfmncVO.setInvntrWght(pckgPrfmncVO.getPckgWght());
		}

		return null;
	}
	@Override
	public HashMap<String, Object> pckgInptSet (PckgInptVO pckgInptVO) throws Exception {

		String apcCd = pckgInptVO.getApcCd();
		String inptYmd = pckgInptVO.getInptYmd();
		double qntt = pckgInptVO.getQntt();
		double wght = pckgInptVO.getWght();
		String sortno = pckgInptVO.getSortno();
		int sortSn = pckgInptVO.getSortSn();

		if (!StringUtils.hasText(apcCd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
		}
		if (!StringUtils.hasText(inptYmd)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별일자");
		}
		if (qntt == 0 && wght == 0) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "수량 및 중량");
		}
		if (!StringUtils.hasText(sortno)) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별번호");
		}
		if (sortSn == 0) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별순번");
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertRawMtrWrhsPrfmnc(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<String, Object>();

		rtnObj = rawMtrWrhsService.insertUntyRawMtrWrhsPrfmnc(rawMtrWrhsVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}
	@Override
	public HashMap<String, Object> updateRawMtrWrhsPrfmnc(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		rtnObj = rawMtrWrhsService.updateRawMtrWrhs(rawMtrWrhsVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;

	}

	@Override
	public HashMap<String, Object> multiUntySortPrfmncList(List<SortPrfmncVO> sortPrfmncList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<String, Object>();

		List<SortPrfmncVO> insertSortPrfmncList = new ArrayList<>();
		List<SortPrfmncVO> updateSortPrfmncList = new ArrayList<>();

		for (SortPrfmncVO sortPrfmncVO : sortPrfmncList) {
			if (ComConstants.ROW_STS_INSERT.equals(sortPrfmncVO.getRowSts())) {
				insertSortPrfmncList.add(sortPrfmncVO);
			}

			if (ComConstants.ROW_STS_UPDATE.equals(sortPrfmncVO.getRowSts())) {
				updateSortPrfmncList.add(sortPrfmncVO);
			}
		}

		/**
		 * 실적 목록 등록
		 * */
		if (!insertSortPrfmncList.isEmpty()) {
			rtnObj = sortPrfmncService.insertUntySortPrfmncList(insertSortPrfmncList);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}


		/**
		 * 실적 업데이트인 경우 해당 실적 삭제 후
		 * 입고 실적이 변경 될 경우 투입 실적도 변경을 해야 하기 때문에
		 * */
		if (!updateSortPrfmncList.isEmpty()) {

			SortPrfmncVO sortPrfmncVO = new SortPrfmncVO();
			BeanUtils.copyProperties(updateSortPrfmncList.get(0), sortPrfmncVO);

			rtnObj = sortPrfmncService.deletePrfmncAll(sortPrfmncVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			rtnObj = sortPrfmncService.insertUntySortPrfmncList(updateSortPrfmncList);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}
	@Override
	public HashMap<String, Object> multiUntySortInptPrfmncList(List<SortInptPrfmncVO> sortInptPrfmncList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		rtnObj = sortInptPrfmncService.insertSortInptPrfmncList(sortInptPrfmncList);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		return null;
	}
	@Override
	public HashMap<String, Object> multiUntySortInptPrfmnc(SortInptPrfmncVO sortInptPrfmnc) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		if (ComConstants.ROW_STS_INSERT.equals(sortInptPrfmnc.getRowSts())) {
			rtnObj = sortInptPrfmncService.insertSortInptPrfmnc(sortInptPrfmnc);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		if (ComConstants.ROW_STS_UPDATE.equals(sortInptPrfmnc.getRowSts())) {
			rtnObj = sortInptPrfmncService.updateSortInptPrfmnc(sortInptPrfmnc);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertUntyPckgInptPrfmncList(List<PckgInptVO> pckgInptList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();
		rtnObj = pckgInptService.insertPckgInptList(pckgInptList);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}


		return null;
	}
	@Override
	public HashMap<String, Object> insertUntyPckgInptPrfmnc(PckgInptVO pckgInptVO) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<>();

		rtnObj = pckgInptService.insertPckgInpt(pckgInptVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		return null;
	}

	@Override
	public HashMap<String, Object> multiUntyPckgPrfmncList(List<PckgPrfmncVO> pckgPrfmncList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		List<PckgPrfmncVO> insertPckgPrfmncList = new ArrayList<>();
		List<PckgPrfmncVO> updatePckgPrfmncList = new ArrayList<>();

		/**
		 * 등록 및 변경 리스트 분리
		 * */
		for (PckgPrfmncVO pckgPrfmncVO : pckgPrfmncList) {

			if (ComConstants.ROW_STS_INSERT.equals(pckgPrfmncVO.getRowSts())) {
				insertPckgPrfmncList.add(pckgPrfmncVO);
			}

			if (ComConstants.ROW_STS_UPDATE.equals(pckgPrfmncVO.getRowSts())) {
				updatePckgPrfmncList.add(pckgPrfmncVO);
			}
		}

		/**
		 * 포장실적 등록
		 * */
		if (!insertPckgPrfmncList.isEmpty()) {
			rtnObj = pckgPrfmncService.insertUntyPckgPrfmncList(insertPckgPrfmncList);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		/**
		 * 포장실적 변경 -> 삭제 후 재 등록 으로 처리 한다.
		 * */
		if (!updatePckgPrfmncList.isEmpty()) {

			PckgPrfmncVO pckgPrfmncVO = new PckgPrfmncVO();
			BeanUtils.copyProperties(updatePckgPrfmncList.get(0), pckgPrfmncVO);
			rtnObj = pckgPrfmncService.deletePckgPrfmncAll(pckgPrfmncVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

			rtnObj = pckgPrfmncService.insertUntyPckgPrfmncList(updatePckgPrfmncList);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}

		}

		return null;
	}

	@Override
	public HashMap<String, Object> multyUntySpmtPrfmncList(List<SpmtPrfmncVO> spmtPrfmncList) throws Exception {
		return null;
	}

	@Override
	public HashMap<String, Object> deleteUntyPrfmncList(List<UntyPrfmncVO> untyPrfmncList) throws Exception {

		/**
		 * 통합실적 삭제
		 * */

		for (UntyPrfmncVO untyPrfmncVO : untyPrfmncList) {

			String wrhsno = untyPrfmncVO.getWrhsno();
			String sortno = untyPrfmncVO.getSortno();
			String pckgno = untyPrfmncVO.getPckgno();
			String spmtno = untyPrfmncVO.getSpmtno();
			/**
			 * 원물입고 삭제
			 * */
			if (StringUtils.hasText(wrhsno)) {
				RawMtrWrhsVO rawMtrWrhsVO = new RawMtrWrhsVO();
				BeanUtils.copyProperties(untyPrfmncVO, rawMtrWrhsVO);
				rawMtrWrhsService.deleteRawMtrWrhs(rawMtrWrhsVO);
			}

			/**
			 * 선별실적 등록
			 * */
			if (StringUtils.hasText(sortno)) {

				/**
				 * 선별투입실적 삭제
				 * */
				if (StringUtils.hasText(wrhsno)) {
					SortInptPrfmncVO sortInptPrfmncVO = new SortInptPrfmncVO();
					BeanUtils.copyProperties(untyPrfmncVO, sortInptPrfmncVO);
					sortInptPrfmncService.deleteSortInptPrfmncAll(sortInptPrfmncVO);
				}

				SortPrfmncVO sortPrfmncVO = new SortPrfmncVO();
				BeanUtils.copyProperties(untyPrfmncVO, sortPrfmncVO);
				sortPrfmncService.deletePrfmncAll(sortPrfmncVO);
			}
			/**
			 * 포장실적 삭제
			 * */
			if (StringUtils.hasText(pckgno)) {

				/**
				 * 포장투입실적 등록
				 * */
				if (StringUtils.hasText(sortno)) {
					PckgInptVO pckgInptVO = new PckgInptVO();
					BeanUtils.copyProperties(untyPrfmncVO, pckgInptVO);
					pckgInptService.deletePckgInptPrfmncAll(pckgInptVO);
				}

			}
			if (StringUtils.hasText(spmtno)) {

			}
		}

		return null;
	}
}
