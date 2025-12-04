package com.at.apcss.pd.aom.service.impl;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.pd.aom.mapper.PruoPrgrsMngMapper;
import com.at.apcss.pd.aom.service.InvShipOgnReqMngService;
import com.at.apcss.pd.aom.service.PrdcrCrclOgnReqMngService;
import com.at.apcss.pd.aom.service.PruoPrgrsMngService;
import com.at.apcss.pd.aom.vo.GpcVO;
import com.at.apcss.pd.aom.vo.InvShipOgnReqMngVO;
import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqMngVO;
import com.at.apcss.pd.isom.service.InvShipOgnPurSalMngService;
import com.at.apcss.pd.isom.service.InvShipOgnSpeczItmPurSalMngService;
import com.at.apcss.pd.isom.vo.InvShipOgnPurSalMngVO;
import com.at.apcss.pd.isom.vo.InvShipOgnSpeczItmPurSalMngVO;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnOnlnWhlslMrktService;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnPurSalMngService;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnSpItmPurSalNMngService;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnSpItmPurSalYMngService;
import com.at.apcss.pd.pcom.vo.*;
import com.at.apcss.pd.pom.service.PrdcrOgnCurntMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;
import com.at.apcss.pd.pom.vo.TbEvFrmhsApoVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("pruoPrgrsMngService")
public class PruoPrgrsMngServiceImpl  extends BaseServiceImpl implements PruoPrgrsMngService {

    @Autowired
    private PruoPrgrsMngMapper pruoPrgrsMngMapper;

    @Resource(name = "invShipOgnSpeczItmPurSalMngService")
    private InvShipOgnSpeczItmPurSalMngService invShipOgnSpeczItmPurSalMngService;

    @Resource(name = "invShipOgnPurSalMngService")
    private InvShipOgnPurSalMngService invShipOgnPurSalMngService;

    @Resource(name = "PrdcrCrclOgnReqMngService")
    private PrdcrCrclOgnReqMngService prdcrCrclOgnReqMngService;

    @Resource(name = "InvShipOgnReqMngService")
    private InvShipOgnReqMngService invShipOgnReqMngService;

    @Resource(name = "prdcrOgnCurntMngService")
    private PrdcrOgnCurntMngService prdcrOgnCurntMngService;

    @Resource(name = "prdcrCrclOgnSpItmPurSalYMngService")
    private PrdcrCrclOgnSpItmPurSalYMngService prdcrCrclOgnSpItmPurSalYMngService;

    @Resource(name = "PrdcrCrclOgnSpItmPurSalNMngService")
    private PrdcrCrclOgnSpItmPurSalNMngService prdcrCrclOgnSpItmPurSalNMngService;

    @Resource(name = "prdcrCrclOgnPurSalMngService")
    private PrdcrCrclOgnPurSalMngService prdcrCrclOgnPurSalMngService;

    @Resource(name = "PrdcrCrclOgnOnlnWhlslMrktService")
    private PrdcrCrclOgnOnlnWhlslMrktService prdcrCrclOgnOnlnWhlslMrktService;

    @Override
    public List<PruoPrgrsVO> selectPruoPrgrsList(PruoPrgrsVO pruoPrgrsVO) throws Exception {
        return pruoPrgrsMngMapper.selectPruoPrgrsList(pruoPrgrsVO);
    }

    @Override
    public HashMap<String, Object> insertPruoPrgrsApoList(List<PruoPrgrsVO> pruoPrgrsList) throws Exception {

        for (PruoPrgrsVO prgrs : pruoPrgrsList) {
            pruoPrgrsMngMapper.insertPruoPrgrsApo(prgrs);
            if (StringUtils.hasText(prgrs.getRtnCd())) {
                return ComUtil.getResultMap(prgrs.getRtnCd(), prgrs.getRtnMsg());
            }

            PrdcrCrclOgnReqMngVO aplyMngInfo = pruoPrgrsMngMapper.selectAplyMngInfo(prgrs);
            if (aplyMngInfo == null || !StringUtils.hasText(aplyMngInfo.getApoCd())) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조직 등록정보");
            }

            String prgrsStpCd = prgrs.getPrgrsStpCd();

            if (prgrsStpCd.equals("DDLN")) {
                // TB_EV_APLY_MNG 법인체 마감
                pruoPrgrsMngMapper.updateCorpDdlnSeCd(prgrs);
            } else if (prgrsStpCd.equals("SBMT")) {
                // TB_EV_APLY_MNG 실적법인체 마감 취소
                pruoPrgrsMngMapper.updatePrfmncCorpDdlnYn(prgrs);
            }

        }



