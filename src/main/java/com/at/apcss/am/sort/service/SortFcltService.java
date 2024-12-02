package com.at.apcss.am.sort.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.sort.vo.SortFcltVO;
import com.at.apcss.am.sort.vo.SortInptPrfmncVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;

/**
 * 선별투입실적 Service 인터페이스
 * @author 박승진
 * @since 2024.09.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.03  박승진        최초 생성
 * </pre>
 */
public interface SortFcltService {

	/**
	 * 선별설비정보 조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortFcltInfoList(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별가동기준관리 조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortOprtngCrtrList(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 가동기준관리정보 삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortOprtngCrtr(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별설비정보 단건
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public SortFcltVO selectSortFcltInfo(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별설비정보 상세조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortFcltDtlInfoList(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별설비정보 상세조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortFcltDtl(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별설비속성 조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public SortFcltVO selectSortFcltAtrbList(SortFcltVO sortFcltVO) throws Exception;



	/**
	 * 선별설비정보 등록,수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortFclt(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별설비정보 삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortFclt(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별설비정보 상세 삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortFcltDtl(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별설비속성정보 등록,수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortFcltAtrb(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별설비상세정보 등록,수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortFcltDtl(List<SortFcltVO> sortFcltVO) throws Exception;


	/**
	 * 선별설비운영계획 조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortFcltOprtngPlanList(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 가동실적등록 조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortFcltOprtngPrfmncList(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별설비상세정보 등록,수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortFcltOprtngPlan(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별설비상세정보 삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortFcltOprtngPlan(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * (선별)가동실적삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortFcltOprtngPrfmnc(SortFcltVO sortFcltVO) throws Exception;

	/**
	 * 선별설비정보 등록,수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortOprtngCrtr(List<SortFcltVO> sortFcltVO) throws Exception;


	/**
	 * (선별)가동실적 등록,수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortFcltOprtngPrfmnc(SortFcltVO sortFcltVO) throws Exception;

}
