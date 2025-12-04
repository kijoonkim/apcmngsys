package com.apcmngsys.apcss.am.sort.service;

import com.apcmngsys.apcss.am.sort.vo.*;

import java.util.HashMap;
import java.util.List;

/**
 * 선별실적속성 Service 인터페이스
 * @author 김호
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.09.18  김호        최초 생성
 * </pre>
 */
public interface SortPrfmncAtrbService {

	/**
	 * 선별실적속성 저장
	 * @param sortPrfmncAtrbList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> muliSaveSortPrfmncList(List<SortPrfmncAtrbVO> sortPrfmncAtrbList) throws Exception;

	/**
	 * 선별실적속성 등록
	 * @param sortPrfmncAtrbVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortPrfmncAtrb(SortPrfmncAtrbVO sortPrfmncAtrbVO) throws Exception;

	/**
	 * 선별실적속성 변경
	 * @param sortPrfmncAtrbVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortPrfmncAtrb(SortPrfmncAtrbVO sortPrfmncAtrbVO) throws Exception;

	/**
	 * 선별실적속성 삭제
	 * @param sortPrfmncAtrbVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortPrfmncAtrb(SortPrfmncAtrbVO sortPrfmncAtrbVO) throws Exception;

	/**
	 * 선별실적속성 삭제
	 * @param sortPrfmncAtrbVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortPrfmncAtrbAll(SortPrfmncAtrbVO sortPrfmncAtrbVO) throws Exception;





}
