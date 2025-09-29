package com.at.apcss.fm.fclt.service.impl;

import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.constants.CsConstants;
import com.at.apcss.co.apc.service.ApcInfoService;
import com.at.apcss.co.apc.vo.ApcInfoVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.fm.fclt.mapper.ApcSurveyMngMapper;
import com.at.apcss.fm.fclt.service.ApcSurveyMngService;
import com.at.apcss.fm.fclt.service.FcltOperInfoService;
import com.at.apcss.fm.fclt.vo.*;
import com.at.apcss.main.web.MainController;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : ApcSurveyMngServiceImpl.java
 * @Description : APC전수조사 관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2025.05.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.05.12  신정철        최초 생성
 * </pre>
 */
@Service("apcSurveyMngService")
public class ApcSurveyMngServiceImpl extends BaseServiceImpl implements ApcSurveyMngService {

    @Autowired
    private ApcSurveyMngMapper apcSurveyMngMapper;

    @Resource(name="cmnsValidationService")
    private CmnsValidationService cmnsValidationService;

    @Resource(name="fcltOperInfoService")
    private FcltOperInfoService fcltOperInfoService;

    @Resource(name="apcInfoService")
    private ApcInfoService apcInfoService;

    @Override
    public ApcSurveyMstVO selectApcSurveyMaster(String crtrYr, String chkYmd) throws Exception {

        if (!StringUtils.hasText(chkYmd)) {
            chkYmd = cmnsValidationService.selectNowDateString();
        }

        ApcSurveyMstVO paramVO = new ApcSurveyMstVO();
        paramVO.setCrtrYr(crtrYr);
        paramVO.setChkYmd(chkYmd);

        ApcSurveyMstVO apcSurveyMstVO = apcSurveyMngMapper.selectApcSurveyMaster(paramVO);

        String rtnCd = null;
        String rtnMsg = null;

        if (apcSurveyMstVO == null) {
            apcSurveyMstVO = new ApcSurveyMstVO();
            rtnCd = ComConstants.MSGCD_NOT_TARGET;
            rtnMsg = "등록대상";
        } else {

            if (!ComConstants.CON_NONE.equals(apcSurveyMstVO.getDelYn())) {
                rtnCd = ComConstants.MSGCD_NOT_TARGET;
                rtnMsg = "등록대상";
            } else {

                String cmptnYn = apcSurveyMstVO.getCmptnYn();
                String ddlnSttsCd = apcSurveyMstVO.getDdlnSttsCd();

                if (ComConstants.CON_NONE.equals(cmptnYn) && CsConstants.CON_DDLN_STTS_CD_START.equals(ddlnSttsCd)) {
                    rtnCd = "";
                    rtnMsg = "";
                } else {
                    rtnCd = ComConstants.MSGCD_NOT_TARGET;
                    rtnMsg = "등록기간";
                }
//                if (ComConstants.CON_YES.equals(cmptnYn)) {
//                    rtnCd = ComConstants.MSGCD_NOT_TARGET;
//                    rtnMsg = "등록대상";
//                } else if (CsConstants.CON_DDLN_STTS_CD_READY.equals(ddlnSttsCd)) {
//                    rtnCd = ComConstants.MSGCD_NOT_TARGET;
//                    rtnMsg = "등록기간";
//                } else if (CsConstants.CON_DDLN_STTS_CD_START.equals(ddlnSttsCd)) {
//                    rtnCd = "";
//                    rtnMsg = "";
//                } else if  (CsConstants.CON_DDLN_STTS_CD_END.equals(ddlnSttsCd)) {
//                    rtnCd = ComConstants.MSGCD_NOT_TARGET;
//                    rtnMsg = "등록기간";
//                } else {
//                    rtnCd = ComConstants.MSGCD_NOT_TARGET;
//                    rtnMsg = "등록기간";
//                }
            }
        }

        apcSurveyMstVO.setRtnCd(rtnCd);
        apcSurveyMstVO.setRtnMsg(rtnMsg);

        return apcSurveyMstVO;
    }

