package com.at.apcss.am.sort.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.sort.vo.SortDsctnTotVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;

/**
 * 선별실적 Service 인터페이스
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
public interface SortPrfmncService {

	/**
	 * 선별실적 단건 조회
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public SortPrfmncVO selectSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별실적 목록 조회
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortPrfmncVO> selectSortPrfmncList(SortPrfmncVO sortPrfmncVO) throws Exception;


	/**
	 * 선별집계내역 목록 조회
	 * @param SortDsctnTotVO
	 * @return
	 * @throws Exception
	 */
	public List<SortDsctnTotVO> selectSortDsctnTot(SortDsctnTotVO sortDsctnTotVO) throws Exception;

	/**
	 * 선별실적 취소대상 목록 조회
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortPrfmncVO> selectSortCnclList(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별투입실적 목록 조회
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortPrfmncVO> selectSortInptPrfmncList(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별실적 등록
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별실적 목록 등록
	 * @param List<SortPrfmncVO> sortPrfmncList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSortPrfmncList(List<SortPrfmncVO> sortPrfmncList) throws Exception;

	/**
	 * 선별실적 변경
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별실적 삭제
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별실적 목록 삭제
	 * @param sortPrfmncList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteSortPrfmncList(List<SortPrfmncVO> sortPrfmncList) throws Exception;
}
