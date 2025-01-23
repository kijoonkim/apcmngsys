package com.at.apcss.am.tot.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.tot.vo.TotCrtrVO;
import com.at.apcss.am.tot.vo.TotMngVO;
import com.at.apcss.am.tot.vo.TotRsltVO;


/**
 * 집계 Service 인터페이스
 * @author 박승진
 * @since 2024.10.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.23  박승진        최초 생성
 * </pre>
 */
public interface TotMngService {


	public TotCrtrVO selectCrtr(TotCrtrVO totCrtrVO) throws Exception;

	public TotCrtrVO selectCrtr(String apcCd, String totCrtrType, String crtrCd) throws Exception;

	/**
	 * 기준정보 목록 조회
	 * @param totCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<TotCrtrVO> selectCrtrList(TotCrtrVO totCrtrVO) throws Exception;

	/**
	 * 기준상세 목록 조회
	 * @param totCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<TotCrtrVO> selectCrtrDtlList(TotCrtrVO totCrtrVO) throws Exception;

	/**
	 * 기준 등록
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertCrtr(TotMngVO totMngVO) throws Exception;

	/**
	 * 기준 삭제
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteCrtr(TotMngVO totMngVO) throws Exception;

	/**
	 * 기준상세 등록
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertCrtrDtl(TotMngVO totMngVO) throws Exception;

	/**
	 * 기준상세 삭제
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteCrtrDtl(TotMngVO totMngVO) throws Exception;


	public List<TotRsltVO> selectTotRsltTermList(TotRsltVO totRsltVO) throws Exception;

	public List<TotRsltVO> selectTotRawMtrWrhsList(TotRsltVO totRsltVO) throws Exception;

	public List<TotRsltVO> selectTotSortPrfmncList(TotRsltVO totRsltVO) throws Exception;

	public List<TotRsltVO> selectTotPckgPrfmncList(TotRsltVO totRsltVO) throws Exception;

	public List<TotRsltVO> selectTotSpmtPrfmncList(TotRsltVO totRsltVO) throws Exception;

	public List<TotRsltVO> selectTotRawMtrInvntrList(TotRsltVO totRsltVO) throws Exception;

	public List<TotRsltVO> selectTotSortInvntrList(TotRsltVO totRsltVO) throws Exception;

	public List<TotRsltVO> selectTotGdsInvntrList(TotRsltVO totRsltVO) throws Exception;

	/**
	 * 집계결과 생성
	 * @param totRsltVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertTotRsltCrt(TotRsltVO totRsltVO) throws Exception;





	/**
	 * 집계기준정보조회
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public List<TotMngVO> selectTotCrtrInfoList(TotMngVO TotMngVO) throws Exception;

	/**
	 * 집계기준상세정보조회
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public List<TotMngVO> selectTotCrtrInfoDtlList(TotMngVO TotMngVO) throws Exception;

	/**
	 * 집계기준정보등록
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertTotCrtrInfo(TotMngVO TotMngVO) throws Exception;

	/**
	 * 집계기준상세정보등록
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertTotCrtrDtlInfo(List<TotMngVO> TotMngVO) throws Exception;


	/**
	 * 집계기준정보삭제
	 * @param TotMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteTotCrtrInfo(TotMngVO totMngVO) throws Exception;

	/**
	 * 집계조회 - 출하
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectSpmtPrfmncTotInfo(HashMap<String,Object> totMngVO) throws Exception;

	/**
	 * 집계조회 - 상품재고
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectGdsInvntrTotInfo(HashMap<String,Object> totMngVO) throws Exception;

	/**
	 * 집계조회 - 포장실적
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectPckgPrfmncTotInfo(HashMap<String,Object> totMngVO) throws Exception;

	/**
	 * 집계조회 - 원물재고
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectRawMtrInvntrTotInfo(HashMap<String,Object> totMngVO) throws Exception;

	/**
	 * 집계조회 - 원물입고
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectRawMtrWrhsTotInfo(HashMap<String,Object> totMngVO) throws Exception;

	/**
	 * 집계조회 - 선별재고
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectSortInvntrTotInfo(HashMap<String,Object> totMngVO) throws Exception;

	/**
	 * 집계조회 - 선별실적
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectSortPrfmncTotInfo(HashMap<String,Object> totMngVO) throws Exception;

	/**
	 * 생산량 비교 분석 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
    List<HashMap<String, Object>> selectPrdctnVol(HashMap<String, Object> param) throws Exception;
}
