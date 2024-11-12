package com.at.apcss.pd.bsm.service;

import java.util.List;

import com.at.apcss.pd.bsm.vo.BrnoNumMngVO;


/**
 * 평가등록결과 Service 인터페이스
 * @author ljw
 * @since 2024.11.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.11  ljw        최초 생성
 * </pre>
 */
public interface BrnoNumMngService {

	/**
	 * 채번을 조회한다.
	 * @param BrnoNumMngVO
	 * @return BrnoNumMngVO
	 * @throws Exception
	 */
	public BrnoNumMngVO selectBrnoNumMng(BrnoNumMngVO BrnoNumMngVO) throws Exception;

	/**
	 * 채번 리스트를 조회한다.
	 * @param BrnoNumMngVO
	 * @return List<BrnoNumMngVO>
	 * @throws Exception
	 */
	public List<BrnoNumMngVO> selectBrnoNumMngList(BrnoNumMngVO BrnoNumMngVO) throws Exception;

	/**
	 * 채번을 수정한다.
	 * @param BrnoNumMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updateBrnoNumMng(BrnoNumMngVO BrnoNumMngVO) throws Exception;

	/**
	 * 채번을 삭제한다.
	 * @param BrnoNumMngVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteBrnoNumMng(BrnoNumMngVO BrnoNumMngVO) throws Exception;

	/**
	 * 채번 리스트를 등록한다.
	 * @param List<BrnoNumMngVO>
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveBrnoNumMngList(List<BrnoNumMngVO> BrnoNumMngVOList) throws Exception;

	/**
	 * 로우데이터 리스트를 조회한다.
	 * @param BrnoNumMngVO
	 * @return List<BrnoNumMngVO>
	 * @throws Exception
	 */
	public List<BrnoNumMngVO> selectBrnoNumMngRowDataList(BrnoNumMngVO BrnoNumMngVO) throws Exception;

}