    @Override
    public HashMap<String, Object> insertCheckApcSurvey(String crtrYr) throws Exception {

        ApcSurveyMstVO apcSurveyMstVO = selectApcSurveyMaster(crtrYr, null);

        if (apcSurveyMstVO == null) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_TARGET, "등록대상");
        }

        if (StringUtils.hasText(apcSurveyMstVO.getRtnCd())) {
            return ComUtil.getResultMap(apcSurveyMstVO.getRtnCd(), apcSurveyMstVO.getRtnMsg());
        }

        return null;
    }

    /**
     * APC전수조사 - 1. 운영자개요 등록
     * @param fcltOperInfoVO
     * @return
     * @throws Exception
     */
    @Override
    public HashMap<String, Object> insertOperOgnz(FcltOperInfoVO fcltOperInfoVO) throws Exception {

        HashMap<String, Object> rtnObj = null;

        String crtrYr = fcltOperInfoVO.getCrtrYr();
        if (!StringUtils.hasText(crtrYr)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준연도");
        }

        String apcCd = fcltOperInfoVO.getApcCd();
        if (!StringUtils.hasText(apcCd)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
        }

        ApcInfoVO apcParamVO = new ApcInfoVO();
        apcParamVO.setApcCd(apcCd);
        ApcInfoVO apcInfoVO = apcInfoService.selectApcInfo(apcParamVO);
        if (apcInfoVO == null
                || !StringUtils.hasText(apcInfoVO.getApcCd())
                || !ComConstants.CON_NONE.equals(apcInfoVO.getDelYn())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC등록정보");
        }

        rtnObj = insertCheckApcSurvey(fcltOperInfoVO.getCrtrYr());
        if (rtnObj != null) {
            return rtnObj;
        }

        rtnObj = fcltOperInfoService.insertOperOgnz(fcltOperInfoVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    /**
     * APC전수조사 마스터 리스트 조회
     * @param
     * @return
     * @throws Exception
     */
    @Override
    public List<ApcSurveyMstVO> selectApcSurveyMasterList(ApcSurveyMstVO apcSurveyMstVO) throws Exception {

        List<ApcSurveyMstVO> resultList = apcSurveyMngMapper.selectApcSurveyMasterList(apcSurveyMstVO);

        return resultList;
    }

    /**
     * APC전수조사 운영자개요 목록 조회
     * @param
     * @return
     * @throws Exception
     */
    @Override
    public List<FcltOperInfoVO> selectOperPrsnInfoList(FcltOperInfoVO fcltOperInfoVO) throws Exception {

        List<FcltOperInfoVO> resultList = fcltOperInfoService.selectOperPrsnInfoList(fcltOperInfoVO);

        return resultList;
    }

    @Override
    public HashMap<String, Object> updateApcCmsuMst(List<ApcSurveyMstVO> apcSurveyMstList) throws Exception {

        for (ApcSurveyMstVO apcSurveyMstVO : apcSurveyMstList) {

            String crtrYr = apcSurveyMstVO.getCrtrYr();
            if (!StringUtils.hasText(crtrYr)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준연도");
            }

            ApcSurveyMstVO mstInfo = apcSurveyMngMapper.selectApcSurveyMaster(apcSurveyMstVO);
            if (mstInfo == null || !StringUtils.hasText(mstInfo.getCrtrYr()) || ComConstants.CON_YES.equals(mstInfo.getDelYn())) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조사연도 관리 대상");	// W0005	{0}이/가 없습니다.
            }

            // APC전수조사마스터 저장
            if ( 0 == apcSurveyMngMapper.updateApcCmsuMst(apcSurveyMstVO)){
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "조사연도 관리 저장"))); // E0003	{0} 시 오류가 발생하였습니다.
            }
        }

        return null;
    }


    /**
     * APC전수조사 운영자정보 수정
     * @param fcltOperInfoVO
     * @return
     * @throws Exception
     */
    @Override
    public HashMap<String, Object> updateOperPrsnInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception {

        HashMap<String, Object> rtnObj = null;

        String crtrYr = fcltOperInfoVO.getCrtrYr();
        if (!StringUtils.hasText(crtrYr)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준연도");
        }

        String apcCd = fcltOperInfoVO.getApcCd();
        if (!StringUtils.hasText(apcCd)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND,"APC코드");
        }

        rtnObj = fcltOperInfoService.updateOperPrsnInfo(fcltOperInfoVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public List<ApcSurveyMstVO> selectApcCmsuCrtrYr() throws Exception {

        List<ApcSurveyMstVO> resultList = apcSurveyMngMapper.selectApcCmsuCrtrYr();

        return resultList;
    }
}
