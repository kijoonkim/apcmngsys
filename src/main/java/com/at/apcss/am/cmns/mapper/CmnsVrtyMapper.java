package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.cmns.vo.CmnsVrtyVO;

/**
 * 품종정보 Mapper 인터페이스
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
public interface CmnsVrtyMapper {

	/**
	 * 품종 마스터 정보 단건 조회
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public CmnsVrtyVO selectCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * 품종 마스터 정보 목록 조회
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public List<CmnsVrtyVO> selectCmnsVrtyList(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * 품종 마스터 정보 등록
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public int insertCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * 품종 마스터 정보 변경
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public int updateCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * 품종 마스터 정보 삭제
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;


	// APC 품종정보

	/**
	 * APC 품종 정보 단건 조회
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public CmnsVrtyVO selectApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * APC 품종 정보 목록 조회
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public List<CmnsVrtyVO> selectApcVrtyList(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * APC 품종 정보 등록
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public int insertApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * APC 품종 정보 변경
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public int updateApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * APC 품종 정보 삭제
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public int deleteApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception;

	/**
	 * APC 품종 정보 전체 삭제
	 * @param cmnsVrtyVO
	 * @return
	 * @throws Exception
	 */
	public int deleteApcVrtyAll(CmnsVrtyVO cmnsVrtyVO) throws Exception;
}
