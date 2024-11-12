package com.at.apcss.pd.bsm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.bsm.vo.BrnoMngVO;

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
public interface BrnoMngMapper {


	/**
	 * 변경된 사업자번호를 조회한다.
	 * @param BrnoMngVO
	 * @return BrnoMngVO
	 */
	public BrnoMngVO selectBrnoMng(BrnoMngVO BrnoMngVO);

	/**
	 * 변경된 사업자번호 리스트를 조회한다.
	 * @param BrnoMngVO
	 * @return List<BrnoMngVO>
	 */
	public List<BrnoMngVO> selectBrnoMngList(BrnoMngVO BrnoMngVO);

	/**
	 * 변경된 사업자번호 상세 리스트를 조회한다.
	 * @param BrnoMngVO
	 * @return List<BrnoMngVO>
	 */
	public List<BrnoMngVO> selectDtlBrnoMngList(BrnoMngVO BrnoMngVO);

	/**
	 * 변경된 사업자번호를 등록 한다
	 * @param BrnoMngVO
	 * @return int
	 */
	public int insertBrnoMng(BrnoMngVO BrnoMngVO);

	/**
	 * 변경된 사업자번호를 수정 한다
	 * @param BrnoMngVO
	 * @return int
	 */
	public int updateBrnoMng(BrnoMngVO BrnoMngVO);

	/**
	 * 변경된 사업자번호를 삭제 한다
	 * @param BrnoMngVO
	 * @return int
	 */
	public int deleteBrnoMng(BrnoMngVO BrnoMngVO) throws Exception;

	/**
	 * 로우데이터 리스트를 조회한다.
	 * @param BrnoMngVO
	 * @return List<BrnoMngVO>
	 */
	public List<BrnoMngVO> selectBrnoMngRowDataList(BrnoMngVO BrnoMngVO);
}
