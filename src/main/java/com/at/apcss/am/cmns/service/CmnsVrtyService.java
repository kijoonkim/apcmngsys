package com.at.apcss.am.cmns.service;

import java.util.List;

import com.at.apcss.am.cmns.vo.CmnsVrtyVO;

/**
 * 품종정보 Service 인터페이스
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
public interface CmnsVrtyService {

	/**
	 * 품종정보 단건 조회
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public CmnsVrtyVO selectCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * 품종정보 목록 조회
	 * @param cmnsVrtyVO
	 * @return List<CmnsVrtyVO>
	 * @throws Exception
	 */
	public List<CmnsVrtyVO> selectCmnsVrtyList(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * APC품종정보 목록 조회
	 * @param cmnsVrtyVO
	 * @return List<CmnsVrtyVO>
	 * @throws Exception
	 */
	public List<CmnsVrtyVO> selectApcCmnsVrtyList(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * 품종정보 등록
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public int insertCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * 품종정보 변경
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public int updateCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * 품종정보 삭제
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;

}
