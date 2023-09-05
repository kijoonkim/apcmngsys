package com.at.apcss.am.sort.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.sort.vo.SortCmndVO;

/**
 * 선별지시 Mapper 인터페이스
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
public interface SortCmndMapper {

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
	 * 포장지시대상 내역 조회
	 * 
	 * @param sortCmndVO
	 * @return
	 * @throws Exception
	 */
	public List<SortCmndVO> selectPckgCmndTrgetList(SortCmndVO sortCmndVO) throws Exception;
}