        return null;
    }

    @Override
    public HashMap<String, Object> updatePruoPrgrsApoCnclList(List<PruoPrgrsVO> pruoPrgrsList) throws Exception {

        for (PruoPrgrsVO prgrs : pruoPrgrsList) {
            pruoPrgrsMngMapper.updatePruoPrgrsApoCncl(prgrs);
            if (StringUtils.hasText(prgrs.getRtnCd())) {
                return ComUtil.getResultMap(prgrs.getRtnCd(), prgrs.getRtnMsg());
            }

            PrdcrCrclOgnReqMngVO aplyMngInfo = pruoPrgrsMngMapper.selectAplyMngInfo(prgrs);
            if (aplyMngInfo == null || !StringUtils.hasText(aplyMngInfo.getApoCd())) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조직 등록정보");
            }

            String prgrsStpCd = prgrs.getPrgrsStpCd();

            if (prgrsStpCd.equals("DDLN")) {
                // TB_EV_APLY_MNG 법인체 마감 취소
                pruoPrgrsMngMapper.updateCorpDdlnSeCd(prgrs);
            } else if (prgrsStpCd.equals("SBMT")) {
                // TB_EV_APLY_MNG 실적법인체 마감 취소
                pruoPrgrsMngMapper.updatePrfmncCorpDdlnYn(prgrs);
            }
        }
        return null;
    }

    @Override
    public HashMap<String, Object> insertPruoPrgrsApoWrt(PruoPrgrsVO pruoPrgrsVO) throws Exception {

        HashMap<String, Object> rtnObj = null;
        String crtrYr = pruoPrgrsVO.getCrtrYr();
        if (!StringUtils.hasText(crtrYr)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "기준연도");
        }
        
        String apoCd = pruoPrgrsVO.getApoCd();
        if (!StringUtils.hasText(apoCd)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조직코드");
        }

        String wrtPrgrmId = pruoPrgrsVO.getWrtPrgrmId();
        if (!StringUtils.hasText(wrtPrgrmId)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "프로그램 아이디");
        }
        
        // 조직별 진척도 저장
        pruoPrgrsMngMapper.insertPruoPrgrsApoWrt(pruoPrgrsVO);
        
        if (StringUtils.hasText(pruoPrgrsVO.getRtnCd())) {
            return ComUtil.getResultMap(pruoPrgrsVO.getRtnCd(), pruoPrgrsVO.getRtnMsg());
        }

        return null;
    }


    @Override
    public HashMap<String, Object> insertIsoNtslDlgtSlsPrfmnc(List<InvShipOgnSpeczItmPurSalMngVO> invShipOgnSpeczItmPurSalMngList) throws Exception {

        // 출자출하조직 전문품목 매입매출 저장
        invShipOgnSpeczItmPurSalMngService.multiSaveInvShipOgnSpeczItmPurSalMngListNew(invShipOgnSpeczItmPurSalMngList);

        // 진척도
        HashMap<String, Object> rtnObj = null;
        String apoCd = invShipOgnSpeczItmPurSalMngList.get(0).getApoCd();
        String crtrYr = invShipOgnSpeczItmPurSalMngList.get(0).getYr();
        String userId = invShipOgnSpeczItmPurSalMngList.get(0).getSysLastChgUserId();
        String prgrmId = invShipOgnSpeczItmPurSalMngList.get(0).getSysLastChgPrgrmId();
        String tmptStrgYn = invShipOgnSpeczItmPurSalMngList.get(0).getTmprStrgYn();

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(apoCd);
        pruoPrgrsVO.setCrtrYr(crtrYr);
        pruoPrgrsVO.setSysLastChgUserId(userId);
        pruoPrgrsVO.setSysLastChgPrgrmId(prgrmId);
        pruoPrgrsVO.setWrtPrgrmId(prgrmId);
        pruoPrgrsVO.setTmprStrgYn(tmptStrgYn);

        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public PruoPrgrsVO selectPruoPrgrsApoDtl(PruoPrgrsVO pruoPrgrsVO) throws Exception {
        return pruoPrgrsMngMapper.selectPruoPrgrsApoDtl(pruoPrgrsVO);
    }

    @Override
    public HashMap<String, Object> insertIsoTotPrchPrfmnc(List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngList) throws Exception {

        // 출자출하조직 총 매입 저장
        invShipOgnPurSalMngService.multiSaveInvShipOgnPurSalMngList01(invShipOgnPurSalMngList);

        // 진척도
        HashMap<String, Object> rtnObj = null;
        String apoCd = invShipOgnPurSalMngList.get(0).getApoCd();
        String crtrYr = invShipOgnPurSalMngList.get(0).getYr();
        String userId = invShipOgnPurSalMngList.get(0).getSysLastChgUserId();
        String prgrmId = invShipOgnPurSalMngList.get(0).getSysLastChgPrgrmId();
        String tmprStrgYn = invShipOgnPurSalMngList.get(0).getTmprStrgYn();

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(apoCd);
        pruoPrgrsVO.setCrtrYr(crtrYr);
        pruoPrgrsVO.setSysLastChgUserId(userId);
        pruoPrgrsVO.setSysLastChgPrgrmId(prgrmId);
        pruoPrgrsVO.setWrtPrgrmId("PD_005_001_01");
        pruoPrgrsVO.setTmprStrgYn(tmprStrgYn);

        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertIsoTotSlsPrfmnc(List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngList) throws Exception {

        // 출자출하조직 총 매출 저장
        invShipOgnPurSalMngService.multiSaveInvShipOgnPurSalMngList02(invShipOgnPurSalMngList);

        // 진척도
        HashMap<String, Object> rtnObj = null;
        String apoCd = invShipOgnPurSalMngList.get(0).getApoCd();
        String crtrYr = invShipOgnPurSalMngList.get(0).getYr();
        String userId = invShipOgnPurSalMngList.get(0).getSysLastChgUserId();
        String prgrmId = invShipOgnPurSalMngList.get(0).getSysLastChgPrgrmId();
        String tmprStrgYn = invShipOgnPurSalMngList.get(0).getTmprStrgYn();

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(apoCd);
        pruoPrgrsVO.setCrtrYr(crtrYr);
        pruoPrgrsVO.setSysLastChgUserId(userId);
        pruoPrgrsVO.setSysLastChgPrgrmId(prgrmId);
        pruoPrgrsVO.setWrtPrgrmId("PD_005_001_02");
        pruoPrgrsVO.setTmprStrgYn(tmprStrgYn);

        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertPruoReg(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception {

        // 통합조직 정보저장
        prdcrCrclOgnReqMngService.updatePrdcrCrclOgnReqMng(prdcrCrclOgnReqMngVO);

        // 조직 품목리스트 저장
        List<GpcVO> gpcList = prdcrCrclOgnReqMngVO.getGpcList();
        if (gpcList != null && !gpcList.isEmpty()) {

            PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
            pruoPrgrsVO.setCrtrYr(prdcrCrclOgnReqMngVO.getYr());
            pruoPrgrsVO.setApoCd(prdcrCrclOgnReqMngVO.getApoCd());
            pruoPrgrsVO.setSysFrstInptPrgrmId(prdcrCrclOgnReqMngVO.getSysFrstInptPrgrmId());
            pruoPrgrsVO.setSysFrstInptUserId(prdcrCrclOgnReqMngVO.getSysFrstInptUserId());
            pruoPrgrsVO.setSysLastChgPrgrmId(prdcrCrclOgnReqMngVO.getSysLastChgPrgrmId());
            pruoPrgrsVO.setSysLastChgUserId(prdcrCrclOgnReqMngVO.getSysLastChgUserId());

            pruoPrgrsVO.setGpcList(gpcList);

            insertPruoGpcList(pruoPrgrsVO);
        }

        HashMap<String, Object> rtnObj = null;

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setCrtrYr(prdcrCrclOgnReqMngVO.getYr());
        pruoPrgrsVO.setApoCd(prdcrCrclOgnReqMngVO.getApoCd());
        pruoPrgrsVO.setSysLastChgPrgrmId(prdcrCrclOgnReqMngVO.getSysLastChgPrgrmId());
        pruoPrgrsVO.setSysLastChgUserId(prdcrCrclOgnReqMngVO.getSysLastChgUserId());
        pruoPrgrsVO.setWrtPrgrmId(prdcrCrclOgnReqMngVO.getSysLastChgPrgrmId());

        // 조직 진척도 저장
        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertIsoReg(InvShipOgnReqMngVO invShipOgnReqMngVO) throws Exception {

        int updateCnt = invShipOgnReqMngService.insertInvShipOgnReqMng(invShipOgnReqMngVO);
        logger.debug("출자조직정보 updateCnt: {}", updateCnt);

        List<GpcVO> gpcList = invShipOgnReqMngVO.getGpcList();
        if (gpcList != null && !gpcList.isEmpty()) {
            for (GpcVO gpcVO : gpcList) {
                gpcVO.setSysFrstInptUserId(invShipOgnReqMngVO.getSysFrstInptUserId());
                gpcVO.setSysFrstInptPrgrmId(invShipOgnReqMngVO.getSysFrstInptPrgrmId());
                gpcVO.setSysLastChgUserId(invShipOgnReqMngVO.getSysLastChgUserId());
                gpcVO.setSysLastChgPrgrmId(invShipOgnReqMngVO.getSysLastChgPrgrmId());
            }
            invShipOgnReqMngService.multiSaveGpcList(gpcList);
        }

        HashMap<String, Object> rtnObj = null;
        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setCrtrYr(invShipOgnReqMngVO.getYr());
        pruoPrgrsVO.setApoCd(invShipOgnReqMngVO.getApoCd());
        pruoPrgrsVO.setSysLastChgPrgrmId(invShipOgnReqMngVO.getSysLastChgPrgrmId());
        pruoPrgrsVO.setSysLastChgUserId(invShipOgnReqMngVO.getSysLastChgUserId());
        pruoPrgrsVO.setWrtPrgrmId(invShipOgnReqMngVO.getSysLastChgPrgrmId());

        // 조직 진척도 저장
        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }
        return null;
    }

    @Override
    public HashMap<String, Object> insertPrdcrOgnzList(List<TbEvFrmhsApoVO> tbEvFrmhsApoVOList) throws Exception {

        // 생산조조직 리스트 저장
        prdcrOgnCurntMngService.multiSaveTbEvFrmhsApoList(tbEvFrmhsApoVOList);

        // 진척도
        HashMap<String, Object> rtnObj = null;
        String apoCd = tbEvFrmhsApoVOList.get(0).getApoCd();
        String crtrYr = tbEvFrmhsApoVOList.get(0).getYr();
        String userId = tbEvFrmhsApoVOList.get(0).getSysLastChgUserId();
        String prgrmId = tbEvFrmhsApoVOList.get(0).getSysLastChgPrgrmId();

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(apoCd);
        pruoPrgrsVO.setCrtrYr(crtrYr);
        pruoPrgrsVO.setSysLastChgUserId(userId);
        pruoPrgrsVO.setSysLastChgPrgrmId(prgrmId);
        pruoPrgrsVO.setWrtPrgrmId("PD_004_001_01");


        // 조직 진척도 저장
        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertFrmhsList(List<PrdcrOgnCurntMngVO> prdcrOgnCurntMngList) throws Exception {

        // 농가리스트 저장
        prdcrOgnCurntMngService.multiSavePrdcrOgnCurntMngDtlList(prdcrOgnCurntMngList);

        // 진척도
        HashMap<String, Object> rtnObj = null;
        String apoCd = prdcrOgnCurntMngList.get(0).getApoCd();
        String crtrYr = prdcrOgnCurntMngList.get(0).getYr();
        String userId = prdcrOgnCurntMngList.get(0).getSysLastChgUserId();
        String prgrmId = prdcrOgnCurntMngList.get(0).getSysLastChgPrgrmId();

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(apoCd);
        pruoPrgrsVO.setCrtrYr(crtrYr);
        pruoPrgrsVO.setSysLastChgUserId(userId);
        pruoPrgrsVO.setSysLastChgPrgrmId(prgrmId);
        pruoPrgrsVO.setWrtPrgrmId("PD_004_001_02");

        // 조직 진척도 저장
        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertPruoNtslDlgtSlsPrfmnc(List<PrdcrCrclOgnSpItmPurSalYMngVO> prdcrCrclOgnSpItmPurSalYMngList) throws Exception {

        // 통합조직 전문품목매입매출(출자출하조직 보유)저장
        prdcrCrclOgnSpItmPurSalYMngService.multiSavePrdcrCrclOgnSpItmPurSalYMngListNew(prdcrCrclOgnSpItmPurSalYMngList);

        // 진척도
        HashMap<String, Object> rtnObj = null;
        String apoCd = prdcrCrclOgnSpItmPurSalYMngList.get(0).getApoCd();
        String crtrYr = prdcrCrclOgnSpItmPurSalYMngList.get(0).getYr();
        String userId = prdcrCrclOgnSpItmPurSalYMngList.get(0).getSysLastChgUserId();
        String prgrmId = prdcrCrclOgnSpItmPurSalYMngList.get(0).getSysLastChgPrgrmId();
        String tmptStrgYn = prdcrCrclOgnSpItmPurSalYMngList.get(0).getTmprStrgYn();

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(apoCd);
        pruoPrgrsVO.setCrtrYr(crtrYr);
        pruoPrgrsVO.setSysLastChgUserId(userId);
        pruoPrgrsVO.setSysLastChgPrgrmId(prgrmId);
        pruoPrgrsVO.setWrtPrgrmId(prgrmId);
        pruoPrgrsVO.setTmprStrgYn(tmptStrgYn);

        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }


        return null;
    }

    @Override
    public HashMap<String, Object> insertPruoNtslDlgtSlsPrfmncIsoN(List<PrdcrCrclOgnSpItmPurSalNMngVO> prdcrCrclOgnSpItmPurSalNMngList) throws Exception {

        // 통합조직 전문품목매입매출(출자출하조직 미보유)저장
        prdcrCrclOgnSpItmPurSalNMngService.multiSavePrdcrCrclOgnSpItmPurSalNMngListNew(prdcrCrclOgnSpItmPurSalNMngList);

        // 진척도
        HashMap<String, Object> rtnObj = null;
        String apoCd = prdcrCrclOgnSpItmPurSalNMngList.get(0).getApoCd();
        String crtrYr = prdcrCrclOgnSpItmPurSalNMngList.get(0).getYr();
        String userId = prdcrCrclOgnSpItmPurSalNMngList.get(0).getSysLastChgUserId();
        String prgrmId = prdcrCrclOgnSpItmPurSalNMngList.get(0).getSysLastChgPrgrmId();
        String tmptStrgYn = prdcrCrclOgnSpItmPurSalNMngList.get(0).getTmprStrgYn();

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(apoCd);
        pruoPrgrsVO.setCrtrYr(crtrYr);
        pruoPrgrsVO.setSysLastChgUserId(userId);
        pruoPrgrsVO.setSysLastChgPrgrmId(prgrmId);
        pruoPrgrsVO.setWrtPrgrmId(prgrmId);
        pruoPrgrsVO.setTmprStrgYn(tmptStrgYn);

        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }


        return null;
    }

    @Override
    public HashMap<String, Object> insertPruoTotalPrch(List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngList) throws Exception {

        // 통합조직 총 매입매출 매입저장
        prdcrCrclOgnPurSalMngService.multiSavePrdcrCrclOgnPurSalMngList01(prdcrCrclOgnPurSalMngList);

        // 진척도
        HashMap<String, Object> rtnObj = null;
        String apoCd = prdcrCrclOgnPurSalMngList.get(0).getApoCd();
        String crtrYr = prdcrCrclOgnPurSalMngList.get(0).getYr();
        String userId = prdcrCrclOgnPurSalMngList.get(0).getSysLastChgUserId();
        String prgrmId = prdcrCrclOgnPurSalMngList.get(0).getSysLastChgPrgrmId();
        String tmptStrgYn = prdcrCrclOgnPurSalMngList.get(0).getTmprStrgYn();

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(apoCd);
        pruoPrgrsVO.setCrtrYr(crtrYr);
        pruoPrgrsVO.setSysLastChgUserId(userId);
        pruoPrgrsVO.setSysLastChgPrgrmId(prgrmId);
        pruoPrgrsVO.setWrtPrgrmId("PD_006_001_01");
        pruoPrgrsVO.setTmprStrgYn(tmptStrgYn);

        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertPruoTotalSls(List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngList) throws Exception {

        // 통합조직 총 매입매출 매출저장
        prdcrCrclOgnPurSalMngService.multiSavePrdcrCrclOgnPurSalMngList02(prdcrCrclOgnPurSalMngList);

        // 진척도
        HashMap<String, Object> rtnObj = null;
        String apoCd = prdcrCrclOgnPurSalMngList.get(0).getApoCd();
        String crtrYr = prdcrCrclOgnPurSalMngList.get(0).getYr();
        String userId = prdcrCrclOgnPurSalMngList.get(0).getSysLastChgUserId();
        String prgrmId = prdcrCrclOgnPurSalMngList.get(0).getSysLastChgPrgrmId();
        String tmptStrgYn = prdcrCrclOgnPurSalMngList.get(0).getTmprStrgYn();

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(apoCd);
        pruoPrgrsVO.setCrtrYr(crtrYr);
        pruoPrgrsVO.setSysLastChgUserId(userId);
        pruoPrgrsVO.setSysLastChgPrgrmId(prgrmId);
        pruoPrgrsVO.setWrtPrgrmId("PD_006_001_02");
        pruoPrgrsVO.setTmprStrgYn(tmptStrgYn);

        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertPruoTotalSpmtPrfmnc(List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngList) throws Exception {

        // 통합조직 총 매입매출 출하실적 저장
        prdcrCrclOgnPurSalMngService.multiSavePrdcrCrclOgnPurSalMngList03(prdcrCrclOgnPurSalMngList);

        // 진척도
        HashMap<String, Object> rtnObj = null;
        String apoCd = prdcrCrclOgnPurSalMngList.get(0).getApoCd();
        String crtrYr = prdcrCrclOgnPurSalMngList.get(0).getYr();
        String userId = prdcrCrclOgnPurSalMngList.get(0).getSysLastChgUserId();
        String prgrmId = prdcrCrclOgnPurSalMngList.get(0).getSysLastChgPrgrmId();
        String tmptStrgYn = prdcrCrclOgnPurSalMngList.get(0).getTmprStrgYn();

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(apoCd);
        pruoPrgrsVO.setCrtrYr(crtrYr);
        pruoPrgrsVO.setSysLastChgUserId(userId);
        pruoPrgrsVO.setSysLastChgPrgrmId(prgrmId);
        pruoPrgrsVO.setWrtPrgrmId("PD_006_001_03");
        pruoPrgrsVO.setTmprStrgYn(tmptStrgYn);

        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertWhlslMrktNtslTrgt(PrdcrCrclOgnOnlnWhlslMrktVO prdcrCrclOgnOnlnWhlslMrktVO) throws Exception {

        // 온라인도매시장 판매목표 저장
        prdcrCrclOgnOnlnWhlslMrktService.insertPrdcrCrclOgnOnlnWhlslMrkt(prdcrCrclOgnOnlnWhlslMrktVO);

        // 진척도
        HashMap<String, Object> rtnObj = null;

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(prdcrCrclOgnOnlnWhlslMrktVO.getApoCd());
        pruoPrgrsVO.setCrtrYr(prdcrCrclOgnOnlnWhlslMrktVO.getYr());
        pruoPrgrsVO.setSysLastChgUserId(prdcrCrclOgnOnlnWhlslMrktVO.getSysLastChgUserId());
        pruoPrgrsVO.setSysLastChgPrgrmId(prdcrCrclOgnOnlnWhlslMrktVO.getSysLastChgPrgrmId());
        pruoPrgrsVO.setWrtPrgrmId("PD_006_006_02");

        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertOnlnWhlslMrktSpmtPrfmnc(List<PrdcrCrclOgnOnlnWhlslMrktVO> prdcrCrclOgnOnlnWhlslMrktList) throws Exception {

        // 온라인도매시장 출하실적 저장
        prdcrCrclOgnOnlnWhlslMrktService.multiSaveOnlnDtl(prdcrCrclOgnOnlnWhlslMrktList);

        // 진척도
        HashMap<String, Object> rtnObj = null;
        String apoCd = prdcrCrclOgnOnlnWhlslMrktList.get(0).getApoCd();
        String crtrYr = prdcrCrclOgnOnlnWhlslMrktList.get(0).getYr();
        String userId = prdcrCrclOgnOnlnWhlslMrktList.get(0).getSysLastChgUserId();
        String prgrmId = prdcrCrclOgnOnlnWhlslMrktList.get(0).getSysLastChgPrgrmId();

        PruoPrgrsVO pruoPrgrsVO = new PruoPrgrsVO();
        pruoPrgrsVO.setApoCd(apoCd);
        pruoPrgrsVO.setCrtrYr(crtrYr);
        pruoPrgrsVO.setSysLastChgUserId(userId);
        pruoPrgrsVO.setSysLastChgPrgrmId(prgrmId);
        pruoPrgrsVO.setWrtPrgrmId("PD_006_006_01");

        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertPruoPrgrsApo(PruoPrgrsVO pruoPrgrsVO) throws Exception {

        pruoPrgrsMngMapper.insertPruoPrgrsApo(pruoPrgrsVO);

        if (StringUtils.hasText(pruoPrgrsVO.getRtnCd())) {
            return ComUtil.getResultMap(pruoPrgrsVO.getRtnCd(), pruoPrgrsVO.getRtnMsg());
        }

        PrdcrCrclOgnReqMngVO aplyMngInfo = pruoPrgrsMngMapper.selectAplyMngInfo(pruoPrgrsVO);
        if (aplyMngInfo == null || !StringUtils.hasText(aplyMngInfo.getApoCd())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조직 등록정보");
        }

        String prgrsStpCd = pruoPrgrsVO.getPrgrsStpCd();

        if (prgrsStpCd.equals("DDLN")) {
            // TB_EV_APLY_MNG 법인체 마감
            pruoPrgrsMngMapper.updateCorpDdlnSeCd(pruoPrgrsVO);
        } else if (prgrsStpCd.equals("SBMT")) {
            // TB_EV_APLY_MNG 실적법인체 마감
            pruoPrgrsMngMapper.updatePrfmncCorpDdlnYn(pruoPrgrsVO);
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertPruoPrgrsApoCncl(PruoPrgrsVO pruoPrgrsVO) throws Exception {

        pruoPrgrsMngMapper.updatePruoPrgrsApoCncl(pruoPrgrsVO);

        if (StringUtils.hasText(pruoPrgrsVO.getRtnCd())) {
            return ComUtil.getResultMap(pruoPrgrsVO.getRtnCd(), pruoPrgrsVO.getRtnMsg());
        }

        PrdcrCrclOgnReqMngVO aplyMngInfo = pruoPrgrsMngMapper.selectAplyMngInfo(pruoPrgrsVO);
        if (aplyMngInfo == null || !StringUtils.hasText(aplyMngInfo.getApoCd())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조직 등록정보");
        }

        String prgrsStpCd = pruoPrgrsVO.getPrgrsStpCd();

        if (prgrsStpCd.equals("DDLN")) {
            // TB_EV_APLY_MNG 법인체 마감 취소
            pruoPrgrsMngMapper.updateCorpDdlnSeCd(pruoPrgrsVO);
        } else if (prgrsStpCd.equals("SBMT")) {
            // TB_EV_APLY_MNG 실적법인체 마감 취소
            pruoPrgrsMngMapper.updatePrfmncCorpDdlnYn(pruoPrgrsVO);
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertPruoGpcList(PruoPrgrsVO pruoPrgrsVO) throws Exception {

        // 품목리스트
        List<GpcVO> gpcList = pruoPrgrsVO.getGpcList();
        if (gpcList != null && !gpcList.isEmpty()) {
            for (GpcVO gpcVO : gpcList) {
                gpcVO.setSysFrstInptUserId(pruoPrgrsVO.getSysFrstInptUserId());
                gpcVO.setSysFrstInptPrgrmId(pruoPrgrsVO.getSysFrstInptPrgrmId());
                gpcVO.setSysLastChgUserId(pruoPrgrsVO.getSysLastChgUserId());
                gpcVO.setSysLastChgPrgrmId(pruoPrgrsVO.getSysLastChgPrgrmId());
            }
            prdcrCrclOgnReqMngService.multiSaveGpcList(gpcList);
        }

        HashMap<String, Object> rtnObj = null;

        pruoPrgrsVO.setWrtPrgrmId("PD_006_003"); // 품목리스트 저장 프로그램명

        // 조직 진척도 저장
        rtnObj = insertPruoPrgrsApoWrt(pruoPrgrsVO);
        if (rtnObj != null) {
            throw new EgovBizException(getMessageForMap(rtnObj));
        }

        return null;
    }

}
