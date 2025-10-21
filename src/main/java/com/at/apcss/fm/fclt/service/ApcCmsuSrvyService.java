package com.at.apcss.fm.fclt.service;

import com.at.apcss.fm.fclt.vo.ApcCmsuSrvyRsltVO;
import com.at.apcss.fm.fclt.vo.ApcCmsuSrvyVO;

import java.util.HashMap;
import java.util.List;

/**
 * APC 전수조사 설문조사 Service 인터페이스
 * @author 유민지
 * @since 2025.10.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자         수정내용
 * ----------   ----------    ---------------------------
 * 2025.10.13   유민지         최초 생성
 * </pre>
 */
public interface ApcCmsuSrvyService {

    /**
     * 전수조사 설문 마스터 조회
     * @param apcCmsuSrvyVO
     * @return
     * @throws Exception
     */
    public ApcCmsuSrvyVO selectSrvyMst(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception;

    /**
     * 전수조사 설문상세 조회
     * @param apcCmsuSrvyVO
     * @return
     * @throws Exception
     */
    public List<ApcCmsuSrvyVO> selectSrvyDtl(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception;

    /**
     * 전수조사 설문결과 조회
     * @param apcCmsuSrvyRsltVO
     * @return
     * @throws Exception
     */
    public List<ApcCmsuSrvyRsltVO> selectSrvyApcRsltDtl(ApcCmsuSrvyRsltVO apcCmsuSrvyRsltVO) throws Exception;

    /**
     * 전수조사 설문결과 저장
     * @param apcCmsuSrvyVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> saveApcCmsuSrvy(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception;
}
