package com.at.apcss.fm.fclt.service;

import com.at.apcss.fm.fclt.vo.ApcSurveyMstVO;
import com.at.apcss.fm.fclt.vo.FcltOperInfoVO;

import java.util.HashMap;

/**
 * APC 전수조사 Service 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자         수정내용
 * ----------   ----------    ---------------------------
 * 2025.05.12   신정철         최초 생성
 * </pre>
 */
public interface ApcSurveyMngService {

    /**
     * APC전수조사 마스터 조회
     * @param crtrYr
     * @return
     * @throws Exception
     */
    public ApcSurveyMstVO selectApcSurveyMaster(String crtrYr, String chkYmd) throws Exception;

    /**
     * APC전수조사 마스터 등록 확인
     * @param crtrYr
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertCheckApcSurvey(String crtrYr) throws Exception;

    /**
     * APC전수조사 - 1. 운영자개요 등록
     * @param fcltOperInfoVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertOperOgnz(FcltOperInfoVO fcltOperInfoVO) throws Exception;

}
