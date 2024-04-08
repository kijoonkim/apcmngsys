package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.SpmtPckgUnitVO;
/**
 * 출하포장단위 Mapper 인터페이스
 * @author 김호
 * @since 2023.07.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.31  김호        최초 생성
 * </pre>
 */
@Mapper
public interface SpmtPckgUnitMapper {
	/**
	 * 출하포장단위 단건 조회
	 * @param SpmtPckgUnitVO
	 * @return
	 * @throws Exception
	 */
	public SpmtPckgUnitVO selectSpmtPckgUnit(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception;

	/**
	 * 출하포장단위 목록 조회
	 * @param SpmtPckgUnitVO
	 * @return List<SpmtPckgUnitVO>
	 * @throws Exception
	 */
	public List<SpmtPckgUnitVO> selectSpmtPckgUnitList(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception;

	/**
	 * 출하포장단위 등록
	 * @param SpmtPckgUnitVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertSpmtPckgUnit(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception;

	/**
	 * 출하포장단위 변경
	 * @param SpmtPckgUnitVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateSpmtPckgUnit(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception;

	/**
	 * 출하포장단위 삭제
	 * @param SpmtPckgUnitVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteSpmtPckgUnit(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception;

	/**
	 * 출하포장단위 자동발전 코드 조회
	 * @param SpmtPckgUnitVO
	 * @return SpmtPckgUnitVO
	 * @throws Exception
	 */
	public SpmtPckgUnitVO getSpmtPckgUnitCd(SpmtPckgUnitVO spmtPckgUnitVO) throws Exception;

	/**
	 * 출하포장단위 삭제 가능 여부
	 * @param SpmtPckgUnitVO
	 * @return List<SpmtPckgUnitVO>
	 * @throws Exception
	 */
	public List<SpmtPckgUnitVO> spmtPckgUnitDelible(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception;
	/**
	 * APC 출하포장단위 정보 업데이트
	 * @param SpmtPckgUnitVO
	 * @return integer
	 * @throws Exception
	 */
	public int updateSpmtPckgUnits(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception;
}
