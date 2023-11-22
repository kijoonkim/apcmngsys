package com.at.apcss.am.clcln.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.clcln.vo.ClclnPrfmncVO;

/**
 * 정산실적 Mapper 인터페이스
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
public interface ClclnPrfmncMapper {
	
	/**
	 * 정산실적 단건 조회
	 * @param clclnPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public ClclnPrfmncVO selectClclnPrfmnc(ClclnPrfmncVO clclnPrfmncVO) throws Exception;
	
	/**
	 * 정산실적 목록 조회
	 * @param clclnPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<ClclnPrfmncVO> selectClclnPrfmncList(ClclnPrfmncVO clclnPrfmncVO) throws Exception;
	
	/**
	 * 정산실적 등록
	 * @param clclnPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertClclnPrfmnc(ClclnPrfmncVO clclnPrfmncVO) throws Exception;
	
	/**
	 * 정산실적 생성 (Call procedure)
	 * @param clclnPrfmncVO
	 * @throws Exception
	 */
	public void insertSpClclnPrfmncCrt(ClclnPrfmncVO clclnPrfmncVO) throws Exception;
	
	/**
	 * 정산실적 수정
	 * @param clclnPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateClclnPrfmnc(ClclnPrfmncVO clclnPrfmncVO) throws Exception;
	
	/**
	 * 정산실적 삭제
	 * @param clclnPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteClclnPrfmnc(ClclnPrfmncVO clclnPrfmncVO) throws Exception;
	
	/**
	 * 정산실적 삭제 : set delyn 'Y'
	 * @param clclnPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateClclnPrfmncForDelY(ClclnPrfmncVO clclnPrfmncVO) throws Exception;
	
}
