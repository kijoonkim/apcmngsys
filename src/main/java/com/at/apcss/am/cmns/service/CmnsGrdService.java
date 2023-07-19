package com.at.apcss.am.cmns.service;

import java.util.List;

import com.at.apcss.am.cmns.vo.CmnsGrdVO;

/**
 * 등급 정보 Service 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
public interface CmnsGrdService {

	/**
	 * 등급 마스터 정보 단건 조회
	 * @param cmnsGrdVO
	 * @return
	 * @throws Exception
	 */
	public CmnsGrdVO selectCmnsGrd(CmnsGrdVO cmnsGrdVO) throws Exception;
	
	/**
	 * 등급 마스터 정보 목록 조회
	 * @param cmnsGrdVO
	 * @return
	 * @throws Exception
	 */
	public List<CmnsGrdVO> selectCmnsGrdList(CmnsGrdVO cmnsGrdVO) throws Exception;
	
	/**
	 * 등급 마스터 정보 등록
	 * @param cmnsGrdVO
	 * @return
	 * @throws Exception
	 */
	public int insertCmnsGrd(CmnsGrdVO cmnsGrdVO) throws Exception;
	
	/**
	 * 등급 마스터 정보 변경
	 * @param cmnsGrdVO
	 * @return
	 * @throws Exception
	 */
	public int updateCmnsGrd(CmnsGrdVO cmnsGrdVO) throws Exception;
	
	/**
	 * 등급 마스터 정보 삭제
	 * @param cmnsGrdVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCmnsGrd(CmnsGrdVO cmnsGrdVO) throws Exception;
	
	
	// APC 등급 정보
	
	/**
	 * APC 등급 정보 단건 조회
	 * @param cmnsGrdVO
	 * @return
	 * @throws Exception
	 */
	public CmnsGrdVO selectApcGrd(CmnsGrdVO cmnsGrdVO) throws Exception;
	
	/**
	 * APC 등급 정보 목록 조회
	 * @param cmnsGrdVO
	 * @return
	 * @throws Exception
	 */
	public List<CmnsGrdVO> selectApcGrdList(CmnsGrdVO cmnsGrdVO) throws Exception;
	
	/**
	 * APC 등급 정보 등록
	 * @param cmnsGrdVO
	 * @return
	 * @throws Exception
	 */
	public int insertApcGrd(CmnsGrdVO cmnsGrdVO) throws Exception;
	
	/**
	 * APC 등급 정보 변경
	 * @param cmnsGrdVO
	 * @return
	 * @throws Exception
	 */
	public int updateApcGrd(CmnsGrdVO cmnsGrdVO) throws Exception;
	
	/**
	 * APC 등급 정보 삭제
	 * @param cmnsGrdVO
	 * @return
	 * @throws Exception
	 */
	public int deleteApcGrd(CmnsGrdVO cmnsGrdVO) throws Exception;
}
