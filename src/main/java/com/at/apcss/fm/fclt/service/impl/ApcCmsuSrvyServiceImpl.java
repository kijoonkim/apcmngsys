package com.at.apcss.fm.fclt.service.impl;

import com.at.apcss.co.apc.service.ApcInfoService;
import com.at.apcss.co.apc.vo.ApcInfoVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.fm.fclt.mapper.ApcCmsuSrvyMapper;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.ApcCmsuSrvyService;
import com.at.apcss.fm.fclt.service.ApcSurveyMngService;
import com.at.apcss.fm.fclt.vo.ApcCmsuSrvyRsltVO;
import com.at.apcss.fm.fclt.vo.ApcCmsuSrvyVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : ApcCmsuSrvyServiceImpl.java
 * @Description : APC전수조사 설문조사 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 유민지
 * @since 2025.10.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.10.13  유민지        최초 생성
 * </pre>
 */
@Service("apcCmsuSrvyService")
public class ApcCmsuSrvyServiceImpl extends BaseServiceImpl implements ApcCmsuSrvyService {

    @Autowired
    private ApcCmsuSrvyMapper apcCmsuSrvyMapper;

    @Resource(name="apcInfoService")
    private ApcInfoService apcInfoService;

    @Resource(name="apcSurveyMngService")
    private ApcSurveyMngService apcSurveyMngService;

    @Autowired
    private FcltPrgrsMapper fcltPrgrsMapper;

    @Override
    public ApcCmsuSrvyVO selectSrvyMst(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception {
        return apcCmsuSrvyMapper.selectSrvyMst(apcCmsuSrvyVO);
    }

    @Override
    public List<ApcCmsuSrvyVO> selectSrvyDtl(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception {
        return apcCmsuSrvyMapper.selectSrvyDtl(apcCmsuSrvyVO);
    }

    @Override
    public List<ApcCmsuSrvyRsltVO> selectSrvyApcRsltDtl(ApcCmsuSrvyRsltVO apcCmsuSrvyRsltVO) throws Exception {
        return apcCmsuSrvyMapper.selectSrvyApcRsltDtlList(apcCmsuSrvyRsltVO);
    }

    @Override
    public HashMap<String, Object> saveApcCmsuSrvy(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception {

        HashMap<String, Object> rtnObj = null;

        String apcCd = apcCmsuSrvyVO.getApcCd();
        if (!StringUtils.hasText(apcCd)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드");
        }

        String crtrYr = apcCmsuSrvyVO.getCrtrYr();
        if (!StringUtils.hasText(crtrYr)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준연도");
        }

        // APC 등록 확인
        ApcInfoVO apcParamVO = new ApcInfoVO();
        apcParamVO.setApcCd(apcCd);
        ApcInfoVO apcInfoVO = apcInfoService.selectApcInfo(apcParamVO);
        if (apcInfoVO == null
                || !StringUtils.hasText(apcInfoVO.getApcCd())
                || !ComConstants.CON_NONE.equals(apcInfoVO.getDelYn())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC등록정보");
        }

        // APC전수조사 등록가능 확인
        rtnObj = apcSurveyMngService.insertCheckApcSurvey(crtrYr);
        if (rtnObj != null) {
            return rtnObj;
        }

        // 전수조사 설문조사 저장
        rtnObj = insertApcSrvyRslt(apcCmsuSrvyVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    private HashMap<String, Object> insertApcSrvyRslt(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception {

        String apcCd = apcCmsuSrvyVO.getApcCd();
        String srvyNo = apcCmsuSrvyVO.getSrvyNo();
        String crtrYr = apcCmsuSrvyVO.getCrtrYr();

        ApcCmsuSrvyRsltVO srvyRsltInfo = apcCmsuSrvyMapper.selectSrvyApcRslt(apcCmsuSrvyVO);

        boolean needInsert;
        if (srvyRsltInfo == null || !StringUtils.hasText(srvyRsltInfo.getApcCd())) {
            needInsert = true;
        } else if (!ComConstants.CON_NONE.equals(srvyRsltInfo.getDelYn())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_TGT_WRONG, "등록정보");
        } else {
            needInsert = false;
        }

        if (needInsert) {
            apcCmsuSrvyMapper.insertSrvyApcRslt(apcCmsuSrvyVO);
        } else {
            apcCmsuSrvyMapper.updateSrvyApcRslt(apcCmsuSrvyVO);
        }

        List<ApcCmsuSrvyRsltVO> srvyApcRsltDtlList = apcCmsuSrvyVO.getSrvyApcRsltDtlList();

        for (ApcCmsuSrvyRsltVO apcCmsuSrvyRsltVO : srvyApcRsltDtlList) {
            apcCmsuSrvyRsltVO.setApcCd(apcCd);
            apcCmsuSrvyRsltVO.setSrvyNo(srvyNo);
            apcCmsuSrvyRsltVO.setSysFrstInptUserId(apcCmsuSrvyVO.getSysFrstInptUserId());
            apcCmsuSrvyRsltVO.setSysFrstInptPrgrmId(apcCmsuSrvyVO.getSysFrstInptPrgrmId());
            apcCmsuSrvyRsltVO.setSysLastChgUserId(apcCmsuSrvyVO.getSysLastChgUserId());
            apcCmsuSrvyRsltVO.setSysLastChgPrgrmId(apcCmsuSrvyVO.getSysLastChgPrgrmId());

            ApcCmsuSrvyRsltVO srvyRsltDtlInfo = apcCmsuSrvyMapper.selectSrvyApcRsltDtl(apcCmsuSrvyRsltVO);

            if (srvyRsltDtlInfo == null || !StringUtils.hasText(srvyRsltDtlInfo.getApcCd()) || !StringUtils.hasText(srvyRsltDtlInfo.getSrvyNo()) || !StringUtils.hasText(srvyRsltDtlInfo.getSrvyQitemNo())) {
                // 등록
                apcCmsuSrvyMapper.insertSrvyApcRsltDtl(apcCmsuSrvyRsltVO);
            } else {
                // 수정
                apcCmsuSrvyMapper.updateSrvyApcRsltDtl(apcCmsuSrvyRsltVO);
            }
        }
        
        // 진척도 저장
        String prgrsYn = ComUtil.nullToDefault(apcCmsuSrvyVO.getPrgrsYn(), ComConstants.CON_NONE);
        if (ComConstants.CON_YES.equals(apcCmsuSrvyVO.getPrgrsYn())) {
            FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
            fcltPrgrsVO.setApcCd(apcCmsuSrvyVO.getApcCd());
            fcltPrgrsVO.setCrtrYr(apcCmsuSrvyVO.getCrtrYr());
            fcltPrgrsVO.setSysFrstInptUserId(apcCmsuSrvyVO.getSysFrstInptUserId());
            fcltPrgrsVO.setSysFrstInptPrgrmId(apcCmsuSrvyVO.getSysFrstInptPrgrmId());
            fcltPrgrsVO.setSysLastChgUserId(apcCmsuSrvyVO.getSysLastChgUserId());
            fcltPrgrsVO.setSysLastChgPrgrmId(apcCmsuSrvyVO.getSysLastChgPrgrmId());

            fcltPrgrsVO.setPrgrsSel("15");

            //임시저장
            if (ComConstants.CON_YES.equals(apcCmsuSrvyVO.getTmprStrgYn())) {
                fcltPrgrsVO.setPrgrsVal(ComConstants.CON_T);
            } else {
                fcltPrgrsVO.setPrgrsVal(ComConstants.CON_YES);
            }
            fcltPrgrsMapper.insertFcltPrgrs(fcltPrgrsVO);
        }


        return null;
    }
}
