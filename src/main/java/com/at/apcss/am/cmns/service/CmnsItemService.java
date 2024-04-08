package com.at.apcss.am.cmns.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.cmns.vo.CmnsItemVO;

/**
 * 품목정보 Service 인터페이스
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
public interface CmnsItemService {

	/**
	 * 품목정보 단건 조회
	 * @param cmnsItemVO
	 * @return CmnsItemVO
	 * @throws Exception
	 */
	public CmnsItemVO selectCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 목록 조회
	 * @param cmnsItemVO
	 * @return List<CmnsItemVO>
	 * @throws Exception
	 */
	public List<CmnsItemVO> selectCmnsItemList(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * APC 품목정보 목록 조회
	 * @param cmnsItemVO
	 * @return List<CmnsItemVO>
	 * @throws Exception
	 */
	public List<CmnsItemVO> selectApcCmnsItemList(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 등록
	 * @param cmnsItemVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 변경
	 * @param cmnsItemVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 삭제
	 * @param cmnsItemVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 단건 조회
	 * @param cmnsItemVO
	 * @return CmnsItemVO
	 * @throws Exception
	 */
	public CmnsItemVO selectCmnsApcItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * APC 품목정보 변경
	 * @param cmnsItemVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateApcCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * APC 품목 삭제 가능 여부
	 * @param cmnsItemVO
	 * @return String
	 * @throws Exception
	 */
	public String itemDelible(CmnsItemVO cmnsItemVO) throws Exception;
	
	/**
	 * APC기준정보 품목 업데이트 리스트
	 * @param CmnsItemVO
	 * @return integer
	 * @throws Exception
	 */
	public int updateItem(CmnsItemVO cmnsItemVO) throws Exception;
	/**
	 * APC기준정보 품목 업데이트 리스트
	 * @param List<CmnsItemVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> updateItemList(List<CmnsItemVO> cmnsItemList) throws Exception;


}
