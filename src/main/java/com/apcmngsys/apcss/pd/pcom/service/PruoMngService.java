package com.apcmngsys.apcss.pd.pcom.service;

import com.apcmngsys.apcss.pd.pcom.vo.PruoMstVO;

import java.util.List;

/**
 * 생산유통통합조직등록관리 Service 인터페이스
 * @author 김동제
 * @since 2023.10.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.09.24  신정철       최초 생성
 * </pre>
 */

public interface PruoMngService {
    public PruoMstVO selectPruoRegMst(PruoMstVO pruoMstVO) throws Exception;
    public List<PruoMstVO> selectPruoRegMstList(PruoMstVO pruoMstVO) throws Exception;
}
