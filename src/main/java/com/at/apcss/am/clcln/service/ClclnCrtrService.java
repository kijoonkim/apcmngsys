package com.at.apcss.am.clcln.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.clcln.vo.ClclnCrtrVO;
import com.at.apcss.am.clcln.vo.ClclnMngVO;
import com.at.apcss.am.clcln.vo.ClclnUntprcVO;

/**
 * 정산기준 Service 인터페이스
 * @author 신정철
 * @since 2024.09.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.21  신정철        최초 생성
 * </pre>
 */
public interface ClclnCrtrService {
	
	/**
	 * 정산기준 조회
	 * @param clclnCrtrVO
	 * @return
	 * @throws Exception
	 */
	public ClclnCrtrVO selectClclnCrtr(ClclnCrtrVO clclnCrtrVO) throws Exception;
	public ClclnCrtrVO selectClclnCrtr(String apcCd, String clclnCrtrType, String crtrCd) throws Exception;
	
	/**
	 * 정산기준 목록 조회
	 * @param clclnCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<ClclnCrtrVO> selectClclnCrtrList(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 상세 조회
	 * @param clclnCrtrVO
	 * @return
	 * @throws Exception
	 */
	public ClclnCrtrVO selectClclnCrtrDtl(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 상세 목록 조회
	 * @param clclnCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<ClclnCrtrVO> selectClclnCrtrDtlList(ClclnCrtrVO clclnCrtrVO) throws Exception;
	
	/**
	 * 정산기준 등록
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertClclnCrtr(ClclnMngVO clclnMngVO) throws Exception;
	
	/**
	 * 정산기준 삭제
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteClclnCrtr(ClclnMngVO clclnMngVO) throws Exception;
	
	/**
	 * 정산기준 상세 등록
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertClclnCrtrDtl(ClclnMngVO clclnMngVO) throws Exception;
	
	/**
	 * 정산기준 상세 삭제
	 * @param clclnMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteClclnCrtrDtl(ClclnMngVO clclnMngVO) throws Exception;
	
}
