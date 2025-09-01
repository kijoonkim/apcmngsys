package com.at.apcss.am.cmns.mapper;

import com.at.apcss.am.cmns.vo.SpmtPckgUnitCnptVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * 출하상품거래처 Mapper 인터페이스
 * @author 김호
 * @since 2023.08.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.01  김호        최초 생성
 * </pre>
 */
@Mapper
public interface SpmtPckgUnitCnptMapper {
	/**
	 * 출하상품거래처 단건 조회
	 * @param SpmtPckgUnitCnptVO
	 * @return SpmtPckgUnitCnptVO
	 * @throws Exception
	 */
	public SpmtPckgUnitCnptVO selectSpmtPckgUnitCnpt(SpmtPckgUnitCnptVO spmtPckgUnitCnptVO) throws Exception;

	/**
	 * 출하상품거래처 목록 조회
	 * @param SpmtPckgUnitCnptVO
	 * @return List<SpmtPckgUnitCnptVO>
	 * @throws Exception
	 */
	public List<SpmtPckgUnitCnptVO> selectSpmtPckgUnitCnptList(SpmtPckgUnitCnptVO spmtPckgUnitCnptVO) throws Exception;

	/**
	 * 출하상품거래처 등록
	 * @param SpmtPckgUnitCnptVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertSpmtPckgUnitCnpt(SpmtPckgUnitCnptVO spmtPckgUnitCnptVO) throws Exception;

	/**
	 * 출하상품거래처 변경
	 * @param SpmtPckgUnitCnptVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateSpmtPckgUnitCnpt(SpmtPckgUnitCnptVO spmtPckgUnitCnptVO) throws Exception;

	/**
	 * 출하상품거래처 삭제
	 * @param SpmtPckgUnitCnptVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteSpmtPckgUnitCnpt(SpmtPckgUnitCnptVO spmtPckgUnitCnptVO) throws Exception;

	/**
	 * 출하상품거래처 merge
	 * @param SpmtPckgUnitCnptVO
	 * @return Integer
	 * @throws Exception
	 */
	public int mergeSpmtPckgUnitCnptList(List<SpmtPckgUnitCnptVO> spmtPckgUnitCnptList) throws Exception;
}
