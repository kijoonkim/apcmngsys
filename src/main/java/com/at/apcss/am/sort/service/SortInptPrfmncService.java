package com.at.apcss.am.sort.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.sort.vo.SortInptPrfmncVO;

/**
 * 선별투입실적 Service 인터페이스
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
public interface SortInptPrfmncService {

	/**
	 * 선별투입실적 단건 조회
	 * @param sortInptPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public SortInptPrfmncVO selectSortInptPrfmnc(SortInptPrfmncVO sortInptPrfmncVO) throws Exception;

	/**
	 * 선별투입실적 목록 조회
	 * @param sortInptPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortInptPrfmncVO> selectSortInptPrfmncList(SortInptPrfmncVO sortInptPrfmncVO) throws Exception;

	/**
	 * 선별투입실적 (취소대상)목록 조회
	 * @param sortInptPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortInptPrfmncVO> selectSortInptCnclList(SortInptPrfmncVO sortInptPrfmncVO) throws Exception;


	/**
	 * 선별투입실적 등록
	 * @param sortInptPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSortInptPrfmnc(SortInptPrfmncVO sortInptPrfmncVO) throws Exception;

	/**
	 * 선별투입실적 목록 등록
	 * @param sortInptPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSortInptPrfmncList(List<SortInptPrfmncVO> sortInptPrfmncList) throws Exception;


	/**
	 * 선별투입실적 변경
	 * @param sortInptPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateSortInptPrfmnc(SortInptPrfmncVO sortInptPrfmncVO) throws Exception;

	/**
	 * 선별투입실적 삭제
	 * @param sortInptPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteSortInptPrfmnc(SortInptPrfmncVO sortInptPrfmncVO) throws Exception;
}
