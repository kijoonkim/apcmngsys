package com.at.apcss.am.clcln.service;

import com.at.apcss.am.clcln.vo.ClclnDtlVO;
import com.at.apcss.am.clcln.vo.ClclnMstrVO;
import com.at.apcss.am.clcln.vo.ClclnUntprcVO;

import java.util.HashMap;
import java.util.List;

/**
 * 정산단가 Service 인터페이스
 * @author 신정철
 * @since 2025.6.2
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.6.2    손민성        최초 생성
 * </pre>
 */
public interface ClclnSortService {
    /**
     * 선별 정산 저장
     * @param mstrList,dtlList
     * @return
     * @throws Exception
     */
    int insertSortClcln(List<ClclnMstrVO> mstrList, List<ClclnDtlVO> dtlList) throws Exception;
    /**
     * 선별 정산 결과조회
     * @param clclnMstrVO
     * @return List<ClclnDtlVO>
     * @throws Exception
     */
    List<HashMap<String, Object>> selectSortClclnList(ClclnMstrVO clclnMstrVO) throws Exception;
}
