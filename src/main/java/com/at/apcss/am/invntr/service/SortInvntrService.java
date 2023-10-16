package com.at.apcss.am.invntr.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.invntr.vo.SortInvntrVO;

/**
 * 선별재고 Service 인터페이스
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
public interface SortInvntrService {

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
	 * 선별재고 목록 조회
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
	public HashMap<String, Object> insertSortInvntr(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 목록 등록
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSortInvntrList(List<SortInvntrVO> sortInvntrList) throws Exception;

	/**
	 * 선별재고 변경
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateSortInvntr(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고내역 변경
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateSortInvntrDsctnList(List<SortInvntrVO> sortInvntrList) throws Exception;
	/**
	 * 선별재고 삭제
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteSortInvntr(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 선별재고 포장처리
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateInvntrPckgPrfmnc(SortInvntrVO sortInvntrVO) throws Exception;
	
	/**
	 * 선별재고 포장취소
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateInvntrPckgPrfmncCncl(SortInvntrVO sortInvntrVO) throws Exception;

	/**
	 * 포장지시등록 선별재고 내역 목록 조회
	 *
	 * @param SortCmndVO
	 * @return List<SortInvntrVO>
	 * @throws Exception
	 */
	public List<SortInvntrVO> selectPckgCmndTrgetList(SortInvntrVO sortInvntrVO) throws Exception;
}
