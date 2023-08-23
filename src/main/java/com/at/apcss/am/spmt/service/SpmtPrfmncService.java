package com.at.apcss.am.spmt.service;

import java.util.List;

import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;

/**
 * 출고실적 Service 인터페이스
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
public interface SpmtPrfmncService {

	/**
	 * 출하실적 단건 조회
	 * @param spmtPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public SpmtPrfmncVO selectSpmtPrfmnc(SpmtPrfmncVO spmtPrfmncVO) throws Exception;

	/**
	 * 출하실적 목록 조회
	 * @param spmtPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SpmtPrfmncVO> selectSpmtPrfmncList(SpmtPrfmncVO spmtPrfmncVO) throws Exception;

	/**
	 * 출하실적 공통 등록
	 * @param spmtPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertSpmtPrfmncCom(SpmtPrfmncVO spmtPrfmncVO) throws Exception;

	/**
	 * 출하실적 공통 변경
	 * @param spmtPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateSpmtPrfmncCom(SpmtPrfmncVO spmtPrfmncVO) throws Exception;

	/**
	 * 출하실적 공통 삭제
	 * @param spmtPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSpmtPrfmncCom(SpmtPrfmncVO spmtPrfmncVO) throws Exception;

	/**
	 * 출하실적 상세 등록
	 * @param spmtPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception;

	/**
	 * 출하실적 상세 변경
	 * @param spmtPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception;

	/**
	 * 출하실적 상세 삭제
	 * @param spmtPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception;

	/**
	 * 출하실적 등록
	 * @param List<SpmtPrfmncVO>
	 * @return
	 * @throws Exception
	 */
	public int insertSpmtPrfmnc(List<SpmtPrfmncVO> spmtPrfmnc) throws Exception;

	/**
	 * 출하실적 삭제
	 * @param List<SpmtPrfmncVO>
	 * @return
	 * @throws Exception
	 */
	public int deleteSpmtPrfmnc(List<SpmtPrfmncVO> spmtPrfmnc) throws Exception;

	/**
	 * 출하실적 등록 내역 목록 조회
	 * @param spmtPrfmncVO
	 * @return List<SpmtPrfmncVO>
	 * @throws Exception
	 */
	public List<SpmtPrfmncVO> selectSpmtPrfmncDtlList(SpmtPrfmncVO spmtPrfmncVO) throws Exception;

	/**
	 * 출하실적 상세 목록 조회
	 * @param spmtPrfmncVO
	 * @return SpmtPrfmncVO
	 * @throws Exception
	 */
	public List<SpmtPrfmncVO> selectSpmtPrfmncDtl(SpmtPrfmncVO spmtPrfmncVO) throws Exception;
}
