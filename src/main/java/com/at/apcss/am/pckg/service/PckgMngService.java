package com.at.apcss.am.pckg.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.pckg.vo.PckgInptVO;
import com.at.apcss.am.pckg.vo.PckgMngVO;

/**
 * 포장관리 Service 인터페이스
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
public interface PckgMngService {
	
	/**
	 * 포장투입실적 등록
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertPckgInpt(PckgMngVO pckgMngVO) throws Exception;

	/**
	 * 포장실적 등록
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertPckgPrfmnc(PckgMngVO pckgMngVO) throws Exception;
	
	
	
	/**
	 * 포장투입실적 변경
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updatePckgInpt(PckgMngVO pckgMngVO) throws Exception;
	
	/**
	 * 포장실적 변경
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updatePckgPrfmnc(PckgMngVO pckgMngVO) throws Exception;
	
	
	
	/**
	 * 포장투입실적 삭제
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deletePckgInpt(PckgMngVO pckgMngVO) throws Exception;
	
	/**
	 * 포장투입실적 삭제
	 * @param pckgInptVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deletePckgPrfmnc(PckgMngVO pckgMngVO) throws Exception;
}
