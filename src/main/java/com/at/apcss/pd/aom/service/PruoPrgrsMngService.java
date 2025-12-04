package com.apcmngsys.apcss.pd.aom.service;

import com.apcmngsys.apcss.pd.aom.vo.GpcVO;
import com.apcmngsys.apcss.pd.aom.vo.InvShipOgnReqMngVO;
import com.apcmngsys.apcss.pd.aom.vo.PrdcrCrclOgnReqMngVO;
import com.apcmngsys.apcss.pd.isom.vo.InvShipOgnPurSalMngVO;
import com.apcmngsys.apcss.pd.isom.vo.InvShipOgnSpeczItmPurSalMngVO;
import com.apcmngsys.apcss.pd.pcom.vo.*;
import com.apcmngsys.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;
import com.apcmngsys.apcss.pd.pom.vo.TbEvFrmhsApoVO;

import java.util.HashMap;
import java.util.List;

/**
 * 생산유통통합조직 진척도 Service
 * @author 유민지
 * @since 2025.10.29
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.10.29  유민지       최초 생성
 * </pre>
 */
public interface PruoPrgrsMngService {
    /**
     * 생산유통통합조직 진척도 목록 조회
     * @param pruoPrgrsVO
     * @return
     * @throws Exception
     */
    public List<PruoPrgrsVO> selectPruoPrgrsList(PruoPrgrsVO pruoPrgrsVO) throws Exception;

    /**
     * 생산유통통합조직 진행관리 저장
     * @param pruoPrgrsList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPruoPrgrsApoList(List<PruoPrgrsVO> pruoPrgrsList) throws Exception;

    /**
     * 생산유통통합조직 진행관리 취소
     * @param pruoPrgrsList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> updatePruoPrgrsApoCnclList(List<PruoPrgrsVO> pruoPrgrsList) throws Exception;

    /**
     * 생통 조직별 진행 상세 저장
     * @param pruoPrgrsVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPruoPrgrsApoWrt(PruoPrgrsVO pruoPrgrsVO) throws Exception;

    /**
     * 생통 출자출하조직 전문품목매입매출 저장
     * @param invShipOgnSpeczItmPurSalMngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertIsoNtslDlgtSlsPrfmnc(List<InvShipOgnSpeczItmPurSalMngVO> invShipOgnSpeczItmPurSalMngList) throws Exception;

    public PruoPrgrsVO selectPruoPrgrsApoDtl(PruoPrgrsVO pruoPrgrsVO) throws Exception;

    /**
     * 생산유통통합조직 - 출자출하조직 - 총매입매출 매입
     * @param invShipOgnPurSalMngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertIsoTotPrchPrfmnc(List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngList) throws Exception;

    /**
     * 생산유통통합조직 - 출자출하조직 - 총매입매출 매출저장
     * @param invShipOgnPurSalMngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertIsoTotSlsPrfmnc(List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngList) throws Exception;

    /**
     * 생산유통통합조직 - 생산유통통합조직 등록
     * @param prdcrCrclOgnReqMngVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPruoReg(PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO) throws Exception;

    /**
     * 생산유통통합조직 - 출자출하조직 등록
     * @param invShipOgnReqMngVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertIsoReg(InvShipOgnReqMngVO invShipOgnReqMngVO) throws Exception;

    /**
     * 생산자조직현황 - 생산자조직 리스트 저장 (진척도 저장 포함)
     * @param tbEvFrmhsApoVOList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPrdcrOgnzList(List<TbEvFrmhsApoVO> tbEvFrmhsApoVOList) throws Exception;

    /**
     * 생산자조직현황 - 농가 리스트 저장 (진척도 저장 포함)
     * @param prdcrOgnCurntMngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertFrmhsList(List<PrdcrOgnCurntMngVO> prdcrOgnCurntMngList) throws Exception;

    /**
     * 통합조직관리 - 전문품목매입매출(출자출하조직보유) (진척도 저장 포함)
     * @param prdcrCrclOgnSpItmPurSalYMngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPruoNtslDlgtSlsPrfmnc(List<PrdcrCrclOgnSpItmPurSalYMngVO> prdcrCrclOgnSpItmPurSalYMngList) throws Exception;

    /**
     * 통합조직관리 - 전문품목매입매출(출자출하조직 미보유) (진척도 저장 포함)
     * @param prdcrCrclOgnSpItmPurSalNMngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPruoNtslDlgtSlsPrfmncIsoN(List<PrdcrCrclOgnSpItmPurSalNMngVO> prdcrCrclOgnSpItmPurSalNMngList) throws Exception;

    /**
     * 통합조직관리 - 총매입매출 - 매입저장(진척도 저장 포함)
     * @param prdcrCrclOgnPurSalMngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPruoTotalPrch(List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngList) throws Exception;

    /**
     * 통합조직관리 - 총매입매출 - 매출저장(진척도 저장 포함)
     * @param prdcrCrclOgnPurSalMngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPruoTotalSls(List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngList) throws Exception;

    /**
     * 통합조직관리 - 총매입매출 - 출하실적 저장(진척도 저장 포함)
     * @param prdcrCrclOgnPurSalMngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPruoTotalSpmtPrfmnc(List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngList) throws Exception;

    /**
     * 통합조직관리 - 온라인도매시장 - 판매목표저장(진척도 저장 포함)
     * @param prdcrCrclOgnOnlnWhlslMrktVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertWhlslMrktNtslTrgt(PrdcrCrclOgnOnlnWhlslMrktVO prdcrCrclOgnOnlnWhlslMrktVO) throws Exception;

    /**
     * 통합조직관리 - 온라인도매시장 - 출하실적 저장(진척도 저장 포함)
     * @param prdcrCrclOgnOnlnWhlslMrktList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertOnlnWhlslMrktSpmtPrfmnc(List<PrdcrCrclOgnOnlnWhlslMrktVO> prdcrCrclOgnOnlnWhlslMrktList) throws Exception;

    /**
     * 통합조직관리 - 진행상태 단건
     * @param pruoPrgrsVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPruoPrgrsApo(PruoPrgrsVO pruoPrgrsVO) throws Exception;

    /**
     * 통합조직관리 - 진행상태 취소 단건
     * @param pruoPrgrsVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPruoPrgrsApoCncl(PruoPrgrsVO pruoPrgrsVO) throws Exception;

    /**
     * 통합조직 품목리스트 저장
     * @param gpcVOList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertPruoGpcList(PruoPrgrsVO pruoPrgrsVO) throws Exception;
}
