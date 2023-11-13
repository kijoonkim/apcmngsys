package com.at.apcss.am.apc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.apc.mapper.ApcEvrmntStngMapper;
import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.am.cmns.service.PltBxService;
import com.at.apcss.am.cmns.vo.PltBxVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.authrt.vo.ComAuthrtVO;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.co.user.vo.ComUserVO;

@Service("apcEvrmntStngService")
public class ApcEvrmntStngServiceImpl extends BaseServiceImpl implements ApcEvrmntStngService{

	@Autowired
	private ApcEvrmntStngMapper apcEvrmntStngMapper;

	// 권한관리
	@Resource(name = "comAuthrtService")
	private ComAuthrtService comAuthrtService;

	// 공통코드
	@Resource(name = "comCdService")
	private ComCdService comCdService;

	// 팔레트/박스
	@Resource(name = "pltBxService")
	private PltBxService pltBxService;



	@Override
	public ApcEvrmntStngVO selectApcInfo(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {
		return apcEvrmntStngMapper.selectApcInfo(apcEvrmntStngVO);
	}

	@Override
	public List<ComUserVO> selectApcUserList(ComUserVO comUserVO) throws Exception {
		return apcEvrmntStngMapper.selectApcUserList(comUserVO);
	}

	@Override
	public List<ComUserVO> selectRsrcList(ComCdVO comCdVO) throws Exception {
		return apcEvrmntStngMapper.selectRsrcList(comCdVO);
	}

	@Override
	public ApcEvrmntStngVO selectUserAprvReg(ComUserVO comUserVO) throws Exception {
		return null;
	}

	@Override
	public HashMap<String, Object> insertApcInitInfo(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		String sysUserId = apcEvrmntStngVO.getSysLastChgUserId();
		String sysPrgrmId = apcEvrmntStngVO.getSysLastChgPrgrmId();

		// 010 apc 정보 확인
		ApcEvrmntStngVO apcInfo = selectApcInfo(apcEvrmntStngVO);
		if (apcInfo == null || !StringUtils.hasText(apcInfo.getApcCd())) {
			return ComUtil.getResultMap("W0005", "APC코드");	// W0005	{0}이/가 없습니다.
		}

		// 020 apc 환경설정 정보 확인
		ApcEvrmntStngVO apcStngInfo = selectApcEvrmntStng(apcEvrmntStngVO);
		if (apcStngInfo != null && StringUtils.hasText(apcStngInfo.getApcCd())) {
			return ComUtil.getResultMap("W0009", "APC환경설정 정보");		// W0009	{0}이/가 있습니다.
		}

		// 110 APC 환경설정정보 INSERT
		// 기본정보
		apcEvrmntStngVO.setApcNm(apcInfo.getApcNm());			// APC명
		apcEvrmntStngVO.setRegApcNm(apcInfo.getRegApcNm());
		apcEvrmntStngVO.setAddr(apcInfo.getAddr());				// 주소
		apcEvrmntStngVO.setTelno(apcInfo.getTelno());			// 전화번호
		apcEvrmntStngVO.setFxno(apcInfo.getFxno());				// FAX번호
		apcEvrmntStngVO.setBrno(apcInfo.getBrno());				// 사업자등록번호


		apcEvrmntStngVO.setApcSeCd(AmConstants.CON_APC_SE_CD_CORP);		// APC구분코드	2:농업법인
		apcEvrmntStngVO.setClclnCrtrCd(AmConstants.CON_CLCLN_CRTR_SORT);	// 정산기준 2:선별완료

		// 기본사용메뉴 set
		apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);			// 원물입고관리유무
		apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);		// 원물인식표발행유무
		apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);				// 팔레트박스정보관리유무
		apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);					// 선별관리유무
		apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);		// 선별확인서발행유무
		apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);					// 출하관리유무
		apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);			// 송품장발행유무

		int insertedCnt = apcEvrmntStngMapper.insertApcEvrmntStngInit(apcEvrmntStngVO);

		if (insertedCnt != 1) {
			// error exception
		}

		// 120 APC 초기정보 등록
		ComCdVO comCdMstVO = new ComCdVO();
		comCdMstVO.setSysFrstInptUserId(sysUserId);
		comCdMstVO.setSysFrstInptPrgrmId(sysPrgrmId);
		comCdMstVO.setSysLastChgUserId(sysUserId);
		comCdMstVO.setSysLastChgPrgrmId(sysPrgrmId);
		comCdMstVO.setApcCd(apcEvrmntStngVO.getApcCd());

		ComCdVO comCdParam = new ComCdVO();
		comCdParam.setApcCd(ApcConstants.APC_CD_SYSTEM);
		comCdParam.setDelYn(ComConstants.CON_NONE);
		List<ComCdVO> comCdDtlList = new ArrayList<>();

		// 121 설비 : 선별기	공통코드	SORT_FCLT_CD
		comCdParam.setCdId(AmConstants.CON_CD_ID_SORT_FCLT_CD);
		comCdDtlList = comCdService.selectComCdDtlList(comCdParam);
		for ( ComCdVO orgnCdDtl : comCdDtlList ) {
			ComCdVO comCdDtlVO = new ComCdVO();
			BeanUtils.copyProperties(comCdMstVO, comCdDtlVO);
			BeanUtils.copyProperties(orgnCdDtl, comCdDtlVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			comCdService.insertComCdDtl(comCdDtlVO);
		}

		// 122 설비 : 포장기	공통코드	PCKG_FCLT_CD
		comCdParam.setCdId(AmConstants.CON_CD_ID_PCKG_FCLT_CD);
		comCdDtlList = comCdService.selectComCdDtlList(comCdParam);
		for ( ComCdVO orgnCdDtl : comCdDtlList ) {
			ComCdVO comCdDtlVO = new ComCdVO();
			BeanUtils.copyProperties(comCdMstVO, comCdDtlVO);
			BeanUtils.copyProperties(orgnCdDtl, comCdDtlVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			comCdService.insertComCdDtl(comCdDtlVO);
		}

		// 123 창고			공통코드	WAREHOUSE_SE_CD
		comCdParam.setCdId(AmConstants.CON_CD_ID_WAREHOUSE_SE_CD);
		comCdDtlList = comCdService.selectComCdDtlList(comCdParam);
		for ( ComCdVO orgnCdDtl : comCdDtlList ) {
			ComCdVO comCdDtlVO = new ComCdVO();
			BeanUtils.copyProperties(comCdMstVO, comCdDtlVO);
			BeanUtils.copyProperties(orgnCdDtl, comCdDtlVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			comCdService.insertComCdDtl(comCdDtlVO);
		}

		// 124 상품코드 : 		공통코드	GDS_SE_CD
		comCdParam.setCdId(AmConstants.CON_CD_ID_GDS_SE_CD);
		comCdDtlList = comCdService.selectComCdDtlList(comCdParam);
		for ( ComCdVO orgnCdDtl : comCdDtlList ) {
			ComCdVO comCdDtlVO = new ComCdVO();
			BeanUtils.copyProperties(comCdMstVO, comCdDtlVO);
			BeanUtils.copyProperties(orgnCdDtl, comCdDtlVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			comCdService.insertComCdDtl(comCdDtlVO);
		}

		// 123 팔레트/박스		테이블		TB_PLT_BX_INFO
		PltBxVO pltBxVO = new PltBxVO();
		BeanUtils.copyProperties(comCdMstVO, pltBxVO);
		rtnObj = pltBxService.insertPltBxSample(pltBxVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 권한메뉴 set
		ApcEvrmntStngVO authStngVO = new ApcEvrmntStngVO();
		BeanUtils.copyProperties(comCdMstVO, authStngVO);

		apcStngInfo = selectApcEvrmntStng(authStngVO);
		if (apcInfo == null || !StringUtils.hasText(apcInfo.getApcCd())) {
			logger.error("Error on ApcEvrmntStngService#insertApcInitInfo call selectApcEvrmntStng");
			logger.error(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC설정정보")));
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC설정정보")));	// W0005	{0}이/가 없습니다.
		}

		BeanUtils.copyProperties(apcStngInfo, authStngVO,
				ApcConstants.PROP_APC_CD,
				ComConstants.PROP_SYS_FRST_INPT_DT,
				ComConstants.PROP_SYS_FRST_INPT_USER_ID,
				ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
				ComConstants.PROP_SYS_LAST_CHG_DT,
				ComConstants.PROP_SYS_LAST_CHG_USER_ID,
				ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
		rtnObj = comAuthrtService.insertApcNormalAuthrt(authStngVO);
		if (rtnObj != null) {
			logger.error("Error on ApcEvrmntStngService#insertApcInitInfo call ComAuthrtService#insertApcNormalAuthrt");
			logger.error(getMessageForMap(rtnObj));
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}

	@Override
	public ApcEvrmntStngVO selectApcEvrmntStng(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {
		return apcEvrmntStngMapper.selectApcEvrmntStng(apcEvrmntStngVO);
	}

	@Override
	public HashMap<String, Object> updateApcEvrmntStngAuthrt(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		rtnObj = insertApcNormalAuthrt(apcEvrmntStngVO);
		if (rtnObj != null) {
			logger.error("Error on ApcEvrmntStngService#updateApcEvrmntStngAuthrt call insertApcNormalAuthrt");
			logger.error(getMessageForMap(rtnObj));
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		int updatedCnt = apcEvrmntStngMapper.updateApcEvrmntStngAuthrt(apcEvrmntStngVO);
		if (updatedCnt != 1) {
			logger.error("Error on ApcEvrmntStngService#updateApcEvrmntStngAuthrt call updateApcEvrmntStngAuthrt");
			logger.error(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC설정정보")));
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC설정정보")));	// W0005	{0}이/가 없습니다.
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertApcSimpleAuthrt(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		String authrtCaseId = apcEvrmntStngVO.getAuthrtCaseId();

		/*
		apcEvrmntStngVO.setWghMngYn(ComConstants.CON_YES);				// 계량정보관리유무
		apcEvrmntStngVO.setWghMblUseYn(ComConstants.CON_YES);			// 계량테블릿사용유무
		apcEvrmntStngVO.setWghIdntyDocPblcnYn(ComConstants.CON_YES);	// 계량확인서발행유무
		apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);		// 원물입고관리유무
		apcEvrmntStngVO.setRawMtrWrhsMblUseYn(ComConstants.CON_YES);	// 원물입고테블릿사용유무
		apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);	// 원물인식표발행유무
		apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);			// 팔레트박스정보관리유무
		apcEvrmntStngVO.setRawMtrWrhsPlanMngYn(ComConstants.CON_YES);	// 원물입고계획관리유무
		apcEvrmntStngVO.setGdsWrhsMngYn(ComConstants.CON_YES);			// 상품입고관리유무
		apcEvrmntStngVO.setSortCmndMngYn(ComConstants.CON_YES);			// 선별지시관리유무
		apcEvrmntStngVO.setSortCmndDocPblcnYn(ComConstants.CON_YES);	// 선별지시서발행유무
		apcEvrmntStngVO.setPckgCmndMngYn(ComConstants.CON_YES);			// 포장지시관리유무
		apcEvrmntStngVO.setPckgCmndDocPblcnYn(ComConstants.CON_YES);	// 포장지시서발행유무
		apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);				// 선별관리사용유무
		apcEvrmntStngVO.setSortMblUseYn(ComConstants.CON_YES);			// 선별테블릿사용유무
		apcEvrmntStngVO.setSortLabelPblcnYn(ComConstants.CON_YES);		// 선별라벨발행유무
		apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);	// 선별확인서발행유무
		apcEvrmntStngVO.setPckgMngYn(ComConstants.CON_YES);				// 포장관리유무
		apcEvrmntStngVO.setPckgMblUseYn(ComConstants.CON_YES);			// 포장테블릿사용유무
		apcEvrmntStngVO.setGdsLblPblcnYn(ComConstants.CON_YES);			// 상품라벨발행유무
		apcEvrmntStngVO.setSpmtCmndMngYn(ComConstants.CON_YES);			// 출하지시관리유무
		apcEvrmntStngVO.setSpmtCmndDocPblcnYn(ComConstants.CON_YES);	// 출하지시서발행유무
		apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
		apcEvrmntStngVO.setSpmtMblUseYn(ComConstants.CON_YES);			// 출하테블릿사용유무
		apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
		apcEvrmntStngVO.setClclnMngYn(ComConstants.CON_YES);			// 정산관리유무
		apcEvrmntStngVO.setOutordrMngYn(ComConstants.CON_YES);			// 발주정보관리유무
		apcEvrmntStngVO.setOutordrPckgCmndLnkgYn(ComConstants.CON_YES);	// 발주정보포장지시연결유무
		apcEvrmntStngVO.setTrsmMngYn(ComConstants.CON_YES);				// 전송관리유무
		apcEvrmntStngVO.setSortDataTrsmYn(ComConstants.CON_YES);		// 선별정보전송유무
		apcEvrmntStngVO.setClclnDataTrsmYn(ComConstants.CON_YES);		// 정산자료전송유무
		apcEvrmntStngVO.setOprtrUseYn(ComConstants.CON_YES);			// 생산작업자사용유무
		apcEvrmntStngVO.setOprtrSortPrfmncTrsmYn(ComConstants.CON_YES);	// 생산작업자선별실적전송유무
		apcEvrmntStngVO.setOprtrPckgPrfmncTrsmYn(ComConstants.CON_YES);	// 생산작업자포장실적전송유무
		 */

		if (ApcConstants.AUTHRT_CASE_01.equals(authrtCaseId)) {
			apcEvrmntStngVO.setWghMngYn(ComConstants.CON_YES);				// 계량정보관리유무
			apcEvrmntStngVO.setWghIdntyDocPblcnYn(ComConstants.CON_YES);	// 계량확인서발행유무
			apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);		// 원물입고관리유무
			apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);	// 원물인식표발행유무
			apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);			// 팔레트박스정보관리유무
			apcEvrmntStngVO.setSortCmndMngYn(ComConstants.CON_YES);			// 선별지시관리유무
			apcEvrmntStngVO.setSortCmndDocPblcnYn(ComConstants.CON_YES);	// 선별지시서발행유무
			apcEvrmntStngVO.setPckgCmndMngYn(ComConstants.CON_YES);			// 포장지시관리유무
			apcEvrmntStngVO.setPckgCmndDocPblcnYn(ComConstants.CON_YES);	// 포장지시서발행유무
			apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);				// 선별관리사용유무
			apcEvrmntStngVO.setSortMblUseYn(ComConstants.CON_YES);			// 선별테블릿사용유무
			apcEvrmntStngVO.setSortLblPblcnYn(ComConstants.CON_YES);		// 선별라벨발행유무
			apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);	// 선별확인서발행유무
			apcEvrmntStngVO.setPckgMngYn(ComConstants.CON_YES);				// 포장관리유무
			apcEvrmntStngVO.setPckgMblUseYn(ComConstants.CON_YES);			// 포장테블릿사용유무
			apcEvrmntStngVO.setGdsLblPblcnYn(ComConstants.CON_YES);			// 상품라벨발행유무
			apcEvrmntStngVO.setSpmtCmndMngYn(ComConstants.CON_YES);			// 출하지시관리유무
			apcEvrmntStngVO.setSpmtCmndDocPblcnYn(ComConstants.CON_YES);	// 출하지시서발행유무
			apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
			apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
			apcEvrmntStngVO.setClclnMngYn(ComConstants.CON_YES);			// 정산관리유무
			apcEvrmntStngVO.setOutordrMngYn(ComConstants.CON_YES);			// 발주정보관리유무
			apcEvrmntStngVO.setOutordrPckgCmndLnkgYn(ComConstants.CON_YES);	// 발주정보포장지시연결유무
			apcEvrmntStngVO.setTrsmMngYn(ComConstants.CON_YES);				// 전송관리유무
		} else if (ApcConstants.AUTHRT_CASE_02.equals(authrtCaseId)) {
			apcEvrmntStngVO.setWghMngYn(ComConstants.CON_YES);				// 계량정보관리유무
			apcEvrmntStngVO.setWghIdntyDocPblcnYn(ComConstants.CON_YES);	// 계량확인서발행유무
			apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);		// 원물입고관리유무
			apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);	// 원물인식표발행유무
			apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);			// 팔레트박스정보관리유무
			apcEvrmntStngVO.setSortCmndMngYn(ComConstants.CON_YES);			// 선별지시관리유무
			apcEvrmntStngVO.setSortCmndDocPblcnYn(ComConstants.CON_YES);	// 선별지시서발행유무
			apcEvrmntStngVO.setPckgCmndMngYn(ComConstants.CON_YES);			// 포장지시관리유무
			apcEvrmntStngVO.setPckgCmndDocPblcnYn(ComConstants.CON_YES);	// 포장지시서발행유무
			apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);				// 선별관리사용유무
			apcEvrmntStngVO.setSortMblUseYn(ComConstants.CON_YES);			// 선별테블릿사용유무
			apcEvrmntStngVO.setSortLblPblcnYn(ComConstants.CON_YES);		// 선별라벨발행유무
			apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);	// 선별확인서발행유무
			apcEvrmntStngVO.setPckgMngYn(ComConstants.CON_YES);				// 포장관리유무
			apcEvrmntStngVO.setGdsLblPblcnYn(ComConstants.CON_YES);			// 상품라벨발행유무
			apcEvrmntStngVO.setSpmtCmndMngYn(ComConstants.CON_YES);			// 출하지시관리유무
			apcEvrmntStngVO.setSpmtCmndDocPblcnYn(ComConstants.CON_YES);	// 출하지시서발행유무
			apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
			apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
			apcEvrmntStngVO.setClclnMngYn(ComConstants.CON_YES);			// 정산관리유무
			apcEvrmntStngVO.setOutordrMngYn(ComConstants.CON_YES);			// 발주정보관리유무
			apcEvrmntStngVO.setOutordrPckgCmndLnkgYn(ComConstants.CON_YES);	// 발주정보포장지시연결유무
			apcEvrmntStngVO.setTrsmMngYn(ComConstants.CON_YES);				// 전송관리유무
		} else if (ApcConstants.AUTHRT_CASE_03.equals(authrtCaseId)) {
			apcEvrmntStngVO.setWghMngYn(ComConstants.CON_YES);				// 계량정보관리유무
			apcEvrmntStngVO.setWghIdntyDocPblcnYn(ComConstants.CON_YES);	// 계량확인서발행유무
			apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);		// 원물입고관리유무
			apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);	// 원물인식표발행유무
			apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);			// 팔레트박스정보관리유무
			apcEvrmntStngVO.setSortCmndMngYn(ComConstants.CON_YES);			// 선별지시관리유무
			apcEvrmntStngVO.setSortCmndDocPblcnYn(ComConstants.CON_YES);	// 선별지시서발행유무
			apcEvrmntStngVO.setPckgCmndMngYn(ComConstants.CON_YES);			// 포장지시관리유무
			apcEvrmntStngVO.setPckgCmndDocPblcnYn(ComConstants.CON_YES);	// 포장지시서발행유무
			apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);				// 선별관리사용유무
			apcEvrmntStngVO.setSortLblPblcnYn(ComConstants.CON_YES);		// 선별라벨발행유무
			apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);	// 선별확인서발행유무
			apcEvrmntStngVO.setPckgMngYn(ComConstants.CON_YES);				// 포장관리유무
			apcEvrmntStngVO.setGdsLblPblcnYn(ComConstants.CON_YES);			// 상품라벨발행유무
			apcEvrmntStngVO.setSpmtCmndMngYn(ComConstants.CON_YES);			// 출하지시관리유무
			apcEvrmntStngVO.setSpmtCmndDocPblcnYn(ComConstants.CON_YES);	// 출하지시서발행유무
			apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
			apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
			apcEvrmntStngVO.setClclnMngYn(ComConstants.CON_YES);			// 정산관리유무
			apcEvrmntStngVO.setOutordrMngYn(ComConstants.CON_YES);			// 발주정보관리유무
			apcEvrmntStngVO.setOutordrPckgCmndLnkgYn(ComConstants.CON_YES);	// 발주정보포장지시연결유무
			apcEvrmntStngVO.setTrsmMngYn(ComConstants.CON_YES);				// 전송관리유무
		} else if (ApcConstants.AUTHRT_CASE_04.equals(authrtCaseId)) {
			apcEvrmntStngVO.setWghMngYn(ComConstants.CON_YES);				// 계량정보관리유무
			apcEvrmntStngVO.setWghIdntyDocPblcnYn(ComConstants.CON_YES);	// 계량확인서발행유무
			apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);		// 원물입고관리유무
			apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);	// 원물인식표발행유무
			apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);			// 팔레트박스정보관리유무
			apcEvrmntStngVO.setSortCmndMngYn(ComConstants.CON_YES);			// 선별지시관리유무
			apcEvrmntStngVO.setSortCmndDocPblcnYn(ComConstants.CON_YES);	// 선별지시서발행유무
			apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);				// 선별관리사용유무
			apcEvrmntStngVO.setSortLblPblcnYn(ComConstants.CON_YES);		// 선별라벨발행유무
			apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);	// 선별확인서발행유무
			apcEvrmntStngVO.setPckgMngYn(ComConstants.CON_YES);				// 포장관리유무
			apcEvrmntStngVO.setGdsLblPblcnYn(ComConstants.CON_YES);			// 상품라벨발행유무
			apcEvrmntStngVO.setSpmtCmndMngYn(ComConstants.CON_YES);			// 출하지시관리유무
			apcEvrmntStngVO.setSpmtCmndDocPblcnYn(ComConstants.CON_YES);	// 출하지시서발행유무
			apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
			apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
			apcEvrmntStngVO.setClclnMngYn(ComConstants.CON_YES);			// 정산관리유무
			apcEvrmntStngVO.setOutordrMngYn(ComConstants.CON_YES);			// 발주정보관리유무
			apcEvrmntStngVO.setOutordrPckgCmndLnkgYn(ComConstants.CON_YES);	// 발주정보포장지시연결유무
			apcEvrmntStngVO.setTrsmMngYn(ComConstants.CON_YES);				// 전송관리유무
		} else if (ApcConstants.AUTHRT_CASE_05.equals(authrtCaseId)) {
			apcEvrmntStngVO.setWghMngYn(ComConstants.CON_YES);				// 계량정보관리유무
			apcEvrmntStngVO.setWghIdntyDocPblcnYn(ComConstants.CON_YES);	// 계량확인서발행유무
			apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);		// 원물입고관리유무
			apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);	// 원물인식표발행유무
			apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);			// 팔레트박스정보관리유무
			apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);				// 선별관리사용유무
			apcEvrmntStngVO.setSortLblPblcnYn(ComConstants.CON_YES);		// 선별라벨발행유무
			apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);	// 선별확인서발행유무
			apcEvrmntStngVO.setPckgMngYn(ComConstants.CON_YES);				// 포장관리유무
			apcEvrmntStngVO.setGdsLblPblcnYn(ComConstants.CON_YES);			// 상품라벨발행유무
			apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
			apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
			apcEvrmntStngVO.setClclnMngYn(ComConstants.CON_YES);			// 정산관리유무
		} else if (ApcConstants.AUTHRT_CASE_06.equals(authrtCaseId)) {
			apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);		// 원물입고관리유무
			apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);	// 원물인식표발행유무
			apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);			// 팔레트박스정보관리유무
			apcEvrmntStngVO.setRawMtrWrhsPlanMngYn(ComConstants.CON_YES);	// 원물입고계획관리유무
			apcEvrmntStngVO.setGdsWrhsMngYn(ComConstants.CON_YES);			// 상품입고관리유무
			apcEvrmntStngVO.setSortCmndMngYn(ComConstants.CON_YES);			// 선별지시관리유무
			apcEvrmntStngVO.setSortCmndDocPblcnYn(ComConstants.CON_YES);	// 선별지시서발행유무
			apcEvrmntStngVO.setPckgCmndMngYn(ComConstants.CON_YES);			// 포장지시관리유무
			apcEvrmntStngVO.setPckgCmndDocPblcnYn(ComConstants.CON_YES);	// 포장지시서발행유무
			apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);				// 선별관리사용유무
			apcEvrmntStngVO.setSortMblUseYn(ComConstants.CON_YES);			// 선별테블릿사용유무
			apcEvrmntStngVO.setSortLblPblcnYn(ComConstants.CON_YES);		// 선별라벨발행유무
			apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);	// 선별확인서발행유무
			apcEvrmntStngVO.setPckgMngYn(ComConstants.CON_YES);				// 포장관리유무
			apcEvrmntStngVO.setPckgMblUseYn(ComConstants.CON_YES);			// 포장테블릿사용유무
			apcEvrmntStngVO.setGdsLblPblcnYn(ComConstants.CON_YES);			// 상품라벨발행유무
			apcEvrmntStngVO.setSpmtCmndMngYn(ComConstants.CON_YES);			// 출하지시관리유무
			apcEvrmntStngVO.setSpmtCmndDocPblcnYn(ComConstants.CON_YES);	// 출하지시서발행유무
			apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
			apcEvrmntStngVO.setSpmtMblUseYn(ComConstants.CON_YES);			// 출하테블릿사용유무
			apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
			apcEvrmntStngVO.setClclnMngYn(ComConstants.CON_YES);			// 정산관리유무
			apcEvrmntStngVO.setOutordrMngYn(ComConstants.CON_YES);			// 발주정보관리유무
			apcEvrmntStngVO.setOutordrPckgCmndLnkgYn(ComConstants.CON_YES);	// 발주정보포장지시연결유무
			apcEvrmntStngVO.setTrsmMngYn(ComConstants.CON_YES);				// 전송관리유무
		} else if (ApcConstants.AUTHRT_CASE_07.equals(authrtCaseId)) {
			apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);		// 원물입고관리유무
			apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);	// 원물인식표발행유무
			apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);			// 팔레트박스정보관리유무
			apcEvrmntStngVO.setRawMtrWrhsPlanMngYn(ComConstants.CON_YES);	// 원물입고계획관리유무
			apcEvrmntStngVO.setGdsWrhsMngYn(ComConstants.CON_YES);			// 상품입고관리유무
			apcEvrmntStngVO.setSortCmndMngYn(ComConstants.CON_YES);			// 선별지시관리유무
			apcEvrmntStngVO.setSortCmndDocPblcnYn(ComConstants.CON_YES);	// 선별지시서발행유무
			apcEvrmntStngVO.setPckgCmndMngYn(ComConstants.CON_YES);			// 포장지시관리유무
			apcEvrmntStngVO.setPckgCmndDocPblcnYn(ComConstants.CON_YES);	// 포장지시서발행유무
			apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);				// 선별관리사용유무
			apcEvrmntStngVO.setSortMblUseYn(ComConstants.CON_YES);			// 선별테블릿사용유무
			apcEvrmntStngVO.setSortLblPblcnYn(ComConstants.CON_YES);		// 선별라벨발행유무
			apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);	// 선별확인서발행유무
			apcEvrmntStngVO.setPckgMngYn(ComConstants.CON_YES);				// 포장관리유무
			apcEvrmntStngVO.setGdsLblPblcnYn(ComConstants.CON_YES);			// 상품라벨발행유무
			apcEvrmntStngVO.setSpmtCmndMngYn(ComConstants.CON_YES);			// 출하지시관리유무
			apcEvrmntStngVO.setSpmtCmndDocPblcnYn(ComConstants.CON_YES);	// 출하지시서발행유무
			apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
			apcEvrmntStngVO.setSpmtMblUseYn(ComConstants.CON_YES);			// 출하테블릿사용유무
			apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
			apcEvrmntStngVO.setClclnMngYn(ComConstants.CON_YES);			// 정산관리유무
			apcEvrmntStngVO.setOutordrMngYn(ComConstants.CON_YES);			// 발주정보관리유무
			apcEvrmntStngVO.setOutordrPckgCmndLnkgYn(ComConstants.CON_YES);	// 발주정보포장지시연결유무
			apcEvrmntStngVO.setTrsmMngYn(ComConstants.CON_YES);				// 전송관리유무
		} else if (ApcConstants.AUTHRT_CASE_08.equals(authrtCaseId)) {
			apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);		// 원물입고관리유무
			apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);	// 원물인식표발행유무
			apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);			// 팔레트박스정보관리유무
			apcEvrmntStngVO.setRawMtrWrhsPlanMngYn(ComConstants.CON_YES);	// 원물입고계획관리유무
			apcEvrmntStngVO.setGdsWrhsMngYn(ComConstants.CON_YES);			// 상품입고관리유무
			apcEvrmntStngVO.setSortCmndMngYn(ComConstants.CON_YES);			// 선별지시관리유무
			apcEvrmntStngVO.setSortCmndDocPblcnYn(ComConstants.CON_YES);	// 선별지시서발행유무
			apcEvrmntStngVO.setPckgCmndMngYn(ComConstants.CON_YES);			// 포장지시관리유무
			apcEvrmntStngVO.setPckgCmndDocPblcnYn(ComConstants.CON_YES);	// 포장지시서발행유무
			apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);				// 선별관리사용유무
			apcEvrmntStngVO.setSortLblPblcnYn(ComConstants.CON_YES);		// 선별라벨발행유무
			apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);	// 선별확인서발행유무
			apcEvrmntStngVO.setPckgMngYn(ComConstants.CON_YES);				// 포장관리유무
			apcEvrmntStngVO.setGdsLblPblcnYn(ComConstants.CON_YES);			// 상품라벨발행유무
			apcEvrmntStngVO.setSpmtCmndMngYn(ComConstants.CON_YES);			// 출하지시관리유무
			apcEvrmntStngVO.setSpmtCmndDocPblcnYn(ComConstants.CON_YES);	// 출하지시서발행유무
			apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
			apcEvrmntStngVO.setSpmtMblUseYn(ComConstants.CON_YES);			// 출하테블릿사용유무
			apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
			apcEvrmntStngVO.setClclnMngYn(ComConstants.CON_YES);			// 정산관리유무
			apcEvrmntStngVO.setOutordrMngYn(ComConstants.CON_YES);			// 발주정보관리유무
			apcEvrmntStngVO.setOutordrPckgCmndLnkgYn(ComConstants.CON_YES);	// 발주정보포장지시연결유무
			apcEvrmntStngVO.setTrsmMngYn(ComConstants.CON_YES);				// 전송관리유무
		} else if (ApcConstants.AUTHRT_CASE_09.equals(authrtCaseId)) {
			apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);		// 원물입고관리유무
			apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);	// 원물인식표발행유무
			apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);			// 팔레트박스정보관리유무
			apcEvrmntStngVO.setRawMtrWrhsPlanMngYn(ComConstants.CON_YES);	// 원물입고계획관리유무
			apcEvrmntStngVO.setGdsWrhsMngYn(ComConstants.CON_YES);			// 상품입고관리유무
			apcEvrmntStngVO.setSortCmndMngYn(ComConstants.CON_YES);			// 선별지시관리유무
			apcEvrmntStngVO.setSortCmndDocPblcnYn(ComConstants.CON_YES);	// 선별지시서발행유무
			apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);				// 선별관리사용유무
			apcEvrmntStngVO.setSortLblPblcnYn(ComConstants.CON_YES);		// 선별라벨발행유무
			apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);	// 선별확인서발행유무
			apcEvrmntStngVO.setPckgMngYn(ComConstants.CON_YES);				// 포장관리유무
			apcEvrmntStngVO.setGdsLblPblcnYn(ComConstants.CON_YES);			// 상품라벨발행유무
			apcEvrmntStngVO.setSpmtCmndMngYn(ComConstants.CON_YES);			// 출하지시관리유무
			apcEvrmntStngVO.setSpmtCmndDocPblcnYn(ComConstants.CON_YES);	// 출하지시서발행유무
			apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
			apcEvrmntStngVO.setSpmtMblUseYn(ComConstants.CON_YES);			// 출하테블릿사용유무
			apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
			apcEvrmntStngVO.setClclnMngYn(ComConstants.CON_YES);			// 정산관리유무
			apcEvrmntStngVO.setOutordrMngYn(ComConstants.CON_YES);			// 발주정보관리유무
			apcEvrmntStngVO.setOutordrPckgCmndLnkgYn(ComConstants.CON_YES);	// 발주정보포장지시연결유무
			apcEvrmntStngVO.setTrsmMngYn(ComConstants.CON_YES);				// 전송관리유무
		} else if (ApcConstants.AUTHRT_CASE_10.equals(authrtCaseId)) {
			apcEvrmntStngVO.setRawMtrWrhsMngYn(ComConstants.CON_YES);		// 원물입고관리유무
			apcEvrmntStngVO.setRawMtrIdentTagPblcnYn(ComConstants.CON_YES);	// 원물인식표발행유무
			apcEvrmntStngVO.setPltBxMngYn(ComConstants.CON_YES);			// 팔레트박스정보관리유무
			apcEvrmntStngVO.setRawMtrWrhsPlanMngYn(ComConstants.CON_YES);	// 원물입고계획관리유무
			apcEvrmntStngVO.setGdsWrhsMngYn(ComConstants.CON_YES);			// 상품입고관리유무
			apcEvrmntStngVO.setSortMngYn(ComConstants.CON_YES);				// 선별관리사용유무
			apcEvrmntStngVO.setSortLblPblcnYn(ComConstants.CON_YES);		// 선별라벨발행유무
			apcEvrmntStngVO.setSortIdntyDocPblcnYn(ComConstants.CON_YES);	// 선별확인서발행유무
			apcEvrmntStngVO.setPckgMngYn(ComConstants.CON_YES);				// 포장관리유무
			apcEvrmntStngVO.setGdsLblPblcnYn(ComConstants.CON_YES);			// 상품라벨발행유무
			apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
			apcEvrmntStngVO.setSpmtMblUseYn(ComConstants.CON_YES);			// 출하테블릿사용유무
			apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
			apcEvrmntStngVO.setClclnMngYn(ComConstants.CON_YES);			// 정산관리유무
			apcEvrmntStngVO.setTrsmMngYn(ComConstants.CON_YES);				// 전송관리유무

		} else if (ApcConstants.AUTHRT_CASE_11.equals(authrtCaseId)) {
			apcEvrmntStngVO.setSpmtCmndMngYn(ComConstants.CON_YES);			// 출하지시관리유무
			apcEvrmntStngVO.setSpmtCmndDocPblcnYn(ComConstants.CON_YES);	// 출하지시서발행유무
			apcEvrmntStngVO.setSpmtMngYn(ComConstants.CON_YES);				// 출하관리유무
			apcEvrmntStngVO.setSpmtMblUseYn(ComConstants.CON_YES);			// 출하테블릿사용유무
			apcEvrmntStngVO.setSpmtDocPblcnYn(ComConstants.CON_YES);		// 송품장발행유무
			apcEvrmntStngVO.setOutordrMngYn(ComConstants.CON_YES);			// 발주정보관리유무
			apcEvrmntStngVO.setOutordrPckgCmndLnkgYn(ComConstants.CON_YES);	// 발주정보포장지시연결유무

		}else {
			logger.error("Error on ApcEvrmntStngService#insertApcSimpleAuthrt");
			logger.error(getMessageForMap(ComUtil.getResultMap("W0005", "CASE ID")));
			return ComUtil.getResultMap("W0005", "CASE ID");
		}

		ComAuthrtVO authrtVO = new ComAuthrtVO();
		BeanUtils.copyProperties(apcEvrmntStngVO, authrtVO);

		rtnObj = comAuthrtService.insertApcSimpleAuthrt(authrtVO);
		if (rtnObj != null) {
			logger.error("Error on ApcEvrmntStngService#insertApcSimpleAuthrt call ComAuthrtService#insertApcSimpleAuthrt");
			logger.error(getMessageForMap(rtnObj));
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		int updatedCnt = apcEvrmntStngMapper.updateApcEvrmntStngAuthrt(apcEvrmntStngVO);
		if (updatedCnt != 1) {
			logger.error("Error on ApcEvrmntStngService#insertApcSimpleAuthrt call updateApcEvrmntStngAuthrt");
			logger.error(getMessageForMap(ComUtil.getResultMap("W0005", "APC설정정보")));
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap("W0005", "APC설정정보")));	// W0005	{0}이/가 없습니다.
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertApcNormalAuthrt(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {

		HashMap<String, Object> rtnObj = comAuthrtService.insertApcNormalAuthrt(apcEvrmntStngVO);
		if (rtnObj != null) {
			logger.error("Error on ApcEvrmntStngService#insertApcSimpleAuthrt call ComAuthrtService#insertApcSimpleAuthrt");
			logger.error(getMessageForMap(rtnObj));
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		return null;
	}


	// APC 환경설정 - 정보 변경
	@Override
	public int updateApcEvrmntStng(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {

		ComCdVO comCdAll = new ComCdVO();
		comCdAll.setSysFrstInptUserId(apcEvrmntStngVO.getSysFrstInptUserId());
		comCdAll.setSysFrstInptPrgrmId(apcEvrmntStngVO.getSysFrstInptPrgrmId());
		comCdAll.setSysLastChgUserId(apcEvrmntStngVO.getSysLastChgUserId());
		comCdAll.setSysLastChgPrgrmId(apcEvrmntStngVO.getSysLastChgPrgrmId());
		comCdAll.setApcCd(apcEvrmntStngVO.getApcCd());
		comCdAll.setCdId("GDS_SE_CD");

		comCdService.comCdDtlDelYnAll(comCdAll);

		String[] cdVls = apcEvrmntStngVO.getCdVls().split("");

		for (String string : cdVls) {
			ComCdVO comCdVO = new ComCdVO();
			comCdVO.setCdVl(string);
			comCdVO.setSysFrstInptUserId(apcEvrmntStngVO.getSysFrstInptUserId());
			comCdVO.setSysFrstInptPrgrmId(apcEvrmntStngVO.getSysFrstInptPrgrmId());
			comCdVO.setSysLastChgUserId(apcEvrmntStngVO.getSysLastChgUserId());
			comCdVO.setSysLastChgPrgrmId(apcEvrmntStngVO.getSysLastChgPrgrmId());
			comCdVO.setApcCd(apcEvrmntStngVO.getApcCd());
			comCdVO.setCdId("GDS_SE_CD");

			comCdService.updateComCdDtlDelYn(comCdVO);
		}

		return apcEvrmntStngMapper.updateApcEvrmntStng(apcEvrmntStngVO);
	}

	@Override
	public HashMap<String, Object> updateApcMenuAuthrt(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<>();

		ComAuthrtVO authrtVO = new ComAuthrtVO();
		BeanUtils.copyProperties(apcEvrmntStngVO, authrtVO);

		rtnObj = comAuthrtService.insertApcNormalAuthrt(apcEvrmntStngVO);
		if (rtnObj != null) {
			logger.error("Error on ApcEvrmntStngService#insertApcSimpleAuthrt call ComAuthrtService#insertApcSimpleAuthrt");
			logger.error(getMessageForMap(rtnObj));
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		int updatedCnt = apcEvrmntStngMapper.updateApcEvrmntStngAuthrt(apcEvrmntStngVO);
		if (updatedCnt != 1) {
			logger.error("Error on ApcEvrmntStngService#insertApcSimpleAuthrt call updateApcEvrmntStngAuthrt");
			logger.error(getMessageForMap(ComUtil.getResultMap("W0005", "APC설정정보")));
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap("W0005", "APC설정정보")));	// W0005	{0}이/가 없습니다.
		}

		return null;
	}

}
