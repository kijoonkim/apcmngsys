package com.at.apcss.am.spmt.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.spmt.vo.SpmtDsctnTotVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncComVO;
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
	 * 출하실적 목록 집계조회
	 * @param spmtPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<SpmtPrfmncVO> selectSpmtPrfmncTotalList(SpmtPrfmncVO spmtPrfmncVO) throws Exception;

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
	 * @param SpmtPrfmncComVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSpmtPrfmncByGrd(SpmtPrfmncComVO spmtPrfmncComVO) throws Exception;

	/**
	 * 출하실적 등록 By 상품리스트
	 * @param spmtPrfmncComVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSpmtPrfmncByPckgList(SpmtPrfmncComVO spmtPrfmncComVO) throws Exception;

	
	/**
	 * 출하실적 등록
	 * @param List<SpmtPrfmncVO>
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSpmtPrfmncList(List<SpmtPrfmncVO> spmtPrfmnc) throws Exception;

	/**
	 * 출하실적 등록 태블릿
	 * @param List<SpmtPrfmncVO>
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSpmtPrfmncTabletList(List<SpmtPrfmncVO> spmtPrfmnc) throws Exception;

	/**
	 * 출하반품 등록
	 * @param List<SpmtPrfmncVO>
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertRtnSpmtPrfmncList(List<SpmtPrfmncVO> spmtPrfmnc) throws Exception;
	/**
	 * 출하반품 취소
	 * @param List<SpmtPrfmncVO>
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteRtnSpmtPrfmncList(List<SpmtPrfmncVO> spmtPrfmnc) throws Exception;

	/**
	 * 출하실적 삭제
	 * @param List<SpmtPrfmncVO>
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteSpmtPrfmnc(List<SpmtPrfmncVO> spmtPrfmnc) throws Exception;

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

	/**
	 * 파프리카출하실적 조회
	 * @param spmtDsctnTotVO
	 * @return List<SpmtDsctnTotVO>
	 * @throws Exception
	 */
	public List<SpmtDsctnTotVO> selectSpmtPrfmncDsctnList(SpmtDsctnTotVO spmtDsctnTotVO) throws Exception;

	/**
	 * 파프리카출하실등록
	 * @param List<SpmtPrfmncVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> insertSpmtPrfmncDsctn(List<SpmtPrfmncComVO> spmtPrfmncComList) throws Exception;
}
