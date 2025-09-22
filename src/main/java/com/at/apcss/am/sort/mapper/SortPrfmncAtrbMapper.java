package com.at.apcss.am.sort.mapper;

import com.at.apcss.am.sort.vo.*;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * 선별실적속성 Mapper 인터페이스
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
@Mapper
public interface SortPrfmncAtrbMapper {

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
