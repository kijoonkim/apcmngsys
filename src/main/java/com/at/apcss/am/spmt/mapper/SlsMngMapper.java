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
	 * 매출실적변경
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int updateSlsPrfmnc(SlsMngVO vo);
	
	/**
	 * 매출단가조회
	 * @param SlsMngVO
	 * @return List<SlsMngVO>
	 * @throws Exception
	 */
	public List<SlsMngVO> selectSlsUntprc(SlsMngVO slsMngVO);
	
	/**
	 * 매출단가삭제
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int deleteSlsUntprc(SlsMngVO slsMngVO);

	/**
	 * 매출단가등록
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int insertSlsUntprc(SlsMngVO item);
	
	/**
	 * 매출단가변경
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int updateSpmtPckgUnitCd(SlsMngVO vo);
	
	/**
	 * 매출단가변경
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int updateSpmtSlsUntprcReg(SlsMngVO vo);

}
