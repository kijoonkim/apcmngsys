package com.at.apcss.am.clcln.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.clcln.vo.ClclnUntprcVO;

/**
 * 정산단가 Service 인터페이스
 * @author 신정철
 * @since 2023.10.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 * </pre>
 */
public interface ClclnUntprcService {
	
	/**
	 * 정산단가 단건 조회
	 * @param clclnUntprcVO
	 * @return
	 * @throws Exception
	 */
	public ClclnUntprcVO selectClclnUntprc(ClclnUntprcVO clclnUntprcVO) throws Exception;
	
	/**
	 * 정산단가 목록 조회
	 * @param clclnUntprcVO
	 * @return
	 * @throws Exception
	 */
	public List<ClclnUntprcVO> selectClclnUntprcList(ClclnUntprcVO clclnUntprcVO) throws Exception;
	
	/**
	 * 정산단가 목록 수정
	 * @param clclnPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateClclnUntprcList(List<ClclnUntprcVO> clclnUntprcList) throws Exception;
	
}
