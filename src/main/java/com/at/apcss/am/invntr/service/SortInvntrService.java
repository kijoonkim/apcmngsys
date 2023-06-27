package com.at.apcss.am.invntr.service;

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
	 * 선별재고 삭제
	 * @param sortInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortInvntr(SortInvntrVO sortInvntrVO) throws Exception;
}
