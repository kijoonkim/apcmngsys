package com.at.apcss.am.spmt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.spmt.vo.SlsMngVO;

@Mapper
public interface SlsMngMapper {
	
	/**
	 * 매출실적조회
	 * @param SlsMngVO
	 * @return List<SlsMngVO>
	 * @throws Exception
	 */
	public List<SlsMngVO> selectSlsPrfmnc(SlsMngVO slsMngVO);

	/**
	 * 매출실적삭제
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int deleteSlsPrfmnc(SlsMngVO slsMngVO);

	/**
	 * 매출실적삭제
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int updateSlsUntprc(SlsMngVO vo);

}
