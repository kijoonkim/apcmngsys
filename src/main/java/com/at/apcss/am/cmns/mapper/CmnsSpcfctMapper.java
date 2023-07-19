package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.cmns.vo.CmnsSpcfctVO;

/**
 * 규격정보 Mapper 인터페이스
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
public interface CmnsSpcfctMapper {

	/**
	 * 규격 마스터 정보 단건 조회
	 * @param cmnsSpcfctVO
	 * @return
	 * @throws Exception
	 */
	public CmnsSpcfctVO selectCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception;
	
	/**
	 * 규격 마스터 정보 목록 조회
	 * @param cmnsSpcfctVO
	 * @return
	 * @throws Exception
	 */
	public List<CmnsSpcfctVO> selectCmnsSpcfctList(CmnsSpcfctVO cmnsSpcfctVO) throws Exception;
	
	/**
	 * 규격 마스터 정보 등록
	 * @param cmnsSpcfctVO
	 * @return
	 * @throws Exception
	 */
	public int insertCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception;
	
	/**
	 * 규격 마스터 정보 변경
	 * @param cmnsSpcfctVO
	 * @return
	 * @throws Exception
	 */
	public int updateCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception;
	
	/**
	 * 규격 마스터 정보 삭제
	 * @param cmnsSpcfctVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception;
	
	
	// APC 규격정보
	
	/**
	 * APC 규격 정보 단건 조회
	 * @param cmnsSpcfctVO
	 * @return
	 * @throws Exception
	 */
	public CmnsSpcfctVO selectApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception;
	
	/**
	 * APC 규격 정보 목록 조회
	 * @param cmnsSpcfctVO
	 * @return
	 * @throws Exception
	 */
	public List<CmnsSpcfctVO> selectApcSpcfctList(CmnsSpcfctVO cmnsSpcfctVO) throws Exception;
	
	/**
	 * APC 규격 정보 등록
	 * @param cmnsSpcfctVO
	 * @return
	 * @throws Exception
	 */
	public int insertApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception;
	
	/**
	 * APC 규격 정보 변경
	 * @param cmnsSpcfctVO
	 * @return
	 * @throws Exception
	 */
	public int updateApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception;
	
	/**
	 * APC 규격 정보 삭제
	 * @param cmnsSpcfctVO
	 * @return
	 * @throws Exception
	 */
	public int deleteApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception;
}
