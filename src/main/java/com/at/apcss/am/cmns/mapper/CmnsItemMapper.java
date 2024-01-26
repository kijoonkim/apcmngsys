package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.CmnsItemVO;

/**
 * 품목정보 Mapper 인터페이스
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
@Mapper
public interface CmnsItemMapper {

	/**
	 * 품목정보 단건 조회
	 * @param cmnsItemVO
	 * @return CmnsItemVO
	 * @throws Exception
	 */
	public CmnsItemVO selectCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 목록 조회
	 * @param cmnsItemVO
	 * @return List<CmnsItemVO>
	 * @throws Exception
	 */
	public List<CmnsItemVO> selectCmnsItemList(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * APC 품목정보 목록 조회
	 * @param cmnsItemVO
	 * @return List<CmnsItemVO>
	 * @throws Exception
	 */
	public List<CmnsItemVO> selectApcCmnsItemList(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 등록
	 * @param cmnsItemVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 변경
	 * @param cmnsItemVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * APC 품목정보 변경
	 * @param cmnsItemVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateApcCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 삭제
	 * @param cmnsItemVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteCmnsItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * 품목정보 단건 조회
	 * @param cmnsItemVO
	 * @return CmnsItemVO
	 * @throws Exception
	 */
	public CmnsItemVO selectCmnsApcItem(CmnsItemVO cmnsItemVO) throws Exception;

	/**
	 * APC 품목 삭제 가능 여부
	 * @param cmnsItemVO
	 * @return List<CmnsItemVO>
	 * @throws Exception
	 */
	public List<CmnsItemVO> itemDelible(CmnsItemVO cmnsItemVO) throws Exception;

}
