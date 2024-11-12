package com.at.apcss.pd.bsm.service;

import java.util.List;

import com.at.apcss.pd.bsm.vo.BrnoMngVO;


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
public interface BrnoMngService {

	/**
	 * 변경된 사업자번호를 조회한다.
	 * @param BrnoMngVO
	 * @return BrnoMngVO
	 * @throws Exception
	 */
	public BrnoMngVO selectBrnoMng(BrnoMngVO BrnoMngVO) throws Exception;

	/**
	 * 변경된 사업자번호 리스트를 조회한다.
	 * @param BrnoMngVO
	 * @return List<BrnoMngVO>
	 * @throws Exception
	 */
	public List<BrnoMngVO> selectBrnoMngList(BrnoMngVO BrnoMngVO) throws Exception;

	/**
	 * 변경된 사업자번호 상세 리스트를 조회한다.
	 * @param BrnoMngVO
	 * @return List<BrnoMngVO>
	 * @throws Exception
	 */
	public List<BrnoMngVO> selectDtlBrnoMngList(BrnoMngVO BrnoMngVO) throws Exception;

	/**
	 * 변경된 사업자번호를 등록한다.
	 * @param BrnoMngVO
	 * @return int
	 * @throws Exception
	 */
	public int insertBrnoMng(BrnoMngVO BrnoMngVO) throws Exception;

	/**
	 * 변경된 사업자번호를 수정한다.
	 * @param BrnoMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updateBrnoMng(BrnoMngVO BrnoMngVO) throws Exception;

	/**
	 * 변경된 사업자번호를 삭제한다.
	 * @param BrnoMngVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteBrnoMng(BrnoMngVO BrnoMngVO) throws Exception;


	/**
	 * 변경된 사업자번호 리스트를 등록한다.
	 * @param UoListVO
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveBrnoMngList(List<BrnoMngVO> BrnoMngVOList) throws Exception;

	/**
	 * 로우데이터 리스트를 조회한다.
	 * @param BrnoMngVO
	 * @return List<BrnoMngVO>
	 * @throws Exception
	 */
	public List<BrnoMngVO> selectBrnoMngRowDataList(BrnoMngVO BrnoMngVO) throws Exception;

}
