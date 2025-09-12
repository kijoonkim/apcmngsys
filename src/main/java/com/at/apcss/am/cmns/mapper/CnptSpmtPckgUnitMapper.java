package com.at.apcss.am.cmns.mapper;

import com.at.apcss.am.cmns.vo.CnptSpmtPckgUnitVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * 출하상품거래처 Mapper 인터페이스
 * @author 김은총
 * @since 2025.09.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.09.01  김은총       최초 생성
 * </pre>
 */
@Mapper
public interface CnptSpmtPckgUnitMapper {

	/**
	 * 출하상품거래처 목록 조회
	 * @param CnptSpmtPckgUnitVO
	 * @return List<CnptSpmtPckgUnitVO>
	 * @throws Exception
	 */
	public List<CnptSpmtPckgUnitVO> selectCnptSpmtPckgUnitList(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception;

	/**
	 * 출하상품거래처 삭제
	 * @param CnptSpmtPckgUnitVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteCnptSpmtPckgUnit(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception;

	/**
	 * 출하상품거래처 merge
	 * @param CnptSpmtPckgUnitVO
	 * @return Integer
	 * @throws Exception
	 */
	public int mergeCnptSpmtPckgUnitList(List<CnptSpmtPckgUnitVO> cnptSpmtPckgUnitList) throws Exception;
}
