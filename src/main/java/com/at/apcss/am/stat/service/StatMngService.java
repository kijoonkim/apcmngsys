package com.at.apcss.am.stat.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.stat.vo.StatMngVO;


/**
 * 통계 Service 인터페이스
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
public interface StatMngService {

	/**
	 * 통계기준정보조회
	 * @param StatMngVO
	 * @return
	 * @throws Exception
	 */
	public List<StatMngVO> selectStatCrtrInfoList(StatMngVO StatMngVO) throws Exception;

	/**
	 * 통계기준상세정보조회
	 * @param StatMngVO
	 * @return
	 * @throws Exception
	 */
	public List<StatMngVO> selectStatCrtrInfoDtlList(StatMngVO StatMngVO) throws Exception;

	/**
	 * 통계기준정보등록
	 * @param StatMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertStatCrtrInfo(StatMngVO StatMngVO) throws Exception;

	/**
	 * 통계기준상세정보등록
	 * @param StatMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertStatCrtrDtlInfo(List<StatMngVO> StatMngVO) throws Exception;


	/**
	 * 통계기준정보삭제
	 * @param StatMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteStatCrtrInfo(StatMngVO totMngVO) throws Exception;



	/**
	 * 기간별 입고통계 조회
	 * @param HashMap<String, Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectPrdWrhsStatInfo(HashMap<String, Object> totMngVO) throws Exception;

	/**
	 * 기간별 투입통계 조회
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectPrdInptPrfmncStatInfo(HashMap<String,Object> StatMngVO) throws Exception;

	/**
	 * 기간별 생산통계 조회
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectPrdPrdctnPrfmncStatInfo(HashMap<String,Object> StatMngVO) throws Exception;

	/**
	 * 기간별 출하통계 조회
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectPrdSpmtPrfmncStatInfo(HashMap<String,Object> StatMngVO) throws Exception;


}
