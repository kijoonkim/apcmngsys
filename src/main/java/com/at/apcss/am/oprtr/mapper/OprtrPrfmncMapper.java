package com.at.apcss.am.oprtr.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.oprtr.vo.OprtrPrfmncVO;

/**
 * 작업자실적등록 프로그램 Mapper 인터페이스
 * @author
 * @since 2023.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.17     김호         최초 생성
 * </pre>
 */
@Mapper
public interface OprtrPrfmncMapper {

	/**
	 * 작업 실적 목록 조회
	 * @param OprtrPrfmncVO
	 * @return List<OprtrPrfmncVO>
	 */
	List<OprtrPrfmncVO> selectRegPrfmncList(OprtrPrfmncVO oprtrPrfmncVO) throws Exception;

	/**
	 * 실적 작업자 목록 조회
	 * @param OprtrPrfmncVO
	 * @return List<OprtrPrfmncVO>
	 */
	List<OprtrPrfmncVO> selectOprtrPrfmncList(OprtrPrfmncVO oprtrPrfmncVO) throws Exception;

	/**
	 * 작업 실적 작업자 등록
	 * @param OprtrPrfmncVO
	 * @return integer
	 */
	int insertOprtrPrfmnc(OprtrPrfmncVO oprtrPrfmncVO) throws Exception;

	/**
	 * 작업 실적 작업자 변경
	 * @param OprtrPrfmncVO
	 * @return integer
	 */
	int updateOprtrPrfmnc(OprtrPrfmncVO oprtrPrfmncVO) throws Exception;

	/**
	 * 작업 실적 작업자 삭제
	 * @param OprtrPrfmncVO
	 * @return integer
	 */
	int deleteOprtrPrfmnc(OprtrPrfmncVO oprtrPrfmncVO) throws Exception;

	/**
	 * 작업 실적 작업순번 조회
	 * @param OprtrPrfmncVO
	 * @return integer
	 */
	int getoprtrPrfmncno(OprtrPrfmncVO oprtrPrfmncVO) throws Exception;
}
