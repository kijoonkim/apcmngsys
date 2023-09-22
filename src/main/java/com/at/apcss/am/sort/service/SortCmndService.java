package com.at.apcss.am.sort.service;

import java.util.List;

import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.sort.vo.SortCmndVO;

/**
 * 선별지시 Service 인터페이스
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
public interface SortCmndService {

	/**
	 * 선별지시 단건 조회
	 * @param sortCmndVO
	 * @return
	 * @throws Exception
	 */
	public SortCmndVO selectSortCmnd(SortCmndVO sortCmndVO) throws Exception;

	/**
	 * 선별지시 목록 조회
	 * @param sortCmndVO
	 * @return
	 * @throws Exception
	 */
	public List<SortCmndVO> selectSortCmndList(SortCmndVO sortCmndVO) throws Exception;

	/**
	 * 선별지시 등록
	 * @param sortCmndVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortCmnd(SortCmndVO sortCmndVO) throws Exception;

	/**
	 * 선별지시 변경
	 * @param sortCmndVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortCmnd(SortCmndVO sortCmndVO) throws Exception;

	/**
	 * 선별지시 삭제
	 * @param sortCmndVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortCmnd(SortCmndVO sortCmndVO) throws Exception;

	/**
	 * 선별재고 내역 목록 조회
	 *
	 * @param SortCmndVO
	 * @return List<SortInvntrVO>
	 * @throws Exception
	 */
	public List<SortInvntrVO> selectPckgCmndTrgetList(SortCmndVO sortCmndVO) throws Exception;

	/**
	 * 선별지시 리스트 등록
	 *
	 * @param List<SortCmndVO>
	 * @return integer
	 * @throws Exception
	 */
	public int insertSortCmndList(List<SortCmndVO> sortCmndList) throws Exception;

	/**
	 * 선별지시 리스트 삭제
	 *
	 * @param List<SortCmndVO>
	 * @return integer
	 * @throws Exception
	 */
	public int deleteSortCmndList(List<SortCmndVO> sortCmndList) throws Exception;
}
