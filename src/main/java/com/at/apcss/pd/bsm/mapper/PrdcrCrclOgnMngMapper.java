package com.at.apcss.pd.bsm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.bsm.vo.PrdcrCrclOgnMngVO;
import com.at.apcss.pd.bsm.vo.UoListVO;

/**
 * 게시판 Mapper 인터페이스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21          최초 생성
 * </pre>
 */
@Mapper
public interface PrdcrCrclOgnMngMapper {


	/**
	 * 산지조직정보를 조회한다.
	 * @param PrdcrCrclOgnMngVO
	 * @return PrdcrCrclOgnMngVO
	 */
	public PrdcrCrclOgnMngVO selectPrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO);

	/**
	 * 산지조직정보 리스트를 조회한다.
	 * @param PrdcrCrclOgnMngVO
	 * @return List<PrdcrCrclOgnMngVO>
	 */
	public List<PrdcrCrclOgnMngVO> selectPrdcrCrclOgnMngList(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO);

	/**
	 * 산지조직정보를 등록 한다
	 * @param PrdcrCrclOgnMngVO
	 * @return int
	 */
	public int insertPrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO);

	/**
	 * 산지조직정보를 수정 한다
	 * @param PrdcrCrclOgnMngVO
	 * @return int
	 */
	public int updatePrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO);

	/**
	 * 산지조직정보 이력정보를 수정 한다
	 * @param PrdcrCrclOgnMngVO
	 * @return int
	 */
	public int updatePrdcrCrclOgnMngHstry(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO);

	/**
	 * 산지조직정보를 삭제 한다
	 * @param PrdcrCrclOgnMngVO
	 * @return int
	 */
	public int deletePrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;

	/**
	 * 조직관계정보를 조회 한다
	 * @param UoListVO
	 * @return UoListVO
	 */
	public UoListVO selectUo(UoListVO uoListVO);

	/**
	 * 조직관계정보 리스트를 조회 한다
	 * @param UoListVO
	 * @return List<UoListVO>
	 */
	public List<UoListVO> selectUoList(UoListVO uoListVO);

	/**
	 * 조직관계정보를 등록 한다
	 * @param UoListVO
	 * @return int
	 */
	public int insertUo(UoListVO uoListVO);

	/**
	 * 조직관계정보를 수정 한다
	 * @param UoListVO
	 * @return int
	 */
	public int updateUo(UoListVO uoListVO);

	/**
	 * 조직관계정보를 삭제 한다
	 * @param UoListVO
	 * @return int
	 */
	public int deleteUo(UoListVO uoListVO) throws Exception;

	/**
	 * 로우데이터 리스트를 조회한다.
	 * @param PrdcrCrclOgnMngVO
	 * @return List<PrdcrCrclOgnMngVO>
	 */
	public List<PrdcrCrclOgnMngVO> selectPrdcrCrclOgnMngRowDataList(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO);
}
