package com.at.apcss.pd.bsm.service;

import java.util.List;

import com.at.apcss.pd.bsm.vo.PrdcrCrclOgnMngVO;
import com.at.apcss.pd.bsm.vo.UoListVO;


/**
 * 평가등록결과 Service 인터페이스
 * @author 김동제
 * @since 2023.10.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.01  김동제        최초 생성
 * </pre>
 */
public interface PrdcrCrclOgnMngService {

	/**
	 * 산지조직정보를 조회한다.
	 * @param PrdcrCrclOgnMngVO
	 * @return PrdcrCrclOgnMngVO
	 * @throws Exception
	 */
	public PrdcrCrclOgnMngVO selectPrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;

	/**
	 * 산지조직정보 리스트를 조회한다.
	 * @param PrdcrCrclOgnMngVO
	 * @return List<PrdcrCrclOgnMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnMngVO> selectPrdcrCrclOgnMngList(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;

	/**
	 * 산지조직정보를 등록한다.
	 * @param PrdcrCrclOgnMngVO
	 * @return int
	 * @throws Exception
	 */
	public int insertPrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;

	/**
	 * 산지조직정보를 수정한다.
	 * @param PrdcrCrclOgnMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updatePrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;

	/**
	 * 산지조직정보 이력정보를 수정한다.
	 * @param PrdcrCrclOgnMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updatePrdcrCrclOgnMngHstry(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;

	/**
	 * 산지조직정보 리스트를 등록한다.
	 * @param List<PrdcrCrclOgnMngVO>
	 * @return int
	 * @throws Exception
	 */
	public int multiSavePrdcrCrclOgnMngList(List<PrdcrCrclOgnMngVO> PrdcrCrclOgnMngVOList) throws Exception;

	/**
	 * 산지조직정보를 삭제한다.
	 * @param PrdcrCrclOgnMngVO
	 * @return int
	 * @throws Exception
	 */
	public int deletePrdcrCrclOgnMng(PrdcrCrclOgnMngVO PrdcrCrclOgnMngVO) throws Exception;


	/**
	 * 조직관계정보를 조회한다.
	 * @param UoListVO
	 * @return UoListVO
	 * @throws Exception
	 */
	public UoListVO selectUo(UoListVO uoListVO) throws Exception;

	/**
	 * 조직관계정보를 조회한다.
	 * @param UoListVO
	 * @return List<UoListVO>
	 * @throws Exception
	 */
	public List<UoListVO> selectUoList(UoListVO uoListVO) throws Exception;

	/**
	 * 조직관계정보를 등록한다.
	 * @param UoListVO
	 * @return int
	 * @throws Exception
	 */
	public int insertUo(UoListVO uoListVO) throws Exception;

	/**
	 * 조직관계정보를 수정한다.
	 * @param UoListVO
	 * @return int
	 * @throws Exception
	 */
	public int updateUo(UoListVO uoListVO) throws Exception;

	/**
	 * 조직관계정보 리스트를 등록한다.
	 * @param UoListVO
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveUoList(List<UoListVO> uoListVOList) throws Exception;

	/**
	 * 조직관계정보를 삭제한다.
	 * @param UoListVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteUo(UoListVO uoListVO) throws Exception;

}
