package com.at.apcss.am.stat.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.stat.vo.StatCrtrVO;
import com.at.apcss.am.stat.vo.StatMngVO;
import com.at.apcss.am.tot.vo.TotCrtrVO;
import com.at.apcss.am.tot.vo.TotMngVO;


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



	public List<StatCrtrVO> selectStatCrtrDtlInUseList(StatCrtrVO statCrtrVO) throws Exception;

	public StatCrtrVO selectCrtr(StatCrtrVO statCrtrVO) throws Exception;

	public StatCrtrVO selectCrtr(String apcCd, String statsCrtrType, String crtrCd) throws Exception;

	/**
	 * 기준정보 목록 조회
	 * @param StatCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<StatCrtrVO> selectCrtrList(StatCrtrVO statCrtrVO) throws Exception;

	/**
	 * 기준상세 목록 조회
	 * @param StatCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<StatCrtrVO> selectCrtrDtlList(StatCrtrVO statCrtrVO) throws Exception;

	/**
	 * 기준 등록
	 * @param StatMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertCrtr(StatMngVO statMngVO) throws Exception;

	/**
	 * 기준 삭제
	 * @param StatMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteCrtr(StatMngVO statMngVO) throws Exception;

	/**
	 * 기준상세 등록
	 * @param StatMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertCrtrDtl(StatMngVO statMngVO) throws Exception;

	/**
	 * 기준상세 삭제
	 * @param StatMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteCrtrDtl(StatMngVO statMngVO) throws Exception;
	/**
	 * 기간별 입고 통계
	 * @param param
	 * @return
	 * @throws Exception
	 */
    HashMap<String, Object> selectPrdWrhsList(HashMap<String, Object> param) throws Exception;

	/**
	 * 기준상세 목록 조회
	 * @param StatCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectPrdSpmtInfo(StatCrtrVO statCrtrVO) throws Exception;

	/**
	 * 기준상세 목록 조회
	 * @param StatCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectPrdSpmtInfoDtl(StatCrtrVO statCrtrVO) throws Exception;

	/**
	 * 기준상세 목록 조회
	 * @param StatCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectPrdPrdctnPrfmncInfo(StatCrtrVO statCrtrVO) throws Exception;

	/**
	 * 기준상세 목록 조회
	 * @param StatCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectPrdPrdctnPrfmncInfoDtl(StatCrtrVO statCrtrVO) throws Exception;

}
