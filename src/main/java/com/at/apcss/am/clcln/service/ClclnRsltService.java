package com.at.apcss.am.clcln.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.clcln.vo.ClclnMngVO;
import com.at.apcss.am.clcln.vo.ClclnRsltVO;

/**
 * 정산실적 Service 인터페이스
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
public interface ClclnRsltService {
	
	/**
	 * 정산결과 목록 조회
	 * @param clclnUntprcVO
	 * @return
	 * @throws Exception
	 */
	public List<ClclnRsltVO> selectClclnRsltList(ClclnRsltVO clclnRsltVO) throws Exception;
	
	/**
	 * 정산결과 변경
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateClclnRslt(ClclnMngVO clclnMngVO) throws Exception;
	
	
	/**
	 * 정산결과 생성
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertClclnRsltReg(ClclnMngVO clclnMngVO) throws Exception;
	
}
