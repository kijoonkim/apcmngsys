package com.at.apcss.am.spmt.service;

import com.at.apcss.am.spmt.vo.SpmtPrfmncComVO;

import java.util.HashMap;
import java.util.List;

/**
 * 출하관리 Service 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.04.21  신정철        최초 생성
 * </pre>
 */
public interface SpmtMngService {

    /**
     * 통합 출하 등록
     * @param spmtPrfmncCom
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertSpmtPrfmnc(SpmtPrfmncComVO spmtPrfmncComVO) throws Exception;

    /**
     * 통합 출하 목록 등록
     * @param spmtPrfmncComList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertSpmtPrfmncWithList(List<SpmtPrfmncComVO> spmtPrfmncComList) throws Exception;

}
