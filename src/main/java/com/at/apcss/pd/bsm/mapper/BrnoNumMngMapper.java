package com.at.apcss.pd.bsm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.bsm.vo.BrnoNumMngVO;

/**
 * 게시판 Mapper 인터페이스
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
@Mapper
public interface BrnoNumMngMapper {


	/**
	 * 채번을 조회한다.
	 * @param BrnoNumMngVO
	 * @return BrnoNumMngVO
	 */
	public BrnoNumMngVO selectBrnoNumMng(BrnoNumMngVO BrnoNumMngVO);

	/**
	 * 채번 리스트를 조회한다.
	 * @param BrnoNumMngVO
	 * @return List<BrnoNumMngVO>
	 */
	public List<BrnoNumMngVO> selectBrnoNumMngList(BrnoNumMngVO BrnoNumMngVO);

	/**
	 * 채번을 수정 한다
	 * @param BrnoNumMngVO
	 * @return int
	 */
	public int updateBrnoNumMng(BrnoNumMngVO BrnoNumMngVO);

	/**
	 * 채번을 삭제 한다
	 * @param BrnoNumMngVO
	 * @return int
	 */
	public int deleteBrnoNumMng(BrnoNumMngVO BrnoNumMngVO);

	/**
	 * 로우데이터 리스트를 조회한다.
	 * @param BrnoNumMngVO
	 * @return List<BrnoNumMngVO>
	 */
	public List<BrnoNumMngVO> selectBrnoNumMngRowDataList(BrnoNumMngVO BrnoNumMngVO);

	/**
	 * 이력을 수정 한다
	 * @param BrnoNumMngVO
	 * @return int
	 */
	public int updateSlctnYnHstry(BrnoNumMngVO BrnoNumMngVO);
}
