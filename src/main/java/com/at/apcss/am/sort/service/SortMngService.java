package com.at.apcss.am.sort.service;

import java.util.HashMap;

import com.at.apcss.am.sort.vo.SortMngVO;

/**
 * 선별관리 Service 인터페이스
 * @author 신정철
 * @since 2023.07.21
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
public interface SortMngService {


	/**
	 * 선별지시 등록
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSortCmnd(SortMngVO sortMngVO) throws Exception;
	
	
	/**
	 * 선별투입 등록
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSortInpt(SortMngVO sortMngVO) throws Exception;
	
	/**
	 * 선별투입 삭제
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteSortInpt(SortMngVO sortMngVO) throws Exception;
	
	/**
	 * 선별투입실적 등록
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSortInptPrfmnc(SortMngVO sortMngVO) throws Exception;
	
	/**
	 * 선별실적 등록
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSortPrfmnc(SortMngVO sortMngVO) throws Exception;
	
	
	/**
	 * 선별실적 등록
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertImportSortRslt(SortMngVO sortMngVO) throws Exception;
	
	/**
	 * 선별실적 등록
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSortRslt(SortMngVO sortMngVO) throws Exception;
	

	/**
	 * 선별지시 변경
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateSortCmnd(SortMngVO sortMngVO) throws Exception;
	/**
	 * 선별투입실적 변경
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateSortInptPrfmnc(SortMngVO sortMngVO) throws Exception;
	/**
	 * 선별실적 변경
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateSortPrfmnc(SortMngVO sortMngVO) throws Exception;


	/**
	 * 선별지시 삭제
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteSortCmnd(SortMngVO sortMngVO) throws Exception;
	/**
	 * 선별투입실적 삭제
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteSortInptPrfmnc(SortMngVO sortMngVO) throws Exception;

	/**
	 * 선별실적 삭제
	 * @param sortMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteSortPrfmnc(SortMngVO sortMngVO) throws Exception;

}
