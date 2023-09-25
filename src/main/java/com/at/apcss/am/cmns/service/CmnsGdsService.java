package com.at.apcss.am.cmns.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.cmns.vo.CmnsGdsVO;

/**
 * 상품정보 Service 인터페이스
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
public interface CmnsGdsService {

	/**
	 * 상품정보 단건 조회
	 * @param cmnsGdsVO
	 * @return
	 * @throws Exception
	 */
	public CmnsGdsVO selectCmnsGds(CmnsGdsVO cmnsGdsVO) throws Exception;

	/**
	 * 상품정보 목록 조회
	 * @param cmnsGdsVO
	 * @return List<CmnsGdsVO>
	 * @throws Exception
	 */
	public List<CmnsGdsVO> selectCmnsGdsList(CmnsGdsVO cmnsGdsVO) throws Exception;

	/**
	 *
	 * @param cmnsGdsVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object>  insertCheckGdsCd(CmnsGdsVO cmnsGdsVO) throws Exception;

	/**
	 * 상품정보 등록
	 * @param cmnsGdsVO
	 * @return
	 * @throws Exception
	 */
	public int insertCmnsGds(CmnsGdsVO cmnsGdsVO) throws Exception;

	/**
	 * 상품정보 수정
	 * @param cmnsGdsVO
	 * @return
	 * @throws Exception
	 */
	public int updateCmnsGds(CmnsGdsVO cmnsGdsVO) throws Exception;

	/**
	 * 상품정보 삭제
	 * @param cmnsGdsVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCmnsGds(CmnsGdsVO cmnsGdsVO) throws Exception;
}
