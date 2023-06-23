package com.at.apcss.am.clcln.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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
	public ClclnPrfmncVO selectClclnPrfmnc(ClclnPrfmncVO clclnPrfmncVO);
	
	/**
	 * 정산실적 목록 조회
	 * @param clclnPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<ClclnPrfmncVO> selectClclnPrfmncList(ClclnPrfmncVO clclnPrfmncVO);
	
	
}
