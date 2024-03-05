package com.at.apcss.am.sort.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.sort.vo.ComSortDsctnTotVO;
import com.at.apcss.am.sort.vo.SortDsctnTotVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;

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
	 * 파프리카선별집계 목록 조회
	 * @param sortDsctnTotVO
	 * @return
	 * @throws Exception
	 */
	public List<SortDsctnTotVO> selectSortDsctnTot(SortDsctnTotVO sortDsctnTotVO) throws Exception;

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

}
