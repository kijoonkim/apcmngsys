package com.at.apcss.am.sort.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.sort.vo.ComSortDsctnTotVO;
import com.at.apcss.am.sort.vo.SortBffaList;
import com.at.apcss.am.sort.vo.SortBffaVO;
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
	 * 선별실적(등급별) 목록 조회
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortPrfmncVO> selectSortPrfmncGrdList(SortPrfmncVO sortPrfmncVO) throws Exception;


	/**
	 * 파프리카선별집계내역 목록 조회
	 * @param SortDsctnTotVO
	 * @return
	 * @throws Exception
	 */
	public List<SortDsctnTotVO> selectSortDsctnTot(SortDsctnTotVO sortDsctnTotVO) throws Exception;
	/**
	 * 파프리카선별집계내역 조회
	 * @param SortDsctnTotVO
	 * @return
	 * @throws Exception
	 */
	public List<SortDsctnTotVO> selectSortDsctn(SortDsctnTotVO sortDsctnTotVO) throws Exception;

	/**
	 * 선별집계내역(공통) 목록 조회
	 * @param SortDsctnTotVO
	 * @return
	 * @throws Exception
	 */
	public List<ComSortDsctnTotVO> selectComSortDsctnTot(ComSortDsctnTotVO sortDsctnTotVO) throws Exception;

	/**
	 * 선별실적 취소대상 목록 조회
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortPrfmncVO> selectSortCnclList(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별실적 목록 조회 (선별번호 그룹)
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortPrfmncVO> selectSortListBySortno(SortPrfmncVO sortPrfmncVO) throws Exception;


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

	/**
	 * 육안선별 실적 조회
	 * @param sortBffaVO
	 * @return
	 * @throws Exception
	 */
	List<SortBffaVO> selectSortBffaListBySortno(SortBffaVO sortBffaVO) throws Exception;
	/**
	 * 배출구별 집계
	 * @param HashMap
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectExhstDsctn(HashMap<String, Object> exhstDsctn) throws Exception;

	/**
	 * 등급별 집계
	 * @param HashMap
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectGrdDsctn(HashMap<String, Object> exhstDsctn) throws Exception;
	/**
	 * 육안판정등급 집계
	 * @param HashMap
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectBffaGrdTot(HashMap<String, Object> exhstDsctn) throws Exception;
	/**
	 * 사전선별 등록
	 *
	 * @param sortBffaVO
	 * @return
	 * @throws Exception
	 */
	int insertSortBffa(SortBffaVO sortBffaVO) throws Exception;

	/**
	 * 선별실적(입고별) 목록 조회
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortPrfmncVO> selectSortPrfmncListByWrhs(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별실적(입고별 상품등급)  목록 조회
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortPrfmncVO> selectSortPrfmncListByWrhsForGdsGrd(SortPrfmncVO sortPrfmncVO) throws Exception;
	/**
	 * 선별실적(입고별 상품등급)  목록삭제
	 * @param sortBffaVoList
	 * @return
	 * @throws Exception
	 */
	int deleteSortBffa(List<SortBffaVO> sortBffaVoList) throws Exception;
	/**
	 * 육안선별 checkbox apcCd,bffaGrdType로 전체 삭제
	 * @param sortBffaVO
	 * @return
	 * @throws Exception
	 */
	int deleteSortBffaAll(SortBffaVO sortBffaVO) throws Exception;


    /**
     * 배출구별 집계
     * @param HashMap
     * @return
     * @throws Exception
     */
    public List<HashMap<String, Object>> selectExhstDsctnCol(HashMap<String, Object> exhstDsctn) throws Exception;

    /**
     * 육한등급조회(현장용)
     * @param sortBffaVO
     * @return
     * @throws Exception
     */
	public SortBffaVO selectSortBffaSpt(SortBffaVO sortBffaVO) throws Exception;

	/**
     * 육한등급등록(현장용)
     * @param sortBffaVO
     * @return
     * @throws Exception
     */
	public HashMap<String, Object> insertSortBffaSpt(List<SortBffaList> sortBffaListVO) throws Exception;
}
