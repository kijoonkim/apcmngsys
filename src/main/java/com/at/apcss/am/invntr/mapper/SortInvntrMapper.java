package com.at.apcss.am.invntr.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.invntr.vo.SortStdGrdVO;

/**
 * 선별재고 Mapper 인터페이스
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
public interface SortInvntrMapper {

	/**
	 * 선별재고 단건 조회
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public SortInvntrVO selectSortInvntr(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 목록 조회
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<SortInvntrVO> selectSortInvntrList(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 포장실적등록대상 목록 조회
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<SortInvntrVO> selectSortInvntrListForRslt(SortInvntrVO sortInvntrVO) throws Exception;
	
	/**
	 * 선별재고 목록 집계조회
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<SortInvntrVO> selectSortInvntrDsctnTotalList(SortInvntrVO sortInvntrVO) throws Exception;


	/**
	 * 선별재고 포장대상 목록 조회
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<SortInvntrVO> selectSortInvntrListForPckg(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별일일재고 목록 조회
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<SortInvntrVO> selectDailySortInvntrList(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별일일재고 목록 조회
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<SortInvntrVO> selectDailySortInvntrTotalList(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 내역 목록 조회 selectSortInvntrDsctnList
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */

	public List<SortInvntrVO> selectSortInvntrDsctnList(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 등록
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortInvntr(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 변경
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortInvntr(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 원물재고내역 변경
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortInvntrChg(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 삭제
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortInvntr(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 삭제 : set delYn 'Y'
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortInvntrForDelY(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 등급 삭제 : set delYn 'Y'
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortStdGrdForDelY(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 등급 삭제
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortStdGrd(SortInvntrVO sortInvntrVO) throws Exception;


	/**
	 * 선별재고 포장처리
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrPckgPrfmnc(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 포장투입완료
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrPckgInptRslt(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 등급 등록
	 * @param sortStdGrdVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortStdGrd(SortStdGrdVO sortStdGrdVO) throws Exception;

	/**
	 * 포장지시대상 내역 조회
	 *
	 * @param sortCmndVO
	 * @return List<SortInvntrVO>
	 * @throws Exception
	 */
	public List<SortInvntrVO> selectPckgCmndTrgetList(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 이송처리
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrTrnsf(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 투입진행
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvntrInptPrgrs(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 변경이력 등록
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortChgHstry(SortInvntrVO sortInvntrVO) throws Exception;

}
