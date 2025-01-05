package com.at.apcss.am.spmt.service;

import com.at.apcss.am.spmt.vo.ShpgotApcCrtrDtlVO;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrVO;

import java.util.List;

/**
 * 반품기준 Service 인터페이스
 * @author 신정철
 * @since 2025.01.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.04  손민성        최초 생성
 * </pre>
 */
public interface ShpgotMngService {

    /**
     * 반품기준 목록 생성
     * @param shpgotApcCrtrVoList,shpgotApcCrtrDtlVoList
     * @return int
     * @throws Exception
     */
    int insertShpgotApcCrtr(List<ShpgotApcCrtrVO> shpgotApcCrtrVoList, List<ShpgotApcCrtrDtlVO> shpgotApcCrtrDtlVoList) throws Exception;
    int insertShpgotApcCrtr(ShpgotApcCrtrVO shpgotApcCrtrVo) throws Exception;
    int insertShpgotApcCrtr(List<ShpgotApcCrtrVO> shpgotApcCrtrVoList) throws Exception;

    /**
     * 반품기준 상세목록 생성
     * @param shpgotApcCrtrDtlVoList
     * @return int
     * @throws Exception
     */
    int insertShpgotApcCrtrDtl(List<ShpgotApcCrtrDtlVO> shpgotApcCrtrDtlVoList) throws Exception;
    /**
     * 반품기준 목록 조회
     * @param shpgotApcCrtrVO
     * @return List<ShpgotApcCrtrVO>
     * @throws Exception
     */
    List<ShpgotApcCrtrVO> selectShpgotApcCrtrList(ShpgotApcCrtrVO shpgotApcCrtrVO) throws Exception;
    /**
     * 반품기준 상세목록 조회
     * @param shpgotApcCrtrVO
     * @return List<ShpgotApcCrtrVO>
     * @throws Exception
     */
    List<ShpgotApcCrtrDtlVO> selectShpgotApcCrtrDtlList(ShpgotApcCrtrVO shpgotApcCrtrVO) throws Exception;
}
