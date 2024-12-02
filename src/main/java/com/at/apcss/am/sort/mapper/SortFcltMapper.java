package com.at.apcss.am.sort.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.sort.vo.SortCmndVO;
import com.at.apcss.am.sort.vo.SortFcltVO;

/**
 * 선별설비정보 Mapper 인터페이스
 * @author 박승진
 * @since 2024.09.03
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
public interface SortFcltMapper {



	/**
	 * 선별설비 목록 조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortFcltInfoList(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비 목록 상세조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortFcltDtlInfoList(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비 목록 상세조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortFcltDtl(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비 목록 단건조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public SortFcltVO selectSortFcltInfo(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별가동설비기준
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortOprtngCrtrList(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비속성 조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public SortFcltVO selectSortFcltAtrb(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비 운영계획 조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortFcltOprtngPlanList(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 가동실적등록 조회
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public List<SortFcltVO> selectSortFcltOprtngPrfmncList(SortFcltVO sortCmndVO) throws Exception;



	/**
	 * 선별설비 등록
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortFclt(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비 수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortFclt(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비 삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortFclt(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비상세 삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortFcltDtl(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비속성 삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortFcltAtrb(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비속성 등록
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortFcltAtrb(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비속성 수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortFcltAtrb(SortFcltVO sortCmndVO) throws Exception;


	/**
	 * 선별설비상세 등록
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortFcltDtl(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비상세 수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortFcltDtl(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비계획 등록
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortFcltOprtngPlan(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비계획 수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortFcltOprtngPlan(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비계획 등록
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	//public int insertSortFcltOprtngPlanDtl(SortFcltVO sortCmndVO) throws Exception;


	/**
	 * 선별설비계획 삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortFcltOprtngPlan(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 선별설비 삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortFcltOprtngPrfmnc(SortFcltVO sortCmndVO) throws Exception;
	/**
	 * 가동기준관리(선별) 삭제
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSortOprtngCrtr(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 가동기준관리(선별) 등록
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortOprtngCrtr(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * 가동기준관리(선별) 수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortOprtngCrtr(SortFcltVO sortCmndVO) throws Exception;


	/**
	 * (선별)가동실적 등록
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSortFcltOprtngPrfmnc(SortFcltVO sortCmndVO) throws Exception;

	/**
	 * (선별)가동실적 수정
	 * @param sortFcltVO
	 * @return
	 * @throws Exception
	 */
	public int updateSortFcltOprtngPrfmnc(SortFcltVO sortCmndVO) throws Exception;

}
