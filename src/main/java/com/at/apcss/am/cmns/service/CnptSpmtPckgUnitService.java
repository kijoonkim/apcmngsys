package com.at.apcss.am.cmns.service;

import com.at.apcss.am.cmns.vo.CnptSpmtPckgUnitVO;

import java.util.List;

/**
 * 출하상품거래처 service 인터페이스
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
public interface CnptSpmtPckgUnitService {
	/**
	 * 출하상품거래처 단건 조회
	 * @param CnptSpmtPckgUnitVO
	 * @return CnptSpmtPckgUnitVO
	 * @throws Exception
	 */
	public CnptSpmtPckgUnitVO selectCnptSpmtPckgUnit(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception;

	/**
	 * 출하상품거래처 목록 조회
	 * @param CnptSpmtPckgUnitVO
	 * @return List<CnptSpmtPckgUnitVO>
	 * @throws Exception
	 */
	public List<CnptSpmtPckgUnitVO> selectCnptSpmtPckgUnitList(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception;

	/**
	 * 출하상품거래처 등록
	 * @param CnptSpmtPckgUnitVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertCnptSpmtPckgUnit(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception;

	/**
	 * 출하상품거래처 변경
	 * @param CnptSpmtPckgUnitVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateCnptSpmtPckgUnit(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception;

	/**
	 * 출하매출단가 삭제
	 * @param CnptSpmtPckgUnitVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteCnptSpmtPckgUnit(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception;

	/**
	 * 출하매출단가 리스트 저장
	 * @param CnptSpmtPckgUnitVO
	 * @return Integer
	 * @throws Exception
	 */
	public int multiCnptSpmtPckgUnitList(List<CnptSpmtPckgUnitVO> cnptSpmtPckgUnitList) throws Exception;
}