package com.at.apcss.co.pms.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.co.pms.vo.DfctMngVO;
import com.at.apcss.co.pms.vo.DfctVO;
import com.at.apcss.co.pms.vo.DvlpPrgrsMngVO;
/**
 * 개발진행관리 Mapper 인터페이스
 * @author 김호
 * @since 2023.08.07
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.07  김호        최초 생성
 * </pre>
 */
@Mapper
public interface DvlpPrgrsMngMapper {

	/**
	 * 개발진행관리 목록을 조회한다.
	 * @param DvlpPrgrsMngVO
	 * @return List<DvlpPrgrsMngVO>
	 * @throws Exception
	 */
	public List<DvlpPrgrsMngVO> selectDvlpPrgrsMngList(DvlpPrgrsMngVO dvlpPrgrsMngVO) throws Exception;

	/**
	 * 개발진행관리를 수정한다.
	 * @param DvlpPrgrsMngVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateDvlpPrgrsMng(DvlpPrgrsMngVO dvlpPrgrsMngVO) throws Exception;

	/**
	 * 개발진행관리 상태를 수정한다.
	 * @param DvlpPrgrsMngVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateDvlpStts(DvlpPrgrsMngVO dvlpPrgrsMngVO) throws Exception;

	/**
	 * 결함관리 목록을 조회한다.
	 * @param DfctMngVO
	 * @return List<DfctMngVO>
	 * @throws Exception
	 */
	public List<DfctMngVO> selectDfctMngList(DfctMngVO dfctMngVO) throws Exception;

	/**
	 * 결함관리 등록한다.
	 * @param DfctMngVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertDfctMng(DfctMngVO dfctMngVO) throws Exception;

	/**
	 * 결함관리 수정한다.
	 * @param DfctMngVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateDfctMng(DfctMngVO dfctMngVO) throws Exception;

	/**
	 * 결함관리 삭제한다.
	 * @param DfctMngVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteDfctMng(DfctMngVO dfctMngVO) throws Exception;

	/**
	 * 프로그램개발진행진도 조회
	 * @param DfctVO
	 * @return List<DfctVO>
	 * @throws Exception
	 */
	public List<DfctVO> selectDfct(DfctVO dfctVO) throws Exception;
}
