package com.at.apcss.am.sort.mapper;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.sort.vo.*;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

/**
 * 선별실적 Mapper 인터페이스
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
@Mapper
public interface SortPrfmncMapper {

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
	 * 파프리카선별집계 목록 조회
	 * @param sortDsctnTotVO
	 * @return
	 * @throws Exception
	 */
	public List<SortDsctnTotVO> selectSortDsctnTot(SortDsctnTotVO sortDsctnTotVO) throws Exception;
	/**
	 * 파프리카선별집계 조회
	 * @param sortDsctnTotVO
	 * @return
	 * @throws Exception
	 */
	public List<SortDsctnTotVO> selectSortDsctn(SortDsctnTotVO sortDsctnTotVO) throws Exception;

	/**
	 * 선별실적 목록 조회
	 * @param comSortDsctnTotVO
	 * @return
	 * @throws Exception
	 */
	public List<ComSortDsctnTotVO> selectComSortDsctnTot(ComSortDsctnTotVO sortDsctnTotVO) throws Exception;

	/**
	 * 선별실적 목록 조회 (취소대상)
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
	 * 선별대상 원물재고 목록 조회
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortPrfmncVO> selectRawMtrInvntrList(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별실적 등록
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별실적 변경
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별실적 삭제
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 선별실적 삭제
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortPrfmncForDelY(SortPrfmncVO sortPrfmncVO) throws Exception;


	/**
	 * 선별투입실적 선별번호 변경
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateInptSortno(SortPrfmncVO sortPrfmncVO) throws Exception;


    /**
     * 선별 목록 조회 (선별번호별)
     * @param sortPrfmncVO
     * @return
     * @throws Exception
     */
    public List<SortPrfmncVO> selectSortListBySortno(SortPrfmncVO sortPrfmncVO) throws Exception;
    
    /**
     * 배출구별집계조회
     * @param sortPrfmncVO
     * @return
     * @throws Exception
     */
    public List<HashMap<String, Object>> selectExhstDsctn(HashMap<String, Object> exhstDsctn) throws Exception;
    
    /**
     * 등급별집계조회
     * @param sortPrfmncVO
     * @return
     * @throws Exception
     */
    public List<HashMap<String, Object>> selectGrdDsctn(HashMap<String, Object> exhstDsctn) throws Exception;

	/**
	 * 육안선별 목록 조회
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortBffaVO> selectSortBffaListBySortno(SortBffaVO sortPrfmncVO) throws Exception;
	/**
	 * 육안선별 등록
	 * @param sortPrfmncVO
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
	 * 선별실적(입고별 상품등급) 목록 조회
	 * @param sortPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SortPrfmncVO> selectSortPrfmncListByWrhsForGdsGrd(SortPrfmncVO sortPrfmncVO) throws Exception;

	/**
	 * 육안선별 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int deleteSortBffa(SortBffaVO vo) throws Exception;
	/**
	 * 육안선별 수정
	 * @param sortBffaVO
	 * @return
	 * @throws Exception
	 */
	int updateSortBffa(SortBffaVO sortBffaVO) throws Exception;
	/**
	 * 육안선별 내역선택 목록등록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	void insertSortBffaStdGrd(SortBffaWrhsStdGrdVO vo) throws Exception;
	/**
	 * 육안선별 내역선택 목록삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	void deleteSortBffaStdGrd(SortBffaVO vo) throws Exception;
	/**
	 * 육안선별 내역선택 목록 apcCd,bffaGrdType으로 전체 삭제
	 * 선별실적 삭제랑은 다름 선별실적 다중 선택후 삭제 > 현재 이 기능은
	 * 선별실적 수정사항에서 checkbox부분 삭제 후 insert를 위함.
	 * @param sortBffaVO
	 * @return
	 * @throws Exception
	 */
	int deleteSortBffaAll(SortBffaVO sortBffaVO);
	
    
    /**
     * 배출구별집계조회
     * @param sortPrfmncVO
     * @return
     * @throws Exception
     */
    public List<HashMap<String, Object>> selectExhstDsctnCol(HashMap<String, Object> exhstDsctn) throws Exception;
}
