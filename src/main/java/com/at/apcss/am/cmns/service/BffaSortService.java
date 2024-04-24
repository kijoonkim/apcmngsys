package com.at.apcss.am.cmns.service;

import java.util.List;

import com.at.apcss.am.cmns.vo.BffaSortVO;

/**
 * 육안정보 Service 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
public interface BffaSortService {


	/**
	 * 육안정보 목록 조회
	 * @param BffaSortVO
	 * @return List<BffaSortVO>
	 * @throws Exception
	 */
	public List<BffaSortVO> selectBffaSortTypeList(BffaSortVO bffaSortVO) throws Exception;
	public List<BffaSortVO> selectBffaSortKndList(BffaSortVO bffaSortVO) throws Exception;
	public List<BffaSortVO> selectBffaSortDtlList(BffaSortVO bffaSortVO) throws Exception;
	

	/**
	 * 육안등급종류 등록
	 * @param BffaSortVO
	 * @return
	 * @throws Exception
	 */
	public int insertBffaSortKnd(BffaSortVO bffaSortVO) throws Exception;

	/**
	 * 육안등급종류 수정
	 * @param BffaSortVO
	 * @return
	 * @throws Exception
	 */
	public int updateBffaSortKnd(BffaSortVO bffaSortVO) throws Exception;

	/**
	 * 육안등급종류 삭제
	 * @param BffaSortVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBffaSortKnd(BffaSortVO bffaSortVO) throws Exception;
	
	/**
	 * 육안등급상세 등록
	 * @param BffaSortVO
	 * @return
	 * @throws Exception
	 */
	public int insertBffaSortDtl(BffaSortVO bffaSortVO) throws Exception;

	/**
	 * 육안등급상세 수정
	 * @param BffaSortVO
	 * @return
	 * @throws Exception
	 */
	public int updateBffaSortDtl(BffaSortVO bffaSortVO) throws Exception;

	/**
	 * 육안등급상세 삭제
	 * @param BffaSortVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBffaSortDtl(BffaSortVO bffaSortVO) throws Exception;
	
	
}
