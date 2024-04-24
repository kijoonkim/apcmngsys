package com.at.apcss.am.cmns.mapper;

import java.util.List;

import com.at.apcss.am.cmns.vo.BffaSortVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface BffaSortMapper {
	

	/**
	 * 상품정보 목록 조회
	 * @param BffaSortVO
	 * @return List<BffaSortVO>
	 * @throws Exception
	 */
	public List<BffaSortVO>selectBffaSortTypeList(BffaSortVO bffaSortVO) throws Exception;
	
	public List<BffaSortVO>selectBffaSortKndList(BffaSortVO bffaSortVO) throws Exception;
	
	public List<BffaSortVO>selectBffaSortDtlList(BffaSortVO bffaSortVO) throws Exception;


	/**
	 * 육안등급종류 등록
	 * @param BffaSortVO
	 * @return
	 * @throws Exception
	 */
	public int insertBffaSortKnd(BffaSortVO bffaSortVO) throws Exception;

	/**
	 * 육안등급종류 수정
	 * @param bffaSortVO
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
	 * @param bffaSortVO
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
	
	/**
	 * 육안등급상세 전체삭제
	 * @param BffaSortVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBffaSortDtlAll(BffaSortVO bffaSortVO) throws Exception;
}
